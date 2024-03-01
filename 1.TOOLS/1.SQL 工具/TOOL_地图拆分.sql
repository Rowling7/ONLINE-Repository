if len('#AREACODE#')=2
begin
select
	(case when left(rtrim(objname),3)='42A' then '42A'
		when left(rtrim(objname),4)='4290' then left(rtrim(objname),6) else left(rtrim(objname),4) end) as objid,
	(case when left(rtrim(objname),3)='42A' then '42A'
		when left(rtrim(objname),4)='4290' then left(rtrim(objname),6) else left(rtrim(objname),4) end)
		+'_'+	(case when left(rtrim(objname),3)='42A' then '高速地图数据' else left(rtrim(objjc),3)+'地图数据' end) as objname
from 	da0102
where 	( (left(rtrim(objname),3)<>'42A' and len(rtrim(objname))=4) or left(rtrim(objname),4)='4290' or rtrim(objname)='42A')
	and (case when left(objname,3)='42A' then left(objname,3) else left(objname,4) end) in (select distinct (case when left(a0102,3)='42A' then left(a0102,3) else left(a0102,4) end) a0102 from a01)
	and left(objname,2)='#AREACODE#' and objname like '#AREACODE#'+'%'
union
select
left(rtrim(objname),5) as objid,
left(rtrim(objname),5)+'_'+left(rtrim(objjc),3)+'高速地图数据' as objname
from da0102
where left(rtrim(objname),5) in (select distinct left(rtrim(a0102),5) a0102 from a01 where rtrim(a0102) like '42A%')
	and left(objname,2)='#AREACODE#' and objname like '#AREACODE#'+'%'
order by objname,objid

end
else
begin
select
	rtrim(objname) as objid,
	rtrim(objname)+'_'+left(rtrim(objjc),3)+'地图数据' as objname
from 	da0102
where 	len(rtrim(objname))>=5 and objname in (select a0102 from a01) and (objname like '#AREACODE#'+'%')
order by rtrim(objname)

end
