
--��·������׵�����--


--������׵�����--
select HA0203,
isnull(sum(A0505),0) "������",isnull(sum(A0506),0) "������",
isnull(sum(A0503),0) "Σ����",isnull(sum(A0504),0) "Σ����",isnull(sum(A0505),0) "������",
isnull(sum(A0506),0) "������",isnull(sum(A0507),0) "��������",isnull(sum(A0508),0) "��������",
isnull(sum(A0509),0) "��ʱ��",isnull(sum(A0510),0) "��ʱ��"

from dbo.A11
 
where A0101 < 2020

group by HA0203

go
--����Ľ���--
select HA0203,Ha3219 "��ʽ",isnull(sum(A0505),0) "������",isnull(sum(A0506),0) "������",
isnull(sum(A0503),0) "Σ����",isnull(sum(A0504),0) "Σ����",isnull(sum(A0505),0) "������",
isnull(sum(A0506),0) "������",isnull(sum(A0507),0) "��������",isnull(sum(A0508),0) "��������",
isnull(sum(A0509),0) "��ʱ��",isnull(sum(A0510),0) "��ʱ��"

from dbo.A11
 
where A0101 = 2020 and HA3219='�Ľ�' 

group by HA0203,HA3219

go
--�����½���--
select HA0203,Ha3219 "��ʽ",isnull(sum(A0505),0) "������",isnull(sum(A0506),0) "������",
isnull(sum(A0503),0) "Σ����",isnull(sum(A0504),0) "Σ����",isnull(sum(A0505),0) "������",
isnull(sum(A0506),0) "������",isnull(sum(A0507),0) "��������",isnull(sum(A0508),0) "��������",
isnull(sum(A0509),0) "��ʱ��",isnull(sum(A0510),0) "��ʱ��"

from dbo.A11
 
where A0101 = 2020 and HA3219<>'�Ľ�' 

group by HA0203,HA3219

go
--������׵�����--
select HA0203,isnull(sum(A0505),0) "������",isnull(sum(A0506),0) "������",
isnull(sum(A0503),0) "Σ����",isnull(sum(A0504),0) "Σ����",isnull(sum(A0505),0) "������",
isnull(sum(A0506),0) "������",isnull(sum(A0507),0) "��������",isnull(sum(A0508),0) "��������",
isnull(sum(A0509),0) "��ʱ��",isnull(sum(A0510),0) "��ʱ��"

from dbo.A11
 
where A0101 <= 2020

group by HA0203