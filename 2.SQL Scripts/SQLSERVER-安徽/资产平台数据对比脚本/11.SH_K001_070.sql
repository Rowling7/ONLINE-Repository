SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS �༭, 
rtrim(k001.A0102)	'�걨|����λ����',rtrim(k001.hA0102)	'�걨|����λ����',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'�걨|·�߱���',	rtrim(zcpt_k001.k0101)	'�ʲ�ƽ̨|·�߱���',
rtrim(k001.A0103)	'�걨|��������',	rtrim(zcpt_k001.A0103)	'�ʲ�ƽ̨|��������',

rtrim(k001.HK9508)	'�걨|��ò',	rtrim(zcpt_k001.HK9508)	'�ʲ�ƽ̨|��ò',
k001.A0522	'�걨|��������',	zcpt_k001.A0522	'�ʲ�ƽ̨|��������',

case 
when rtrim(k001.HK9508)<>rtrim(zcpt_k001.HK9508)	and isnull(k001.A0522,0)=isnull(zcpt_k001.A0522,0)		then '��ò ��һ��' 
when rtrim(k001.HK9508)=rtrim(zcpt_k001.HK9508)	and isnull(k001.A0522,0)<>isnull(zcpt_k001.A0522,0)		then '�������� ��һ��'
else '��ò/�������� ��һ��'end '�ԱȽ��'

from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
--where   k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101)
and k001.k0108=ZCPT_K001.k0108 and 
(
rtrim(k001.HK9508)<>rtrim(zcpt_k001.HK9508)	or -- ��ò,
isnull(k001.A0522,0)<>isnull(zcpt_k001.A0522,0)	 -- ��������,
)



