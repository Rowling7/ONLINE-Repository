SELECT 
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS �༭, 

RTRIM(K001.A0102) '����λ����' ,RTRIM(K001.HA0102) '����λ����',
K063.K6302 '�걨|�������',	ZCPT_K063.K6302 '�ʲ�ƽ̨|�������',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '�걨|�������',	ZCPT_K063.SDDM '�ʲ�ƽ̨|�������',

K063.hK6335 '�걨|�Ƿ�ˮ�����',	ZCPT_K063.K6335 '�ʲ�ƽ̨|�Ƿ�ˮ�����',
K063.hK6371 '�걨|�Ƿ��ʡ���',	ZCPT_K063.K6371 '�ʲ�ƽ̨|�Ƿ��ʡ���',
K063.K0199 '�걨|��ע',	ZCPT_K063.K0199 '�ʲ�ƽ̨|��ע',

CASE 	when rtrim(K063.hK6335)<>rtrim(ZCPT_K063.K6335) and rtrim(K063.hK6371)<>rtrim(ZCPT_K063.K6371) then '�Ƿ�ˮ�����/�Ƿ��ʡ��� ��һ��'
		  when rtrim(K063.hK6335)<>rtrim(ZCPT_K063.K6335)  and rtrim(K063.hK6371)=rtrim(ZCPT_K063.K6371)then '�Ƿ�ˮ����� ��һ��'
			when rtrim(K063.hK6335)=rtrim(ZCPT_K063.K6335) and rtrim(K063.hK6371)<>rtrim(ZCPT_K063.K6371) then '�Ƿ��ʡ��� ��һ��'
			else ''
END '�ԱȽ��'

from ZCPT_K063
left join k063 on ZCPT_K063.SDDM= rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301
left join k001 on rtrim(k063.k0101)=rtrim(k001.k0101) and k063.k6324>=k001.k0108 and k063.k6324<=k001.k0109
--where   k063.A0102 LIKE '34%' AND k063.A0102 LIKE '34%' and
where K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
(
K063.hK6335 <>	ZCPT_K063.K6335 or --�Ƿ�ˮ�����',
K063.hK6371 <>	ZCPT_K063.K6371  --�Ƿ��ʡ���',
)
ORDER BY  sddm