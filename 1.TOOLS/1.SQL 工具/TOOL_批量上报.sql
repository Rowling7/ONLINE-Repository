----------DBMS_20230322
IF OBJECT_ID('TEMPDB..#DA0102') IS NOT NULL
DROP TABLE #DA0102
create table #DA0102 (objid varchar(50),objname varchar(100))
insert into #DA0102 (objid,objname)
select distinct
	case when left(rtrim(a0102),4)='4290' then left(rtrim(a0102),6) else
		case when left(rtrim(a0102),3)='42A' then left(rtrim(a0102),5) else left(rtrim(a0102),4) end end objid,
	rtrim(da0102.objname)+'_'+left(rtrim(objjc),3)+'_'+'HRP-DBMS2022年年报属性库汇编基数'+Datename(year,GetDate())+''+Datename(month,GetDate())+''+Datename(day,GetDate()) objname
from A01
left join da0102 on
	case when left(rtrim(a0102),4)='4290' then left(rtrim(a0102),6) else
		case when left(rtrim(a0102),3)='42A' then left(rtrim(a0102),5) else left(rtrim(a0102),4) end end=rtrim(da0102.objname)
union
select '42A' objid ,'42A_湖北高速_HRP-DBMS2022年年报属性库汇编基数'+Datename(year,GetDate())+''+Datename(month,GetDate())+''+Datename(day,GetDate()) objname
order by objid


----------GHSS_20230322
IF OBJECT_ID('TEMPDB..#DA0102') IS NOT NULL
DROP TABLE #DA0102
create table #DA0102 (objid varchar(50),objname varchar(100))
insert into #DA0102 (objid,objname)
select distinct
	case when left(rtrim(a0102),4)='4290' then left(rtrim(a0102),6) else
		case when left(rtrim(a0102),3)='42A' then left(rtrim(a0102),5) else left(rtrim(a0102),4) end end objid,
	rtrim(da0102.objname)+'_'+left(rtrim(objjc),3)+'_'+'HRP-GHSS2022年年报统计库汇编基数'+Datename(year,GetDate())+''+Datename(month,GetDate())+''+Datename(day,GetDate()) objname
from A01
left join da0102 on
	case when left(rtrim(a0102),4)='4290' then left(rtrim(a0102),6) else
		case when left(rtrim(a0102),3)='42A' then left(rtrim(a0102),5) else left(rtrim(a0102),4) end end=rtrim(da0102.objname)
union
select '42A' objid ,'42A_湖北高速_HRP-GHSS2022年年报统计库汇编基数'+Datename(year,GetDate())+''+Datename(month,GetDate())+''+Datename(day,GetDate()) objname
order by objid
select * from #DA0102
