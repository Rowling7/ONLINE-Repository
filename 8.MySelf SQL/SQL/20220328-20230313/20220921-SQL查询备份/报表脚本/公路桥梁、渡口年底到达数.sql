
--��·�������ɿ���׵�����--

--������׵�����--
select HA0203,
isnull(sum(A0511),0)+isnull(sum(A0513),0)+isnull(sum(A0515),0)+isnull(sum(A0517),0) "����",
isnull(sum(A0512),0)+isnull(sum(A0514),0)+isnull(sum(A0516),0)+isnull(sum(A0518),0) "����",
isnull(sum(A0519),0) "��ͨ��",isnull(sum(A0520),0) "��ͨ��",
isnull(sum(A0511),0) "�ش���",isnull(sum(A0512),0) "�ش���",
isnull(sum(A0513),0) "����",isnull(sum(A0514),0) "����",isnull(sum(A0515),0) "����",
isnull(sum(A0516),0) "����",isnull(sum(A0517),0) "С��",isnull(sum(A0518),0) "С��",
isnull(sum(A0701),0) "�ɿ�",isnull(sum(A0702),0) "�����ɿ�"

from dbo.A11
 
where A0101 < 2020

group by HA0203

go
--����Ľ���--
select HA0203,Ha3219 "��ʽ",
isnull(sum(A0511),0)+isnull(sum(A0513),0)+isnull(sum(A0515),0)+isnull(sum(A0517),0) "����",
isnull(sum(A0512),0)+isnull(sum(A0514),0)+isnull(sum(A0516),0)+isnull(sum(A0518),0) "����",
isnull(sum(A0519),0) "��ͨ��",isnull(sum(A0520),0) "��ͨ��",
isnull(sum(A0511),0) "�ش���",isnull(sum(A0512),0) "�ش���",
isnull(sum(A0513),0) "����",isnull(sum(A0514),0) "����",isnull(sum(A0515),0) "����",
isnull(sum(A0516),0) "����",isnull(sum(A0517),0) "С��",isnull(sum(A0518),0) "С��",
isnull(sum(A0701),0) "�ɿ�",isnull(sum(A0702),0) "�����ɿ�"

from dbo.A11
 
where A0101 = 2020 and HA3219='�Ľ�' 

group by HA0203,HA3219

go
--�����½���--
select HA0203,Ha3219 "��ʽ",
isnull(sum(A0511),0)+isnull(sum(A0513),0)+isnull(sum(A0515),0)+isnull(sum(A0517),0) "����",
isnull(sum(A0512),0)+isnull(sum(A0514),0)+isnull(sum(A0516),0)+isnull(sum(A0518),0) "����",
isnull(sum(A0519),0) "��ͨ��",isnull(sum(A0520),0) "��ͨ��",
isnull(sum(A0511),0) "�ش���",isnull(sum(A0512),0) "�ش���",
isnull(sum(A0513),0) "����",isnull(sum(A0514),0) "����",isnull(sum(A0515),0) "����",
isnull(sum(A0516),0) "����",isnull(sum(A0517),0) "С��",isnull(sum(A0518),0) "С��",
isnull(sum(A0701),0) "�ɿ�",isnull(sum(A0702),0) "�����ɿ�"

from dbo.A11
 
where A0101 = 2020 and HA3219<>'�Ľ�' 

group by HA0203,HA3219

go
--������׵�����--
select HA0203,
isnull(sum(A0511),0)+isnull(sum(A0513),0)+isnull(sum(A0515),0)+isnull(sum(A0517),0) "����",
isnull(sum(A0512),0)+isnull(sum(A0514),0)+isnull(sum(A0516),0)+isnull(sum(A0518),0) "����",
isnull(sum(A0519),0) "��ͨ��",isnull(sum(A0520),0) "��ͨ��",
isnull(sum(A0511),0) "�ش���",isnull(sum(A0512),0) "�ش���",
isnull(sum(A0513),0) "����",isnull(sum(A0514),0) "����",isnull(sum(A0515),0) "����",
isnull(sum(A0516),0) "����",isnull(sum(A0517),0) "С��",isnull(sum(A0518),0) "С��",
isnull(sum(A0701),0) "�ɿ�",isnull(sum(A0702),0) "�����ɿ�"

from dbo.A11
 
where A0101 <= 2020

group by HA0203