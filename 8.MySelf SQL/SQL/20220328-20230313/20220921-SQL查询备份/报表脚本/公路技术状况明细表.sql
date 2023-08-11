
--公路技术状况明细表--

select distinct substring(K.K0101,2,5) '路线编号',K1.K0112 '路线名称',k.K0105 '起点桩号',k.K0106 '止点桩号',
k.A5009 '检测方向',k.K0304 '技术等级',k.K5124 '路面类型',k.A5008 '路段长度',k.A5010 'MQI',
k.A5011 '路面PQI',k.A5011A 'PCI',k.A5011B 'RQI',k.A5011C 'RDI',k.A5011D 'SRI',k.A5011E 'PSSI',k.A5012 '路基SCI',k.A5013 '桥隧构造物',k.A5014 '沿线设施',
isnull(cast(k.A0129 as varchar(100)),'') '备注'
from K05 K,K01 K1
where k.A0101A = '2020' and K.K0101 like '[GS]%' and K.K0101= K1.K0101 
order by substring(k.K0101,2,5)
