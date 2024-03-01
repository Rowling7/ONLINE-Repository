/* DBMS查询
--项目类型
select j0103, hj0103,a0102
from k001
--update  k001 set j0103='09'
where j0103 ='9'

--项目类型
select j0103,hj0103, a0102
from k001
--update  k001 set j0103='07'
where j0103 ='7'

--项目类型
select j0103,hj0103, a0102
from L001
--update  L001 set j0103='07'
where j0103 ='7'

select j0103, hj0103,a0102
from L001
--update  L001 set j0103='09'
where j0103 ='9'



--GBM
select k3102 ,hk3102 ,a0102
from  k001
--update k001 set k3102 = null,hk3102 =null
where k3102='0'

select k3102 ,hk3102 ,a0102
from  l001
--update L001 set k3102 = null,hk3102 =null
where k3102='0'


--行政等级
select  a0203,a0102
from a50
--update a50 set a0203='C'
where a0203='c'


-- 路线性质
select  kf0180,hkf0180,a0102
from a50
--update a50 set kf0180=null,hkf0180=null
where kf0180='0'

-- 路线性质
select  kf0180,hkf0180,a0102
from a50
--update a50 set kf0180=null,hkf0180=null
where kf0180='?'


--是否按干线公路管养接养
select k0138,hk0138 ,a0102
from k001
--update k001 set k0138= null
where k0138 ='?'

select k0138,hk0138 ,a0102
from L001
--update L001 set k0138= null
where k0138 ='?'

--k084
select a0103,a0102,'421088'+right(rtrim(a0103),3)
from k084
--update k084 set  a0103='421088'+right(rtrim(a0103),3)
where  a0103 like '421023%'

--k084
select a0103,a0102
from k084
--update k084 set  a0103='420882'
where  a0103 like '420821%'


-- L001 k0161
-- select a0103,a0102,'421088'+right(rtrim(a0103),3)
-- FROM L001
--update l001 set  a0103='421088'+right(rtrim(a0103),3)
--where  a0103 like '421023%'

--update l001 set  a0103='421088'+right(rtrim(a0103),3)
--where  a0103 like '421088023%'


--L001
SELECT K0161
FROM L001
--update l001 set  K0161='421088'+right(rtrim(a0103),3)
where  K0161  like '421023%'


--L060
select a0103,a0102,'421088'+right(rtrim(a0103),3)
FROM L060
--update l060 set  a0103='421088'+right(rtrim(a0103),3)
where  a0103 like '421023%'


SELECT K6115
FROM L060
-- UPDATE L060 SET  K6115 =NULL
WHERE K6115='一'

--路段收费性质
select  k0128,hk0128,bg0128,hbg0128
from bg01
-- update bg01 set k0128 ='01', bg0128='01'
where k0128='1'


-- 建设性质
select j0838,hj0838
from  j08
-- update j08 set  j0838 ='5',hj0838='加固改造'
where j0838 ='9'


--j05
select k0101,j0312
from j05
-- update j05 set k0101=j0312,j0312= k0101
where  j0102= '2019421222006'


--j03
select j5104,hj5104
from j03
--update j03 set j5104='12',hj5104='水泥混凝土'
where j5104 is not null and hj5104 is null

select j5104,hj5104
from j03
--update j03 set j5104 ='5' ,hj5104='未铺装路面(无路面)'
where j5104 ='36'


--拟建道路
SELECT  V8103
FROM V53
--update v53 set v8103 = 'V'
WHERE v8103='w'


--所属地形
SELECT V0506
FROM V53
--UPDATE V53 SET V0506 ='1'
WHERE V0506='11'

*/


/* DBMS 执行
update  k001 set j0103='09'
where j0103 ='9';

update  k001 set j0103='07'
where j0103 ='7';

update  L001 set j0103='07'
where j0103 ='7';

update  L001 set j0103='09'
where j0103 ='9';

update k001 set k3102 = null,hk3102 =null
where k3102='0';

update L001 set k3102 = null,hk3102 =null
where k3102='0';

update a50 set a0203='C'
where a0203='c';

update a50 set kf0180=null,hkf0180=null
where kf0180='0';

update a50 set kf0180=null,hkf0180=null
where kf0180='?';

update k001 set k0138= null
where k0138 ='?';

update L001 set k0138= null
where k0138 ='?';

update k084 set  a0103='421088'+right(rtrim(a0103),3)
where  a0103 like '421023%';

update k084 set  a0103='420882'
where  a0103 like '420821%';

update l001 set  K0161='421088'+right(rtrim(a0103),3)
where  K0161  like '421023%';

update l060 set  a0103='421088'+right(rtrim(a0103),3)
where  a0103 like '421023%';

UPDATE L060 SET  K6115 =NULL
WHERE K6115='一';

update bg01 set k0128 ='01', bg0128='01'
where k0128='1';

update j08 set  j0838 ='5',hj0838='加固改造'
where j0838 ='9';

update j05 set k0101=j0312,j0312= k0101
where  j0102= '2019421222006';

update j03 set j5104='12',hj5104='水泥混凝土'
where j5104 is not null and hj5104 is null;

update j03 set j5104 ='5' ,hj5104='未铺装路面(无路面)'
where j5104 ='36';

update v53 set v8103 = 'V'
WHERE v8103='w';

UPDATE V53 SET V0506 ='1'
WHERE V0506='11';
*/



/* GHSS  查询
-- A11
SELECT a0203
from a11
-- UPDATE A11 SET A0203 ='S'
WHERE A0203='s';

-- UPDATE A11 SET A0203 ='Y'
WHERE A0203='y';

SELECT *
-- DELETE
FROM A21
WHERE HA0103='湖北省十堰市郧  县';

SELECT A0103,ha0103
from a21
-- UPDATE A21 SET a0103 ='420304' ,ha0103='郧阳区'
where a0103 ='420321';

SELECT A0103 ,HA0103
FROM A21
-- UPDATE A21 SET A0103 ='420882' ,HA0103='京山市'
WHERE A0103 ='420821';

SELECT A0103 ,HA0103
FROM A21
-- UPDATE A21 SET A0103 ='421088' ,HA0103='监利市'
WHERE A0103 ='421023';

SELECT A0103 ,HA0103
FROM a17
-- UPDATE a17 SET A0103 ='420882' ,HA0103='京山市'
WHERE A0103 ='420821';

SELECT A0103 ,HA0103
FROM a17
-- UPDATE a17 SET A0103 ='421088' ,HA0103='监利市'
WHERE A0103 ='421023';


update k88 set  a0103='421088'+right(rtrim(a0103),3)
where  a0103 like '421023%'


SELECT a0203,ha0203
from a51
-- update a51 set a0203 ='S'
where  a0203='s'
*/


/*GHSS 执行
-- A11
UPDATE A11 SET A0203 ='Y'
WHERE A0203='y';

UPDATE A11 SET A0203 ='S'
WHERE A0203='s';

DELETE
FROM A21
WHERE HA0103='湖北省十堰市郧  县';

UPDATE A21 SET a0103 ='420304' ,ha0103='郧阳区'
where a0103 ='420321';

UPDATE A21 SET A0103 ='420882' ,HA0103='京山市'
WHERE A0103 ='420821';

UPDATE A21 SET A0103 ='421088' ,HA0103='监利市'
WHERE A0103 ='421023';

UPDATE a17 SET A0103 ='420882' ,HA0103='京山市'
WHERE A0103 ='420821';

UPDATE a17 SET A0103 ='421088' ,HA0103='监利市'
WHERE A0103 ='421023';

UPDATE A25 SET A0103 ='421088' ,HA0103='监利市'
WHERE A0103 ='421023';

UPDATE A27 SET a0103 ='420304' ,ha0103='郧阳区'
where a0103 ='420321';

UPDATE A27 SET A0103 ='420882' ,HA0103='京山市'
WHERE A0103 ='420821';

UPDATE A27 SET A0103 ='421088' ,HA0103='监利市'
WHERE A0103 ='421023';

UPDATE A15 SET A0103 ='421088' ,HA0103='监利市'
WHERE A0103 ='421023';

UPDATE K04 SET A0203 ='Y'
WHERE A0203 ='1465.853'

update a51 set a0203 ='S'
where  a0203='s'

update a51 set a0203 ='Y'
where  a0203='y'

update a51 set a0203 ='X'
where  a0203='x'

*/