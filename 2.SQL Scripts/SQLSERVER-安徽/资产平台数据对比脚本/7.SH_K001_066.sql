SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS �༭, 
rtrim(k001.A0102)	'�걨|����λ����',rtrim(k001.hA0102)	'�걨|����λ����',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'�걨|·�߱���',	rtrim(zcpt_k001.k0101)	'�ʲ�ƽ̨|·�߱���',
rtrim(k001.A0103)	'�걨|��������',	rtrim(zcpt_k001.A0103)	'�ʲ�ƽ̨|��������',

rtrim(k001.hK0182)	'�걨|��������',	rtrim(zcpt_k001.hK0182)	'�ʲ�ƽ̨|��������',
rtrim(k001.HK0123)	'�걨|�Ƿ��ͷ',	rtrim(zcpt_k001.HK0123) '�ʲ�ƽ̨|�Ƿ��ͷ',
case 
when rtrim(k001.hK0182)<>rtrim(zcpt_k001.hK0182)	and rtrim(k001.HK0123)=rtrim(zcpt_k001.HK0123)		then '�������� ��һ��' 
when rtrim(k001.hK0182)=rtrim(zcpt_k001.hK0182)	and rtrim(k001.HK0123)=rtrim(zcpt_k001.HK0123)		then '�Ƿ��ͷ ��һ��'
else '��������/�Ƿ��ͷ ��һ��'end '�ԱȽ��'


from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
where   k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
--where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101)
and k001.k0108=ZCPT_K001.k0108 and 
(
rtrim(k001.hK0182)<>rtrim(zcpt_k001.hK0182)	or -- ��������,
rtrim(k001.HK0123)<>rtrim(zcpt_k001.HK0123)	 -- �Ƿ��ͷ,
)
