SELECT 
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS �༭, 

RTRIM(K001.A0102) '����λ����' ,RTRIM(K001.HA0102) '����λ����',
K063.K6302 '�걨|�������',	ZCPT_K063.K6302 '�ʲ�ƽ̨|�������',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '�걨|�������',	ZCPT_K063.SDDM '�ʲ�ƽ̨|�������',

K063.A1313 '�걨|��λ���ʴ���',	ZCPT_K063.A1313 '�ʲ�ƽ̨|��λ���ʴ���',
K063.A0130 '�걨|������λ����',	ZCPT_K063.A0130 '�ʲ�ƽ̨|������λ����',
K063.K6111 '�걨|��ܵ�λ����',	ZCPT_K063.K6111 '�ʲ�ƽ̨|��ܵ�λ����',



CASE 	when K063.A1313<>ZCPT_K063.A1313 and K063.A0130<>ZCPT_K063.A0130 and K063.K6111 <>ZCPT_K063.K6111
then '��λ���ʴ���/������λ����/��ܵ�λ���� ��һ��'
			when K063.A1313<>ZCPT_K063.A1313 and K063.A0130<>ZCPT_K063.A0130 and K063.K6111 =ZCPT_K063.K6111
then '��λ���ʴ���/������λ���� ��һ��'
			when K063.A1313<>ZCPT_K063.A1313 and K063.A0130=ZCPT_K063.A0130  and K063.K6111 <>ZCPT_K063.K6111
then '��λ���ʴ���/��ܵ�λ���� ��һ��'
			when K063.A1313<>ZCPT_K063.A1313  and K063.A0130<>ZCPT_K063.A0130 and K063.K6111 <>ZCPT_K063.K6111
then '������λ����/��ܵ�λ���� ��һ��'
			WHEN K063.A1313<>ZCPT_K063.A1313 and K063.A0130=ZCPT_K063.A0130 and K063.K6111 =ZCPT_K063.K6111
THEN '��λ���ʴ��� ��һ��'
      when K063.A1313=ZCPT_K063.A1313  and K063.A0130<>ZCPT_K063.A0130 and K063.K6111 =ZCPT_K063.K6111
then '������λ���� ��һ��'
			when K063.A1313=ZCPT_K063.A1313 and K063.A0130=ZCPT_K063.A0130 and K063.K6111 <>ZCPT_K063.K6111
then '��ܵ�λ���� ��һ��'
			else ''
END '�ԱȽ��'

from ZCPT_K063
left join k063 on ZCPT_K063.SDDM= rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301
left join k001 on rtrim(k063.k0101)=rtrim(k001.k0101) and k063.k6324>=k001.k0108 and k063.k6324<=k001.k0109
--where   k063.A0102 LIKE '34%' AND k063.A0102 LIKE '34%' and
where K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
(
K063.A1313 <>ZCPT_K063.A1313 OR--��λ���ʴ���',
K063.A0130 <>ZCPT_K063.A0130 OR--������λ����',
K063.K6111 <>	ZCPT_K063.K6111 --��ܵ�λ����'
)
ORDER BY  sddm