--��ʡ��
SELECT a.a0103  ��������,
d.objjc ��������,
a.k0101 ·�߱���,
b.sk0114 ȥ��ͨ�����,
a.sk0114 ����ͨ�����,
b.sa3101 ȥ����̻����,
a.sa3101 ������̻����,
b.sa3102 ȥ�����̻����,
a.sa3102 �������̻����,
a.sa3102-b.sa3102 ���̻���̼������
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


--ũ�幫·
SELECT
d.objjc ������,
a.a0103 �ش���,
a.sk0114 �����,
a.sa3101 ���̻����,
a.sa3102 ���̻����,
a.sa1001 �������,
cast(cast(round(a.lhl*100,2)as NUMERIC(18,2)) as VARCHAR)+'%'���̻���,
b.sk0114 �����2,
b.sa3101 ���̻����2,
b.sa3102 ���̻����2,
b.sa1001 �������2,
cast(cast(round(b.lhl*100,2)as NUMERIC(18,2)) as VARCHAR)+'%'���̻���2,
a.sk0114-b.sk0114 ����̱仯ֵ,
a.sa3102-b.sa3102 ���̻���̱仯ֵ
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
ORDER BY ���̻���̱仯ֵ