use [HRP-GHSS2015]
--��·�ֻ���ʧ����ͨ���ͳ�Ʊ�--

select HA2819, isnull(sum(A2801),0) '�ֻ������ϼ�1',isnull(sum(A2802),0) '�ֻ������ϼ�2',isnull(sum(A2803),0) '��ʡ���ߺϼ�1',isnull(sum(A2804),0) '��ʡ���ߺϼ�2',
isnull(sum(A2805),0) 'ˮ������1',isnull(sum(A2806),0) 'ˮ������2',isnull(sum(A2807),0) '��ʡ���ߺϼ�1',isnull(sum(A2808),0) '��ʡ���ߺϼ�2',isnull(sum(A2809),0) '�漰���ϼ�1',
isnull(sum(A2810),0) '�漰���ϼ�2',isnull(sum(A2811),0) 'ˮ�ٺϼ�1',isnull(sum(A2812),0) 'ˮ�ٺϼ�2'
from A28
where A0101A = '2020'
group by HA2819


