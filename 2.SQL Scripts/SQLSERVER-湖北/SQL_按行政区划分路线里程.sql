--�������ܼ�G
select
case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end,
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and  isnull(K0304,0)<>'10'THEN isnull(K0114,0) else 0 END) '���',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='11' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) 'һ��',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='22' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '����',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='23' or  isnull(K0304,0)='24' or isnull(K0304,0)='30' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '��������'
from K01
where left(k0101,1) in ('G')
group by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end with rollup
order by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end


--�������ܼ�S
select
case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end,
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and  isnull(K0304,0)<>'10'THEN isnull(K0114,0) else 0 END) '���',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='11' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) 'һ��',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='22' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '����',
sum(CASE WHEN isnull(K0124,'') = '' and (isnull(K0304,0)='23' or  isnull(K0304,0)='24' or isnull(K0304,0)='30' )and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '��������'
from K01
where left(k0101,1) in ('S')
group by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end with rollup
order by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end



--�������ܼ�
select
case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end,
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0123,'2') = '2' THEN isnull(K0114,0) else 0 END) '���',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='10' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '����',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='11' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) 'һ��',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='22' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '����',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='23' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '����',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='24' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '�ļ�',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='30' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '���⹫·'
from K01
where left(k0101,1) in ('G','S','X','Y','C','Z')
group by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end with rollup
order by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end



--�������ܼ�
select
case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end,
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='10' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '����',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='10' and isnull(K0123,'2') = '2' and  left(k0101,1)='G'THEN K0114 else 0 END) ��������,
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='10' and isnull(K0123,'2') = '2' THEN K0114 else 0 END)-
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='10' and isnull(K0123,'2') = '2' and  left(k0101,1)='G'THEN K0114 else 0 END)
from K01
where left(k0101,1) in ('G','S','X','Y','C','Z')
group by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end with rollup
order by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end


--�������ܼ�
select
case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end,
sum(case when left(k0101,1)='G' then isnull(k0114,0) end)	����,
sum(case when left(k0101,1)='S' then isnull(k0114,0) end)	ʡ��,
sum(case when left(k0101,1)='X' then isnull(k0114,0) end)	�ص�,
sum(case when left(k0101,1)='Y' then isnull(k0114,0) end)	���,
sum(case when left(k0101,1)='C' then isnull(k0114,0) end)	���,
sum(case when left(k0101,1)='Z' then isnull(k0114,0) end)	ר�ù�·
from K01
where left(k0101,1) in ('G','S','X','Y','C','Z')
and  isnull(K0124,'') = '' and isnull(K0123,'2') = '2' and isnull(K0304,0)<>'10'
group by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end with rollup
order by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end