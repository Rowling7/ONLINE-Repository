--DK6306
---10.未变更
---11.新建
---14.往年建成本年统计
---21.指标变更或地理位置变更


----------------------------------路线----------------------------------
--修建年度2023 变更原因改为 新建
SELECT  k3912
--update k001 set k3912='11',hk3912='新建'
from k001 
where k0180 = '2023'

--修建年度不是2023 且没有唯一id  变更原因改为往年建成本年统计
SELECT  a0102,k0101,k3912,k0180
--update k001 set k3912='14',hk3912='往年建成本年统计'
from k001 
where kwyid is null and k0180 <> '2023'

--变更愿意填写12
SELECT  a0102,k0101,k3912,k0180
--update k001 set k3912='14',hk3912='往年建成本年统计'
from k001 
where k3912='12'

--“变更原因”为“11.新建”或“14.往年建成本年统计”时，“原路线代码”须为空
SELECT  a0102,k0101,k3912,Hk3912,k0180,A9903
--update k001 set A9903 =NULL
from k001 
where k3912 IN('11','14') and A9903 is not null
ORDER  BY A9903 DESC

SELECT A0102,K0101,RTRIM(K0112) K0112, K3912,Hk3912,A9903
FROM K001 
--WHERE K3912='11'
--WHERE K3912='14'
--WHERE K3912='21'
WHERE K3912 IN ('11','14')


----------------------------------桥梁----------------------------------
--修建年度2023 变更原因改为 新建
SELECT  k3912
--update k060 set k3912='11',hk3912='新建'
from k060
where k0180 = '2023'

--修建年度不是2023 且没有唯一id  变更原因改为往年建成本年统计
SELECT  a0102,k0101,k6002,k3912,hk3912,k0180
--update k060 set k3912='14',hk3912='往年建成本年统计'
from k060
where kwyid is null and k0180 <> '2023'
ORDER BY k3912 desc

--变更原因填写12
SELECT  a0102,k0101,k3912,k0180
--update k001 set k3912='14',hk3912='往年建成本年统计'
from k001 
where k3912='12'

--“变更原因”为“1.新建”或“14.往年建成本年统计”时，“原路线代码”须为空
SELECT  a0102,k0101,k3912,Hk3912,k0180,A9903
--update k060 set A9903 =NULL
from k060 
where k3912 IN('11','14') and A9903 is not null
ORDER  BY A9903 DESC

SELECT A0102,K0101,RTRIM(K6002) K6002, K3912,Hk3912,A9903
FROM k060 
--WHERE K3912='11'
--WHERE K3912='14'
--WHERE K3912='21'
WHERE K3912 IN ('11','14')

----------------------------------隧道----------------------------------
--修建年度2023 变更原因改为 新建
SELECT  k3912
--update k063 set k3912='11',hk3912='新建'
from k063
where k0180 = '2023'

--修建年度不是2023 且没有唯一id  变更原因改为往年建成本年统计
SELECT  a0102,k0101,k6302,k3912,hk3912,k0180
--update k063 set k3912='14',hk3912='往年建成本年统计'
from k063
where kwyid is null and k0180 <> '2023'
ORDER BY k3912 desc

--变更原因填写12
SELECT  a0102,k0101,k3912,k0180
--update k063 set k3912='14',hk3912='往年建成本年统计'
from k063 
where k3912='12'

--“变更原因”为“1.新建”或“14.往年建成本年统计”时，“原路线代码”须为空
SELECT  a0102,k0101,k3912,Hk3912,k0180,A9903
--update k063 set A9903 =NULL
from k063 
where k3912 IN('11','14') and A9903 is not null
ORDER  BY A9903 DESC


SELECT A0102,K0101,RTRIM(K6302) K6302, K3912,Hk3912,A9903
FROM k063 
--WHERE K3912='11'
--WHERE K3912='14'
--WHERE K3912='21'
WHERE K3912 IN ('11','14')