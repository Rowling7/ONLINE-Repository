SELECT 
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS �༭, 

RTRIM(K001.A0102) '����λ����' ,RTRIM(K001.HA0102) '����λ����',
K063.K6302 '�걨|�������',	ZCPT_K063.K6302 '�ʲ�ƽ̨|�������',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '�걨|�������',	ZCPT_K063.SDDM '�ʲ�ƽ̨|�������',

RTRIM(K063.K6079) '�걨|���赥λ����',	RTRIM(ZCPT_K063.K6079) '�ʲ�ƽ̨|���赥λ����',
RTRIM(K063.K6030) '�걨|��Ƶ�λ����',	RTRIM(ZCPT_K063.K6030) '�ʲ�ƽ̨|��Ƶ�λ����',
RTRIM(K063.K6031) '�걨|ʩ����λ����',	RTRIM(ZCPT_K063.K6031) '�ʲ�ƽ̨|ʩ����λ����',
RTRIM(K063.K6032) '�걨|����λ����',	RTRIM(ZCPT_K063.K6032) '�ʲ�ƽ̨|����λ����',
RTRIM(K063.K0116) '�걨|����ͨ��ʱ��',	RTRIM(ZCPT_K063.K0116) '�ʲ�ƽ̨|����ͨ��ʱ��',
K063.K0199 '�걨|��ע',	ZCPT_K063.K0199 '�ʲ�ƽ̨|��ע',

CASE WHEN RTRIM(K063.K6079) <>	RTRIM(ZCPT_K063.K6079) THEN '���赥λ���� ��һ��'
WHEN RTRIM(K063.K6030) <>	RTRIM(ZCPT_K063.K6030) THEN '��Ƶ�λ���� ��һ��'
WHEN RTRIM(K063.K6031) <>	RTRIM(ZCPT_K063.K6031) THEN 'ʩ����λ���� ��һ��'
WHEN RTRIM(K063.K6032) <>	RTRIM(ZCPT_K063.K6032) THEN '����λ���� ��һ��'
WHEN RTRIM(K063.K0116) <>	RTRIM(ZCPT_K063.K0116) THEN '����ͨ��ʱ�� ��һ��' 
else 'error'
end

from ZCPT_K063
left join k063 on ZCPT_K063.SDDM= rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301
left join k001 on rtrim(k063.k0101)=rtrim(k001.k0101) and k063.k6324>=k001.k0108 and k063.k6324<=k001.k0109
--where   k063.A0102 LIKE '34%' AND k063.A0102 LIKE '34%' and
where K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
(
RTRIM(K063.K6079) <>	RTRIM(ZCPT_K063.K6079) OR --���赥λ����',
RTRIM(K063.K6030) <>	RTRIM(ZCPT_K063.K6030) OR --��Ƶ�λ����',
RTRIM(K063.K6031) <>	RTRIM(ZCPT_K063.K6031) OR --ʩ����λ����',
RTRIM(K063.K6032) <>	RTRIM(ZCPT_K063.K6032) OR --����λ����',
RTRIM(K063.K0116) <>	RTRIM(ZCPT_K063.K0116)  --����ͨ��ʱ��',
)
ORDER BY  sddm