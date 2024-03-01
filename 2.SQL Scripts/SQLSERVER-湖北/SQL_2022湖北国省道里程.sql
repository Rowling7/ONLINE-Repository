--国道总里程
select
(case when left(rtrim(k0101),1)='h' then replace(rtrim(k0101),'h','g') else
	case when left(rtrim(k0101),1)='t' then replace(rtrim(k0101),'t','s') else
    case when len(rtrim(k0101))>9 then left(rtrim(k0101),4) else rtrim(k0101) end end end) 路线代码,
sum(isnull(k0114,0)) 总里程
from k01
where left(k0101,1)in ('g') and isnull(k0123,'2')='2' and nullif(k0124,'') is null --and len(rtrim(k0101))>9
group by
(case when left(rtrim(k0101),1)='h' then replace(rtrim(k0101),'h','g') else
	case when left(rtrim(k0101),1)='t' then replace(rtrim(k0101),'t','s') else
    case when len(rtrim(k0101))>9 then left(rtrim(k0101),4) else rtrim(k0101) end end end) with rollup
order by 路线代码

--国高里程
select
(case when left(rtrim(k0101),1)='h' then replace(rtrim(k0101),'h','g') else
	case when left(rtrim(k0101),1)='t' then replace(rtrim(k0101),'t','s') else
    case when len(rtrim(k0101))>9 then left(rtrim(k0101),4) else rtrim(k0101) end end end) 路线代码,
sum(isnull(k0114,0)) 总里程
from k01
where left(k0101,1)in ('g') and isnull(k0123,'2')='2' and nullif(k0124,'') is null and len(rtrim(k0101))<9
group by
(case when left(rtrim(k0101),1)='h' then replace(rtrim(k0101),'h','g') else
	case when left(rtrim(k0101),1)='t' then replace(rtrim(k0101),'t','s') else
    case when len(rtrim(k0101))>9 then left(rtrim(k0101),4) else rtrim(k0101) end end end) with rollup
order by  路线代码

--省道总里程
select
(case when left(rtrim(k0101),1)='h' then replace(rtrim(k0101),'h','g') else
	case when left(rtrim(k0101),1)='t' then replace(rtrim(k0101),'t','s') else
    case when len(rtrim(k0101))>9 then left(rtrim(k0101),4) else rtrim(k0101) end end end) 路线代码,
sum(isnull(k0114,0)) 总里程
from k01
where left(k0101,1)in ('s') and isnull(k0123,'2')='2' and nullif(k0124,'') is null --and len(rtrim(k0101))>9
group by
(case when left(rtrim(k0101),1)='h' then replace(rtrim(k0101),'h','g') else
	case when left(rtrim(k0101),1)='t' then replace(rtrim(k0101),'t','s') else
    case when len(rtrim(k0101))>9 then left(rtrim(k0101),4) else rtrim(k0101) end end end) with rollup
order by 路线代码

--省高里程
select
(case when left(rtrim(k0101),1)='h' then replace(rtrim(k0101),'h','g') else
	case when left(rtrim(k0101),1)='t' then replace(rtrim(k0101),'t','s') else
    case when len(rtrim(k0101))>9 then left(rtrim(k0101),4) else rtrim(k0101) end end end) 路线代码,
sum(isnull(k0114,0)) 总里程
from k01
where left(k0101,1)in ('s') and isnull(k0123,'2')='2' and nullif(k0124,'') is null and len(rtrim(k0101))<9
group by
(case when left(rtrim(k0101),1)='h' then replace(rtrim(k0101),'h','g') else
	case when left(rtrim(k0101),1)='t' then replace(rtrim(k0101),'t','s') else
    case when len(rtrim(k0101))>9 then left(rtrim(k0101),4) else rtrim(k0101) end end end) with rollup
order by  路线代码


