
--��·�����׵�����--


--������׵�����--
select HA0203,isnull(sum(A0315A),0)+isnull(sum(A0314A),0)+isnull(sum(A0316A),0)+isnull(sum(A0317A),0) "�ܼ�",
isnull(sum(A0315A),0)+isnull(sum(A0314A),0) "�ϼ�",
isnull(sum(A0315A),0) "���������",isnull(sum(A0314A),0) "ˮ�������",isnull(sum(A0316A),0) "������װ·��",isnull(sum(A0317A),0) "δ��װ·��",
isnull(sum(A3101),0) "���̻����",isnull(sum(A3102),0) "���̻����",isnull(sum(A1001),0) "�������"

from dbo.A11
 
where A0101 < 2020

group by HA0203

go
--����Ľ���--
select HA0203,Ha3219 "��ʽ",isnull(sum(A0315A),0)+isnull(sum(A0314A),0)+isnull(sum(A0316A),0)+isnull(sum(A0317A),0) "�ܼ�",
isnull(sum(A0315A),0)+isnull(sum(A0314A),0) "�ϼ�",
isnull(sum(A0315A),0) "���������",isnull(sum(A0314A),0) "ˮ�������",isnull(sum(A0316A),0) "������װ·��",isnull(sum(A0317A),0) "δ��װ·��",
isnull(sum(A3101),0) "���̻����",isnull(sum(A3102),0) "���̻����",isnull(sum(A1001),0) "�������"

from dbo.A11
 
where A0101 = 2020 and HA3219='�Ľ�' 

group by HA0203,HA3219

go
--�����½���--
select HA0203,Ha3219 "��ʽ",isnull(sum(A0315A),0)+isnull(sum(A0314A),0)+isnull(sum(A0316A),0)+isnull(sum(A0317A),0) "�ܼ�",
isnull(sum(A0315A),0)+isnull(sum(A0314A),0) "�ϼ�",
isnull(sum(A0315A),0) "���������",isnull(sum(A0314A),0) "ˮ�������",isnull(sum(A0316A),0) "������װ·��",isnull(sum(A0317A),0) "δ��װ·��",
isnull(sum(A3101),0) "���̻����",isnull(sum(A3102),0) "���̻����",isnull(sum(A1001),0) "�������"

from dbo.A11
 
where A0101 = 2020 and HA3219<>'�Ľ�' 

group by HA0203,HA3219

go
--������׵�����--
select HA0203,isnull(sum(A0315A),0)+isnull(sum(A0314A),0)+isnull(sum(A0316A),0)+isnull(sum(A0317A),0) "�ܼ�",
isnull(sum(A0315A),0)+isnull(sum(A0314A),0) "�ϼ�",
isnull(sum(A0315A),0) "���������",isnull(sum(A0314A),0) "ˮ�������",isnull(sum(A0316A),0) "������װ·��",isnull(sum(A0317A),0) "δ��װ·��",
isnull(sum(A3101),0) "���̻����",isnull(sum(A3102),0) "���̻����",isnull(sum(A1001),0) "�������"

from dbo.A11
 
where A0101 <= 2020

group by HA0203