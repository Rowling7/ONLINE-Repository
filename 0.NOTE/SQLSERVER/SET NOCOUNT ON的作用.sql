触发器使得表和跨数据库之间数据的自动同步行为变得简单。但是，那些一眼看上去不是很明显的东西却会对它们的性能造成显著的影响。这里我将描述一个命令，它可用来减少一些不可预料的问题产生的影响 。

　　以反复被触发的INSERT触发器为例，尤其是当使用INSERT INTO语句用来进行大量插入操作时。在语句执行的过程中，当触发器一遍又一遍的被激发的情况下，触发器将会对每个INSERT动作发布DONE_IN_PROC消息，这会使速度明显下降。

　　尤其是当触发器作为一个预定了时间的SQL Server Agent工作的结果而被触发时，这个速度的减慢是特别明显的 。SQL Server Agent自动在每个DONE_IN_PROC 信号后强加一个延迟，以避免服务器拥塞 。如果你想通过查询分析器来运行同样的一组命令，由于没有强加这样的延迟，它的执行将会快得多。如果你通过查询分析器运行这样的查询并且查看多个语句产生的多个"n rows affected"，那么很有可能查询会被反复执行，并且触发器也被重新触发多次，这比它实际需要的次数要多很多。

　　要关掉DONE_IN_PROC消息，可以在触发器语句的开始用SET NOCOUNT ON命令。大多数时候，以任何方式对行进行计数都是不需要的。如果确实需要，你可以考虑重新构造命令来触发触发器（或者是触发器本身），这样就使所有的改变作为一个命令完成。如果这个进程仍然花了很长时间，为了简单起见，你应该重新想一个方法来激发触发器。
SET NOCOUNT
使返回的结果中不包含有关受 Transact-SQL 语句影响的行数的信息。

语法
SET NOCOUNT { ON | OFF }

注释
当 SET NOCOUNT 为 ON 时，不返回计数（表示受 Transact-SQL 语句影响的行数）。当 SET NOCOUNT 为 OFF 时，返回计数。

即使当 SET NOCOUNT 为 ON 时，也更新 @@ROWCOUNT 函数。

<<<<<<< HEAD
褰� SET NOCOUNT 涓� ON 鏃讹紝灏嗕笉缁欏鎴风鍙戦�佸瓨鍌ㄨ繃绋嬩腑鐨勬瘡涓鍙ョ殑 DONE_IN_PROC 淇℃伅銆傚綋浣跨敤 Microsoft&reg; SQL ServerTM 鎻愪緵鐨勫疄鐢ㄥ伐鍏锋墽琛屾煡璇㈡椂锛屽湪 Transact-SQL 璇彞锛堝 SELECT銆両NSERT銆乁PDATE 鍜� DELETE锛夌粨鏉熸椂灏嗕笉浼氬湪鏌ヨ缁撴灉涓樉绀�"nn rows affected"銆�
=======
当 SET NOCOUNT 为 ON 时，将不给客户端发送存储过程中的每个语句的 DONE_IN_PROC 信息。当使用 Microsoft&reg; SQL ServerTM 提供的实用工具执行查询时，在 Transact-SQL 语句（如 SELECT、INSERT、UPDATE 和 DELETE）结束时将不会在查询结果中显示"nn rows affected"。
>>>>>>> 777656939919fcd677982f6f5e3777037836113a

如果存储过程中包含的一些语句并不返回许多实际的数据，则该设置由于大量减少了网络流量，因此可显著提高性能。

SET NOCOUNT 设置是在执行或运行时设置，而不是在分析时设置。   
    
例子：
从某张表查询数据后，
结果的最后会有一行写着有多少行结果之类的东西，
set nocount on之后，
这一行就看不到了