if exists(select * from tempdb..sysobjects where id=object_id('tempdb..##tk060'))
drop table ##tk060
declare @softpath varchar(255);
declare @filepath varchar(255);
exec master..xp_regread	'hkey_local_machine'
	,'software\����������\hrp-ghss\��׼��\������\2014'
	,'path' , @softpath output
set @filepath=@softpath+'�ʲ�ƽ̨������ϸ��.xls'

declare @query nvarchar(1000);
set @query = 
    'select 
        *
				into ##tk060
    from openrowset(''microsoft.jet.oledb.4.0'', ''excel 5.0;database=' + @filepath + ';hdr=yes'', ''select * from [��ϸ��$]'')';

exec(@query);

	
	-- �����ʲ�ƽ̨��������
truncate table zcpt_k060

insert into zcpt_k060(
k6002, -- ��������
k6001, -- �������
k6003, -- ��������׮��
k0101, -- ·�ߴ���
k0112, -- ·�߼��
hk0304, -- �����ȼ�
k6008, -- [����ȫ��(��)]
k6065, -- �羶�ܳ�(��)
k6063, -- �������羶(��)
k6064, -- �����羶���(��*��)
k6066, -- ����ȫ��(��)
k6009, -- ���澻��(��)
k6007, -- �����羶����
hk6007, -- �����羶����
k6004, -- ��ʹ�����޷�
hk6004, -- ��ʹ�����޷�
k6016, -- �ϲ��ṹ����
hk6016, -- �ϲ��ṹ����
k6110, -- �ϲ��ṹ����
hk6110, -- �ϲ��ṹ����
k6017, -- �Ŷ�����
hk6017, -- �Ŷ�����
k6022, -- ��ƺ��صȼ�
hk6022, -- ��ƺ��صȼ�
k6023, -- ����ȼ�
hk6023, -- ����ȼ�
k6005, -- ��Խ��������
hk6005, -- ��Խ��������
k6006, -- ��Խ��������
hk0149, -- �����׼(��)
hk6024, -- ͨ���ȼ�
ha1328, -- ��̨��ײ��ʩ����
hk6062, -- ���������
k6079, -- ���赥λ����
k6030, -- ��Ƶ�λ����
k6031, -- ʩ����λ����
k6032, -- ����λ����
k0180, -- �޽����
k0116, -- ͨ������
a1313, -- ������λ����
a1314, -- ������λ����
k6111, -- ��ܵ�λ����
a1302, -- �շ����ʴ���
ha1302, -- �շ����ʷ���
k6028, -- ����״������
hk6028, -- ����״������
a1305, -- ��������
k6050, -- ����״��������λ
k0181, -- �Ľ����
a1316, -- �����깤����
ha1317, -- ���첿λ
ha1318, -- ��������
k6051, -- ����ʩ����λ
ha1319, -- �Ƿ񲿲�����Ŀ
ha1306, -- ��Ҫ����λ��
k6102, -- ��Ҫ��������
a1307, -- �Ѳ�ȡ��ͨ���ƴ�ʩ
ha1307, -- �Ѳ�ȡ��ͨ���ƴ�ʩ
a0103, -- ��������
ha0103, -- ��������
hk6117, -- ��������λ��
hk6118, -- �Ƿ��·խ��
hk6119, -- �Ƿ��ڳ�������Ŀ¼��
hk6120, -- �Ƿ��ʡ����
hk6041, -- �Ƿ�����������
k6040, -- ���������
k0185, -- ����
k0186 -- γ��

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
case when len(replace(�޽����, '-' ,'')) >0 then replace(�޽����, '-' ,'') when len(replace(�޽����, '-' ,'')) =0 or replace(�޽����, '-' ,'') is null then null end �޽����	,
case when len(replace(ͨ������, '-' ,'')) >0 then replace(ͨ������, '-' ,'') when len(replace(ͨ������, '-' ,'')) =0 or replace(ͨ������, '-' ,'') is null then null end ͨ������	,
������λ���� 	,
case when len(������λ����)>0 then ������λ���� when len(������λ����)=0 or ������λ���� is null then null end ,
case when len(��ܵ�λ����)>0 then ��ܵ�λ���� when len(��ܵ�λ����)=0 or ��ܵ�λ���� is null then null end ,
�շ����ʴ��� 	,
case when len(�շ����ʺ���)>0 then �շ����ʺ��� when len(�շ����ʺ���)=0 or �շ����ʺ��� is null then null end ,
����״���������� 	,
case when len(����״����������)>0 then ����״���������� when len(����״����������)=0 or ����״���������� is null then null end ,
case when len(replace(��������, '-' ,'')) >0 then replace(��������, '-' ,'') when len(replace(��������, '-' ,'')) =0 or replace(��������, '-' ,'') is null then null end ��������	,
case when len(����״��������λ)>0 then ����״��������λ when len(����״��������λ)=0 or ����״��������λ is null then null end ,
case when len(�Ľ����)>0 then �Ľ���� when len(�Ľ����)=0 or �Ľ���� is null then null end ,
case when len(replace(�����깤����, '-' ,'')) >0 then replace(�����깤����, '-' ,'') when len(replace(�����깤����, '-' ,'')) =0 or replace(�����깤����, '-' ,'') is null then null end �����깤����	,
case when len(���첿λ)>0 then ���첿λ when len(���첿λ)=0 or ���첿λ is null then null end ���첿λ,
case when len(��������)>0 then �������� when len(��������)=0 or �������� is null then null end ��������,
case when len(����ʩ����λ)>0 then ����ʩ����λ when len(����ʩ����λ)=0 or ����ʩ����λ is null then null end ����ʩ����λ,
case when len(�Ƿ񲿲�����Ŀ)>0 then �Ƿ񲿲�����Ŀ when len(�Ƿ񲿲�����Ŀ)=0 or �Ƿ񲿲�����Ŀ is null then null end �Ƿ񲿲�����Ŀ,
case when len(��Ҫ����λ��)>0 then ��Ҫ����λ�� when len(��Ҫ����λ��)=0 or ��Ҫ����λ�� is null then null end ��Ҫ����λ��,
case when len(��Ҫ��������)>0 then ��Ҫ�������� when len(��Ҫ��������)=0 or ��Ҫ�������� is null then null end ��Ҫ��������,
case when len(�Ѳ�ȡ��ͨ���ƴ�ʩ����)>0 then rtrim(�Ѳ�ȡ��ͨ���ƴ�ʩ����) when len(�Ѳ�ȡ��ͨ���ƴ�ʩ����)=0 or rtrim(�Ѳ�ȡ��ͨ���ƴ�ʩ����) is null then null end �Ѳ�ȡ��ͨ���ƴ�ʩ����,
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
from ##tk060

--���¹���λ�ֶ�a0102,ha0102
update zcpt_k060
set zcpt_k060.a0102=rtrim(k060.a0102),zcpt_k060.ha0102=rtrim(k060.ha0102)
from zcpt_k060
left join k060
on (case when left(k060.k0101,1)in ('h','g','t','s') then rtrim(replace(replace(replace(replace(replace(replace(replace(k060.k0101,'h','g'),'t','s'),'340000',''),'000000',''),'d001',''),'d002',''),'d003',''))+left(k060.a0103,6)+'l'+rtrim(k060.k6001)
else left(k060.k0101,4)+left(k060.a0103,6)+'l'+rtrim(k060.k6001) end)= rtrim(zcpt_k060.k6001)
--���¹���λ�ֶ�a0102,ha0102
update zcpt_k060
set zcpt_k060.a0102=rtrim(k001.a0102),zcpt_k060.ha0102=rtrim(k001.ha0102)
from zcpt_k060
left join k001
on rtrim(replace(replace(replace(replace(replace(replace(replace(zcpt_k060.k0101,'h','g'),'t','s'),'340000',''),'000000',''),'d001',''),'d002',''),'d003',''))=rtrim(replace(replace(replace(replace(replace(replace(replace(k001.k0101,'h','g'),'t','s'),'340000',''),'000000',''),'d001',''),'d002',''),'d003','')) and zcpt_k060.k6003>=k001.k0108 and zcpt_k060.k6003<=k001.k0109
where zcpt_k060.a0102 is null
drop table ##tk060


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