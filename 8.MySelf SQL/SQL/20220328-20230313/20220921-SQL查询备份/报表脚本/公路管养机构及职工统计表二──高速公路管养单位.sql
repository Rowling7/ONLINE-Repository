
--��·����������ְ��ͳ�Ʊ���������ٹ�·������λ--
declare @name varchar(100)
declare @num varchar(100)
select @name = A26.HA0102,@num = A26.A0102
from A21,A26
where A26.A0102 =
(case when A21.A0102 like '4290%' then A21.A0102
    else  substring(A21.A0102,1,4) end) 



select @name '������Ӫ��λ',@num '������Ӫ��λ����',sum(isnull(A.A0108,0)) '��������',sum(isnull(A.A1118,0)) '������ҵ',sum(isnull(A.A0109,0)) '�շѹ�·��Ӫ��ҵ',
sum(isnull(A.A0831,0))+sum(isnull(A.A0823,0))+sum(isnull(A.A0833,0))+sum(isnull(A.A0834,0))+sum(isnull(A.A0835,0))+sum(isnull(A.A0821,0))+sum(isnull(A.A0822,0))+sum(isnull(A.A0823,0))+sum(isnull(A.A0836,0))+sum(isnull(A.A0824,0)) '�ϼ�',
sum(isnull(A.A0831,0))+sum(isnull(A.A0823,0))+sum(isnull(A.A0833,0))+sum(isnull(A.A0834,0))+sum(isnull(A.A0835,0)) 'С��',
sum(isnull(A.A0831,0))+sum(isnull(A.A0823,0))+sum(isnull(A.A0833,0)) '�ڸ�ְ��',sum(isnull(A.A0803,0)) '���̼�����Ա',sum(isnull(A.A0831,0)) '��ҵ�����Ա',sum(isnull(A.A0823,0)) '��ͬ����Ա',
sum(isnull(A.A0833,0)) '��ʱƸ����Ա',sum(isnull(A.A0834,0)) '������ǲ��Ա',sum(isnull(A.A0835,0)) '������Ա',
sum(isnull(A.A0821,0))+sum(isnull(A.A0822,0))+sum(isnull(A.A0823,0))+sum(isnull(A.A0836,0))+sum(isnull(A.A0824,0)) 'С��',
sum(isnull(A.A0821,0))+sum(isnull(A.A0822,0))+sum(isnull(A.A0823,0)) '�ڸ�ְ��',sum(isnull(A.A0821,0)) '��ҵ�����Ա',sum(isnull(A.A0822,0)) '��ͬ����Ա',sum(isnull(A.A0823,0)) '��ʱƸ����Ա',
sum(isnull(A.A0836,0)) '������ǲ��Ա',sum(isnull(A.A0824,0)) '������Ա'

from A21 A,A26

where A.A0101 = '2020' and A.A0108 is not NULL and A26.A0101='2005'

group by A26.HA0102,A26.A0102,A.A0101


/*
and A26.A0102 = ( 
select distinct A26.A0102 
from A21,A26 

)

*/