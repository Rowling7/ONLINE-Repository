/*����ʾ��*/
SELECT
	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K05.K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''),		--·�߱��
	RTRIM(A50.K0112),	--·������
	K05.K0105,		--���׮��
	K05.K0106,		--ֹ��׮��
	RTRIM(OBJJC),		--��ⷽ��
	RTRIM(HK0304),		--�����ȼ�
	CASE WHEN K5104 IN ('11','21','22','23') THEN '����' WHEN K5104 IN ('12') THEN 'ˮ��' ELSE 'ɰʯ' END,			--·������
	A5008,		--·�γ���(��)
	case when isnull(a5011,0)=0 then nullif(a5010,0) else a5010 end,		--MQI
	nullif(a5011,0),		--PQI
	case when isnull(a5011,0)=0 then nullif(a5011A,0) else a5011A end,		--PCI
	case when isnull(a5011,0)=0 then nullif(a5011B,0) else a5011B end,		--RQI
	case when isnull(a5011,0)=0 then nullif(a5011C,0) else a5011C end,		--RDI
	case when isnull(a5011,0)=0 then nullif(a5011F,0) else a5011F end,		--PBI
	case when isnull(a5011,0)=0 then nullif(a5011G,0) else a5011G end,		--PWI
	case when isnull(a5011,0)=0 then nullif(a5011D,0) else a5011D end,		--SRI
	case when isnull(a5011,0)=0 then nullif(a5011E,0) else a5011E end,		--PSSI
	case when isnull(a5011,0)=0 then nullif(a5012,0) else a5012 end,		--SCI
	case when isnull(a5011,0)=0 then nullif(a5013,0) else a5013 end,		--BCI
	case when isnull(a5011,0)=0 then nullif(a5014,0) else a5014 end,		--TCI
	case when k05.k0101 like '%D%' AND LEN(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K05.K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=4 then '����-'+cast(isnull(a0129,'') as varchar(100)) else cast(isnull(a0129,'') as varchar(100)) end		--��ע
FROM 	K05 	LEFT JOIN D132 ON K05.A5009=D132.OBJNAME
		LEFT JOIN A50 ON K05.A0102=A50.A0102 AND K05.K0101=A50.K0101
WHERE	K05.A0102 LIKE '34%'
	AND LEFT(K05.A0101A,4) = '2023'
	AND (SUBSTRING(RTRIM(K05.A0101A),5,1)-1)*3+SUBSTRING(RTRIM(K05.A0101A),6,1)= '12'

ORDER BY REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K05.K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''),K05.K0105,A5009
