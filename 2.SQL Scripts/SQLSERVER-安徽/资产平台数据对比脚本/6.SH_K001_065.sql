SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS �༭, 
rtrim(k001.A0102)	'�걨|����λ����',rtrim(k001.hA0102)	'�걨|����λ����',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'�걨|·�߱���',	rtrim(zcpt_k001.k0101)	'�ʲ�ƽ̨|·�߱���',
rtrim(k001.A0103)	'�걨|��������',	rtrim(zcpt_k001.A0103)	'�ʲ�ƽ̨|��������',

rtrim(k001.K0180)	'�걨|�޽����',	rtrim(zcpt_k001.K0180)	'�ʲ�ƽ̨|�޽����',
rtrim(k001.K0181)	'�걨|�Ľ����',	rtrim(zcpt_k001.K0181)	'�ʲ�ƽ̨|�Ľ����',
rtrim(k001.K0155)	'�걨|���һ�δ��������',		rtrim(zcpt_k001.K0155)		'�ʲ�ƽ̨|���һ�δ��������',
CASE 	when isnull(left(k001.K0180,4),'0')<>isnull(left(zcpt_k001.K0180,4),'0') and isnull(left(k001.K0181,4),'0')<>isnull(left(zcpt_k001.K0181,4),'0') and isnull(left(k001.k0155,4),'0')<>isnull(left(zcpt_k001.k0155,4),'0')
then '�޽����/�Ľ����/���һ�δ�������� ��һ��'
			when isnull(left(k001.K0180,4),'0')<>isnull(left(zcpt_k001.K0180,4),'0') and isnull(left(k001.K0181,4),'0')<>isnull(left(zcpt_k001.K0181,4),'0') and isnull(left(k001.k0155,4),'0')=isnull(left(zcpt_k001.k0155,4),'0')
then '�޽����/�Ľ���� ��һ��'
			when isnull(left(k001.K0180,4),'0')<>isnull(left(zcpt_k001.K0180,4),'0') and isnull(left(k001.K0181,4),'0')=isnull(left(zcpt_k001.K0181,4),'0')  and isnull(left(k001.k0155,4),'0')<>isnull(left(zcpt_k001.k0155,4),'0')
then '�޽����/���һ�δ�������� ��һ��'
			when isnull(left(k001.K0180,4),'0')=isnull(left(zcpt_k001.K0180,4),'0')  and isnull(left(k001.K0181,4),'0')<>isnull(left(zcpt_k001.K0181,4),'0') and isnull(left(k001.k0155,4),'0')<>isnull(left(zcpt_k001.k0155,4),'0')
then '�Ľ����/���һ�δ�������� ��һ��'
			WHEN isnull(left(k001.K0180,4),'0')<>isnull(left(zcpt_k001.K0180,4),'0') and isnull(left(k001.K0181,4),'0')=isnull(left(zcpt_k001.K0181,4),'0') and isnull(left(k001.k0155,4),'0')=isnull(left(zcpt_k001.k0155,4),'0')THEN '�޽���� ��һ��'
      when isnull(left(k001.K0180,4),'0')=isnull(left(zcpt_k001.K0180,4),'0')  and isnull(left(k001.K0181,4),'0')<>isnull(left(zcpt_k001.K0181,4),'0') and isnull(left(k001.k0155,4),'0')=isnull(left(zcpt_k001.k0155,4),'0')then '�Ľ���� ��һ��'
			when isnull(left(k001.K0180,4),'0')=isnull(left(zcpt_k001.K0180,4),'0') and isnull(left(k001.K0181,4),'0')=isnull(left(zcpt_k001.K0181,4),'0') and isnull(left(k001.k0155,4),'0')<>isnull(left(zcpt_k001.k0155,4),'0') then '���һ�δ�������� ��һ��'
			else '0'
END


from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
where   k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
--where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101)
and k001.k0108=ZCPT_K001.k0108 and 

(
isnull(left(k001.K0180,4),'0')<>isnull(left(zcpt_k001.K0180,4),'0')	or -- �޽����,
isnull(left(k001.K0181,4),'0')<>isnull(left(zcpt_k001.K0181,4),'0')	or -- �Ľ����,
isnull(left(k001.k0155,4),'0')<>isnull(left(zcpt_k001.k0155,4),'0') -- ���һ�δ��������,
)