--DK6306
---10.δ���
---11.�½�
---14.���꽨�ɱ���ͳ��
---21.ָ���������λ�ñ��


----------------------------------·��----------------------------------
--�޽����2023 ���ԭ���Ϊ �½�
SELECT  k3912
--update k001 set k3912='11',hk3912='�½�'
from k001 
where k0180 = '2023'

--�޽���Ȳ���2023 ��û��Ψһid  ���ԭ���Ϊ���꽨�ɱ���ͳ��
SELECT  a0102,k0101,k3912,k0180
--update k001 set k3912='14',hk3912='���꽨�ɱ���ͳ��'
from k001 
where kwyid is null and k0180 <> '2023'

--���Ը����д12
SELECT  a0102,k0101,k3912,k0180
--update k001 set k3912='14',hk3912='���꽨�ɱ���ͳ��'
from k001 
where k3912='12'

--�����ԭ��Ϊ��11.�½�����14.���꽨�ɱ���ͳ�ơ�ʱ����ԭ·�ߴ��롱��Ϊ��
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


----------------------------------����----------------------------------
--�޽����2023 ���ԭ���Ϊ �½�
SELECT  k3912
--update k060 set k3912='11',hk3912='�½�'
from k060
where k0180 = '2023'

--�޽���Ȳ���2023 ��û��Ψһid  ���ԭ���Ϊ���꽨�ɱ���ͳ��
SELECT  a0102,k0101,k6002,k3912,hk3912,k0180
--update k060 set k3912='14',hk3912='���꽨�ɱ���ͳ��'
from k060
where kwyid is null and k0180 <> '2023'
ORDER BY k3912 desc

--���ԭ����д12
SELECT  a0102,k0101,k3912,k0180
--update k001 set k3912='14',hk3912='���꽨�ɱ���ͳ��'
from k001 
where k3912='12'

--�����ԭ��Ϊ��1.�½�����14.���꽨�ɱ���ͳ�ơ�ʱ����ԭ·�ߴ��롱��Ϊ��
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

----------------------------------���----------------------------------
--�޽����2023 ���ԭ���Ϊ �½�
SELECT  k3912
--update k063 set k3912='11',hk3912='�½�'
from k063
where k0180 = '2023'

--�޽���Ȳ���2023 ��û��Ψһid  ���ԭ���Ϊ���꽨�ɱ���ͳ��
SELECT  a0102,k0101,k6302,k3912,hk3912,k0180
--update k063 set k3912='14',hk3912='���꽨�ɱ���ͳ��'
from k063
where kwyid is null and k0180 <> '2023'
ORDER BY k3912 desc

--���ԭ����д12
SELECT  a0102,k0101,k3912,k0180
--update k063 set k3912='14',hk3912='���꽨�ɱ���ͳ��'
from k063 
where k3912='12'

--�����ԭ��Ϊ��1.�½�����14.���꽨�ɱ���ͳ�ơ�ʱ����ԭ·�ߴ��롱��Ϊ��
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