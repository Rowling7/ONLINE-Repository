
--��·�����׵�����--

--������׵�����--
select HA0203,
isnull(sum(A0605),0)+isnull(sum(A0607),0)+isnull(sum(A0609),0)+isnull(sum(A0611),0) "����",
isnull(sum(A0606),0)+isnull(sum(A0608),0)+isnull(sum(A0610),0)+isnull(sum(A0612),0) "����",
isnull(sum(A0605),0) "�س���",isnull(sum(A0606),0) "�س���",
isnull(sum(A0607),0) "����",isnull(sum(A0608),0) "����",isnull(sum(A0609),0) "����",
isnull(sum(A0610),0) "����",isnull(sum(A0611),0) "����",isnull(sum(A0612),0) "����"

from dbo.A11
 
where A0101 < 2020

group by HA0203

go
--����Ľ���--
select HA0203,Ha3219 "��ʽ",
isnull(sum(A0605),0)+isnull(sum(A0607),0)+isnull(sum(A0609),0)+isnull(sum(A0611),0) "����",
isnull(sum(A0606),0)+isnull(sum(A0608),0)+isnull(sum(A0610),0)+isnull(sum(A0612),0) "����",
isnull(sum(A0605),0) "�س���",isnull(sum(A0606),0) "�س���",
isnull(sum(A0607),0) "����",isnull(sum(A0608),0) "����",isnull(sum(A0609),0) "����",
isnull(sum(A0610),0) "����",isnull(sum(A0611),0) "����",isnull(sum(A0612),0) "����"

from dbo.A11
 
where A0101 = 2020 and HA3219='�Ľ�' 

group by HA0203,HA3219

go
--�����½���--
select HA0203,Ha3219 "��ʽ",
isnull(sum(A0605),0)+isnull(sum(A0607),0)+isnull(sum(A0609),0)+isnull(sum(A0611),0) "����",
isnull(sum(A0606),0)+isnull(sum(A0608),0)+isnull(sum(A0610),0)+isnull(sum(A0612),0) "����",
isnull(sum(A0605),0) "�س���",isnull(sum(A0606),0) "�س���",
isnull(sum(A0607),0) "����",isnull(sum(A0608),0) "����",isnull(sum(A0609),0) "����",
isnull(sum(A0610),0) "����",isnull(sum(A0611),0) "����",isnull(sum(A0612),0) "����"

from dbo.A11
 
where A0101 = 2020 and HA3219<>'�Ľ�' 

group by HA0203,HA3219

go
--������׵�����--
select HA0203,
isnull(sum(A0605),0)+isnull(sum(A0607),0)+isnull(sum(A0609),0)+isnull(sum(A0611),0) "����",
isnull(sum(A0606),0)+isnull(sum(A0608),0)+isnull(sum(A0610),0)+isnull(sum(A0612),0) "����",
isnull(sum(A0605),0) "�س���",isnull(sum(A0606),0) "�س���",
isnull(sum(A0607),0) "����",isnull(sum(A0608),0) "����",isnull(sum(A0609),0) "����",
isnull(sum(A0610),0) "����",isnull(sum(A0611),0) "����",isnull(sum(A0612),0) "����"

from dbo.A11
 
where A0101 <= 2020

group by HA0203