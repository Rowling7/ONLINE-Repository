

--����ű�

/*����ʾ��*/
select
rtrim(k6002),--��������
rtrim(k60.k6001),--��������
k6003,--��������׮��
--k60.k0101,--·�߱��
(case when (charindex('D',k60.k0101) = 0 and len(k60.k0101)>9 and left(k60.k0101,1)<>'X') then left(rtrim(k60.k0101),4) else 
     (case when charindex('D',rtrim(k60.k0101))=11 then left(k60.k0101,4)+right(rtrim(k60.k0101),4) else rtrim(k60.k0101) end)  end),--·�߱��
rtrim(a50.k0112),--·������
rtrim(d.objjc) hk0304,--�����ȼ�
k6008,--����ȫ��
k6065,--�羶�ܳ�
k6063,--�������羶
k6064,--�羶���

A6066,--����ȫ��

k6009,--���澻��
k6007,hk6007,--�羶��
k6004,hk6004,--ʹ�����޷�
k6016,hk6016,--�����ϲ��ṹ��ʽ
k6035,hk6035,--�����ϲ��ṹ����
k6017,hk6017,--�Ŷ�����
k6022,hk6022,--��ƺ��صȼ�
k6023,hk6023,--����ȼ�
k6005,hk6005,--��Խ����
k6006,--��Խ��������
hk6024,--ͨ���ȼ�
ha1328,--��̨��ײ����
(case when k6062='1' then '��' else '��' end),--�Ƿ�ͨ����
k6079,--���赥λ
k6030,--��Ƶ�λ
k6031,--ʩ����λ
k6032,--����λ
k0180,--�޽����
k60.k0116,--ͨ������
a1313,--������λ���ʴ���
a1314,--������λ����
K6034,--��ܵ�λ����
--a1302,ha1302,--�շ�����
isnull(rtrim(a1302),'1'),(case when rtrim(a1302)='2' then '����' when rtrim(a1302)='3' then '��Ӫ' else '���շ�' end),
k6028,hk6028,--�����ȼ�
a1305,--��������
rtrim(k6050),--������λ
k0183,--�������
a1316,--�����깤����
ha1317,--���첿λ
ha1318,--�������ʴ���
rtrim(k6051),--����ʩ����λ
(case when a1319 is null then '��' else rtrim(ha1319) end),--�Ƿ񲿲�����Ŀ
--k6091,
rtrim(hk6091),--��Ҫ����λ��
rtrim(k6093),--��Ҫ��������
isnull(rtrim(a1307),'1'),isnull(rtrim(ha1307),'����ʹ��'),--��ȡ��ͨ���ƴ�ʩ
left(k60.a0103,6), --��������
rtrim(hk6117),--��������λ��
rtrim(hk6118),--�Ƿ�խ·����
rtrim(hk6119),--�Ƿ��ڳ�������Ŀ¼��
rtrim(hk6120),--�Ƿ��ʡ����
--k60.k0199  --��ע
(case when charindex('D',rtrim(k60.k0101))<>0 then '����'  else 
	(case when k6016='90' then rtrim(cast(k60.k0199 as char)) else null end) end)
from k60 
	left join 
		(select a.a0102,a.k0101,a.k6001,max(b.k0304) k0304
		from K60 a left join K01 b on a.a0102=b.a0102 and a.k0101=b.k0101 and a.k6003>=b.k0108 and a.k6003<=b.k0109
		where left(a.k0101,1) in ('G','H','S','T','X','J')  and a.A0102 like '#oyds_��λ����#%' and a.a0101 = '#oyds_��������#'
		group by a.a0102,a.k0101,a.k6001) c
	     on k60.a0102=c.a0102 and k60.k0101=c.k0101 and k60.k6001=c.k6001
	left join D002 d  on  d.objname=c.k0304
	left join a50  on k60.a0102=a50.a0102 and k60.k0101=a50.k0101
where (left(k60.k0101,1) in ('G','H','S','T','X','Y','C','Z') )	
and k60.A0102 like '#oyds_��λ����#%' and a0101 = '#oyds_��������#'
