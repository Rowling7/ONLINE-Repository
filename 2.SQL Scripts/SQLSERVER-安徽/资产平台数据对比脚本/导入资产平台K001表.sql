/*
	1.ɾ���ʲ�ƽ̨k001������
	2.�����ʲ�ƽ̨k001�� zcpt_k001
	3.����EXCEL������
*/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ZCPT_K001]') AND type IN ('U'))
	DROP TABLE [dbo].[ZCPT_K001]
GO
CREATE TABLE [dbo].[ZCPT_K001] (
[A0101] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
[A0102] char(9) COLLATE Chinese_PRC_CI_AS   NULL,
[A0103] char(12) COLLATE Chinese_PRC_CI_AS  NULL,
[A0130] char(100) COLLATE Chinese_PRC_CI_AS  NULL,
[A0522] numeric(12)  NULL,
[A1001] numeric(18,3)  NULL,
[A3101] numeric(18,3)  NULL,
[A3102] numeric(18,3)  NULL,
[HA0101] char(10) COLLATE Chinese_PRC_CI_AS  NULL,
[HA0102] char(50) COLLATE Chinese_PRC_CI_AS  NULL,
[HA0103] char(50) COLLATE Chinese_PRC_CI_AS  NULL,
[HK0121] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
[HK0123] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
[HK0126] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
[HK0136] char(20) COLLATE Chinese_PRC_CI_AS  NULL,
[HK0138] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
[HK0156] char(50) COLLATE Chinese_PRC_CI_AS  NULL,
[HK0182] char(100) COLLATE Chinese_PRC_CI_AS  NULL,
[K0304] char(4) COLLATE Chinese_PRC_CI_AS  NULL,
[HK0304] char(8) COLLATE Chinese_PRC_CI_AS  NULL,
[HK5104] char(24) COLLATE Chinese_PRC_CI_AS  NULL,
[HK9508] char(12) COLLATE Chinese_PRC_CI_AS  NULL,
[K0101] char(15) COLLATE Chinese_PRC_CI_AS  NOT NULL,
[K0108] numeric(18,3)  NOT NULL,
[K0109] numeric(18,3)  NULL,
[K0110] char(60) COLLATE Chinese_PRC_CI_AS  NULL,
[K0111] char(60) COLLATE Chinese_PRC_CI_AS  NULL,
[K0112] char(60) COLLATE Chinese_PRC_CI_AS  NULL,
[K0114] numeric(18,3)  NOT NULL,
[K0121] char(1) COLLATE Chinese_PRC_CI_AS  NULL,
[K0123] char(1) COLLATE Chinese_PRC_CI_AS  NULL,
[K0124] char(15) COLLATE Chinese_PRC_CI_AS  NULL,
[K0126] char(1) COLLATE Chinese_PRC_CI_AS  NULL,
[K0136] char(2) COLLATE Chinese_PRC_CI_AS  NULL,
[K0138] char(10) COLLATE Chinese_PRC_CI_AS  NULL,
[K0155] char(40) COLLATE Chinese_PRC_CI_AS  NULL,
[K0156] char(10) COLLATE Chinese_PRC_CI_AS  NULL,
[K0162] numeric(18,3)  NULL,
[K0163] numeric(18,3)  NULL,
[K0180] char(8) COLLATE Chinese_PRC_CI_AS  NULL,
[K0181] char(20) COLLATE Chinese_PRC_CI_AS  NULL,
[K0182] char(10) COLLATE Chinese_PRC_CI_AS  NULL,
[K0199] text COLLATE Chinese_PRC_CI_AS  NULL,
[K0306] numeric(18,3)  NULL,
[K0404] char(80) COLLATE Chinese_PRC_CI_AS  NULL,
[K3990] char(15) COLLATE Chinese_PRC_CI_AS  NULL,
[K4002] numeric(18,2)  NULL,
[K5104] char(20) COLLATE Chinese_PRC_CI_AS  NULL,
[K5222] numeric(18,2)  NULL,
[K5404] numeric(18,2)  NULL,
[K9508] char(80) COLLATE Chinese_PRC_CI_AS  NULL,
[KWYID] char(100) COLLATE Chinese_PRC_CI_AS  NULL,
[ModifyLogin] char(30) COLLATE Chinese_PRC_CI_AS  NULL,
[InsertLogin] char(30) COLLATE Chinese_PRC_CI_AS  NULL,
[OYDSF_ID] int  IDENTITY(1,1) NOT NULL
)
GO

-- ����excel������
TRUNCATE table zcpt_k001
INSERT INTO ZCPT_K001(
k0101,--·�߱���
A0103,--��������
A0130,--������λ����
K0112,--·������
K0110,--���׮������
K0111,--ֹ��׮������
K0108,--���׮��
K0109,--ֹ��׮��
K0114,--���
K0304,--�����ȼ�
HK0304,--�����ȼ�
HK0126,--�Ƿ�һ������
K0404,--��������

HK5104,--�������
K4002,--·�����
K5404,--·����
K5222,--�����
K0306,--���ʱ��(km/h)
K0180,--�޽����
K0181,--�Ľ����
K0155,--���һ�δ��������
hK0182,--��������
HK0121,--�Ƿ�ǹ�·��
HK0123,--�Ƿ��ͷ··��
HK0136,--·���շ�����
K0124,--�ظ�·�α���
K0162,--�ظ�·�����׮��
K0163,--�ظ�·��ֹ��׮��
A1001,--�������(����)
A3101,--���̻����(����)
A3102,--���̻����(����)
HK9508,--��ò
A0522,--����(��)
HK0156,--ʡ�ʳ���ڱ�ʶ
K3990,--��������ǰ·�߱��
HK0138,--�Ƿ񰴸��߹�·�������
K0199--��ע
)
SELECT 
·�߱���,
��������,
������λ,
·������,
case when len(���׮������)  >0 then ���׮������   when len(���׮������)  =0 or ���׮������   is null then null end,
case when len(ֹ��׮������)  >0 then ֹ��׮������   when len(ֹ��׮������)  =0 or ֹ��׮������   is null then null end,
���׮��,
ֹ��׮��,
���,
dk0301.objname,
case when len(�����ȼ�)  >0 then �����ȼ�   when len(�����ȼ�)  =0 or �����ȼ�   is null then null end,
case when len(�Ƿ�һ������)  >0 then �Ƿ�һ������   when len(�Ƿ�һ������)  =0 or �Ƿ�һ������   is null then null end,
case when len(��������)  >0 then ��������   when len(��������)  =0 or ��������   is null then null end,
�������,
case when len(·�����)  >0 then ·�����   when len(·�����)  =0 or ·�����   is null then null end,
case when len(·����)  >0 then ·����   when len(·����)  =0 or ·����   is null then null end,
case when len(�����)  >0 then �����   when len(�����)  =0 or �����   is null then null end,
case when len([���ʱ��(km/h)])  >0 then [���ʱ��(km/h)]   when len([���ʱ��(km/h)])  =0 or [���ʱ��(km/h)]   is null then null end,
case when len(�޽����)  >0 then �޽����   when len(�޽����)  =0 or �޽����   is null then null end,
case when len(�Ľ����)  >0 then �Ľ����   when len(�Ľ����)  =0 or �Ľ����   is null then null end,
case when len(���һ�δ��������)>0 then rtrim(���һ�δ��������) when len(���һ�δ��������)=0 or rtrim(���һ�δ��������) is null then null end,
case when rtrim(��������) = '������·��' then '·����ǰһ·�β�����'
		when rtrim(��������) = '����' then '��������ǰ��׮�Ų�����·������'
		when rtrim(��������) = '��ͷ·��' then '��ͷ·��'
		when rtrim(��������) = '����' then '����'
		when rtrim(��������) = '����·��' then '����·��'
		else null	end,�Ƿ�ǹ�,
case when len(�Ƿ��ͷ)  >0 then �Ƿ��ͷ   when len(�Ƿ��ͷ)  =0 or �Ƿ��ͷ   is null then null end,

case when len(·���շ�����)>0 then ·���շ����� when len(·���շ�����)=0 or ·���շ����� is null then null end,
case when len(�ظ�·�α���)>0 then �ظ�·�α��� when len(�ظ�·�α���)=0 or �ظ�·�α��� is null then null end,

case when len(�ظ�·�����׮��)>0 then �ظ�·�����׮�� when len(�ظ�·�����׮��)=0 or �ظ�·�����׮�� is null then null end,
case when len(�ظ�·��ֹ��׮��)>0 then �ظ�·��ֹ��׮�� when len(�ظ�·��ֹ��׮��)=0 or �ظ�·��ֹ��׮�� is null then null end,
case when len(�������)  >0 then �������   when len(�������)  =0 or �������   is null then null end,
case when len(���̻����)>0 then ���̻���� when len(���̻����)=0 or ���̻���� is null then null end,
case when len(���̻����)>0 then ���̻���� when len(���̻����)=0 or ���̻���� is null then null end,
��ò,
case when len(��������)>0 then �������� when len(��������)=0 or �������� is null then null end,
case when rtrim(ʡ�ʳ����)  like '%��ʡ�ʳ���%' then '·�η�ʡ�ʳ���'
		when rtrim(ʡ�ʳ����) like '%�����ʡ��%' then '��ʡ��·�������ʡ�磬����ʡ·������'
		when rtrim(ʡ�ʳ����) like '%ֹ����ʡ��%' then '��ʡ��·��ֹ����ʡ�磬����ʡ·������'
		when rtrim(ʡ�ʳ����) like '%��ֹ�����ʡ��%' then '��ʡ��·����ֹ�����ʡ�磬����ʡ·������'	
		else null	end,

case when len(��������ǰ·�߱��)>0 then ��������ǰ·�߱�� when len(��������ǰ·�߱��)=0 or ��������ǰ·�߱�� is null then null end,

case when len(�Ƿ񰴸��߹�·�������)>0 then �Ƿ񰴸��߹�·������� when len(�Ƿ񰴸��߹�·�������)=0 or �Ƿ񰴸��߹�·������� is null then null end,
--�Ƿ�Ϊ�ʲ�����,
case when len(��ע)>0 then ��ע when len(��ע)=0 or ��ע is null then null end

from OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\6078������\1.�����ļ�\3.���չ����ļ�\20231120 �����ʲ�ƽ̨����\ȫʡ·����ϸ����.xls',sheet1$)
left join dk0301 on left((case when len(�����ȼ�)  >0 then �����ȼ�   when len(�����ȼ�)  =0 or �����ȼ�   is null then null end),2)= rtrim(objjc)
ORDER BY ·�߱���


--���¹���λ�ֶ�A0102,HA0102
UPDATE zcpt_k001
SET zcpt_k001.a0102=rtrim(k001.a0102),zcpt_k001.ha0102=rtrim(k001.ha0102)
FROM zcpt_k001
left JOIN k001
ON rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) +CAST(k001.K0108 as VARCHAR(20)) +CAST(k001.K0109 as VARCHAR(20))=rtrim(zcpt_k001.k0101) +CAST(zcpt_k001.K0108 as VARCHAR(20)) +CAST(zcpt_k001.K0109 as VARCHAR(20))
