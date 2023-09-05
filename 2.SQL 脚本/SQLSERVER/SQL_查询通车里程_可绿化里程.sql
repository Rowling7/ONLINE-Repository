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
)b  on a.a0103=b.a0103 and a.k0101=b.k0101
left join d020 d on a.A0103=d.objname
ORDER BY a.sa3102-b.sa3102 desc


/*比较耗时
SELECT a.a0103  政区编码,
a.objjc 政区名称,
a.k0101 路线编码,
b.sk0114 去年通车里程,
a.sk0114 今年通车里程,
b.sa3101 去年可绿化里程,
a.sa3101 今年可绿化里程,
b.sa3102 去年已绿化里程,
a.sa3102 今年已绿化里程,
a.sa3102-b.sa3102 已绿化里程减少情况
from(
SELECT   left(A0103,6) a0103,objjc, (case when len(k01.k0101)>9 and  left(k0101,1)in('g','s','h','t')  then left(rtrim(k01.k0101),4)
	when len(k01.k0101)<=9 and charindex('D',rtrim(k01.k0101))<>0 then left(rtrim(k01.k0101),charindex('D',rtrim(k01.k0101))-1)
	when len(k01.k0101)<=9 and charindex('D',rtrim(k01.k0101))=0 then rtrim(k01.k0101) else rtrim(k01.k0101) end)
k0101,sum(k0114) sk0114,sum(isnull(a3101,0)) sa3101,sum(isnull(a3102,0)) sa3102
from k01
left join d020 on left(A0103,6)=objname
where isnull(k01.k0123,'2')='2' and k01.k0124 is null
GROUP BY left(A0103,6),objjc,(case when len(k01.k0101)>9  and  left(k0101,1)in('g','s','h','t') then left(rtrim(k01.k0101),4)
	when len(k01.k0101)<=9 and charindex('D',rtrim(k01.k0101))<>0 then left(rtrim(k01.k0101),charindex('D',rtrim(k01.k0101))-1)
	when len(k01.k0101)<=9 and charindex('D',rtrim(k01.k0101))=0 then rtrim(k01.k0101) else rtrim(k01.k0101) end)
)a
left join (
SELECT   left(A0103,6) a0103,objjc, (case when len(l01.k0101)>9  and  left(k0101,1)in('g','s','h','t') then left(rtrim(l01.k0101),4)
	when len(l01.k0101)<=9 and charindex('D',rtrim(l01.k0101))<>0 then left(rtrim(l01.k0101),charindex('D',rtrim(l01.k0101))-1)
	when len(l01.k0101)<=9 and charindex('D',rtrim(l01.k0101))=0 then rtrim(l01.k0101) else rtrim(l01.k0101) end)
k0101,sum(k0114) sk0114,sum(isnull(a3101,0)) sa3101,sum(isnull(a3102,0)) sa3102
from l01
left join d020 on left(A0103,6)=objname
where isnull(l01.k0123,'2')='2' and l01.k0124 is null AND LEFT(l01.A0101,4)='2021'
GROUP BY left(A0103,6),objjc,(case when len(l01.k0101)>9  and  left(k0101,1)in('g','s','h','t') then left(rtrim(l01.k0101),4)
	when len(l01.k0101)<=9 and charindex('D',rtrim(l01.k0101))<>0 then left(rtrim(l01.k0101),charindex('D',rtrim(l01.k0101))-1)
	when len(l01.k0101)<=9 and charindex('D',rtrim(l01.k0101))=0 then rtrim(l01.k0101) else rtrim(l01.k0101) end)
)b  on a.a0103=b.a0103 and a.k0101=b.k0101
--排序耗时
ORDER BY a.sa3102-b.sa3102 desc
*/