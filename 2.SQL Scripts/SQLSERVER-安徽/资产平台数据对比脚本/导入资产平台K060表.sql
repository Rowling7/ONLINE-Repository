

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ZCPT_K060]') AND type IN ('U'))
	DROP TABLE [dbo].[ZCPT_K060]
CREATE TABLE ZCPT_K060(
[A0102] char(9) COLLATE Chinese_PRC_CI_AS   NULL,
[HA0102] char(50) COLLATE Chinese_PRC_CI_AS  NULL,

  [K6002] char(100) COLLATE Chinese_PRC_CI_AS   NULL, --�������� 
  [K6001] char(100) COLLATE Chinese_PRC_CI_AS   NULL, --������� 
  [K6003] numeric(18,3)   NULL, --��������׮�� 
  [K0101] char(15) COLLATE Chinese_PRC_CI_AS   NULL, --·�ߴ��� 
  [K0112] char(60) COLLATE Chinese_PRC_CI_AS  NULL, --·�߼�� 
  [HK0304] char(8) NULL, --����·�߼����ȼ�
	[K6008] numeric(18,2)  NULL, --[����ȫ��(��)] 
  [K6065] numeric(18,2)  NULL, --�羶�ܳ�(��) 
  [K6063] numeric(18,2)  NULL, --�������羶(��) 	
  [K6064] char(250) COLLATE Chinese_PRC_CI_AS  NULL, --�����羶���(��*��) 
  [K6066] numeric(18,2)  NULL, --����ȫ��(��) 
  [K6009] numeric(18,2)  NULL, --���澻��(��) 
  [K6007] char(2) COLLATE Chinese_PRC_CI_AS  NULL, --�����羶���� 
  [HK6007] char(10) COLLATE Chinese_PRC_CI_AS  NULL, --�����羶���� 
  [K6004] char(2) COLLATE Chinese_PRC_CI_AS  NULL, --��ʹ�����޷� 
  [HK6004] char(14) COLLATE Chinese_PRC_CI_AS  NULL, --��ʹ�����޷� 
  [K6016] char(4) COLLATE Chinese_PRC_CI_AS  NULL, --�ϲ��ṹ���� 
  [HK6016] char(22) COLLATE Chinese_PRC_CI_AS  NULL, --�ϲ��ṹ���� 
  [K6110] char(2) COLLATE Chinese_PRC_CI_AS  NULL, --�ϲ��ṹ���� 
  [HK6110] char(20) COLLATE Chinese_PRC_CI_AS  NULL, --�ϲ��ṹ���� 
  [K6017] char(2) COLLATE Chinese_PRC_CI_AS  NULL, --�Ŷ����� 
  [HK6017] char(10) COLLATE Chinese_PRC_CI_AS  NULL, --�Ŷ����� 
  [K6022] char(2) COLLATE Chinese_PRC_CI_AS  NULL, --��ƺ��صȼ� 
  [HK6022] char(16) COLLATE Chinese_PRC_CI_AS  NULL, --��ƺ��صȼ� 
  [K6023] char(3) COLLATE Chinese_PRC_CI_AS  NULL, --����ȼ� 
  [HK6023] char(20) COLLATE Chinese_PRC_CI_AS  NULL, --����ȼ� 
  [K6005] char(1) COLLATE Chinese_PRC_CI_AS  NULL, --��Խ�������� 
  [HK6005] char(28) COLLATE Chinese_PRC_CI_AS  NULL, --��Խ�������� 
  [K6006] char(40) COLLATE Chinese_PRC_CI_AS  NULL, --��Խ�������� 
  [HK0149] char(10) COLLATE Chinese_PRC_CI_AS  NULL, --�����׼(��) 
  [HK6024] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --ͨ���ȼ� 
  [HA1328] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --��̨��ײ��ʩ���� 
  [hK6062] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --��������� 
  [K6079] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --���赥λ���� 
  [K6030] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --��Ƶ�λ���� 
  [K6031] char(200) COLLATE Chinese_PRC_CI_AS  NULL, --ʩ����λ���� 
  [K6032] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --����λ���� 
  [K0180] char(8) COLLATE Chinese_PRC_CI_AS  NULL, --�޽���� 
  [K0116] char(8) COLLATE Chinese_PRC_CI_AS  NULL, --ͨ������ 
  [A1313] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --������λ���� 
  [A1314] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --������λ���� 
  [K6111] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --��ܵ�λ���� 
  [A1302] char(3) COLLATE Chinese_PRC_CI_AS  NULL, --�շ����� 
  [HA1302] char(20) COLLATE Chinese_PRC_CI_AS  NULL, --�շ����� 
  [K6028] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --����״������ 
  [HK6028] char(20) COLLATE Chinese_PRC_CI_AS  NULL, --����״������ 
  [A1305] char(8) COLLATE Chinese_PRC_CI_AS  NULL, --�������� 
  [K6050] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --����״��������λ 
  [K0181] char(8) COLLATE Chinese_PRC_CI_AS  NULL, --�Ľ���� 
  [A1316] char(8) COLLATE Chinese_PRC_CI_AS  NULL, --�����깤���� 
  [HA1317] char(200) COLLATE Chinese_PRC_CI_AS  NULL, --���첿λ 
  [HA1318] char(20) COLLATE Chinese_PRC_CI_AS  NULL, --�������� 
  [K6051] char(200) COLLATE Chinese_PRC_CI_AS  NULL, --����ʩ����λ 
  [HA1319] char(4) COLLATE Chinese_PRC_CI_AS  NULL, --�Ƿ񲿲�����Ŀ 
  [HA1306] char(200) COLLATE Chinese_PRC_CI_AS  NULL, --��Ҫ����λ�� 
  [K6102] char(200) COLLATE Chinese_PRC_CI_AS  NULL, --��Ҫ�������� 
  [A1307] char(3) COLLATE Chinese_PRC_CI_AS  NULL, --�Ѳ�ȡ��ͨ���ƴ�ʩ 
  [HA1307] char(20) COLLATE Chinese_PRC_CI_AS  NULL, --�Ѳ�ȡ��ͨ���ƴ�ʩ 
  [A0103] char(12) COLLATE Chinese_PRC_CI_AS  NULL, --�������� 
  [HA0103] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --�������� 
  [HK6117] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --��������λ�� 
  [HK6118] char(4) COLLATE Chinese_PRC_CI_AS  NULL, --�Ƿ��·խ�� 
  [HK6119] char(4) COLLATE Chinese_PRC_CI_AS  NULL, --�Ƿ��ڳ�������Ŀ¼�� 
  [HK6120] char(4) COLLATE Chinese_PRC_CI_AS  NULL, --�Ƿ��ʡ���� 
  [HK6041] char(4) COLLATE Chinese_PRC_CI_AS  NULL, --�Ƿ����������� 
  [K6040] char(100) COLLATE Chinese_PRC_CI_AS  NULL, --��������� 
	[K0185] numeric(12,8)  NULL, --���� 
  [K0186] numeric(12,8)  NULL --γ�� 
)
	
	
	
	
	-- �����ʲ�ƽ̨��������
TRUNCATE table ZCPT_K060

insert into ZCPT_K060(
K6002, -- ��������
K6001, -- �������
K6003, -- ��������׮��
K0101, -- ·�ߴ���
K0112, -- ·�߼��
HK0304, -- �����ȼ�
K6008, -- [����ȫ��(��)]
K6065, -- �羶�ܳ�(��)
K6063, -- �������羶(��)
K6064, -- �����羶���(��*��)
K6066, -- ����ȫ��(��)
K6009, -- ���澻��(��)
K6007, -- �����羶����
hK6007, -- �����羶����
K6004, -- ��ʹ�����޷�
hK6004, -- ��ʹ�����޷�
K6016, -- �ϲ��ṹ����
hK6016, -- �ϲ��ṹ����
K6110, -- �ϲ��ṹ����
hK6110, -- �ϲ��ṹ����
K6017, -- �Ŷ�����
hK6017, -- �Ŷ�����
K6022, -- ��ƺ��صȼ�
hK6022, -- ��ƺ��صȼ�
K6023, -- ����ȼ�
hK6023, -- ����ȼ�
K6005, -- ��Խ��������
hK6005, -- ��Խ��������
K6006, -- ��Խ��������
hK0149, -- �����׼(��)
hK6024, -- ͨ���ȼ�
hA1328, -- ��̨��ײ��ʩ����
hK6062, -- ���������
K6079, -- ���赥λ����
K6030, -- ��Ƶ�λ����
K6031, -- ʩ����λ����
K6032, -- ����λ����
K0180, -- �޽����
K0116, -- ͨ������
A1313, -- ������λ����
A1314, -- ������λ����
K6111, -- ��ܵ�λ����
A1302, -- �շ����ʴ���
hA1302, -- �շ����ʷ���
K6028, -- ����״������
hK6028, -- ����״������
A1305, -- ��������
K6050, -- ����״��������λ
K0181, -- �Ľ����
A1316, -- �����깤����
hA1317, -- ���첿λ
hA1318, -- ��������
K6051, -- ����ʩ����λ
hA1319, -- �Ƿ񲿲�����Ŀ
hA1306, -- ��Ҫ����λ��
K6102, -- ��Ҫ��������
A1307, -- �Ѳ�ȡ��ͨ���ƴ�ʩ
hA1307, -- �Ѳ�ȡ��ͨ���ƴ�ʩ
A0103, -- ��������
hA0103, -- ��������
hK6117, -- ��������λ��
hK6118, -- �Ƿ��·խ��
hK6119, -- �Ƿ��ڳ�������Ŀ¼��
hK6120, -- �Ƿ��ʡ����
hK6041, -- �Ƿ�����������
K6040, -- ���������
K0185, -- ����
K0186 -- γ��

)
select 
�������� 	,
������� 	,
��������׮�� 	,
·�ߴ��� 	,
case when len(·�߼��)>0 then ·�߼�� when len(·�߼��)=0 or ·�߼�� is null then null end ·�߼��,
case when len(�����ȼ�)>0 then �����ȼ� when len(�����ȼ�)=0 or �����ȼ� is null then null end �����ȼ�,
[����ȫ��(��)] 	,
[�羶�ܳ�(��)] 	,
[�������羶(��)] 	,
[�����羶���(��*��)] 	,
[����ȫ��(��)] 	,
[���澻��(��)] 	,
�����羶������� 	,
case when len(�����羶���຺��)>0 then �����羶���຺�� when len(�����羶���຺��)=0 or �����羶���຺�� is null then null end ,
case when len(��ʹ�����޷ִ���)>0 then ��ʹ�����޷ִ��� when len(��ʹ�����޷ִ���)=0 or ��ʹ�����޷ִ��� is null then null end ,
case when len(��ʹ�����޷ֺ���)>0 then ��ʹ�����޷ֺ��� when len(��ʹ�����޷ֺ���)=0 or ��ʹ�����޷ֺ��� is null then null end ,
�ϲ��ṹ���ʹ��� 	,
case when len(�ϲ��ṹ���ͺ���)>0 then �ϲ��ṹ���ͺ��� when len(�ϲ��ṹ���ͺ���)=0 or �ϲ��ṹ���ͺ��� is null then null end ,
�ϲ��ṹ���ϴ��� 	,
case when len(�ϲ��ṹ���Ϻ���)>0 then �ϲ��ṹ���Ϻ��� when len(�ϲ��ṹ���Ϻ���)=0 or �ϲ��ṹ���Ϻ��� is null then null end ,
�Ŷ����ʹ��� 	,
case when len(�Ŷ����ͺ���)>0 then �Ŷ����ͺ��� when len(�Ŷ����ͺ���)=0 or �Ŷ����ͺ��� is null then null end ,
��ƺ��صȼ����� 	,
case when len(��ƺ��صȼ�����)>0 then ��ƺ��صȼ����� when len(��ƺ��صȼ�����)=0 or ��ƺ��صȼ����� is null then null end ,
����ȼ����� 	,
case when len(����ȼ�����)>0 then ����ȼ����� when len(����ȼ�����)=0 or ����ȼ����� is null then null end ,
��Խ�������ʹ��� 	,
case when len(��Խ�������ͺ���)>0 then ��Խ�������ͺ��� when len(��Խ�������ͺ���)=0 or ��Խ�������ͺ��� is null then null end ,
case when len(��Խ��������)>0 then ��Խ�������� when len(��Խ��������)=0 or ��Խ�������� is null then null end ,
case when len([�����׼(��)])>0 then [�����׼(��)] when len([�����׼(��)])=0 or [�����׼(��)] is null then null end ,
replace(case when len(ͨ���ȼ�)>0 then ͨ���ȼ� when len(ͨ���ȼ�)=0 or ͨ���ȼ� is null then null end,'����','') ,
case when len(��̨��ײ��ʩ����)>0 then ��̨��ײ��ʩ���� when len(��̨��ײ��ʩ����)=0 or ��̨��ײ��ʩ���� is null then null end ,
case when len(���������)>0 then ��������� when len(���������)=0 or ��������� is null then null end ,
case when len(���赥λ����)>0 then ���赥λ���� when len(���赥λ����)=0 or ���赥λ���� is null then null end ,
case when len(��Ƶ�λ����)>0 then ��Ƶ�λ���� when len(��Ƶ�λ����)=0 or ��Ƶ�λ���� is null then null end ,
case when len(ʩ����λ����)>0 then ʩ����λ���� when len(ʩ����λ����)=0 or ʩ����λ���� is null then null end ,
case when len(����λ����)>0 then ����λ���� when len(����λ����)=0 or ����λ���� is null then null end ,
case when len(REPLACE(�޽����, '-' ,'')) >0 then REPLACE(�޽����, '-' ,'') when len(REPLACE(�޽����, '-' ,'')) =0 or REPLACE(�޽����, '-' ,'') is null then null end �޽����	,
case when len(REPLACE(ͨ������, '-' ,'')) >0 then REPLACE(ͨ������, '-' ,'') when len(REPLACE(ͨ������, '-' ,'')) =0 or REPLACE(ͨ������, '-' ,'') is null then null end ͨ������	,
������λ���� 	,
case when len(������λ����)>0 then ������λ���� when len(������λ����)=0 or ������λ���� is null then null end ,
case when len(��ܵ�λ����)>0 then ��ܵ�λ���� when len(��ܵ�λ����)=0 or ��ܵ�λ���� is null then null end ,
�շ����ʴ��� 	,
case when len(�շ����ʺ���)>0 then �շ����ʺ��� when len(�շ����ʺ���)=0 or �շ����ʺ��� is null then null end ,
����״���������� 	,
case when len(����״����������)>0 then ����״���������� when len(����״����������)=0 or ����״���������� is null then null end ,
case when len(REPLACE(��������, '-' ,'')) >0 then REPLACE(��������, '-' ,'') when len(REPLACE(��������, '-' ,'')) =0 or REPLACE(��������, '-' ,'') is null then null end ��������	,
case when len(����״��������λ)>0 then ����״��������λ when len(����״��������λ)=0 or ����״��������λ is null then null end ,
case when len(�Ľ����)>0 then �Ľ���� when len(�Ľ����)=0 or �Ľ���� is null then null end ,
case when len(REPLACE(�����깤����, '-' ,'')) >0 then REPLACE(�����깤����, '-' ,'') when len(REPLACE(�����깤����, '-' ,'')) =0 or REPLACE(�����깤����, '-' ,'') is null then null end �����깤����	,
case when len(���첿λ)>0 then ���첿λ when len(���첿λ)=0 or ���첿λ is null then null end ���첿λ,
case when len(��������)>0 then �������� when len(��������)=0 or �������� is null then null end ��������,
case when len(����ʩ����λ)>0 then ����ʩ����λ when len(����ʩ����λ)=0 or ����ʩ����λ is null then null end ����ʩ����λ,
case when len(�Ƿ񲿲�����Ŀ)>0 then �Ƿ񲿲�����Ŀ when len(�Ƿ񲿲�����Ŀ)=0 or �Ƿ񲿲�����Ŀ is null then null end �Ƿ񲿲�����Ŀ,
case when len(��Ҫ����λ��)>0 then ��Ҫ����λ�� when len(��Ҫ����λ��)=0 or ��Ҫ����λ�� is null then null end ��Ҫ����λ��,
case when len(��Ҫ��������)>0 then ��Ҫ�������� when len(��Ҫ��������)=0 or ��Ҫ�������� is null then null end ��Ҫ��������,
case when len(�Ѳ�ȡ��ͨ���ƴ�ʩ����)>0 then �Ѳ�ȡ��ͨ���ƴ�ʩ���� when len(�Ѳ�ȡ��ͨ���ƴ�ʩ����)=0 or �Ѳ�ȡ��ͨ���ƴ�ʩ���� is null then null end �Ѳ�ȡ��ͨ���ƴ�ʩ����,
case when len(�Ѳ�ȡ��ͨ���ƴ�ʩ����)>0 then �Ѳ�ȡ��ͨ���ƴ�ʩ���� when len(�Ѳ�ȡ��ͨ���ƴ�ʩ����)=0 or �Ѳ�ȡ��ͨ���ƴ�ʩ���� is null then null end �Ѳ�ȡ��ͨ���ƴ�ʩ����,
case when len(������������)>0 then ������������ when len(������������)=0 or ������������ is null then null end ,
case when len(������������)>0 then ������������ when len(������������)=0 or ������������ is null then null end ,
case when len(��������λ��)>0 then ��������λ�� when len(��������λ��)=0 or ��������λ�� is null then null end ,
case when len(�Ƿ��·խ��)>0 then �Ƿ��·խ�� when len(�Ƿ��·խ��)=0 or �Ƿ��·խ�� is null then null end ,
case when len(�Ƿ��ڳ�������Ŀ¼��)>0 then �Ƿ��ڳ�������Ŀ¼�� when len(�Ƿ��ڳ�������Ŀ¼��)=0 or �Ƿ��ڳ�������Ŀ¼�� is null then null end ,
case when len(�Ƿ��ʡ����)>0 then �Ƿ��ʡ���� when len(�Ƿ��ʡ����)=0 or �Ƿ��ʡ���� is null then null end ,
case when len(�Ƿ�����������)>0 then �Ƿ����������� when len(�Ƿ�����������)=0 or �Ƿ����������� is null then null end ,
��������� 	,
����,
γ��
from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\6078������\1.�����ļ�\3.���չ����ļ�\20231120 �����ʲ�ƽ̨����\ȫʡ������ϸ��.xls',��ϸ��$)

--���¹���λ�ֶ�A0102,HA0102
UPDATE zcpt_k060
SET zcpt_k060.a0102=rtrim(k060.a0102),zcpt_k060.ha0102=rtrim(k060.ha0102)
FROM zcpt_k060
left JOIN k060
ON (case when left(k060.k0101,1)in ('H','G','T','S') then rtrim(replace(replace(replace(replace(replace(replace(replace(k060.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001)
else left(k060.k0101,4)+left(k060.a0103,6)+'L'+rtrim(k060.k6001) end)= rtrim(zcpt_k060.k6001)
--���¹���λ�ֶ�A0102,HA0102
UPDATE zcpt_k060
SET zcpt_k060.a0102=rtrim(k001.a0102),zcpt_k060.ha0102=rtrim(k001.ha0102)
FROM zcpt_k060
left JOIN k001
ON rtrim(replace(replace(replace(replace(replace(replace(replace(zcpt_k060.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(replace(replace(replace(replace(replace(replace(replace(k001.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) and zcpt_k060.k6003>=k001.k0108 and zcpt_k060.k6003<=k001.k0109
WHERE zcpt_k060.A0102 IS NULL
