
--��·Ӧ���������ʼ�����ͳ�Ʊ�--

select HA0102 '����λ����',A0102 '����λ����',sum(isnull(A2711,0)) '�������ģ��㣩����ʡ��',
sum(isnull(A2712,0)) '�������ģ��㣩�������м����¼�',sum(isnull(A2702,0)) '�������ʱ�֯��',
sum(isnull(A2703,0)) '��ѩ��',sum(isnull(A2713,0)) '������',
sum(isnull(A2701,0)) 'ս������',sum(isnull(A2714,0)) '��е����',
sum(isnull(A2704,0)) 'ƽ�峵',sum(isnull(A2705,0)) '�ھ��',
sum(isnull(A2706,0)) '������',min(A2707) 'װ�ػ�',
sum(isnull(A2715,0)) '���ػ�',sum(isnull(A2716,0)) '�๦�ܳ�ѩ��������',
sum(isnull(A2710,0)) '��ѩ��',sum(isnull(A2717,0)) '������ˢ',
sum(isnull(A2708,0)) '��ˮ��',sum(isnull(A2718,0)) 'Ӧ��ͨѶ��',
sum(isnull(A2719,0)) '����װ��',sum(isnull(A2720,0)) '���˻�',
sum(isnull(A2709,0)) '�������',sum(isnull(A2721,0)) '�ƶ������豸'

from A27 
where A0101 = '2020' 
group by HA0102,A0102

--and (A.HA0203 = '�ص�' or A.HA0203 = '���' or A.HA0203 = '���' or A.HA0203 = 'ר�ù�·')  


 