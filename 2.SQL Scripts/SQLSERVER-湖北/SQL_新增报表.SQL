--普通国省道
select 	'','合计',sum(isnull(a5008,0))/1000 mqipdlc,
sum(case when isnull(a5010,0)>=90 then isnull(a5008,0) else 0 end)/1000 mqiydlc,        --YDLC
sum(case when isnull(a5010,0)>=80 and isnull(a5010,0)<90 then isnull(a5008,0) else 0 end)/1000 mqildlc,        --LDLC
sum(case when isnull(a5010,0)>=70 and isnull(a5010,0)<80 then isnull(a5008,0) else 0 end)/1000 mqizdlc,        --ZDLC
sum(case when isnull(a5010,0)>=60 and isnull(a5010,0)<70 then isnull(a5008,0) else 0 end)/1000 mqicidlc,        --CIDLC
sum(case when isnull(a5010,0)<60 then isnull(a5008,0) else 0 end)/1000 mqichadlc,        --CHADLC
round(sum(case when isnull(a5010,0)>=80 then isnull(a5008,0) else 0 end)/sum(isnull(a5008,0))*100,2) mqiyllv,        --YLLV
round(sum(isnull(a5008,0)*a5010)/sum(isnull(a5008,0)),2) mqi,        --MQI
sum(isnull(a5008,0))/1000 pqipdlc,
sum(case when isnull(a5011,0)>=90 then isnull(a5008,0) else 0 end)/1000 pqiydlc,        --YDLC
sum(case when isnull(a5011,0)>=80 and isnull(a5011,0)<90 then isnull(a5008,0) else 0 end)/1000 pqildlc,        --LDLC
sum(case when isnull(a5011,0)>=70 and isnull(a5011,0)<80 then isnull(a5008,0) else 0 end)/1000 pqizdlc,        --ZDLC
sum(case when isnull(a5011,0)>=60 and isnull(a5011,0)<70 then isnull(a5008,0) else 0 end)/1000 pqicidlc,        --CIDLC
sum(case when isnull(a5011,0)<60 then isnull(a5008,0) else 0 end)/1000 pqichadlc,        --CHADLC
round(sum(case when isnull(a5011,0)>=80 then isnull(a5008,0) else 0 end)/sum(isnull(a5008,0))*100,2) pqiyllc,       --YLLV
round(sum(isnull(a5008,0)*a5011)/sum(isnull(a5008,0)),2) pqi        --PQI
from k05
where a0102 like '#oyds_单位代码#%' and a0101a = '#oyds_报表年限#' and left(a0102,3)<>'42A' and left(rtrim(k0101),1) in ('G','S') and k5124 in ('1','2') and
(rtrim(cast(a0129 as char))='' or rtrim(cast(a0129 as char)) is null or rtrim(cast(a0129 as char))='长链')


--普通国省道
DECLARE @a0102 char(100)
set @a0102 = '#oyds_单位代码#'
select 	NULLIF(objname,objname),objjc,sum(isnull(a5008,0))/1000 mqipdlc,
sum(case when isnull(a5010,0)>=90 then isnull(a5008,0) else 0 end)/1000 mqiydlc,        --YDLC
sum(case when isnull(a5010,0)>=80 and isnull(a5010,0)<90 then isnull(a5008,0) else 0 end)/1000 mqildlc,        --LDLC
sum(case when isnull(a5010,0)>=70 and isnull(a5010,0)<80 then isnull(a5008,0) else 0 end)/1000 mqizdlc,        --ZDLC
sum(case when isnull(a5010,0)>=60 and isnull(a5010,0)<70 then isnull(a5008,0) else 0 end)/1000 mqicidlc,        --CIDLC
sum(case when isnull(a5010,0)<60 then isnull(a5008,0) else 0 end)/1000 mqichadlc,        --CHADLC
round(sum(case when isnull(a5010,0)>=80 then isnull(a5008,0) else 0 end)/sum(isnull(a5008,0))*100,2) mqiyllv,        --YLLV
round(sum(isnull(a5008,0)*a5010)/sum(isnull(a5008,0)),2) mqi,        --MQI
sum(isnull(a5008,0))/1000 pqipdlc,
sum(case when isnull(a5011,0)>=90 then isnull(a5008,0) else 0 end)/1000 pqiydlc,        --YDLC
sum(case when isnull(a5011,0)>=80 and isnull(a5011,0)<90 then isnull(a5008,0) else 0 end)/1000 pqildlc,        --LDLC
sum(case when isnull(a5011,0)>=70 and isnull(a5011,0)<80 then isnull(a5008,0) else 0 end)/1000 pqizdlc,        --ZDLC
sum(case when isnull(a5011,0)>=60 and isnull(a5011,0)<70 then isnull(a5008,0) else 0 end)/1000 pqicidlc,        --CIDLC
sum(case when isnull(a5011,0)<60 then isnull(a5008,0) else 0 end)/1000 pqichadlc,        --CHADLC
round(sum(case when isnull(a5011,0)>=80 then isnull(a5008,0) else 0 end)/sum(isnull(a5008,0))*100,2) pqiyllc,       --YLLV
round(sum(isnull(a5008,0)*a5011)/sum(isnull(a5008,0)),2) pqi        --PQI
from k05
left join k01 on k05.a0102=k01.a0102 and k05.k0101=k01.k0101 and k05.K0105>=k01.k0108 and k05.K0105<k01.k0109
--left join d020 on left(k01.a0103,6)=objname
left join d020 on     CASE WHEN LEN(@a0102) = 2 AND LEFT(k01.a0103, 4) = '4290' THEN LEFT(k01.a0103, 6)
        WHEN LEN(@a0102) = 2 THEN LEFT(k01.a0103, 4)
        WHEN LEN(@a0102) > 2 THEN LEFT(k01.a0103, 6) END  =objname

where k05.a0102 like '#oyds_单位代码#%' and k05.a0101a = '2022' and left(k05.a0102,3)<>'42A'
and left(rtrim(k05.k0101),1) in ('G','S')
and k5124 in ('1','2') and  (rtrim(cast(a0129 as char))='' or rtrim(cast(a0129 as char)) is null or rtrim(cast(a0129 as char))='长链')
GROUP BY objjc ,objname
order by objname


SELECT '','','合计',A.k0114,A.YBLC,B.SBLC,B.PDLC,B.QXZRQ,B.SSLM,B.SGLD,B.SZDL,B.QTDW
FROM (
select  '合计' hj,
sum(isnull(K01.k0114,0)) k0114,SUM(	CASE WHEN K01.K0304 IN('22','23','24','30')THEN isnull(K01.k0114,0)ELSE isnull(K01.k0114,0)*2 END ) YBLC
from k01
where  isnull(K01.k0123,'2')='2' and k0124 is null
and K01.a0102 like '#oyds_单位代码#%' and K01.a0101 = '#oyds_报表年限#'
AND left(K01.a0102,3)<>'42A'  AND LEFT(K01.K0101,1) IN ('G','S')
)A
LEFT JOIN
(SELECT  '合计' hj,
SUM(Isnull(K05.a5008/1000,0)) SBLC,
sum(CASE WHEN (rtrim(cast(a0129 as char))='' or rtrim(cast(a0129 as char)) is null or rtrim(cast(a0129 as char))='长链') AND k5124 <> '3' THEN isnull(K05.a5008/1000,0 ) ELSE 0 END) PDLC,
sum(CASE WHEN A0129 LIKE '%缺陷责任期%'and k5124 in ('1','2')THEN isnull(K05.a5008/1000,0 )ELSE 0 END) QXZRQ,
sum(CASE WHEN k5124  ='3'  						 THEN isnull(K05.a5008/1000,0 )ELSE 0 END) SSLM,
sum(CASE WHEN A0129 LIKE '%施工%'          and k5124 in ('1','2')  THEN isnull(K05.a5008/1000,0 )ELSE 0 END) SGLD,
sum(CASE WHEN A0129 LIKE '%市政道路%' and k5124 in ('1','2')  THEN isnull(K05.a5008/1000,0 )ELSE 0 END) SZDL,
sum(CASE WHEN A0129 LIKE '%其他单位%' and k5124 in ('1','2')  THEN isnull(K05.a5008/1000,0 )ELSE 0 END) QTDW
FROM K05
where K05.a0102 like '#oyds_单位代码#%' and K05.a0101a = '#oyds_报表年限#'   and
left(K05.a0102,3)<>'42A' AND A0101A='2022'  AND LEFT(K05.K0101,1) IN ('G','S')
)B ON A.hj=B.hj




SELECT '湖北',A.K0101,A.K0112,A.k0114,A.YBLC,B.SBLC,B.PDLC,B.QXZRQ,B.SSLM,B.SGLD,B.SZDL,B.QTDW
FROM (
select  (case when len(K01.k0101)>9  then left(rtrim(K01.k0101),4)
when len(K01.k0101)<=9 and charindex('D',rtrim(K01.k0101))<>0 then left(rtrim(K01.k0101),charindex('D',rtrim(K01.k0101))-1)
when len(K01.k0101)<=9 and charindex('D',rtrim(K01.k0101))=0 then rtrim(K01.k0101) else rtrim(K01.k0101) end) k0101,K0112,
sum(isnull(K01.k0114,0)) k0114,SUM(	CASE WHEN K01.K0304 IN('22','23','24','30')THEN isnull(K01.k0114,0)ELSE isnull(K01.k0114,0)*2 END ) YBLC
from k01
where  isnull(K01.k0123,'2')='2' and k0124 is null
and K01.a0102 like '#oyds_单位代码#%' and K01.a0101 = '#oyds_报表年限#'
AND left(K01.a0102,3)<>'42A'  AND LEFT(K01.K0101,1) IN ('G','S')
group by  (case when len(K01.k0101)>9  then left(rtrim(K01.k0101),4)
when len(K01.k0101)<=9 and charindex('D',rtrim(K01.k0101))<>0 then left(rtrim(K01.k0101),charindex('D',rtrim(K01.k0101))-1)
when len(K01.k0101)<=9 and charindex('D',rtrim(K01.k0101))=0 then rtrim(K01.k0101) else rtrim(K01.k0101) end),K0112
)A
LEFT JOIN
(SELECT  (case when len(k05.k0101)>9  then left(rtrim(k05.k0101),4)
	when len(k05.k0101)<=9 and charindex('D',rtrim(k05.k0101))<>0 then left(rtrim(k05.k0101),charindex('D',rtrim(k05.k0101))-1)
	when len(k05.k0101)<=9 and charindex('D',rtrim(k05.k0101))=0 then rtrim(k05.k0101) else rtrim(k05.k0101) end) k0101,
SUM(Isnull(K05.a5008/1000,0)) SBLC,
sum(CASE WHEN (rtrim(cast(a0129 as char))='' or rtrim(cast(a0129 as char)) is null or rtrim(cast(a0129 as char))='长链') AND k5124 <> '3' THEN isnull(K05.a5008/1000,0 ) ELSE 0 END) PDLC,
sum(CASE WHEN A0129 LIKE '%缺陷责任期%' and k5124 in ('1','2')THEN isnull(K05.a5008/1000,0 )ELSE 0 END) QXZRQ,
sum(CASE WHEN k5124  ='3' THEN isnull(K05.a5008/1000,0 )ELSE 0 END) SSLM,
sum(CASE WHEN A0129 LIKE '%施工%' 		and k5124 in ('1','2') THEN isnull(K05.a5008/1000,0 )ELSE 0 END) SGLD,
sum(CASE WHEN A0129 LIKE '%市政道路%' and k5124 in ('1','2')  THEN isnull(K05.a5008/1000,0 )ELSE 0 END) SZDL,
sum(CASE WHEN A0129 LIKE '%其他单位%' and k5124 in ('1','2')  THEN isnull(K05.a5008/1000,0 )ELSE 0 END) QTDW
FROM K05
where K05.a0102 like '#oyds_单位代码#%' and K05.a0101a = '#oyds_报表年限#' and
left(K05.a0102,3)<>'42A' AND LEFT(K05.K0101,1) IN ('G','S')
GROUP BY  (case when len(k05.k0101)>9  then left(rtrim(k05.k0101),4)
	when len(k05.k0101)<=9 and charindex('D',rtrim(k05.k0101))<>0 then left(rtrim(k05.k0101),charindex('D',rtrim(k05.k0101))-1)
	when len(k05.k0101)<=9 and charindex('D',rtrim(k05.k0101))=0 then rtrim(k05.k0101) else rtrim(k05.k0101) end)
)B ON A.K0101=B.K0101
ORDER BY A.K0101


SELECT a.objname,a.objjc,A.k0114,A.YBLC,B.SBLC,B.PDLC,B.QXZRQ,B.SSLM,B.SGLD,B.SZDL,B.QTDW
FROM (
select  objname,objjc,
sum(isnull(K01.k0114,0)) k0114,SUM(	CASE WHEN K01.K0304 IN('22','23','24','30')THEN isnull(K01.k0114,0)ELSE isnull(K01.k0114,0)*2 END ) YBLC
from k01
left join d020 on     CASE WHEN LEN('42') = 2 AND LEFT(k01.a0103, 4) = '4290' THEN LEFT(k01.a0103, 6)
        WHEN LEN('42') = 2 THEN LEFT(k01.a0103, 4)
        WHEN LEN('42') > 2 THEN LEFT(k01.a0103, 6) END  =objname
where  isnull(K01.k0123,'2')='2' and k0124 is null
and K01.a0102 like '#oyds_单位代码#%' and K01.a0101 = '#oyds_报表年限#'
AND left(K01.a0102,3)<>'42A'  AND LEFT(K01.K0101,1) IN ('G','S')
group by  objname,objjc
)A
LEFT JOIN
(SELECT  objname,objjc,
SUM(Isnull(K05.a5008/1000,0)) SBLC,
sum(CASE WHEN (rtrim(cast(a0129 as char))='' or rtrim(cast(a0129 as char)) is null or rtrim(cast(a0129 as char))='长链') AND k5124 <> '3' THEN isnull(K05.a5008/1000,0 ) ELSE 0 END) PDLC,
sum(CASE WHEN A0129 LIKE '%缺陷责任期%' and k5124 in ('1','2')THEN isnull(K05.a5008/1000,0 )ELSE 0 END) QXZRQ,
sum(CASE WHEN k5124  ='3' THEN isnull(K05.a5008/1000,0 )ELSE 0 END) SSLM,
sum(CASE WHEN A0129 LIKE '%施工%' 		and k5124 in ('1','2') THEN isnull(K05.a5008/1000,0 )ELSE 0 END) SGLD,
sum(CASE WHEN A0129 LIKE '%市政道路%' and k5124 in ('1','2')  THEN isnull(K05.a5008/1000,0 )ELSE 0 END) SZDL,
sum(CASE WHEN A0129 LIKE '%其他单位%' and k5124 in ('1','2')  THEN isnull(K05.a5008/1000,0 )ELSE 0 END) QTDW
FROM K05
right join k01 on k05.a0102=k01.a0102 and k05.k0101=k01.k0101 and k05.K0105>=k01.k0108 and k05.K0105<k01.k0109
left join d020 on     CASE WHEN LEN('42') = 2 AND LEFT(k01.a0103, 4) = '4290' THEN LEFT(k01.a0103, 6)
        WHEN LEN('42') = 2 THEN LEFT(k01.a0103, 4)
        WHEN LEN('42') > 2 THEN LEFT(k01.a0103, 6) END  =objname
where
K05.a0102 like '#oyds_单位代码#%' and K05.a0101a = '#oyds_报表年限#'
and left(K05.a0102,3)<>'42A' AND LEFT(K05.K0101,1) IN ('G')
GROUP BY  objname,objjc
)B ON A.objname=B.objname
ORDER BY A.objname
