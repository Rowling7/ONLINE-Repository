--���� ȫʡ
select
left(a0103,4)a0103, objjc,
sum(case when k6007 in ('1','2','3','4') then k6008 else 0 end) ������,
sum(case when k6007 in ('1','2','3','4') then 1 else 0 end) ������,
sum(case when k6028 in ('4','5') then k6008 else 0 end) Σ������,
sum(case when k6028 in ('4','5') then 1 else 0 end) Σ������,
sum(case when k6007='1' then k6008 else 0 end) �ش�����,
sum(case when k6007='1' then 1 else 0 end) �ش�����,
sum(case when k6007='2' then k6008 else 0 end) ��������,
sum(case when k6007='2' then 1 else 0 end) ��������,
sum(case when k6007='3' then k6008 else 0 end) ��������,
sum(case when k6007='3' then 1 else 0 end) ��������,
sum(case when k6007='4' then k6008 else 0 end) С������,
sum(case when k6007='4' then 1 else 0 end) С������
from k60
left join d020 on objname=left(a0103,4)
--where rtrim(a0102) like '141%'
group by left(a0103,4), objjc  with rollup
having grouping(left(a0103,4))=grouping(objjc)
order by left(a0103,4)

--���� ��ʡ����
select
left(a0103,4)a0103, objjc,
sum(case when k6007 in ('1','2','3','4') then k6008 else 0 end) ������,
sum(case when k6007 in ('1','2','3','4') then 1 else 0 end) ������,
sum(case when k6028 in ('4','5') then k6008 else 0 end) Σ������,
sum(case when k6028 in ('4','5') then 1 else 0 end) Σ������,
sum(case when k6007='1' then k6008 else 0 end) �ش�����,
sum(case when k6007='1' then 1 else 0 end) �ش�����,
sum(case when k6007='2' then k6008 else 0 end) ��������,
sum(case when k6007='2' then 1 else 0 end) ��������,
sum(case when k6007='3' then k6008 else 0 end) ��������,
sum(case when k6007='3' then 1 else 0 end) ��������,
sum(case when k6007='4' then k6008 else 0 end) С������,
sum(case when k6007='4' then 1 else 0 end) С������
from k60
left join d020 on objname=left(a0103,4)
where rtrim(a0102) like '141%'
group by left(a0103,4), objjc  with rollup
having grouping(left(a0103,4))=grouping(objjc)
order by left(a0103,4)


--��� ȫʡ
select
left(a0103,4)a0103, objjc,
sum(case when k6304 in ('1','2','3','4') then k6305 else 0 end) ������,
sum(case when k6304 in ('1','2','3','4') then 1 else 0 end) ������,
sum(case when k6304='1' then k6305 else 0 end)	as	�س��������,
sum(case when k6304='1' then 1 else 0 end)	as	�س����,
sum(case when k6304='2' then k6305 else 0 end)	as	���������,
sum(case when k6304='2' then 1 else 0 end)	as	�����,
sum(case when k6304='3' then k6305 else 0 end)	as	���������,
sum(case when k6304='3' then 1 else 0 end)	as	�����,
sum(case when k6304='4' then k6305 else 0 end)	as	���������,
sum(case when k6304='4' then 1 else 0 end)	as	�����
from k63
left join d020 on objname=left(a0103,4)
--where rtrim(a0102) like '141%'
group by left(a0103,4), objjc  with rollup
having grouping(left(a0103,4))=grouping(objjc)
order by left(a0103,4)

--��� ��ʡ����
select
left(a0103,4)a0103, objjc,
sum(case when k6304 in ('1','2','3','4') then k6305 else 0 end) ������,
sum(case when k6304 in ('1','2','3','4') then 1 else 0 end) ������,
sum(case when k6304='1' then k6305 else 0 end)	as	�س��������,
sum(case when k6304='1' then 1 else 0 end)	as	�س����,
sum(case when k6304='2' then k6305 else 0 end)	as	���������,
sum(case when k6304='2' then 1 else 0 end)	as	�����,
sum(case when k6304='3' then k6305 else 0 end)	as	���������,
sum(case when k6304='3' then 1 else 0 end)	as	�����,
sum(case when k6304='4' then k6305 else 0 end)	as	���������,
sum(case when k6304='4' then 1 else 0 end)	as	�����
from k63
left join d020 on objname=left(a0103,4)
where rtrim(a0102) like '141%'
group by left(a0103,4), objjc  with rollup
having grouping(left(a0103,4))=grouping(objjc)
order by left(a0103,4)



