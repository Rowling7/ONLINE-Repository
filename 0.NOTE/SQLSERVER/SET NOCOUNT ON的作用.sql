´¥·¢Æ÷Ê¹µÃ±íºÍ¿çÊý¾Ý¿âÖ®¼äÊý¾ÝµÄ×Ô¶¯Í¬²½ÐÐÎª±äµÃ¼òµ¥¡£µ«ÊÇ£¬ÄÇÐ©Ò»ÑÛ¿´ÉÏÈ¥²»ÊÇºÜÃ÷ÏÔµÄ¶«Î÷È´»á¶ÔËüÃÇµÄÐÔÄÜÔì³ÉÏÔÖøµÄÓ°Ïì¡£ÕâÀïÎÒ½«ÃèÊöÒ»¸öÃüÁî£¬Ëü¿ÉÓÃÀ´¼õÉÙÒ»Ð©²»¿ÉÔ¤ÁÏµÄÎÊÌâ²úÉúµÄÓ°Ïì ¡£

¡¡¡¡ÒÔ·´¸´±»´¥·¢µÄINSERT´¥·¢Æ÷ÎªÀý£¬ÓÈÆäÊÇµ±Ê¹ÓÃINSERT INTOÓï¾äÓÃÀ´½øÐÐ´óÁ¿²åÈë²Ù×÷Ê±¡£ÔÚÓï¾äÖ´ÐÐµÄ¹ý³ÌÖÐ£¬µ±´¥·¢Æ÷Ò»±éÓÖÒ»±éµÄ±»¼¤·¢µÄÇé¿öÏÂ£¬´¥·¢Æ÷½«»á¶ÔÃ¿¸öINSERT¶¯×÷·¢²¼DONE_IN_PROCÏûÏ¢£¬Õâ»áÊ¹ËÙ¶ÈÃ÷ÏÔÏÂ½µ¡£

¡¡¡¡ÓÈÆäÊÇµ±´¥·¢Æ÷×÷ÎªÒ»¸öÔ¤¶¨ÁËÊ±¼äµÄSQL Server Agent¹¤×÷µÄ½á¹û¶ø±»´¥·¢Ê±£¬Õâ¸öËÙ¶ÈµÄ¼õÂýÊÇÌØ±ðÃ÷ÏÔµÄ ¡£SQL Server Agent×Ô¶¯ÔÚÃ¿¸öDONE_IN_PROC ÐÅºÅºóÇ¿¼ÓÒ»¸öÑÓ³Ù£¬ÒÔ±ÜÃâ·þÎñÆ÷ÓµÈû ¡£Èç¹ûÄãÏëÍ¨¹ý²éÑ¯·ÖÎöÆ÷À´ÔËÐÐÍ¬ÑùµÄÒ»×éÃüÁî£¬ÓÉÓÚÃ»ÓÐÇ¿¼ÓÕâÑùµÄÑÓ³Ù£¬ËüµÄÖ´ÐÐ½«»á¿ìµÃ¶à¡£Èç¹ûÄãÍ¨¹ý²éÑ¯·ÖÎöÆ÷ÔËÐÐÕâÑùµÄ²éÑ¯²¢ÇÒ²é¿´¶à¸öÓï¾ä²úÉúµÄ¶à¸ö"n rows affected"£¬ÄÇÃ´ºÜÓÐ¿ÉÄÜ²éÑ¯»á±»·´¸´Ö´ÐÐ£¬²¢ÇÒ´¥·¢Æ÷Ò²±»ÖØÐÂ´¥·¢¶à´Î£¬Õâ±ÈËüÊµ¼ÊÐèÒªµÄ´ÎÊýÒª¶àºÜ¶à¡£

¡¡¡¡Òª¹ØµôDONE_IN_PROCÏûÏ¢£¬¿ÉÒÔÔÚ´¥·¢Æ÷Óï¾äµÄ¿ªÊ¼ÓÃSET NOCOUNT ONÃüÁî¡£´ó¶àÊýÊ±ºò£¬ÒÔÈÎºÎ·½Ê½¶ÔÐÐ½øÐÐ¼ÆÊý¶¼ÊÇ²»ÐèÒªµÄ¡£Èç¹ûÈ·ÊµÐèÒª£¬Äã¿ÉÒÔ¿¼ÂÇÖØÐÂ¹¹ÔìÃüÁîÀ´´¥·¢´¥·¢Æ÷£¨»òÕßÊÇ´¥·¢Æ÷±¾Éí£©£¬ÕâÑù¾ÍÊ¹ËùÓÐµÄ¸Ä±ä×÷ÎªÒ»¸öÃüÁîÍê³É¡£Èç¹ûÕâ¸ö½ø³ÌÈÔÈ»»¨ÁËºÜ³¤Ê±¼ä£¬ÎªÁË¼òµ¥Æð¼û£¬ÄãÓ¦¸ÃÖØÐÂÏëÒ»¸ö·½·¨À´¼¤·¢´¥·¢Æ÷¡£
SET NOCOUNT
Ê¹·µ»ØµÄ½á¹ûÖÐ²»°üº¬ÓÐ¹ØÊÜ Transact-SQL Óï¾äÓ°ÏìµÄÐÐÊýµÄÐÅÏ¢¡£

Óï·¨
SET NOCOUNT { ON | OFF }

×¢ÊÍ
µ± SET NOCOUNT Îª ON Ê±£¬²»·µ»Ø¼ÆÊý£¨±íÊ¾ÊÜ Transact-SQL Óï¾äÓ°ÏìµÄÐÐÊý£©¡£µ± SET NOCOUNT Îª OFF Ê±£¬·µ»Ø¼ÆÊý¡£

¼´Ê¹µ± SET NOCOUNT Îª ON Ê±£¬Ò²¸üÐÂ @@ROWCOUNT º¯Êý¡£

<<<<<<< HEAD
å½“ SET NOCOUNT ä¸º ON æ—¶ï¼Œå°†ä¸ç»™å®¢æˆ·ç«¯å‘é€å­˜å‚¨è¿‡ç¨‹ä¸­çš„æ¯ä¸ªè¯­å¥çš„ DONE_IN_PROC ä¿¡æ¯ã€‚å½“ä½¿ç”¨ Microsoft&reg; SQL ServerTM æä¾›çš„å®žç”¨å·¥å…·æ‰§è¡ŒæŸ¥è¯¢æ—¶ï¼Œåœ¨ Transact-SQL è¯­å¥ï¼ˆå¦‚ SELECTã€INSERTã€UPDATE å’Œ DELETEï¼‰ç»“æŸæ—¶å°†ä¸ä¼šåœ¨æŸ¥è¯¢ç»“æžœä¸­æ˜¾ç¤º"nn rows affected"ã€‚
=======
µ± SET NOCOUNT Îª ON Ê±£¬½«²»¸ø¿Í»§¶Ë·¢ËÍ´æ´¢¹ý³ÌÖÐµÄÃ¿¸öÓï¾äµÄ DONE_IN_PROC ÐÅÏ¢¡£µ±Ê¹ÓÃ Microsoft&reg; SQL ServerTM Ìá¹©µÄÊµÓÃ¹¤¾ßÖ´ÐÐ²éÑ¯Ê±£¬ÔÚ Transact-SQL Óï¾ä£¨Èç SELECT¡¢INSERT¡¢UPDATE ºÍ DELETE£©½áÊøÊ±½«²»»áÔÚ²éÑ¯½á¹ûÖÐÏÔÊ¾"nn rows affected"¡£
>>>>>>> 777656939919fcd677982f6f5e3777037836113a

Èç¹û´æ´¢¹ý³ÌÖÐ°üº¬µÄÒ»Ð©Óï¾ä²¢²»·µ»ØÐí¶àÊµ¼ÊµÄÊý¾Ý£¬Ôò¸ÃÉèÖÃÓÉÓÚ´óÁ¿¼õÉÙÁËÍøÂçÁ÷Á¿£¬Òò´Ë¿ÉÏÔÖøÌá¸ßÐÔÄÜ¡£

SET NOCOUNT ÉèÖÃÊÇÔÚÖ´ÐÐ»òÔËÐÐÊ±ÉèÖÃ£¬¶ø²»ÊÇÔÚ·ÖÎöÊ±ÉèÖÃ¡£   
    
Àý×Ó£º
´ÓÄ³ÕÅ±í²éÑ¯Êý¾Ýºó£¬
½á¹ûµÄ×îºó»áÓÐÒ»ÐÐÐ´×ÅÓÐ¶àÉÙÐÐ½á¹ûÖ®ÀàµÄ¶«Î÷£¬
set nocount onÖ®ºó£¬
ÕâÒ»ÐÐ¾Í¿´²»µ½ÁË