
--��·����״����ϸ��--

select distinct substring(K.K0101,2,5) '·�߱��',K1.K0112 '·������',k.K0105 '���׮��',k.K0106 'ֹ��׮��',
k.A5009 '��ⷽ��',k.K0304 '�����ȼ�',k.K5124 '·������',k.A5008 '·�γ���',k.A5010 'MQI',
k.A5011 '·��PQI',k.A5011A 'PCI',k.A5011B 'RQI',k.A5011C 'RDI',k.A5011D 'SRI',k.A5011E 'PSSI',k.A5012 '·��SCI',k.A5013 '��������',k.A5014 '������ʩ',
isnull(cast(k.A0129 as varchar(100)),'') '��ע'
from K05 K,K01 K1
where k.A0101A = '2020' and K.K0101 like '[GS]%' and K.K0101= K1.K0101 
order by substring(k.K0101,2,5)
