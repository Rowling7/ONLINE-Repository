-- ��ʱ���������
UPDATE zcpt_k060
SET zcpt_k060.k6040=rtrim(k060.k6040)
FROM zcpt_k060
left JOIN k060
ON (case when left(k060.k0101,1)in ('H','G','T','S') then rtrim(replace(replace(replace(replace(replace(replace(replace(k060.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001)
else left(k060.k0101,4)+left(k060.a0103,6)+'L'+rtrim(k060.k6001) end) = rtrim(ZCPT_K060.k6001)
WHERE LEFT(k060.K0101,1) IN ('G','s')


--�����Ӳ�ѯ
SELECT rtrim(K060.K6040)
from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT  rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001)
from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'


--9.2.3
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,rtrim(NBZC.zk0101)'�ʲ�ƽ̨|����·�ߴ���',
CASE WHEN rtrim(NBZC.k0101)<>rtrim(NBZC.zk0101) THEN '����·�ߴ��� ��һ��'	ELSE null END '����·�ߴ��� �Ա�',
rtrim(NBZC.k6002) k6002,rtrim(NBZC.zk6002) '�ʲ�ƽ̨|��������',
CASE WHEN rtrim(NBZC.k6002)<>rtrim(NBZC.zk6002) THEN '�������� ��һ��'	ELSE null END '�������� �Ա�',
rtrim(NBZC.k6003) k6003,rtrim(NBZC.zk6003) '�ʲ�ƽ̨|��������׮��',
CASE WHEN rtrim(NBZC.k6003)<>rtrim(NBZC.zk6003) THEN '��������׮�� ��һ��'	ELSE null END'��������׮�� �Ա�',
rtrim(NBZC.A0103)A0103,rtrim(NBZC.zA0103)'�ʲ�ƽ̨|��������',
CASE WHEN rtrim(NBZC.A0103)<>rtrim(NBZC.zA0103) THEN '�������� ��һ��'	ELSE null END'�������� �Ա�',
rtrim(NBZC.hA0103)hA0103,rtrim(NBZC.zhA0103)'�ʲ�ƽ̨|������������',
CASE WHEN rtrim(NBZC.HA0103)<>rtrim(NBZC.zHA0103) THEN '������������ ��һ��'	ELSE null END'������������ �Ա�',

nbzc.K6040
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,
rtrim(ZCPT_K060.K0101) zK0101,
rtrim(k060.A0103) A0103,rtrim(ZCPT_K060.A0103) zA0103,
rtrim(k060.hA0103) hA0103,rtrim(ZCPT_K060.hA0103) zhA0103,
rtrim(k060.k6002) k6002,rtrim(ZCPT_K060.k6002) zk6002,
rtrim(k060.k6003) k6003,rtrim(ZCPT_K060.k6003) zk6003,
rtrim(K060.K6040) K6040
from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
--k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,
rtrim(ZCPT_K060.K0101) zK0101,
rtrim(k060.A0103) A0103,rtrim(ZCPT_K060.A0103) zA0103,
rtrim(k060.hA0103) hA0103,rtrim(ZCPT_K060.hA0103) zhA0103,
rtrim(k060.k6002) k6002,rtrim(ZCPT_K060.k6002) zk6002,
rtrim(k060.k6003) k6003,rtrim(ZCPT_K060.k6003) zk6003,
rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001
from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
--k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and(
rtrim(NBZC.k6002)<>rtrim(NBZC.zk6002) or -- ��������,
rtrim(NBZC.k6003)<>rtrim(NBZC.zk6003) or -- ��������׮��
rtrim(NBZC.k0101)<>rtrim(NBZC.zk0101) or
rtrim(NBZC.A0103)<>rtrim(NBZC.zA0103) or -- ��������
rtrim(NBZC.hA0103)<>rtrim(NBZC.zhA0103) -- ��������
)
order by k0101


--9.2.4
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,rtrim(NBZC.K6002) K6002,

rtrim(NBZC.K6065) K6065,rtrim(NBZC.zK6065) '�ʲ�ƽ̨|�羶�ܳ�',
CASE WHEN rtrim(NBZC.K6065)<>rtrim(NBZC.zK6065) THEN '�羶�ܳ� ��һ��'	ELSE null END'�羶�ܳ� �Ա�',
rtrim(NBZC.K6063) K6063,rtrim(NBZC.zK6063) '�ʲ�ƽ̨|�������羶',
CASE WHEN rtrim(NBZC.K6063)<>rtrim(NBZC.zK6063) THEN '�������羶 ��һ��'	ELSE null END'�������羶 �Ա�',
rtrim(NBZC.K6064) K6064,rtrim(NBZC.zK6064) '�ʲ�ƽ̨|�����羶���',
CASE WHEN rtrim(NBZC.K6064)<>rtrim(NBZC.zK6064) THEN '�����羶��� ��һ��'	ELSE null END'�����羶��� �Ա�',

nbzc.K6040
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(K060.K6065) K6065,rtrim(ZCPT_K060.K6065) zK6065,
rtrim(K060.K6063) K6063,rtrim(ZCPT_K060.K6063) zK6063,
rtrim(K060.K6064) K6064,rtrim(ZCPT_K060.K6064) zK6064

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,
rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(K060.K6065) K6065,rtrim(ZCPT_K060.K6065) zK6065,
rtrim(K060.K6063) K6063,rtrim(ZCPT_K060.K6063) zK6063,
rtrim(K060.K6064) K6064,rtrim(ZCPT_K060.K6064) zK6064

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
COALESCE(CASE WHEN rtrim(NBZC.K6065)<>rtrim(NBZC.zK6065) THEN '�羶�ܳ� ��һ��'	ELSE null END,
CASE WHEN rtrim(NBZC.K6063)<>rtrim(NBZC.zK6063) THEN '�������羶 ��һ��'	ELSE null END,
CASE WHEN rtrim(NBZC.K6064)<>rtrim(NBZC.zK6064) THEN '�����羶��� ��һ��'	ELSE null END
)  like '%��һ��%'
order by k0101

--9.2.5
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
rtrim(NBZC.zk0101)'�ʲ�ƽ̨|����·�ߴ���',
CASE WHEN rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(NBZC.zk0101) THEN '����·�ߴ��� ��һ��'	ELSE null END '����·�ߴ��� �Ա�',
NBZC.k0112,NBZC.zk0112 '�ʲ�ƽ̨|·�߼��',
CASE WHEN rtrim(NBZC.k0112)<>rtrim(NBZC.zk0112) THEN '·�߼�� ��һ��'	ELSE null END '·�߼�� �Ա�',
NBZC.hk0304,NBZC.zhk0304 '�ʲ�ƽ̨|����·�߼����ȼ��Ա�',
CASE WHEN rtrim(NBZC.hk0304)<>rtrim(NBZC.zhk0304) THEN '����·�߼����ȼ��Ա� ��һ��'	ELSE null END'����·�߼����ȼ��Ա� �Ա�',
nbzc.K6040 '���������/�������'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,
rtrim(ZCPT_K060.K0101) zK0101,
rtrim(k060.k6003) k6003,
rtrim(K060.k0112) k0112 ,rtrim(ZCPT_K060.k0112) zk0112,
rtrim(k001.hk0304) hk0304,rtrim(ZCPT_k060.hk0304) zhk0304,
rtrim(K060.K6040) K6040
from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,
rtrim(ZCPT_K060.K0101) zK0101,
rtrim(k060.k6003) k6003,
rtrim(K060.k0112) k0112 ,rtrim(ZCPT_K060.k0112) zk0112,
rtrim(k001.hk0304) hk0304,rtrim(ZCPT_k060.hk0304) zhk0304,
rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001
from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.k0112)<>rtrim(NBZC.Zk0112)	or --   ·�߼��,
rtrim(NBZC.hk0304)<>rtrim(NBZC.Zhk0304) or 	 --   ����·�߼����ȼ��Ա�,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(NBZC.zk0101)
)	 -- ·�ߴ���,
order by k0101

--9.2.6
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,
NBZC.K6003 k6003,
NBZC.K6007 K6007,NBZC.zK6007 '�ʲ�ƽ̨|�����羶�������',
CASE WHEN K6007<>zK6007 THEN '�����羶������� ��һ��'	ELSE null END'�����羶������� �Ա�',
NBZC.HK6007 HK6007,NBZC.zHK6007 '�ʲ�ƽ̨|�����羶����',
CASE WHEN HK6007<>zHK6007 THEN '�����羶���� ��һ��'	ELSE null END'�����羶���� �Ա�',
NBZC.K6004 K6004,NBZC.zK6004 '�ʲ�ƽ̨|��ʹ�����޷ִ���',
CASE WHEN K6004<>zK6004 THEN '��ʹ�����޷ִ��� ��һ��'	ELSE null END'��ʹ�����޷ִ��� �Ա�',
NBZC.HK6004 HK6004,NBZC.zHK6004 '�ʲ�ƽ̨|��ʹ�����޷ֺ���',
CASE WHEN REPLACE(HK6004, '��', '')<>zHK6004 THEN '��ʹ�����޷ֺ��� ��һ��'	ELSE null END'��ʹ�����޷ֺ��� �Ա�',
nbzc.K6040 '���������/�������'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.K6007)K6007,rtrim(ZCPT_K060.K6007) zK6007,
rtrim(k060.HK6007)HK6007,rtrim(ZCPT_K060.HK6007)	zHK6007,
rtrim(k060.K6004)K6004,rtrim(ZCPT_K060.K6004)	zK6004,
rtrim(k060.HK6004)HK6004,rtrim(ZCPT_K060.HK6004)	zHK6004

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.K6007)K6007,rtrim(ZCPT_K060.K6007) zK6007,
rtrim(k060.HK6007)HK6007,rtrim(ZCPT_K060.HK6007)	zHK6007,
rtrim(k060.K6004)K6004,rtrim(ZCPT_K060.K6004)	zK6004,
rtrim(k060.HK6004)HK6004,rtrim(ZCPT_K060.HK6004)	zHK6004

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where
NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.K6007)<>rtrim(NBZC.zK6007) or --  �����羶�������,
rtrim(NBZC.HK6007)<>rtrim(NBZC.zHK6007)	or--  �����羶����,
rtrim(NBZC.K6004)<>rtrim(NBZC.zK6004)	or --  ��ʹ�����޷ִ���,
REPLACE(HK6004, '��', '')<>zHK6004
)
order by k0101

--9.2.7
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,rtrim(NBZC.K6002) K6002,

rtrim(NBZC.k6023) k6023,rtrim(NBZC.zk6023) '�ʲ�ƽ̨|����ȼ�����',
CASE WHEN rtrim(NBZC.k6023)<>rtrim(NBZC.zk6023) THEN '����ȼ����� ��һ��'	ELSE null END'����ȼ����� �Ա�',
rtrim(NBZC.hk6023) hk6023,rtrim(NBZC.zhk6023) '�ʲ�ƽ̨|����ȼ�',
CASE WHEN rtrim(NBZC.k6023)<>rtrim(NBZC.zk6023) THEN '����ȼ� ��һ��'	ELSE null END'����ȼ� �Ա�',

nbzc.K6040
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(K060.k6023) k6023,rtrim(ZCPT_K060.k6023) zk6023,
rtrim(K060.hk6023) hk6023,rtrim(ZCPT_K060.hk6023) zhk6023

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,
rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(K060.k6023) k6023,rtrim(ZCPT_K060.k6023) zk6023,
rtrim(K060.hk6023) hk6023,rtrim(ZCPT_K060.hk6023) zhk6023

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where --NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(

rtrim(NBZC.k6023)<>rtrim(NBZC.zk6023)-- or -- ����ȼ�����,
--rtrim(NBZC.hk6023)<>rtrim(NBZC.zhk6023)	 -- ����ȼ�,


)
order by k0101


--9.2.8
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,rtrim(NBZC.K6002) K6002,

rtrim(NBZC.hk0149) hk0149,rtrim(NBZC.zhk0149) '�ʲ�ƽ̨|�����׼',
CASE WHEN rtrim(NBZC.hk0149)<>isnull(rtrim(NBZC.zhk0149),'999') THEN '�����׼ ��һ��'	ELSE null END'�����׼ �Ա�',

nbzc.K6040
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(K060.hk0149) hk0149,rtrim(ZCPT_K060.hk0149) zhk0149

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,
rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(K060.hk0149) hk0149,rtrim(ZCPT_K060.hk0149) zhk0149

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.hk0149)<>isnull(rtrim(NBZC.zhk0149),'999')	 -- �����׼,
)
order by k0101


--9.2.9 tonghang
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,rtrim(NBZC.K6002) K6002,


rtrim(NBZC.hK6024) hK6024,rtrim(NBZC.zhK6024) '�ʲ�ƽ̨|ͨ���ȼ�',
CASE WHEN rtrim(NBZC.hK6024)<>rtrim(NBZC.zhK6024) THEN 'ͨ���ȼ� ��һ��'        ELSE null END 'ͨ���ȼ� �Ա�',
rtrim(NBZC.hA1328) hA1328,rtrim(NBZC.zhA1328) '�ʲ�ƽ̨|��̨��ײ��ʩ����',
CASE WHEN rtrim(NBZC.hA1328)<>rtrim(NBZC.zhA1328) THEN '��̨��ײ��ʩ���� ��һ��'        ELSE null END'��̨��ײ��ʩ���� �Ա�',

nbzc.K6040
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.hK6024) hK6024,rtrim(ZCPT_K060.hK6024) zhK6024,
rtrim(k060.hA1328) hA1328,rtrim(ZCPT_K060.hA1328) zhA1328

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,
rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.hK6024) hK6024,rtrim(ZCPT_K060.hK6024) zhK6024,
rtrim(k060.hA1328) hA1328,rtrim(ZCPT_K060.hA1328) zhA1328

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.hK6024)<>rtrim(NBZC.zhK6024) or -- ͨ���ȼ�,
rtrim(NBZC.hA1328)<>rtrim(NBZC.zhA1328)-- ��̨��ײ��ʩ����,
)
order by k0101


--9.2.10
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,rtrim(NBZC.K6002) K6002,


rtrim(NBZC.ha1306) ha1306,rtrim(NBZC.zha1306) '�ʲ�ƽ̨|��Ҫ����λ��',
CASE WHEN rtrim(NBZC.ha1306)<>rtrim(NBZC.zha1306) THEN '��Ҫ����λ�� ��һ��'        ELSE null END '��Ҫ����λ�� �Ա�',
rtrim(NBZC.k6102) k6102,rtrim(NBZC.zk6102) '�ʲ�ƽ̨|��Ҫ��������',
CASE WHEN rtrim(NBZC.k6102)<>rtrim(NBZC.zk6102) THEN '��Ҫ�������� ��һ��'        ELSE null END'��Ҫ�������� �Ա�',

nbzc.K6040
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.ha1306) ha1306,rtrim(ZCPT_K060.ha1306) zha1306,
rtrim(k060.k6102) k6102,rtrim(ZCPT_K060.k6102) zk6102

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
--k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,
rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.ha1306) ha1306,rtrim(ZCPT_K060.ha1306) zha1306,
rtrim(k060.k6102) k6102,rtrim(ZCPT_K060.k6102) zk6102

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
--k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where --NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.ha1306)<>rtrim(NBZC.zha1306) or -- ��Ҫ����λ��,
rtrim(NBZC.k6102)<>rtrim(NBZC.zk6102)        -- ��Ҫ��������,
)
order by k0101


--9.2.11
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,NBZC.K6003 k6003,

NBZC.k0181 k0181,NBZC.zk0181 '�ʲ�ƽ̨|�Ľ����',
CASE WHEN k0181<>zk0181 THEN '�Ľ���� ��һ��'	ELSE null END'�Ľ���� �Ա�',
NBZC.a1316 a1316,NBZC.za1316 '�ʲ�ƽ̨|�����깤����',
CASE WHEN a1316<>za1316 THEN '�����깤���� ��һ��'	ELSE null END'�����깤���� �Ա�',

nbzc.K6040 '���������/�������'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.k0181) k0181,rtrim(ZCPT_K060.k0181) zk0181,
rtrim(k060.a1316) a1316,rtrim(ZCPT_K060.a1316) za1316

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.k0181) k0181,rtrim(ZCPT_K060.k0181) zk0181,
rtrim(k060.a1316) a1316,rtrim(ZCPT_K060.a1316) za1316

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.k0181)<>rtrim(NBZC.zk0181)	or -- �Ľ����,
rtrim(NBZC.a1316)<>rtrim(NBZC.za1316)	 -- �����깤����,
)
order by k0101

--9.2.12
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,
NBZC.K6003 k6003,
NBZC.a1302 a1302,NBZC.za1302 '�ʲ�ƽ̨|�շ����ʴ���',
CASE WHEN a1302<>za1302 THEN '�շ����ʴ��� ��һ��'	ELSE null END'�շ����ʴ��� �Ա�',
NBZC.ha1302 ha1302,NBZC.zha1302 '�ʲ�ƽ̨|�շ����ʷ���',
CASE WHEN replace(replace(rtrim(NBZC.ha1302),'����',''),'��','')<>zha1302 THEN '�շ����ʷ��� ��һ��'	ELSE null END'�շ����ʷ��� �Ա�',
nbzc.K6040 '���������/�������'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.a1302) a1302,rtrim(ZCPT_K060.a1302) za1302,
rtrim(k060.ha1302) ha1302,rtrim(ZCPT_K060.ha1302) zha1302

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
 k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.a1302) a1302,rtrim(ZCPT_K060.a1302) za1302,
rtrim(k060.ha1302) ha1302,rtrim(ZCPT_K060.ha1302) zha1302

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
 k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where  NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.a1302)<>rtrim(NBZC.za1302)	or -- �շ����ʴ���,
replace(replace(rtrim(NBZC.ha1302),'����',''),'��','')<>rtrim(NBZC.zha1302)	 -- �շ����ʷ���,
)
order by k0101

--9.2.13
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,
NBZC.K6003 k6003,
NBZC.A1307 A1307,NBZC.zA1307 '�ʲ�ƽ̨|�Ѳ�ȡ��ͨ���ƴ�ʩ����',
CASE WHEN A1307<>zA1307 THEN '�Ѳ�ȡ��ͨ���ƴ�ʩ���� ��һ��'	ELSE null END'�Ѳ�ȡ��ͨ���ƴ�ʩ���� �Ա�',
NBZC.hA1307 hA1307,NBZC.zhA1307 '�ʲ�ƽ̨|�Ѳ�ȡ��ͨ���ƴ�ʩ',
CASE WHEN hA1307<>zhA1307 THEN '�Ѳ�ȡ��ͨ���ƴ�ʩ ��һ��'	ELSE null END'�Ѳ�ȡ��ͨ���ƴ�ʩ �Ա�',
nbzc.K6040 '���������/�������'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.A1307) A1307,rtrim(ZCPT_K060.A1307) zA1307,
rtrim(k060.hA1307) hA1307,rtrim(ZCPT_K060.hA1307) zhA1307

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.A1307) A1307,rtrim(ZCPT_K060.A1307) zA1307,
rtrim(k060.hA1307) hA1307,rtrim(ZCPT_K060.hA1307) zhA1307

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.A1307)<>rtrim(NBZC.zA1307)	or -- �Ѳ�ȡ��ͨ���ƴ�ʩ����,
rtrim(NBZC.hA1307)<>rtrim(NBZC.zhA1307)	 -- �Ѳ�ȡ��ͨ���ƴ�ʩ,
)
order by k0101

--9.2.14
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,NBZC.K6003 k6003,

rtrim(NBZC.ha1319) ha1319,rtrim(NBZC.zha1319) '�ʲ�ƽ̨|�Ƿ񲿲�����Ŀ',
CASE WHEN rtrim(NBZC.ha1319)<>rtrim(NBZC.zha1319) THEN '�Ƿ񲿲�����Ŀ ��һ��'        ELSE null END '�Ƿ񲿲�����Ŀ �Ա�',
rtrim(NBZC.hk6118) hk6118,rtrim(NBZC.zhk6118) '�ʲ�ƽ̨|�Ƿ��·խ��',
CASE WHEN rtrim(NBZC.hk6118)<>rtrim(NBZC.zhk6118) THEN '�Ƿ��·խ�� ��һ��'        ELSE null END'�Ƿ��·խ�� �Ա�',
rtrim(NBZC.hk6119) hk6119,rtrim(NBZC.zhk6119) '�ʲ�ƽ̨|�Ƿ��ڳ�������Ŀ¼��',
CASE WHEN rtrim(NBZC.hk6119)<>rtrim(NBZC.zhk6119) THEN '�Ƿ��ڳ�������Ŀ¼�� ��һ��'        ELSE null END '�Ƿ��ڳ�������Ŀ¼�� �Ա�',
rtrim(NBZC.hk6120) hk6120,rtrim(NBZC.zhk6120) '�ʲ�ƽ̨|�Ƿ��ʡ����',
CASE WHEN rtrim(NBZC.hk6120)<>rtrim(NBZC.zhk6120) THEN '�Ƿ��ʡ���� ��һ��'        ELSE null END '�Ƿ��ʡ���� �Ա�',
rtrim(NBZC.hk6041) hk6041,rtrim(NBZC.zhk6041) '�ʲ�ƽ̨|�Ƿ�����������',
CASE WHEN rtrim(NBZC.hk6041)<>rtrim(NBZC.zhk6041) THEN '�Ƿ����������� ��һ��'        ELSE null END'�Ƿ����������� �Ա�',

nbzc.K6040 '���������/�������'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

case when len(k060.ha1319)>0 then k060.ha1319 when len(k060.ha1319)=0 or k060.ha1319 is null then null end  ha1319,
rtrim(ZCPT_K060.ha1319) zha1319,
rtrim(k060.hk6118) hk6118,rtrim(ZCPT_K060.hk6118) zhk6118,
rtrim(k060.hk6119) hk6119,rtrim(ZCPT_K060.hk6119) zhk6119,
rtrim(k060.hk6120) hk6120,rtrim(ZCPT_K060.hk6120) zhk6120,
rtrim(k060.hk6041) hk6041,rtrim(ZCPT_K060.hk6041) zhk6041

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

case when len(k060.ha1319)>0 then k060.ha1319 when len(k060.ha1319)=0 or k060.ha1319 is null then null end  ha1319,
rtrim(ZCPT_K060.ha1319) zha1319,
rtrim(k060.hk6118) hk6118,rtrim(ZCPT_K060.hk6118) zhk6118,
rtrim(k060.hk6119) hk6119,rtrim(ZCPT_K060.hk6119) zhk6119,
rtrim(k060.hk6120) hk6120,rtrim(ZCPT_K060.hk6120) zhk6120,
rtrim(k060.hk6041) hk6041,rtrim(ZCPT_K060.hk6041) zhk6041

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.ha1319)<>rtrim(NBZC.zha1319) or -- �Ƿ񲿲�����Ŀ,
rtrim(NBZC.hk6118)<>rtrim(NBZC.zhk6118) or -- �Ƿ��·խ��,
rtrim(NBZC.hk6119)<>rtrim(NBZC.zhk6119) or -- �Ƿ��ڳ�������Ŀ¼��,
rtrim(NBZC.hk6120)<>rtrim(NBZC.zhk6120) or -- �Ƿ��ʡ����,
rtrim(NBZC.hk6041)<>rtrim(NBZC.zhk6041)         -- �Ƿ�����������,
)
order by k0101
--9.2.15
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,NBZC.K6003 k6003,

NBZC.k0180 k0180,NBZC.zk0180 '�ʲ�ƽ̨|�޽����',
CASE WHEN k0180<>left(rtrim(NBZC.zk0180),4) THEN '�޽���� ��һ��'	ELSE null END'�޽���� �Ա�',
NBZC.k0116 k0116,NBZC.zk0116 '�ʲ�ƽ̨|ͨ������',
CASE WHEN k0116<>zk0116 THEN 'ͨ������ ��һ��'	ELSE null END'ͨ������ �Ա�',

nbzc.K6040 '���������/�������'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.k0180) k0180,rtrim(ZCPT_K060.k0180) zk0180,
rtrim(k060.k0116) k0116,rtrim(ZCPT_K060.k0116) zk0116

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.k0180) k0180,rtrim(ZCPT_K060.k0180) zk0180,
rtrim(k060.k0116) k0116,rtrim(ZCPT_K060.k0116) zk0116

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.k0180)<>left(rtrim(NBZC.zk0180),4)	or -- �޽����,
rtrim(NBZC.k0116)<>rtrim(NBZC.zk0116)	 -- ͨ������,
)
order by k0101
--9.2.16
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,NBZC.K6003 k6003,

rtrim(NBZC.k6028) k6028,rtrim(NBZC.zk6028) '�ʲ�ƽ̨|����״����������',
CASE WHEN rtrim(NBZC.k6028)<>rtrim(NBZC.zk6028) THEN '����״���������� ��һ��'        ELSE null END '����״���������� �Ա�',
rtrim(NBZC.hk6028) hk6028,rtrim(NBZC.zhk6028) '�ʲ�ƽ̨|����״������',
CASE WHEN rtrim(NBZC.k6028)<>rtrim(NBZC.zk6028) THEN '����״������ ��һ��'        ELSE null END'����״������ �Ա�',
rtrim(NBZC.a1305) a1305,rtrim(NBZC.za1305) '�ʲ�ƽ̨|��������',
CASE WHEN rtrim(NBZC.a1305)<>rtrim(NBZC.za1305) THEN '�������� ��һ��'        ELSE null END '�������� �Ա�',
rtrim(NBZC.k6050) k6050,rtrim(NBZC.zk6050) '�ʲ�ƽ̨|����״��������λ',
CASE WHEN rtrim(NBZC.k6050)<>rtrim(NBZC.zk6050) THEN '����״��������λ ��һ��'        ELSE null END'����״��������λ �Ա�',

nbzc.K6040 '���������/�������'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.k6028) k6028,rtrim(ZCPT_K060.k6028) zk6028,
rtrim(k060.hk6028) hk6028,rtrim(ZCPT_K060.hk6028) zhk6028,
rtrim(k060.a1305) a1305,rtrim(ZCPT_K060.a1305) za1305,
rtrim(k060.k6050) k6050,rtrim(ZCPT_K060.k6050) zk6050

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.k6028) k6028,rtrim(ZCPT_K060.k6028) zk6028,
rtrim(k060.hk6028) hk6028,rtrim(ZCPT_K060.hk6028) zhk6028,
rtrim(k060.a1305) a1305,rtrim(ZCPT_K060.a1305) za1305,
rtrim(k060.k6050) k6050,rtrim(ZCPT_K060.k6050) zk6050

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.k6028)<>rtrim(NBZC.zk6028) or -- ����״����������,
rtrim(NBZC.a1305)<>rtrim(NBZC.za1305) or -- ��������,
rtrim(NBZC.k6050)<>rtrim(NBZC.zk6050)         -- ����״��������λ,
)
order by k0101
--9.2.17
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,NBZC.K6003 k6003,

rtrim(NBZC.ha1317) ha1317,rtrim(NBZC.zha1317) '�ʲ�ƽ̨|���첿λ',
CASE WHEN rtrim(NBZC.ha1317)<>isnull(NBZC.zha1317,'9999') THEN '���첿λ ��һ��'        ELSE null END '���첿λ �Ա�',
rtrim(NBZC.ha1318) ha1318,rtrim(NBZC.zha1318) '�ʲ�ƽ̨|��������',
CASE WHEN rtrim(NBZC.ha1318)<>isnull(rtrim(NBZC.zha1318),'9999') THEN '�������� ��һ��'        ELSE null END'�������� �Ա�',
rtrim(NBZC.k6051) k6051,rtrim(NBZC.zk6051) '�ʲ�ƽ̨|����ʩ����λ',
CASE WHEN rtrim(NBZC.k6051)<>isnull(rtrim(NBZC.zk6051),'9999') THEN '����ʩ����λ ��һ��'        ELSE null END '����ʩ����λ �Ա�',

nbzc.K6040 '���������/�������'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

case when len(k060.ha1317)>0 then k060.ha1317 when len(k060.ha1317)=0 or k060.ha1317 is null then null end  ha1317,
rtrim(ZCPT_K060.ha1317) zha1317,
case when len(k060.ha1318)>0 then k060.ha1318 when len(k060.ha1318)=0 or k060.ha1318 is null then null end  ha1318,
rtrim(ZCPT_K060.ha1318) zha1318,
case when len(k060.k6051)>0 then k060.k6051 when len(k060.k6051)=0 or k060.k6051 is null then null end  k6051,
rtrim(ZCPT_K060.k6051) zk6051

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

case when len(k060.ha1317)>0 then k060.ha1317 when len(k060.ha1317)=0 or k060.ha1317 is null then null end  ha1317,
rtrim(ZCPT_K060.ha1317) zha1317,
case when len(k060.ha1318)>0 then k060.ha1318 when len(k060.ha1318)=0 or k060.ha1318 is null then null end  ha1318,
rtrim(ZCPT_K060.ha1318) zha1318,
case when len(k060.k6051)>0 then k060.k6051 when len(k060.k6051)=0 or k060.k6051 is null then null end  k6051,
rtrim(ZCPT_K060.k6051) zk6051

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.ha1317)<>rtrim(NBZC.zha1317) or -- ���첿λ,
rtrim(NBZC.ha1318)<>rtrim(NBZC.zha1318) or -- ��������,
rtrim(NBZC.k6051)<>rtrim(NBZC.zk6051)  -- ����ʩ����λ
)
order by k0101
--9.2.18
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,NBZC.K6003 k6003,

rtrim(NBZC.ha1317) ha1317,rtrim(NBZC.zha1317) '�ʲ�ƽ̨|���첿λ',
CASE WHEN rtrim(NBZC.ha1317)<>isnull(NBZC.zha1317,'9999') THEN '���첿λ ��һ��'        ELSE null END '���첿λ �Ա�',
rtrim(NBZC.ha1318) ha1318,rtrim(NBZC.zha1318) '�ʲ�ƽ̨|��������',
CASE WHEN rtrim(NBZC.ha1318)<>isnull(rtrim(NBZC.zha1318),'9999') THEN '�������� ��һ��'        ELSE null END'�������� �Ա�',
rtrim(NBZC.k6051) k6051,rtrim(NBZC.zk6051) '�ʲ�ƽ̨|����ʩ����λ',
CASE WHEN rtrim(NBZC.k6051)<>isnull(rtrim(NBZC.zk6051),'9999') THEN '����ʩ����λ ��һ��'        ELSE null END '����ʩ����λ �Ա�',

nbzc.K6040 '���������/�������'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

case when len(k060.ha1317)>0 then k060.ha1317 when len(k060.ha1317)=0 or k060.ha1317 is null then null end  ha1317,
rtrim(ZCPT_K060.ha1317) zha1317,
case when len(k060.ha1318)>0 then k060.ha1318 when len(k060.ha1318)=0 or k060.ha1318 is null then null end  ha1318,
rtrim(ZCPT_K060.ha1318) zha1318,
case when len(k060.k6051)>0 then k060.k6051 when len(k060.k6051)=0 or k060.k6051 is null then null end  k6051,
rtrim(ZCPT_K060.k6051) zk6051

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

case when len(k060.ha1317)>0 then k060.ha1317 when len(k060.ha1317)=0 or k060.ha1317 is null then null end  ha1317,
rtrim(ZCPT_K060.ha1317) zha1317,
case when len(k060.ha1318)>0 then k060.ha1318 when len(k060.ha1318)=0 or k060.ha1318 is null then null end  ha1318,
rtrim(ZCPT_K060.ha1318) zha1318,
case when len(k060.k6051)>0 then k060.k6051 when len(k060.k6051)=0 or k060.k6051 is null then null end  k6051,
rtrim(ZCPT_K060.k6051) zk6051

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.ha1317)<>rtrim(NBZC.zha1317) or -- ���첿λ,
rtrim(NBZC.ha1318)<>rtrim(NBZC.zha1318) or -- ��������,
rtrim(NBZC.k6051)<>rtrim(NBZC.zk6051)  -- ����ʩ����λ
)
order by k0101
--9.2.19
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,
NBZC.K6003 k6003,

rtrim(NBZC.K6079) K6079,rtrim(NBZC.zK6079) '�ʲ�ƽ̨|���赥λ����',
CASE WHEN rtrim(NBZC.K6079)<>rtrim(NBZC.zK6079) THEN '���赥λ���� ��һ��'        ELSE null END '���赥λ���� �Ա�',
rtrim(NBZC.K6030) K6030,rtrim(NBZC.zK6030) '�ʲ�ƽ̨|��Ƶ�λ����',
CASE WHEN rtrim(NBZC.K6030)<>rtrim(NBZC.zK6030) THEN '��Ƶ�λ���� ��һ��'        ELSE null END'��Ƶ�λ���� �Ա�',
rtrim(NBZC.K6031) K6031,rtrim(NBZC.zK6031) '�ʲ�ƽ̨|ʩ����λ����',
CASE WHEN rtrim(NBZC.K6031)<>rtrim(NBZC.zK6031) THEN 'ʩ����λ���� ��һ��'        ELSE null END 'ʩ����λ���� �Ա�',
rtrim(NBZC.K6032) K6032,rtrim(NBZC.zK6032) '�ʲ�ƽ̨|����λ����',
CASE WHEN rtrim(NBZC.K6032)<>rtrim(NBZC.zK6032) THEN '����λ���� ��һ��'        ELSE null END'����λ���� �Ա�',
nbzc.K6040 '���������/�������'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.K6079) K6079,rtrim(ZCPT_K060.K6079) zK6079,
rtrim(k060.K6030) K6030,rtrim(ZCPT_K060.K6030) zK6030,
rtrim(k060.K6031) K6031,rtrim(ZCPT_K060.K6031) zK6031,
rtrim(k060.K6032) K6032,rtrim(ZCPT_K060.K6032) zK6032

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.K6079) K6079,rtrim(ZCPT_K060.K6079) zK6079,
rtrim(k060.K6030) K6030,rtrim(ZCPT_K060.K6030) zK6030,
rtrim(k060.K6031) K6031,rtrim(ZCPT_K060.K6031) zK6031,
rtrim(k060.K6032) K6032,rtrim(ZCPT_K060.K6032) zK6032

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.K6079)<>rtrim(NBZC.zK6079) or -- ���赥λ����,
rtrim(NBZC.K6030)<>rtrim(NBZC.zK6030) or -- ��Ƶ�λ����,
rtrim(NBZC.K6031)<>rtrim(NBZC.zK6031) or -- ʩ����λ����,
rtrim(NBZC.K6032)<>rtrim(NBZC.zK6032)         -- ����λ����
)
order by k0101
--9.2.20
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,
NBZC.K6003 k6003,

rtrim(NBZC.hK6117) hK6117,rtrim(NBZC.zhK6117) '�ʲ�ƽ̨|��������λ��',
CASE WHEN rtrim(NBZC.hK6117)<>rtrim(NBZC.zhK6117) THEN '��������λ�� ��һ��'        ELSE null END '��������λ�� �Ա�',
nbzc.K6040 '���������/�������'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.hK6117) hK6117,rtrim(ZCPT_K060.hK6117) zhK6117

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.hK6117) hK6117,rtrim(ZCPT_K060.hK6117) zhK6117

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.hK6117)<>rtrim(NBZC.zhK6117) -- ��������λ��
)
order by k0101