--11b-1
select
	'��  ��',	--·�߱��
	'',		--������������
	'',		--·������
	'',		--���׮��
	'',		--ֹ��׮��
	'',		--��ⷽ��
	'',		--�����ȼ�
	'',		--·������
	CAST(CAST((ISNULL(SUM(CASE WHEN ISNULL(A5009,'') IN ('2','3') THEN isnull(a5008,0) END)/2,0)+
	ISNULL(SUM(CASE WHEN ISNULL(A5009,'') IN ('1') THEN isnull(a5008,0) END),0))/1000 AS NUMERIC(18,3)) AS VARCHAR)+'����',	--·�γ���(����)
	'',		--·�ο��(��)
	CAST(sum(isnull(A5010,0)*isnull(a5008,0))/nullif(sum(isnull(a5008,0)),0) AS NUMERIC(18,2)) MQI,		--MQI
	CAST(sum(isnull(A5011,0)*isnull(a5008,0))/nullif(sum(isnull(a5008,0)),0) AS NUMERIC(18,2)) PQI,		--PQI
		'','',''
	from  k03 a
where	isnull(A5010,0)<>0 AND isnull(A5011,0)<>0
	AND left(k0101,1) in ('X','Y','C')
	AND a.A0102 LIKE '34%'
	AND LEFT(a.A0101A,4) = '2023'
	AND (SUBSTRING(RTRIM(a.A0101A),5,1)-1)*3+SUBSTRING(RTRIM(a.A0101A),6,1)= '12'


UNION

--11b-2
select
	'�ص�',	--·�߱��
	'',		--������������
	'',		--·������
	'',		--���׮��
	'',		--ֹ��׮��
	'',		--��ⷽ��
	'',		--�����ȼ�
	'',		--·������
	CAST(CAST((ISNULL(SUM(CASE WHEN ISNULL(A5009,'') IN ('2','3') THEN isnull(a5008,0) END)/2,0)+
	ISNULL(SUM(CASE WHEN ISNULL(A5009,'') IN ('1') THEN isnull(a5008,0) END),0))/1000 AS NUMERIC(18,3)) AS VARCHAR)+'����',	--·�γ���(����)
	'',		--·�ο��(��)
	CAST(sum(isnull(A5010,0)*isnull(a5008,0))/nullif(sum(isnull(a5008,0)),0) AS NUMERIC(18,2)) MQI,		--MQI
	CAST(sum(isnull(A5011,0)*isnull(a5008,0))/nullif(sum(isnull(a5008,0)),0) AS NUMERIC(18,2)) PQI,		--PQI
		'','',''
	from  k03 a
where	isnull(A5010,0)<>0 AND isnull(A5011,0)<>0
	AND left(k0101,1) in ('X')
	AND a.A0102 LIKE '34%'
	AND LEFT(a.A0101A,4) = '2023'
	AND (SUBSTRING(RTRIM(a.A0101A),5,1)-1)*3+SUBSTRING(RTRIM(a.A0101A),6,1)= '12'



UNION

--11b-3
select
	'���',	--·�߱��
	'',		--������������
	'',		--·������
	'',		--���׮��
	'',		--ֹ��׮��
	'',		--��ⷽ��
	'',		--�����ȼ�
	'',		--·������
	CAST(CAST((ISNULL(SUM(CASE WHEN ISNULL(A5009,'') IN ('2','3') THEN isnull(a5008,0) END)/2,0)+
	ISNULL(SUM(CASE WHEN ISNULL(A5009,'') IN ('1') THEN isnull(a5008,0) END),0))/1000 AS NUMERIC(18,3)) AS VARCHAR)+'����',	--·�γ���(����)
	'',		--·�ο��(��)
	CAST(sum(isnull(A5010,0)*isnull(a5008,0))/nullif(sum(isnull(a5008,0)),0) AS NUMERIC(18,2)) MQI,		--MQI
	CAST(sum(isnull(A5011,0)*isnull(a5008,0))/nullif(sum(isnull(a5008,0)),0) AS NUMERIC(18,2)) PQI,		--PQI
	'','',''
		from  k03 a
where	isnull(A5010,0)<>0 AND isnull(A5011,0)<>0
	and left(k0101,1) in ('Y')
	AND a.A0102 LIKE '34%'
	AND LEFT(a.A0101A,4) = '2023'
	AND (SUBSTRING(RTRIM(a.A0101A),5,1)-1)*3+SUBSTRING(RTRIM(a.A0101A),6,1)= '12'

UNION

--11b-4
/*����ʾ��*/
select
	'���',	--·�߱��
	'',		--������������
	'',		--·������
	'',		--���׮��
	'',		--ֹ��׮��
	'',		--��ⷽ��
	'',		--�����ȼ�
	'',		--·������
	CAST(CAST((ISNULL(SUM(CASE WHEN ISNULL(A5009,'') IN ('2','3') THEN isnull(a5008,0) END)/2,0)+
	ISNULL(SUM(CASE WHEN ISNULL(A5009,'') IN ('1') THEN isnull(a5008,0) END),0))/1000 AS NUMERIC(18,3)) AS VARCHAR)+'����',	--·�γ���(����)
	'',		--·�ο��(��)
	CAST(sum(isnull(A5010,0)*isnull(a5008,0))/nullif(sum(isnull(a5008,0)),0) AS NUMERIC(18,2)) MQI,		--MQI
	CAST(sum(isnull(A5011,0)*isnull(a5008,0))/nullif(sum(isnull(a5008,0)),0) AS NUMERIC(18,2)) PQI,		--PQI
	'','',''
from  k03 a
where	isnull(A5010,0)<>0 AND isnull(A5011,0)<>0
	and left(k0101,1) in ('C')
	AND a.A0102 LIKE '34%'
	AND LEFT(a.A0101A,4) = '2023'
	AND (SUBSTRING(RTRIM(a.A0101A),5,1)-1)*3+SUBSTRING(RTRIM(a.A0101A),6,1)= '12'



--11b-5

/*����ʾ��*/
SELECT
	RTRIM(a.K0101),		--·�߱��
	LEFT(a.A0103,6),	--������������
	RTRIM(A50.K0112),	--·������
	a.K0108,		--���׮��
	a.K0109,		--ֹ��׮��
	RTRIM(OBJJC),		--��ⷽ��
	RTRIM(HK0304),		--�����ȼ�
	CASE WHEN K5104 IN ('11','21','22','23') THEN '����' WHEN K5104 IN ('12') THEN 'ˮ��' ELSE 'ɰʯ' END,			--·������
	A5008,		--·�γ���(��)
	K5404,		--·����
	CASE WHEN ISNULL(A5010,0)=0 AND ISNULL(A5011,0)=0 THEN NULLIF(a5010,0) ELSE ISNULL(A5010,0) END,		--MQI
	CASE WHEN ISNULL(A5010,0)=0 AND ISNULL(A5011,0)=0 THEN NULLIF(A5011,0) ELSE ISNULL(A5011,0) END,		--PQI
	CASE WHEN ISNULL(A5011,0)=0 THEN NULL ELSE HA5080 END,		--��ⷽʽ
	CASE WHEN ISNULL(A5011,0)=0 THEN NULL ELSE HA5081 END,		--������
	CAST(A0129 AS VARCHAR(100))	--��ע
FROM 	K03 a	LEFT JOIN D132 ON a.A5009=D132.OBJNAME
		LEFT JOIN A50 ON a.A0102=A50.A0102 AND a.K0101=A50.K0101
WHERE	left(a.k0101,1) in ('X','Y','C')
	AND a.A0102 LIKE '34%'
	AND LEFT(a.A0101A,4) = '2023'
	AND (SUBSTRING(RTRIM(a.A0101A),5,1)-1)*3+SUBSTRING(RTRIM(a.A0101A),6,1)= '12'
ORDER BY RTRIM(a.K0101),a.K0108,A5009