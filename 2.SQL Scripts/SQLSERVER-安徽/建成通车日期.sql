/*
---����ͨ������

����	S208340210L0070	80.352	S208	20161201
��ɽ���ţ����У�	S460340223L0090	37.681	S460	20150320
�Ҹ���	G206340123L0290	1134.522	G206	20151001
·����	G329340122L0110	785.256	G329	20220515
С����	G329340122L0120	789.006	G329	20220515
ͯׯ��	G329340122L0130	790.967	G329	20220515
��԰��	G329340122L0140	791.656	G329	20220515
÷��	G329340122L0160	792.997	G329	20220515
������	G329340122L0170	796.634	G329	20220515
����	G329340122L0180	801.749	G329	20230715
������	G329340122L0190	818.437	G329	20230715
*/

declare @qlbm varchar(255)
declare @k0116 varchar(255)
set @qlbm='G329340122L0190'
set @k0116='20230715'

SELECT @qlbm,@k0116,'',''
union
SELECT left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001),rtrim(k0116),rtrim(k6002),rtrim(k6003)
--update k060 set k0116=@k0116
from k060 
where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001) =@qlbm


update k060 set k0116=@k0116
from k060 
where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001) =@qlbm



SELECT @qlbm,@k0116,'',''
union
SELECT left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001),rtrim(k0116),rtrim(k6002),rtrim(k6003)
--update k060 set k0116=@k0116
from k060 
where left(k0101,4)+left(a0103,6)+'L'+rtrim(k6001) =@qlbm
