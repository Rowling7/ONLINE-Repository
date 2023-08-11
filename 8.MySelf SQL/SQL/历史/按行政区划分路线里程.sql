--各市区总计
select
case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end,
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0123,'2') = '2' THEN isnull(K0114,0) else 0 END) '里程',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='10' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '高速',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='11' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '一级',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='22' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '二级',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='23' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '三级',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='24' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '四级',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='30' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '等外公路'
from K01
where left(k0101,1) in ('G','S','X','Y','C','Z') 
group by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end with rollup
order by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end



--各市区总计
select
case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end,
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='10' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '高速',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='10' and isnull(K0123,'2') = '2' and  left(k0101,1)='G'THEN K0114 else 0 END) 国道高速,
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='10' and isnull(K0123,'2') = '2' THEN K0114 else 0 END)-
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='10' and isnull(K0123,'2') = '2' and  left(k0101,1)='G'THEN K0114 else 0 END)
from K01
where left(k0101,1) in ('G','S','X','Y','C','Z') 
group by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end with rollup
order by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end


--各市区总计
select
case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end,
sum(case when left(k0101,1)='G' then isnull(k0114,0) end)	国道,
sum(case when left(k0101,1)='S' then isnull(k0114,0) end)	省道,
sum(case when left(k0101,1)='X' then isnull(k0114,0) end)	县道,
sum(case when left(k0101,1)='Y' then isnull(k0114,0) end)	乡道,
sum(case when left(k0101,1)='C' then isnull(k0114,0) end)	村道,
sum(case when left(k0101,1)='Z' then isnull(k0114,0) end)	专用公路

from K01
where left(k0101,1) in ('G','S','X','Y','C','Z')  
and  isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and isnull(K0304,0)<>'10'
group by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end with rollup
order by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end