SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS �༭, 
rtrim(k001.A0102)	'�걨|����λ����',rtrim(k001.hA0102)	'�걨|����λ����',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'�걨|·�߱���',	rtrim(zcpt_k001.k0101)	'�ʲ�ƽ̨|·�߱���',
rtrim(k001.A0103)	'�걨|��������',	rtrim(zcpt_k001.A0103)	'�ʲ�ƽ̨|��������',

rtrim(k001.HK5104)	'�걨|�������',	rtrim(zcpt_k001.HK5104)	'�ʲ�ƽ̨|�������',
k001.K4002	'�걨|·�����',	zcpt_k001.K4002	'�ʲ�ƽ̨|·�����',
k001.K5404	'�걨|·����',	zcpt_k001.K5404	'�ʲ�ƽ̨|·����',
k001.K0306		'�걨|�����',	zcpt_k001.K0306		'�ʲ�ƽ̨|�����',

CASE 	WHEN rtrim(k001.HK5104)<>rtrim(zcpt_k001.HK5104) THEN '������� ��һ��'
      when k001.K4002<>zcpt_k001.K4002 then '·����� ��һ��'
			when k001.K0306<>zcpt_k001.K0306 then '����� ��һ��'
			when k001.K5404<>zcpt_k001.K5404 then '·���� ��һ��'
END


from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
where   k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
--where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
(
rtrim(k001.HK5104)<>rtrim(zcpt_k001.HK5104)	or -- �������,
k001.K4002<>zcpt_k001.K4002	or -- ·�����,
k001.K5404<>zcpt_k001.K5404	or -- ·����,
k001.K0306<>zcpt_k001.K0306	 -- �����,
)