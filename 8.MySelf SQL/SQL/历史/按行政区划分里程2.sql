--各市区总计
select
case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end,
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and  isnull(K0304,0)<>'10'THEN isnull(K0114,0) else 0 END) '里程',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='11' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '一级',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='22' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '二级',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='23' or  isnull(K0304,0)='24' or isnull(K0304,0)='30' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '二级以下'
from K01
where left(k0101,1) in ('G') 
group by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end with rollup
order by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end


--各市区总计
select
case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end,
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and  isnull(K0304,0)<>'10'THEN isnull(K0114,0) else 0 END) '里程',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='11' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '一级',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='22' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '二级',
sum(CASE WHEN isnull(K0124,'') = '' and (isnull(K0304,0)='23' or  isnull(K0304,0)='24' or isnull(K0304,0)='30' )and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '二级以下'
from K01
where left(k0101,1) in ('S') 
group by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end with rollup
order by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end
