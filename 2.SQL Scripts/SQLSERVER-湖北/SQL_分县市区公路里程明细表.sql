
--�������ܼ�
select
left(A0103 ,6) ,rtrim(OBJJC),
sum(isnull(K0114,0)) '���',
sum(CASE WHEN  isnull(K0304,0)='10' THEN K0114 else 0 END) ����,
sum(case when left(k0101,1)='G' then isnull(k0114,0) end)	����,
sum(CASE WHEN isnull(K0304,0)='10' and  left(k0101,1)='G'THEN K0114 else 0 END) ��������,
sum(case when left(k0101,1)='S' then isnull(k0114,0) end)	ʡ��,
sum(CASE WHEN isnull(K0304,0)='10' and  left(k0101,1)='S'THEN K0114 else 0 END) ʡ������,
sum(case when left(k0101,1)='X' then isnull(k0114,0) end)	�ص�,
sum(case when left(k0101,1)='Y' then isnull(k0114,0) end)	���,
sum(case when left(k0101,1)='C' then isnull(k0114,0) end)	���,
sum(case when left(k0101,1)='Z' then isnull(k0114,0) end)	ר�ù�·
from K01
left JOIN d020 on left(A0103 ,6)=RTRIM(OBJNAME)
where left(k0101,1) in ('G','S','X','Y','C','Z')
and  isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and left(a0103,4)='4205'
group by left(A0103 ,6) ,rtrim(OBJJC)with rollup
HAVING GROUPING(left(A0103 ,6))=GROUPING(rtrim(OBJJC))
order by left(A0103 ,6),rtrim(OBJJC)

