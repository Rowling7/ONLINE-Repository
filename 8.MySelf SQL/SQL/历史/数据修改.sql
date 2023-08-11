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

select k3102 ,hk3102 ,a0102
from  k001 
--update k001 set k3102 = null,hk3102 =null 
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
