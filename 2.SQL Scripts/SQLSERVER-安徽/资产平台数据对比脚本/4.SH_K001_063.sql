SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS �༭, 
rtrim(k001.A0102)	'�걨|����λ����',rtrim(k001.hA0102)	'�걨|����λ����',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'�걨|·�߱���',	rtrim(zcpt_k001.k0101)	'�ʲ�ƽ̨|·�߱���',
rtrim(k001.A0103)	'�걨|��������',	rtrim(zcpt_k001.A0103)	'�ʲ�ƽ̨|��������',

rtrim(k001.HK0304)	'�걨|�����ȼ�',	rtrim(LEFT(zcpt_k001.hK0304, 2))	'�ʲ�ƽ̨|�����ȼ�',
rtrim(k001.HK0126)	'�걨|�Ƿ�һ������',	rtrim(zcpt_k001.HK0126)	'�ʲ�ƽ̨|�Ƿ�һ������',
rtrim(k001.K0404)	'�걨|���ʱ��',	rtrim(zcpt_k001.K0404) '�ʲ�ƽ̨|���ʱ��(km/h)',
k001.K5222	'�걨|��������',	zcpt_k001.K5222	'�ʲ�ƽ̨|��������',
case 
when rtrim(k001.hK0304)<>rtrim(LEFT(zcpt_k001.hK0304, 2))	then '�����ȼ� ��һ��' 
when rtrim(k001.HK0126)<>rtrim(zcpt_k001.HK0126)		then '�Ƿ�һ������ ��һ��'
when rtrim(k001.K0404)<>rtrim(zcpt_k001.K0404)		then '���ʱ�� ��һ��'
when k001.K5222<>zcpt_k001.K5222		then '�������� ��һ��'
end '�ԱȽ��'

from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
where  k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
--where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
(
rtrim(k001.hK0304)<>rtrim(LEFT(zcpt_k001.hK0304, 2))	or -- �걨|�����ȼ�,
rtrim(k001.HK0126)<>rtrim(zcpt_k001.HK0126)	or -- �Ƿ�һ������,
rtrim(k001.K0404)<>rtrim(zcpt_k001.K0404)	or -- ���ʱ��,
k001.K5222<>zcpt_k001.K5222	 -- ��������
)