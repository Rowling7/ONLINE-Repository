use [HRP-GHSS2015]
--��·�����׵�����--

--������׵�����--
select HA0203,isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0)+isnull(sum(A0307),0)+isnull(sum(A0308),0)+isnull(sum(A0309),0)+isnull(sum(A0310),0)+isnull(sum(A0311),0)+isnull(sum(A0312),0) "�ܼ�",
isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0)+isnull(sum(A0307),0)+isnull(sum(A0308),0)+isnull(sum(A0309),0)+isnull(sum(A0310),0)+isnull(sum(A0311),0) "�ϼ�",
isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0) "С��",
isnull(sum(A0304),0) "�ĳ���",isnull(sum(A0305),0) "������",isnull(sum(A0306),0) "�˳���",isnull(sum(A0307),0) "һ��",
isnull(sum(A0308),0) "����",isnull(sum(A0309),0) "һ������",isnull(sum(A0310),0) "����",sum(A0311) "�ļ�",isnull(sum(A0312),0) "���⹫·"

from dbo.A11
 
where A0101 < 2020

group by HA0203

go
--����Ľ���--
select HA0203,Ha3219 "��ʽ",isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0)+isnull(sum(A0307),0)+isnull(sum(A0308),0)+isnull(sum(A0309),0)+isnull(sum(A0310),0)+isnull(sum(A0311),0)+isnull(sum(A0312),0) "�ܼ�",
isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0)+isnull(sum(A0307),0)+isnull(sum(A0308),0)+isnull(sum(A0309),0)+isnull(sum(A0310),0)+isnull(sum(A0311),0) "�ϼ�",
isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0) "С��",
isnull(sum(A0304),0) "�ĳ���",isnull(sum(A0305),0) "������",isnull(sum(A0306),0) "�˳���",isnull(sum(A0307),0) "һ��",isnull(sum(A0308),0) "����",
isnull(sum(A0309),0) "һ������",isnull(sum(A0310),0) "����",isnull(sum(A0311),0) "�ļ�",isnull(sum(A0312),0) "���⹫·"

from dbo.A11
 
where A0101 = 2020 and HA3219='�Ľ�' 

group by HA0203,HA3219

go
--�����½���--
select HA0203,Ha3219 "��ʽ",isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0)+isnull(sum(A0307),0)+isnull(sum(A0308),0)+isnull(sum(A0309),0)+isnull(sum(A0310),0)+isnull(sum(A0311),0)+isnull(sum(A0312),0) "�ܼ�",
isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0)+isnull(sum(A0307),0)+isnull(sum(A0308),0)+isnull(sum(A0309),0)+isnull(sum(A0310),0)+isnull(sum(A0311),0) "�ϼ�",
isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0) "С��",
isnull(sum(A0304),0) "�ĳ���",isnull(sum(A0305),0) "������",isnull(sum(A0306),0) "�˳���",isnull(sum(A0307),0) "һ��",isnull(sum(A0308),0) "����",
isnull(sum(A0309),0) "һ������",isnull(sum(A0310),0) "����",isnull(sum(A0311),0) "�ļ�",isnull(sum(A0312),0) "���⹫·"

from dbo.A11
 
where A0101 = 2020 and HA3219<>'�Ľ�' 

group by HA0203,HA3219

go
--������׵�����--
select HA0203,isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0)+isnull(sum(A0307),0)+isnull(sum(A0308),0)+isnull(sum(A0309),0)+isnull(sum(A0310),0)+isnull(sum(A0311),0)+isnull(sum(A0312),0) "�ܼ�",
isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0)+isnull(sum(A0307),0)+isnull(sum(A0308),0)+isnull(sum(A0309),0)+isnull(sum(A0310),0)+isnull(sum(A0311),0) "�ϼ�",
isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0) "С��",
isnull(sum(A0304),0) "�ĳ���",isnull(sum(A0305),0) "������",isnull(sum(A0306),0) "�˳���",isnull(sum(A0307),0) "һ��",
isnull(sum(A0308),0) "����",isnull(sum(A0309),0) "һ������",isnull(sum(A0310),0) "����",sum(A0311) "�ļ�",isnull(sum(A0312),0) "���⹫·"

from dbo.A11
 
where A0101 <= 2020

group by HA0203