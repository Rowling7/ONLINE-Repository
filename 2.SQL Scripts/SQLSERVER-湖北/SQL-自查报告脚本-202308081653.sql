select
'g' g,
sum(isnull(a5008,0))/1000  PDLC, 	--	PDLC
sum(case when isnull(a5011,0)>=90 then isnull(a5008,0) else 0 end) YDL,
sum(case when isnull(a5011,0)>=80 and isnull(a5011,0)<90 then isnull(a5008,0) else 0 end) LDL,
sum(case when isnull(a5011,0)>=70 and isnull(a5011,0)<80 then isnull(a5008,0) else 0 end) ZDL,
sum(case when isnull(a5011,0)>=60 and isnull(a5011,0)<70 then isnull(a5008,0) else 0 end) CIDL,
sum(case when isnull(a5011,0)<60 then isnull(a5008,0) else 0 end) CHADL,
round(sum(case when isnull(a5011,0)>=80 then isnull(a5008,0) else 0 end)/sum(isnull(a5008,0))*100,2)	YLLV,
round(sum(isnull(a5008,0)*a5011)/sum(isnull(a5008,0)),2) PQI
from k05
where rtrim(a0101a)='2021' and left(a0102,3)='42A' and left(rtrim(k0101),1)='G'  and
(rtrim(cast(a0129 as char)) is null or rtrim(cast(a0129 as char))='³¤Á´')
UNION
select
's' s,
sum(isnull(a5008,0))/1000  PDLC, 	--	PDLC
sum(case when isnull(a5011,0)>=90 then isnull(a5008,0) else 0 end) YDL,
sum(case when isnull(a5011,0)>=80 and isnull(a5011,0)<90 then isnull(a5008,0) else 0 end) LDL,
sum(case when isnull(a5011,0)>=70 and isnull(a5011,0)<80 then isnull(a5008,0) else 0 end) ZDL,
sum(case when isnull(a5011,0)>=60 and isnull(a5011,0)<70 then isnull(a5008,0) else 0 end) CIDL,
sum(case when isnull(a5011,0)<60 then isnull(a5008,0) else 0 end) CHADL,
round(sum(case when isnull(a5011,0)>=80 then isnull(a5008,0) else 0 end)/sum(isnull(a5008,0))*100,2)	YLLV,
round(sum(isnull(a5008,0)*a5011)/sum(isnull(a5008,0)),2) PQI
from k05
where rtrim(a0101a)='2022' and left(a0102,3)='42A' and left(rtrim(k0101),1)='S'  and
(rtrim(cast(a0129 as char)) is null or rtrim(cast(a0129 as char))='³¤Á´')




SELECT k6028,hk6028,count(*)
from l60
where left(k0101,1)in ('g','s','h','t')  --and left(a0102,3)<>'42A'
group by k6028,hk6028 with rollup
having grouping(k6028)=grouping(hk6028)



SELECT k6028,hk6028,count(*)
from k60
where left(k0101,1)in ('g','h')
group by k6028,hk6028 with rollup
having grouping(k6028)=grouping(hk6028)
union
SELECT k6028,hk6028,count(*)
from k60
where left(k0101,1)in ('s','t')
group by k6028,hk6028 with rollup
having grouping(k6028)=grouping(hk6028)









SELECT k6336,hk6336,count(*)
from l63
where left(k0101,1)in ('g','s','h','t')  --and left(a0102,3)<>'42A'
group by k6336,hk6336 with rollup
having grouping(k6336)=grouping(hk6336)



SELECT k6336,hk6336,count(*)
from k63
where left(k0101,1)in ('g','h')  --and left(a0102,3)<>'42A'
group by k6336,hk6336 with rollup
having grouping(k6336)=grouping(hk6336)
union
SELECT k6336,hk6336,count(*)
from k63
where left(k0101,1)in ('s','t')  --and left(a0102,3)<>'42A'
group by k6336,hk6336 with rollup
having grouping(k6336)=grouping(hk6336)