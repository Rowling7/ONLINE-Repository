if exists(select * from tempdb..sysobjects where id=object_id('tempdb..##tk063'))
drop table ##tk063
declare @softpath varchar(255);
declare @filepath varchar(255);
exec master..xp_regread	'hkey_local_machine'
	,'software\����������\hrp-ghss\��׼��\������\2014'
	,'path' , @softpath output
set @filepath=@softpath+'�ʲ�ƽ̨�����ϸ��.xls'

declare @query nvarchar(1000);
set @query = 
    'select 
        *
				into ##tk063
    from openrowset(''microsoft.jet.oledb.4.0'', ''excel 5.0;database=' + @filepath + ';hdr=yes'', ''select * from [��ϸ��$]'')';

exec(@query);


truncate table zcpt_k063
insert into zcpt_k063(
k6302,-- �������
sddm,-- �������
k6303,-- ������׮��
k0101,-- ·�߱��
k0112,-- ·������
k0304,-- �����ȼ�
k6305,-- ������ȣ��ף�
k6306,-- ��������ף�
k6307,-- ������ߣ��ף�
k6304,-- ��������ȷ���
hk6304,-- ��������ȷ���
k6335,-- �Ƿ�ˮ�����
k0180,-- �޽����
k6079,-- ���赥λ����
k6030,-- ��Ƶ�λ����
k6031,-- ʩ����λ����
k6032,-- ����λ����
k0116,-- ����ͨ��ʱ��
a1313,-- ��λ���ʴ���
a0130,-- ����
k6111,-- ��ܵ�λ����
hk6346,-- �����ȼ�
k6344,-- ��������
k6345,-- ������λ
hk6336,-- �����ȼ�
k6347,-- ��������
k6348,-- ������λ
hk6349,-- �����ȼ�
k6350,-- ��������
k6351,-- ������λ
hk6352,-- �����ȼ�
k6353,-- ��������
k6354,-- ������λ
k0181,-- �������
a1316,-- �깤����
k6337,-- ���첿λ
a1318,-- ��������
k6338,-- ������λ
k6339,-- ��������
a0103,-- ������������
k6370,-- �������λ��
k6355,-- �Ƿ��ڳ������Ŀ¼��
k6371,-- �Ƿ��ʡ���
k0199,-- ��ע
sdgcs,-- �������ʦ
k0185,-- ����
k0186,-- γ��
k6343-- ��������ȼ�
)
select
case when len(�������) >0 then ������� when len(�������) =0 or ������� is null then null end �������	,
case when len(�������) >0 then ������� when len(�������) =0 or ������� is null then null end �������	,
case when len(������׮��) >0 then ������׮�� when len(������׮��) =0 or ������׮�� is null then null end ������׮��	,
case when len(rtrim(replace(replace(replace(replace(replace(·�߱��,'340000',''),'000000',''),'d001',''),'d002',''),'d003',''))) >0 then rtrim(replace(replace(replace(replace(replace(·�߱��,'340000',''),'000000',''),'d001',''),'d002',''),'d003','')) when len(rtrim(replace(replace(replace(replace(replace(·�߱��,'340000',''),'000000',''),'d001',''),'d002',''),'d003',''))) =0 or rtrim(replace(replace(replace(replace(replace(·�߱��,'340000',''),'000000',''),'d001',''),'d002',''),'d003','')) is null then null end ·�߱��	,
case when len(·������) >0 then ·������ when len(·������) =0 or ·������ is null then null end ·������	,
case when len(�����ȼ�) >0 then �����ȼ� when len(�����ȼ�) =0 or �����ȼ� is null then null end �����ȼ�	,
case when len(�������) >0 then ������� when len(�������) =0 or ������� is null then null end �������	,
case when len(�������) >0 then ������� when len(�������) =0 or ������� is null then null end �������	,
case when len(�������) >0 then ������� when len(�������) =0 or ������� is null then null end �������	,
case when len(��������ȷ���1) >0 then ��������ȷ���1 when len(��������ȷ���1) =0 or ��������ȷ���1 is null then null end ��������ȷ���1	,
case when len(��������ȷ���) >0 then ��������ȷ��� when len(��������ȷ���) =0 or ��������ȷ��� is null then null end ��������ȷ���	,
case when len(�Ƿ�ˮ�����) >0 then �Ƿ�ˮ����� when len(�Ƿ�ˮ�����) =0 or �Ƿ�ˮ����� is null then null end �Ƿ�ˮ�����	,
case when len(replace(�޽����, '-' ,'')) >0 then replace(�޽����, '-' ,'') when len(replace(�޽����, '-' ,'')) =0 or replace(�޽����, '-' ,'') is null then null end �޽����	,
case when len(���赥λ����) >0 then ���赥λ���� when len(���赥λ����) =0 or ���赥λ���� is null then null end ���赥λ����	,
case when len(��Ƶ�λ����) >0 then ��Ƶ�λ���� when len(��Ƶ�λ����) =0 or ��Ƶ�λ���� is null then null end ��Ƶ�λ����	,
case when len(ʩ����λ����) >0 then ʩ����λ���� when len(ʩ����λ����) =0 or ʩ����λ���� is null then null end ʩ����λ����	,
case when len(����λ����) >0 then ����λ���� when len(����λ����) =0 or ����λ���� is null then null end ����λ����	,
case when len(replace(����ͨ��ʱ��, '-' ,'')) >0 then replace(����ͨ��ʱ��, '-' ,'') when len(replace(����ͨ��ʱ��, '-' ,'')) =0 or replace(����ͨ��ʱ��, '-' ,'') is null then null end ����ͨ��ʱ��	,
case when len(��λ���ʴ���) >0 then ��λ���ʴ��� when len(��λ���ʴ���) =0 or ��λ���ʴ��� is null then null end ��λ���ʴ���	,
case when len(����) >0 then ���� when len(����) =0 or ���� is null then null end ����	,
case when len(��ܵ�λ����) >0 then ��ܵ�λ���� when len(��ܵ�λ����) =0 or ��ܵ�λ���� is null then null end ��ܵ�λ����	,
case when len(�����ȼ�����) >0 then �����ȼ����� when len(�����ȼ�����) =0 or �����ȼ����� is null then null end �����ȼ�����	,
case when len(replace(������������, '-', '')) >0 then replace(������������, '-', '') when len(replace(������������, '-', '')) =0 or replace(������������, '-', '') is null then null end ������������	,
case when len(������λ����) >0 then ������λ���� when len(������λ����) =0 or ������λ���� is null then null end ������λ����	,
case when len(�����ȼ������ṹ) >0 then �����ȼ������ṹ when len(�����ȼ������ṹ) =0 or �����ȼ������ṹ is null then null end �����ȼ������ṹ	,
case when len(replace(�������������ṹ, '-', '')) >0 then replace(�������������ṹ, '-', '') when len(replace(�������������ṹ, '-', '')) =0 or replace(�������������ṹ, '-', '') is null then null end �������������ṹ	,
case when len(������λ�����ṹ) >0 then ������λ�����ṹ when len(������λ�����ṹ) =0 or ������λ�����ṹ is null then null end ������λ�����ṹ	,
case when len(�����ȼ�������ʩ) >0 then �����ȼ�������ʩ when len(�����ȼ�������ʩ) =0 or �����ȼ�������ʩ is null then null end �����ȼ�������ʩ	,
case when len(replace(�������ڻ�����ʩ, '-', '')) >0 then replace(�������ڻ�����ʩ, '-', '') when len(replace(�������ڻ�����ʩ, '-', '')) =0 or replace(�������ڻ�����ʩ, '-', '') is null then null end �������ڻ�����ʩ	,
case when len(������λ������ʩ) >0 then ������λ������ʩ when len(������λ������ʩ) =0 or ������λ������ʩ is null then null end ������λ������ʩ	,
case when len(�����ȼ�����������ʩ) >0 then �����ȼ�����������ʩ when len(�����ȼ�����������ʩ) =0 or �����ȼ�����������ʩ is null then null end �����ȼ�����������ʩ	,
case when len(replace(������������������ʩ, '-', '') ) >0 then replace(������������������ʩ, '-', '')  when len(replace(������������������ʩ, '-', '') ) =0 or replace(������������������ʩ, '-', '')  is null then null end ������������������ʩ	,
case when len(������λ����������ʩ) >0 then ������λ����������ʩ when len(������λ����������ʩ) =0 or ������λ����������ʩ is null then null end ������λ����������ʩ	,
case when len(�������) >0 then ������� when len(�������) =0 or ������� is null then null end �������	,
case when len(replace(�깤���� ,'-' ,'')) >0 then replace(�깤���� ,'-' ,'') when len(replace(�깤���� ,'-' ,'')) =0 or replace(�깤���� ,'-' ,'') is null then null end  �깤����	,
case when len(���첿λ) >0 then ���첿λ when len(���첿λ) =0 or ���첿λ is null then null end ���첿λ	,
case when len(��������) >0 then �������� when len(��������) =0 or �������� is null then null end ��������	,
case when len(������λ) >0 then ������λ when len(������λ) =0 or ������λ is null then null end ������λ	,
case when len(��������) >0 then �������� when len(��������) =0 or �������� is null then null end ��������	,
case when len(������������) >0 then ������������ when len(������������) =0 or ������������ is null then null end ������������	,
case when len(�������λ��) >0 then �������λ�� when len(�������λ��) =0 or �������λ�� is null then null end �������λ��	,
case when len(�Ƿ��ڳ������Ŀ¼��) >0 then �Ƿ��ڳ������Ŀ¼�� when len(�Ƿ��ڳ������Ŀ¼��) =0 or �Ƿ��ڳ������Ŀ¼�� is null then null end �Ƿ��ڳ������Ŀ¼��	,
case when len(�Ƿ��ʡ���) >0 then �Ƿ��ʡ��� when len(�Ƿ��ʡ���) =0 or �Ƿ��ʡ��� is null then null end �Ƿ��ʡ���	,
case when len(��ע) >0 then ��ע when len(��ע) =0 or ��ע is null then null end ��ע	,
case when len(�������ʦ) >0 then �������ʦ when len(�������ʦ) =0 or �������ʦ is null then null end �������ʦ	,
case when len(����) >0 then ���� when len(����) =0 or ���� is null then null end ����	,
case when len(γ��) >0 then γ�� when len(γ��) =0 or γ�� is null then null end γ��	,
case when len(��������ȼ�) >0 then ��������ȼ� when len(��������ȼ�) =0 or ��������ȼ� is null then null end ��������ȼ�	
from ##tk063



--���¹���λ�ֶ�a0102,ha0102
update zcpt_k063
set zcpt_k063.a0102=rtrim(k001.a0102),zcpt_k063.ha0102=rtrim(k001.ha0102)
--select zcpt_k063.a0102,rtrim(k001.a0102),zcpt_k063.ha0102,rtrim(k001.ha0102)
from zcpt_k063
left join  k001
on rtrim(zcpt_k063.k0101)=rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'d001',''),'d002',''),'d003','')) and isnull(zcpt_k063.k6303,0)>=isnull(k001.k0108,0) and isnull(zcpt_k063.k6303,0)<=isnull(k001.k0109,0)

drop table ##tk063


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