
USE [HRP-DBMS2015]

select 
RTRIM(HA0102) ��λ,
sum(1) ������,
sum(K6008) ������,
SUM(CASE WHEN K6062 = '1' THEN 1 ELSE 0 END) ��ͨ����,
SUM(CASE WHEN K6062 = '1' THEN ISNULL(K6008,0) ELSE 0 END) ��ͨ����,
sum(case when K6028 in ('4','5') then 1 else 0 end)Σ��,
sum(case when K6028 in ('4','5') then K6008 else 0 end)Σ������,
sum(case when K6004='1' then 1 else 0 end) ������,
sum(case when K6004='1' then K6008 else 0 end) ������,
sum(case when K6004='2' then 1 else 0 end) ��������,
sum(case when K6004='2' then K6008 else 0 end) ��������,
sum(case when K6004='3' then 1 else 0 end) ��ʱ��,
sum(case when K6004='3' then K6008 else 0 end) ��ʱ��,

RTRIM(HA0102) ��λ,
COUNT(K6007) ������,
SUM(K6008) ������,
SUM(CASE WHEN K6007 = '1' THEN 1 ELSE 0 END) �ش�����,
SUM(CASE WHEN K6007 = '1' THEN ISNULL(K6008,0) ELSE 0 END) �ش�����,
SUM(CASE WHEN K6007 = '2' THEN 1 ELSE 0 END) ��������,
SUM(CASE WHEN K6007 = '2' THEN ISNULL(K6008,0) ELSE 0 END) ��������,
SUM(CASE WHEN K6007 = '3' THEN 1 ELSE 0 END) ��������,
SUM(CASE WHEN K6007 = '3' THEN ISNULL(K6008,0) ELSE 0 END) ��������,
SUM(CASE WHEN K6007 = '4' THEN 1 ELSE 0 END) С������,
SUM(CASE WHEN K6007 = '4' THEN ISNULL(K6008,0) ELSE 0 END) С������
from K060 
	
	WHERE  LEFT(K0101,1) IN ('G') --���й�����H
	--WHERE  LEFT(K0101,1) IN ('S')--����ʡ��
	--WHERE  LEFT(K0101,1) IN ('X','Z')--������ר��
	--WHERE  LEFT(K0101,1) IN ('H','T') --������H����
GROUP BY HA0102 WITH ROLLUP
ORDER BY RTRIM(HA0102) 


--���
SELECT 
	RTRIM(B.A0102) A0102,
	RTRIM(B.HA0102) HA0102,
	SUM(CASE WHEN A.K6304 IN ('1','2','3','4') THEN 1 ELSE 0 END) �������,
	SUM(CASE WHEN A.K6304 IN ('1','2','3','4') THEN A.K6305 ELSE 0 END) �����������
FROM K063 A
	RIGHT JOIN (
		SELECT RTRIM(HA0102) HA0102,RTRIM(A0102) A0102
		FROM K060 
		GROUP BY HA0102,RTRIM(A0102)
		)B  ON A.HA0102 = B.HA0102
	
	WHERE  LEFT(K0101,1) IN ('G') --���й�����H
	--WHERE  LEFT(K0101,1) IN ('S')--����ʡ��
	--WHERE  LEFT(K0101,1) IN ('X','Z')--������ר��
	--WHERE  LEFT(K0101,1) IN ('H','T') --������H����
GROUP BY RTRIM(B.HA0102),RTRIM(B.A0102) WITH ROLLUP
HAVING GROUPING(RTRIM(B.A0102))=GROUPING(RTRIM(B.HA0102))
ORDER BY RTRIM(B.HA0102)

