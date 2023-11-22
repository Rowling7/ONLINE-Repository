-- 临时更新身份码
UPDATE zcpt_k060
SET zcpt_k060.k6040=rtrim(k060.k6040)
FROM zcpt_k060
left JOIN k060
ON (case when left(k060.k0101,1)in ('H','G','T','S') then rtrim(replace(replace(replace(replace(replace(replace(replace(k060.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001)
else left(k060.k0101,4)+left(k060.a0103,6)+'L'+rtrim(k060.k6001) end) = rtrim(ZCPT_K060.k6001)
WHERE LEFT(k060.K0101,1) IN ('G','s')


--桥梁子查询
SELECT rtrim(K060.K6040)
from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'
UNION
SELECT  rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001)
from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%高速%'AND k001.A0102 LIKE '341%'