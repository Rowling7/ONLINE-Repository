if exists(select * from tempdb..sysobjects where id=object_id('tempdb..##tk001'))
drop table ##tk001
declare @softpath varchar(255);
declare @filepath varchar(255);
exec master..xp_regread	'hkey_local_machine'
	,'software\����������\hrp-ghss\��׼��\������\2014'
	,'path' , @softpath output
set @filepath=@softpath+'�ʲ�ƽ̨·����ϸ��.xls'

declare @query nvarchar(1000);
set @query = 
    'select 
        *
				into ##tk001
    from openrowset(''microsoft.jet.oledb.4.0'', ''excel 5.0;database=' + @filepath + ';hdr=yes'', ''select * from [��ϸ��$]'')';

exec(@query);


truncate table zcpt_k001
insert into zcpt_k001(
a0102,
ha0102,
k0101,--·�߱���
a0103,--��������
a0130,--������λ����
k0112,--·������
k0110,--���׮������
k0111,--ֹ��׮������
k0108,--���׮��
k0109,--ֹ��׮��
k0114,--���
k0304,--�����ȼ�
hk0304,--�����ȼ�
hk0126,--�Ƿ�һ������
k0404,--��������

hk5104,--�������
k4002,--·�����
k5404,--·����
k5222,--�����
k0306,--���ʱ��(km/h)
k0180,--�޽����
k0181,--�Ľ����
k0155,--���һ�δ��������
hk0182,--��������
hk0121,--�Ƿ�ǹ�·��
hk0123,--�Ƿ��ͷ··��
hk0136,--·���շ�����
k0124,--�ظ�·�α���
k0162,--�ظ�·�����׮��
k0163,--�ظ�·��ֹ��׮��
a1001,--�������(����)
a3101,--���̻����(����)
a3102,--���̻����(����)
hk9508,--��ò
a0522,--����(��)
hk0156,--ʡ�ʳ���ڱ�ʶ
k3990,--��������ǰ·�߱��
hk0138,--�Ƿ񰴸��߹�·�������
k0199--��ע
)
select 
rtrim(k001.a0102),
rtrim(k001.ha0102),
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
case when len(���ʱ��)  >0 then ���ʱ��   when len(���ʱ��)  =0 or ���ʱ��   is null then null end,
case when len(�޽����)  >0 then �޽����   when len(�޽����)  =0 or �޽����   is null then null end,
case when len(�Ľ����)  >0 then �Ľ����   when len(�Ľ����)  =0 or �Ľ����   is null then null end,
case when len(���һ�δ��������)>0 then rtrim(���һ�δ��������) when len(���һ�δ��������)=0 or rtrim(���һ�δ��������) is null then null end,
case when rtrim(��������) = '������·��' then '·����ǰһ·�β�����'
		when rtrim(��������) = '����' then '��������ǰ��׮�Ų�����·������'
		when rtrim(��������) = '��ͷ·��' then '��ͷ·��'
		when rtrim(��������) = '����' then '����'
		when rtrim(��������) = '����·��' or (len(��������)=0 or �������� is null)then '����·��'
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
case when rtrim(ʡ�ʳ����)  like '%��ʡ�ʳ���%' or (len(ʡ�ʳ����)=0 or ʡ�ʳ���� is null) then '·�η�ʡ�ʳ���'
		when rtrim(ʡ�ʳ����) like '%�����ʡ��%' then '��ʡ��·�������ʡ�磬����ʡ·������'
		when rtrim(ʡ�ʳ����) like '%ֹ����ʡ��%' then '��ʡ��·��ֹ����ʡ�磬����ʡ·������'
		when rtrim(ʡ�ʳ����) like '%��ֹ�����ʡ��%' then '��ʡ��·����ֹ�����ʡ�磬����ʡ·������'	
		else null	end,

case when len(��������ǰ·�߱��)>0 then ��������ǰ·�߱�� when len(��������ǰ·�߱��)=0 or ��������ǰ·�߱�� is null then null end,

case when len(�Ƿ񰴸��߹�·�������)>0 then �Ƿ񰴸��߹�·������� when len(�Ƿ񰴸��߹�·�������)=0 or �Ƿ񰴸��߹�·������� is null then null end,
--�Ƿ�Ϊ�ʲ�����,
case when len(��ע)>0 then ��ע when len(��ע)=0 or ��ע is null then null end

from ##tk001
left join dk0301 on left((case when len(�����ȼ�)  >0 then �����ȼ�   when len(�����ȼ�)  =0 or �����ȼ�   is null then null end),2)= rtrim(objjc)
left join k001
on rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'d001',''),'d002',''),'d003','')) +cast(k001.k0108 as varchar(20)) +cast(k001.k0109 as varchar(20))=rtrim(##tk001.·�߱���) +cast(##tk001.���׮�� as varchar(20)) +cast(##tk001.ֹ��׮�� as varchar(20))

order by ·�߱���


--���¹���λ�ֶ�A0102,HA0102
UPDATE zcpt_k001
SET zcpt_k001.a0102=rtrim(k001.a0102),zcpt_k001.ha0102=rtrim(k001.ha0102)
FROM zcpt_k001
left JOIN  k001
ON rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) +CAST(k001.K0108 as VARCHAR(20)) +CAST(k001.K0109 as VARCHAR(20))=rtrim(zcpt_k001.k0101) +CAST(zcpt_k001.K0108 as VARCHAR(20)) +CAST(zcpt_k001.K0109 as VARCHAR(20))



drop table ##tk001

--<CONTROL
	SELECT
		'ִ�н��' AS CAPTION , 
		LABELTEXT='�������'+char(13)+char(10),
		370 AS WIDTH , 
		0 AS HEIGHT, 
		'ȷ��=' AS BUTTON,
		0 AS SHOWTITLE,
		'select null' as datasource
--CONTROL>