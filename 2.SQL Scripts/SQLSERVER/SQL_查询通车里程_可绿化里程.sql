--国省道
SELECT a.a0103  政区编码,
d.objjc 政区名称,
a.k0101 路线编码,
b.sk0114 去年通车里程,
a.sk0114 今年通车里程,
b.sa3101 去年可绿化里程,
a.sa3101 今年可绿化里程,
b.sa3102 去年已绿化里程,
a.sa3102 今年已绿化里程,
a.sa3102-b.sa3102 已绿化里程减少情况
from(
SELECT   left(A0103,6) a0103, (case when len(k01.k0101)>9  then left(rtrim(k01.k0101),4)
	when len(k01.k0101)<=9 and charindex('D',rtrim(k01.k0101))<>0 then left(rtrim(k01.k0101),charindex('D',rtrim(k01.k0101))-1)
	when len(k01.k0101)<=9 and charindex('D',rtrim(k01.k0101))=0 then rtrim(k01.k0101) else rtrim(k01.k0101) end)
k0101,sum(k0114) sk0114,sum(isnull(a3101,0)) sa3101,sum(isnull(a3102,0)) sa3102
from k01
where isnull(k01.k0123,'2')='2' and k01.k0124 is null and   left(k0101,1)in('g','s','h','t')
GROUP BY left(A0103,6),(case when len(k01.k0101)>9   then left(rtrim(k01.k0101),4)
	when len(k01.k0101)<=9 and charindex('D',rtrim(k01.k0101))<>0 then left(rtrim(k01.k0101),charindex('D',rtrim(k01.k0101))-1)
	when len(k01.k0101)<=9 and charindex('D',rtrim(k01.k0101))=0 then rtrim(k01.k0101) else rtrim(k01.k0101) end)
)a
left join (
SELECT   left(A0103,6) a0103, (case when len(l01.k0101)>9   then left(rtrim(l01.k0101),4)
	when len(l01.k0101)<=9 and charindex('D',rtrim(l01.k0101))<>0 then left(rtrim(l01.k0101),charindex('D',rtrim(l01.k0101))-1)
	when len(l01.k0101)<=9 and charindex('D',rtrim(l01.k0101))=0 then rtrim(l01.k0101) else rtrim(l01.k0101) end)
k0101,sum(k0114) sk0114,sum(isnull(a3101,0)) sa3101,sum(isnull(a3102,0)) sa3102
from l01
where isnull(l01.k0123,'2')='2' and l01.k0124 is null  and   left(k0101,1)in('g','s','h','t')AND LEFT(l01.A0101,4)='2021'
GROUP BY left(A0103,6),(case when len(l01.k0101)>9   then left(rtrim(l01.k0101),4)
	when len(l01.k0101)<=9 and charindex('D',rtrim(l01.k0101))<>0 then left(rtrim(l01.k0101),charindex('D',rtrim(l01.k0101))-1)
	when len(l01.k0101)<=9 and charindex('D',rtrim(l01.k0101))=0 then rtrim(l01.k0101) else rtrim(l01.k0101) end)
)b  on  a.a0103=REPLACE(b.a0103, '421023', '421088') and a.k0101=b.k0101
left join d020 d on a.A0103=d.objname
ORDER BY a.sa3102-b.sa3102 desc


--农村公路
SELECT
d.objjc 县名称,
a.a0103 县代码,
a.sk0114 总里程,
a.sa3101 可绿化里程,
a.sa3102 已绿化里程,
a.sa1001 养护里程,
cast(cast(round(a.lhl*100,2)as NUMERIC(18,2)) as VARCHAR)+'%'已绿化率,
b.sk0114 总里程2,
b.sa3101 可绿化里程2,
b.sa3102 已绿化里程2,
b.sa1001 养护里程2,
cast(cast(round(b.lhl*100,2)as NUMERIC(18,2)) as VARCHAR)+'%'已绿化率2,
a.sk0114-b.sk0114 总里程变化值,
a.sa3102-b.sa3102 已绿化里程变化值
--into #Tmp
from(
SELECT   left(A0103,6) a0103,sum(k0114) sk0114,sum(isnull(a3101,0)) sa3101,sum(isnull(a3102,0)) sa3102,SUM(isnull(A1001,0)) sa1001,sum(isnull(a3102,0))/sum(isnull(a3101,0)) lhl
from k01
where isnull(k01.k0123,'2')='2' and k01.k0124 is null and   left(k0101,1)in('X','Y','C','Z')
GROUP BY left(A0103,6)
)a
left join (
SELECT   left(A0103,6) a0103,sum(k0114) sk0114,sum(isnull(a3101,0)) sa3101,sum(isnull(a3102,0)) sa3102,SUM(isnull(A1001,0)) sa1001,sum(isnull(a3102,0))/sum(isnull(a3101,0)) lhl
from l01
where isnull(l01.k0123,'2')='2' and l01.k0124 is null  and   left(k0101,1)in('X','Y','C','Z') AND LEFT(l01.A0101,4)='2021'
GROUP BY left(A0103,6)
)b  on a.a0103=REPLACE(b.a0103, '421023', '421088')
left join d020 d on a.A0103=d.objname
where a.a0103 like '42%'
ORDER BY 已绿化里程变化值