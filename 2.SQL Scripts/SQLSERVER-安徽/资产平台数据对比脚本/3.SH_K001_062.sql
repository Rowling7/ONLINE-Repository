SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS �༭, 

rtrim(k001.A0102)	'�걨|����λ����',rtrim(k001.hA0102)	'�걨|����λ����',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'�걨|·�߱���',	rtrim(zcpt_k001.k0101)	'�ʲ�ƽ̨|·�߱���',
rtrim(k001.A0103)	'�걨|��������',	rtrim(zcpt_k001.A0103)	'�ʲ�ƽ̨|��������',

rtrim(k001.K0112)	'�걨|·������',	rtrim(zcpt_k001.K0112)	'�ʲ�ƽ̨|·������',
k001.K0108	'�걨|���׮��',	zcpt_k001.K0108	'�ʲ�ƽ̨|���׮��',
rtrim(k001.K0110)	'�걨|���׮������',	rtrim(zcpt_k001.K0110)	'�ʲ�ƽ̨|���׮������',
k001.K0109	'�걨|ֹ��׮��',	zcpt_k001.K0109	'�ʲ�ƽ̨|ֹ��׮��',
rtrim(k001.K0111)	'�걨|ֹ��׮������',	rtrim(zcpt_k001.K0111)	'�ʲ�ƽ̨|ֹ��׮������',
case 
when rtrim(k001.K0110)=rtrim(zcpt_k001.K0110)	and rtrim(k001.K0111)<>rtrim(zcpt_k001.K0111)		then '���׮������ ��һ��' 
when rtrim(k001.K0110)<>rtrim(zcpt_k001.K0110)	and rtrim(k001.K0111)=rtrim(zcpt_k001.K0111)		then 'ֹ��׮������ ��һ��'
else '���׮������/ֹ��׮������ ��һ��'end '�ԱȽ��'

from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
where  k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
--where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
(
rtrim(k001.K0112)<>rtrim(zcpt_k001.K0112) or
rtrim(k001.K0110)<>rtrim(zcpt_k001.K0110)	or
rtrim(k001.K0111)<>rtrim(zcpt_k001.K0111)	
)