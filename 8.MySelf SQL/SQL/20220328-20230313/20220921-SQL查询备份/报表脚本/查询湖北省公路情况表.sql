--����2020�깫·��������ϼ�
--ȫʡ�ϼ��ܼ�
select
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0123,'2') = '2' THEN isnull(K0114,0) else 0 END) '���',
sum(CASE WHEN isnull(K0304,0)='10' and isnull(K0124,'') = '' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '����',
sum(CASE WHEN isnull(K0304,0)='11' and isnull(K0124,'') = '' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) 'һ��',
sum(CASE WHEN isnull(K0304,0)='22' and isnull(K0124,'') = '' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '����',
sum(CASE WHEN isnull(K0304,0)='23' and isnull(K0124,'') = '' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '����',
sum(CASE WHEN isnull(K0304,0)='24' and isnull(K0124,'') = '' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '�ļ�',
sum(CASE WHEN isnull(K0304,0)='30' and isnull(K0124,'') = '' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '���⹫·',
sum(CASE WHEN isnull(K0123,'2') = '1'  THEN isnull(K0114,0) else 0 END) '��ͷ·'
from K001
where left(k0101,1) in ('G','S','X','Y','C','Z')
--ȫʡ�ϼƷ���
select
left(K0101 ,1),
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0123,'2') = '2' THEN isnull(K0114,0) else 0 END) '���',
sum(CASE WHEN isnull(K0304,0)='10' and isnull(K0124,'') = '' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '����',
sum(CASE WHEN isnull(K0304,0)='11' and isnull(K0124,'') = '' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) 'һ��',
sum(CASE WHEN isnull(K0304,0)='22' and isnull(K0124,'') = '' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '����',
sum(CASE WHEN isnull(K0304,0)='23' and isnull(K0124,'') = '' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '����',
sum(CASE WHEN isnull(K0304,0)='24' and isnull(K0124,'') = '' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '�ļ�',
sum(CASE WHEN isnull(K0304,0)='30' and isnull(K0124,'') = '' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '���⹫·',
sum(CASE WHEN isnull(K0123,'2') = '1'  THEN isnull(K0114,0) else 0 END) '��ͷ·'
from K001
where left(k0101,1) in ('G','S','X','Y','C','Z')
group by left(K0101 ,1)
order by case left(K0101,1)
when 'G' then 1
when 'S' then 2
when 'X' then 3
when 'Y' then 4
when 'C' then 5
when 'Z' then 6
end

--�������ܼ�
select
case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end,
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0123,'2') = '2' THEN isnull(K0114,0) else 0 END) '���',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='10' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '����',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='11' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) 'һ��',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='22' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '����',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='23' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '����',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='24' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '�ļ�',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='30' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '���⹫·',
sum(CASE WHEN isnull(K0123,'2') = '1'  THEN isnull(K0114,0) else 0 END) '��ͷ·'
from K001
where left(k0101,1) in ('G','S','X','Y','C','Z')
group by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end
order by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end

--����������
select
case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end,
left(K0101 ,1),
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '���',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='10' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '����',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='11' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) 'һ��',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='22' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '����',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='23' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '����',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='24' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '�ļ�',
sum(CASE WHEN isnull(K0124,'') = '' and isnull(K0304,0)='30' and isnull(K0123,'2') = '2' THEN K0114 else 0 END) '���⹫·',
sum(CASE WHEN isnull(K0123,'2') = '1'  THEN isnull(K0114,0) else 0 END) '��ͷ·'
from K001
where left(k0101,1) in ('G','S','X','Y','C','Z')
group by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end,left(K0101 ,1)
order by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end,case left(K0101,1)
when 'G' then 1
when 'S' then 2
when 'X' then 3
when 'Y' then 4
when 'C' then 5
when 'Z' then 6
end


---------��������
--ȫʡ�ϼ��ܼ�
select
count(distinct CASE WHEN isnull(K0124,'') = '' and isnull(K0123,'2') = '2' THEN K0101 else null END)
from K001
where left(k0101,1) in ('G','S','X','Y','C','Z') and 
isnull(K0123,'2') = '2' and 
isnull(K0124,'') = '' 


--ȫʡ�ϼƷ���
select
left(K0101 ,1),
count(distinct K0101)
from K001
where left(k0101,1) in ('G','S','X','Y','C','Z') and isnull(K0123,'2') = '2' and isnull(K0124,'') = ''
group by left(K0101 ,1)
order by case left(K0101,1)
when 'G' then 1
when 'S' then 2
when 'X' then 3
when 'Y' then 4
when 'C' then 5
when 'Z' then 6
end
--�������ܼ�
select
case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end,
count(distinct K0101)
from K001
where left(k0101,1) in ('G','S','X','Y','C','Z') and isnull(K0123,'2') = '2' and isnull(K0124,'') = ''
group by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end
order by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end
--����������
select
case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end,
left(K0101 ,1),
count(distinct K0101)
from K001
where left(k0101,1) in ('G','S','X','Y','C','Z') and isnull(K0123,'2') = '2' and isnull(K0124,'') = ''
group by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end,left(K0101 ,1)
order by case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end,case left(K0101,1)
when 'G' then 1
when 'S' then 2
when 'X' then 3
when 'Y' then 4
when 'C' then 5
when 'Z' then 6
end