
select
'�ϼ�' gydw,
null mc,
sum(ifnull(a2711,0)) a2711,-- �������ģ��㣩����ʡ��
sum(ifnull(a2712,0)) a2712,-- �������ģ��㣩�������м����¼�
cast(sum(ifnull(a2702,0)) as decimal(18,3)) a2702,-- ��֯��
sum(ifnull(a2703,0)) a2703,-- ��ѩ��
sum(ifnull(a2713,0)) a2713,-- ������
sum(ifnull(a2701,0)) a2701,-- ս������
sum(ifnull(a2714,0)) a2714,-- ��е����
sum(ifnull(a2704,0)) a2704,-- ƽ�峵
sum(ifnull(a2705,0)) a2705,-- �ھ��
sum(ifnull(a2706,0)) a2706,-- ������
sum(ifnull(a2707,0)) a2707,-- װ�ػ�
sum(ifnull(a2715,0)) a2715,-- ���ػ�
sum(ifnull(a2716,0)) a2716,-- �๦�ܳ�ѩ��������
sum(ifnull(a2710,0)) a2710,-- ��ѩ��
sum(ifnull(a2717,0)) a2717,-- ��ѩ��ˢ
sum(ifnull(a2708,0)) a2708,-- ��ˮ��
sum(ifnull(a2718,0)) a2718,-- Ӧ��ͨѶ��
sum(ifnull(a2719,0)) a2719,-- ����װ��
sum(ifnull(a2720,0)) a2720,-- ���˻�
sum(ifnull(a2709,0)) a2709,-- �������
sum(ifnull(a2721,0)) a2721,-- �ƶ������豸
sum(ifnull(a2722,0)) a2722-- Ӧ����ͨ��Ӫ��
from a27 
left join b01 b on a27.b01_id=b.b01_id	 
where   b.b0111 like'42A%'
and A27.z0011!=3
and b.b0111 like concat( (select b0111 from b01 where b01_id=:B01_ID),'%')

union
select
b.b0101 b0101,
b.b0111 b0111,
sum(ifnull(a2711,0)) a2711,-- �������ģ��㣩����ʡ��
sum(ifnull(a2712,0)) a2712,-- �������ģ��㣩�������м����¼�
cast(sum(ifnull(a2702,0)) as decimal(18,3)) a2702,-- ��֯��
sum(ifnull(a2703,0)) a2703,-- ��ѩ��
sum(ifnull(a2713,0)) a2713,-- ������
sum(ifnull(a2701,0)) a2701,-- ս������
sum(ifnull(a2714,0)) a2714,-- ��е����
sum(ifnull(a2704,0)) a2704,-- ƽ�峵
sum(ifnull(a2705,0)) a2705,-- �ھ��
sum(ifnull(a2706,0)) a2706,-- ������
sum(ifnull(a2707,0)) a2707,-- װ�ػ�
sum(ifnull(a2715,0)) a2715,-- ���ػ�
sum(ifnull(a2716,0)) a2716,-- �๦�ܳ�ѩ��������
sum(ifnull(a2710,0)) a2710,-- ��ѩ��
sum(ifnull(a2717,0)) a2717,-- ��ѩ��ˢ
sum(ifnull(a2708,0)) a2708,-- ��ˮ��
sum(ifnull(a2718,0)) a2718,-- Ӧ��ͨѶ��
sum(ifnull(a2719,0)) a2719,-- ����װ��
sum(ifnull(a2720,0)) a2720,-- ���˻�
sum(ifnull(a2709,0)) a2709,-- �������
sum(ifnull(a2721,0)) a2721,-- �ƶ������豸
sum(ifnull(a2722,0)) a2722-- �ƶ������豸
from a27 
left join b01 b on a27.b01_id=b.b01_id and B.z0011!=3
left join  s951 C on a27.a0101=C.s951_id and C.z0011!=3 -- ����		 
where  b.b0111 like'42A%'  and A27.z0011!=3
AND C.s9532 < :A0101
and b.b0111 like concat( (select b0111 from b01 where b01_id=:B01_ID),'%')
group by  b.b0111 