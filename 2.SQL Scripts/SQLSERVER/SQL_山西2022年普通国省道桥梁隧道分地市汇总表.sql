--桥梁 全省
select
left(a0103,4)a0103, objjc,
sum(case when k6007 in ('1','2','3','4') then k6008 else 0 end) 总延米,
sum(case when k6007 in ('1','2','3','4') then 1 else 0 end) 总座数,
sum(case when k6028 in ('4','5') then k6008 else 0 end) 危桥延米,
sum(case when k6028 in ('4','5') then 1 else 0 end) 危桥座数,
sum(case when k6007='1' then k6008 else 0 end) 特大延米,
sum(case when k6007='1' then 1 else 0 end) 特大座数,
sum(case when k6007='2' then k6008 else 0 end) 大桥延米,
sum(case when k6007='2' then 1 else 0 end) 大桥座数,
sum(case when k6007='3' then k6008 else 0 end) 中桥延米,
sum(case when k6007='3' then 1 else 0 end) 中桥座数,
sum(case when k6007='4' then k6008 else 0 end) 小桥延米,
sum(case when k6007='4' then 1 else 0 end) 小桥座数
from k60
left join d020 on objname=left(a0103,4)
--where rtrim(a0102) like '141%'
group by left(a0103,4), objjc  with rollup
having grouping(left(a0103,4))=grouping(objjc)
order by left(a0103,4)

--桥梁 国省干线
select
left(a0103,4)a0103, objjc,
sum(case when k6007 in ('1','2','3','4') then k6008 else 0 end) 总延米,
sum(case when k6007 in ('1','2','3','4') then 1 else 0 end) 总座数,
sum(case when k6028 in ('4','5') then k6008 else 0 end) 危桥延米,
sum(case when k6028 in ('4','5') then 1 else 0 end) 危桥座数,
sum(case when k6007='1' then k6008 else 0 end) 特大延米,
sum(case when k6007='1' then 1 else 0 end) 特大座数,
sum(case when k6007='2' then k6008 else 0 end) 大桥延米,
sum(case when k6007='2' then 1 else 0 end) 大桥座数,
sum(case when k6007='3' then k6008 else 0 end) 中桥延米,
sum(case when k6007='3' then 1 else 0 end) 中桥座数,
sum(case when k6007='4' then k6008 else 0 end) 小桥延米,
sum(case when k6007='4' then 1 else 0 end) 小桥座数
from k60
left join d020 on objname=left(a0103,4)
where rtrim(a0102) like '141%'
group by left(a0103,4), objjc  with rollup
having grouping(left(a0103,4))=grouping(objjc)
order by left(a0103,4)


--隧道 全省
select
left(a0103,4)a0103, objjc,
sum(case when k6304 in ('1','2','3','4') then k6305 else 0 end) 总延米,
sum(case when k6304 in ('1','2','3','4') then 1 else 0 end) 总座数,
sum(case when k6304='1' then k6305 else 0 end)	as	特长隧道延米,
sum(case when k6304='1' then 1 else 0 end)	as	特长隧道,
sum(case when k6304='2' then k6305 else 0 end)	as	长隧道延米,
sum(case when k6304='2' then 1 else 0 end)	as	长隧道,
sum(case when k6304='3' then k6305 else 0 end)	as	中隧道延米,
sum(case when k6304='3' then 1 else 0 end)	as	中隧道,
sum(case when k6304='4' then k6305 else 0 end)	as	短隧道延米,
sum(case when k6304='4' then 1 else 0 end)	as	短隧道
from k63
left join d020 on objname=left(a0103,4)
--where rtrim(a0102) like '141%'
group by left(a0103,4), objjc  with rollup
having grouping(left(a0103,4))=grouping(objjc)
order by left(a0103,4)

--隧道 国省干线
select
left(a0103,4)a0103, objjc,
sum(case when k6304 in ('1','2','3','4') then k6305 else 0 end) 总延米,
sum(case when k6304 in ('1','2','3','4') then 1 else 0 end) 总座数,
sum(case when k6304='1' then k6305 else 0 end)	as	特长隧道延米,
sum(case when k6304='1' then 1 else 0 end)	as	特长隧道,
sum(case when k6304='2' then k6305 else 0 end)	as	长隧道延米,
sum(case when k6304='2' then 1 else 0 end)	as	长隧道,
sum(case when k6304='3' then k6305 else 0 end)	as	中隧道延米,
sum(case when k6304='3' then 1 else 0 end)	as	中隧道,
sum(case when k6304='4' then k6305 else 0 end)	as	短隧道延米,
sum(case when k6304='4' then 1 else 0 end)	as	短隧道
from k63
left join d020 on objname=left(a0103,4)
where rtrim(a0102) like '141%'
group by left(a0103,4), objjc  with rollup
having grouping(left(a0103,4))=grouping(objjc)
order by left(a0103,4)



