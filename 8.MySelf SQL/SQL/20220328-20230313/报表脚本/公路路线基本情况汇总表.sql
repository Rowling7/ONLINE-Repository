use [HRP-GHSS2015]
--��··�߻���������ܱ�--
select A0203 '·�߱��',A0102 '��������',HA0203 '·������',
isnull(sum(A0307),0)+isnull(sum(A0308),0)+isnull(sum(A0309),0)+isnull(sum(A0310),0)+isnull(sum(A0311),0)+
isnull(sum(A0312),0) '�ܼ�',
isnull(sum(A0307),0)+isnull(sum(A0308),0)+isnull(sum(A0309),0)+isnull(sum(A0310),0)+isnull(sum(A0311),0) '�ϼ�',
isnull(sum(A0304),0)+isnull(sum(A0305),0)+isnull(sum(A0306),0) 'С��',
isnull(sum(A0304),0) '�ĳ���',
isnull(sum(A0305),0) '������',isnull(sum(A0306),0) '�˳���������',isnull(sum(A0307),0) 'һ��',isnull(sum(A0308),0) '����',isnull(sum(A0309),0) 'һ������',
isnull(sum(A0310),0) '����',isnull(sum(A0311),0) '�ļ�',isnull(sum(A0312),0) '���⹫·',
isnull(sum(A0314A),0)+isnull(sum(A0315A),0) 'С��',
isnull(sum(A0314A),0) '���������',isnull(sum(A0315A),0) 'ˮ�������',isnull(sum(A0316A),0) '������װ·��',isnull(sum(A0317A),0) 'δ��װ·��',
isnull(sum(A0323),0) 'Ӳ��·��',isnull(sum(A0324),0) '�ǹ����',isnull(sum(A0321),0) '��ͷ·���',isnull(sum(K1707),0) '�ظ����',
isnull(sum(A1001),0) '�������',isnull(sum(A3101),0) '���̻����',isnull(sum(A3102),0) '���̻����'

from A51

where A0102 != '420701' and (A0203 = 'C' or A0203 = 'Y')

group by A0203,A0102,HA0203

order by A0102



