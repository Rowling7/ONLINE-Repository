SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS �༭, 
rtrim(k001.A0102)	'�걨|����λ����',rtrim(k001.hA0102)	'�걨|����λ����',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'�걨|·�߱���',	rtrim(zcpt_k001.k0101)	'�ʲ�ƽ̨|·�߱���',
rtrim(k001.A0103)	'�걨|��������',	rtrim(zcpt_k001.A0103)	'�ʲ�ƽ̨|��������',

k001.A1001	'�걨|�������',	zcpt_k001.A1001	'�ʲ�ƽ̨|�������',
k001.A3101	'�걨|���̻����',	zcpt_k001.A3101	'�ʲ�ƽ̨|���̻����',
k001.A3102	'�걨|���̻����',		zcpt_k001.A3102		'�ʲ�ƽ̨|���̻����',

CASE 	when isnull(k001.A1001,0)<>isnull(zcpt_k001.A1001,0) and isnull(k001.A3101,0)<>isnull(zcpt_k001.A3101,0) and isnull(k001.A3102,0)<>isnull(zcpt_k001.A3102,0)
then '�������/���̻����/���̻���� ��һ��'
			when isnull(k001.A1001,0)<>isnull(zcpt_k001.A1001,0) and isnull(k001.A3101,0)<>isnull(zcpt_k001.A3101,0) and isnull(k001.A3102,0)=isnull(zcpt_k001.A3102,0)
then '�������/���̻���� ��һ��'
			when isnull(k001.A1001,0)<>isnull(zcpt_k001.A1001,0) and isnull(k001.A3101,0)=isnull(zcpt_k001.A3101,0)  and isnull(k001.A3102,0)<>isnull(zcpt_k001.A3102,0)
then '�������/���̻���� ��һ��'
			when isnull(k001.A1001,0)=isnull(zcpt_k001.A1001,0)  and isnull(k001.A3101,0)<>isnull(zcpt_k001.A3101,0) and isnull(k001.A3102,0)<>isnull(zcpt_k001.A3102,0)
then '���̻����/���̻���� ��һ��'
			WHEN isnull(k001.A1001,0)<>isnull(zcpt_k001.A1001,0) and isnull(k001.A3101,0)=isnull(zcpt_k001.A3101,0) and isnull(k001.A3102,0)=isnull(zcpt_k001.A3102,0)
THEN '������� ��һ��'
      when isnull(k001.A1001,0)=isnull(zcpt_k001.A1001,0)  and isnull(k001.A3101,0)<>isnull(zcpt_k001.A3101,0) and isnull(k001.A3102,0)=isnull(zcpt_k001.A3102,0)
then '���̻���� ��һ��'
			when isnull(k001.A1001,0)=isnull(zcpt_k001.A1001,0) and isnull(k001.A3101,0)=isnull(zcpt_k001.A3101,0) and isnull(k001.A3102,0)<>isnull(zcpt_k001.A3102,0)
then '���̻���� ��һ��'
			else 'error'
END '�ԱȽ��'

from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
--where   k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101)
and k001.k0108=ZCPT_K001.k0108 and 
(
isnull(k001.A1001,0)<>isnull(zcpt_k001.A1001,0)	or -- �������,
isnull(k001.A3101,0)<>isnull(zcpt_k001.A3101,0)	or -- ���̻����,
isnull(k001.A3102,0)<>isnull(zcpt_k001.A3102,0)	 -- ���̻����,
)
