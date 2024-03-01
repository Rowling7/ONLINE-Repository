--国省道路线明细表（按管理单位分）
select
rtrim(c.a0102) a0102,c.ha0102,rtrim(replace(replace(replace(replace(replace(c.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) k0101 ,rtrim(k0112) k0112,min(c.k0108) k0108,max(c.k0109) k0109,sum(isnull(c.k0114,0)) k0114
from k01 c
where  isnull(c.k0123,'2')='2' and k0124 is null and
left(k0101,1) in ('g','s')
group by  rtrim(replace(replace(replace(replace(replace(c.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')),rtrim(c.a0102),c.ha0102,rtrim(k0112)
ORDER BY  rtrim(c.a0102),k0101



--国省道路线明细表（按路线分）
select
rtrim(replace(replace(replace(replace(replace(c.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) k0101 ,
rtrim(k0112) k0112,	min(c.k0108) k0108,max(c.k0109) k0109,sum(isnull(c.k0114,0)) k0114
from k01 c
where  isnull(c.k0123,'2')='2' and k0124 is null and
left(k0101,1) in ('g','s')
group by  rtrim(replace(replace(replace(replace(replace(c.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')),rtrim(k0112)
ORDER BY  k0101

