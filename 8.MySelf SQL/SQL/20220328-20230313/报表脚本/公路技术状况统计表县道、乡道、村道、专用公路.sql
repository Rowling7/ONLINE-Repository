
--��·����״��ͳ�Ʊ��ص�������������ר�ù�·--

select HA0203 'MQI����', sum(isnull(A5031,0)) '�ϼ�',sum(isnull(A5032,0)) '�ŵ�·',sum(isnull(A5033,0)) '����·',sum(isnull(A5034,0)) '�е�·',sum(isnull(A5035,0)) '�ε�·',sum(isnull(A5076,0)) '���·',
CAST(sum(isnull(a5032,0)+isnull(a5033,0))*100/nullif(sum(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)),0) as decimal(18,2)) '����·��',
CAST(sum(isnull(a5010,0)*(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)))/nullif(sum(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)),0) as decimal(18,2)) '�������'

from K04
where A0101A = '2020'
group by HA0203

select HA0203 '·������', sum(isnull(A5041,0)) '�ϼ�',sum(isnull(A5042,0)) '�ŵ�·',sum(isnull(A5043,0)) '����·',sum(isnull(A5044,0)) '�е�·',sum(isnull(A5045,0)) '�ε�·',
sum(isnull(A5046,0)) '���·',
CAST(sum(isnull(a5032,0)+isnull(a5033,0))*100/nullif(sum(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)),0) as decimal(18,2)) '����·��',
CAST(sum(isnull(a5010,0)*(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)))/nullif(sum(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)),0) as decimal(18,2)) '�������'

from K04
where A0101A = '2020'
group by HA0203

select HA0203 '·������', sum(isnull(A5051,0)) '�ϼ�',sum(isnull(A5052,0)) '�ŵ�·',sum(isnull(A5053,0)) '����·',sum(isnull(A5054,0)) '�е�·',sum(isnull(A5055,0)) '�ε�·',
sum(isnull(A5056,0)) '���·',
CAST(sum(isnull(a5032,0)+isnull(a5033,0))*100/nullif(sum(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)),0) as decimal(18,2)) '����·��',
CAST(sum(isnull(a5010,0)*(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)))/nullif(sum(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)),0) as decimal(18,2)) '�������'

from K04
where A0101A = '2020'
group by HA0203

select HA0203 '��������', sum(isnull(A5061,0)) '�ϼ�',sum(isnull(A5062,0)) '�ŵ�·',sum(isnull(A5063,0)) '����·',sum(isnull(A5064,0)) '�е�·',sum(isnull(A5065,0)) '�ε�·',
sum(isnull(A5066,0)) '���·',
CAST(sum(isnull(a5032,0)+isnull(a5033,0))*100/nullif(sum(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)),0) as decimal(18,2)) '����·��',
CAST(sum(isnull(a5010,0)*(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)))/nullif(sum(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)),0) as decimal(18,2)) '�������'

from K04
where A0101A = '2020'
group by HA0203

select HA0203 '��������', sum(isnull(A5071,0)) '�ϼ�',sum(isnull(A5072,0)) '�ŵ�·',sum(isnull(A5073,0)) '����·',sum(isnull(A5074,0)) '�е�·',sum(isnull(A5075,0)) '�ε�·',
sum(isnull(A5076,0)) '���·',
CAST(sum(isnull(a5032,0)+isnull(a5033,0))*100/nullif(sum(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)),0) as decimal(18,2)) '����·��',
CAST(sum(isnull(a5010,0)*(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)))/nullif(sum(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)),0) as decimal(18,2)) '�������'

from K04
where A0101A = '2020'
group by HA0203