SELECT 
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS �༭, 
RTRIM(K001.A0102) '����λ����' ,RTRIM(K001.HA0102) '����λ����',
K063.K6302 '�걨|·�߱��',	ZCPT_K063.K6302 '�ʲ�ƽ̨|·�߱��',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '�걨|·������',	ZCPT_K063.SDDM '�ʲ�ƽ̨|·������',

rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) '�걨|·�߱��',	ZCPT_K063.k0101 '�ʲ�ƽ̨|·�߱��',
K063.K0112 '�걨|·������',	ZCPT_K063.K0112 '�ʲ�ƽ̨|·������',
K001.k0304 '�걨|�����ȼ�',	ZCPT_K063.k0304 '�ʲ�ƽ̨|�����ȼ�',
K063.K0199 '�걨|��ע',	ZCPT_K063.K0199 '�ʲ�ƽ̨|��ע',
CASE 	when rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(ZCPT_K063.k0101) and rtrim(K063.K0112)<>rtrim(ZCPT_K063.K0112) and rtrim(K001.k0304)<>rtrim(ZCPT_K063.k0304)
then '·�߱��/·������/�����ȼ� ��һ��'
			when rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(ZCPT_K063.k0101) and rtrim(K063.K0112)<>rtrim(ZCPT_K063.K0112) and rtrim(K001.k0304)=rtrim(ZCPT_K063.k0304)
then '·�߱��/·������ ��һ��'
			when rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(ZCPT_K063.k0101) and rtrim(K063.K0112)=rtrim(ZCPT_K063.K0112)  and rtrim(K001.k0304)<>rtrim(ZCPT_K063.k0304)
then '·�߱��/�����ȼ� ��һ��'
			when rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(ZCPT_K063.k0101)  and rtrim(K063.K0112)<>rtrim(ZCPT_K063.K0112) and rtrim(K001.k0304)<>rtrim(ZCPT_K063.k0304)
then '·������/�����ȼ� ��һ��'
			WHEN rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(ZCPT_K063.k0101) and rtrim(K063.K0112)=rtrim(ZCPT_K063.K0112) and rtrim(K001.k0304)=rtrim(ZCPT_K063.k0304)
THEN '·�߱�� ��һ��'
      when rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K063.k0101)  and rtrim(K063.K0112)<>rtrim(ZCPT_K063.K0112) and rtrim(K001.k0304)=rtrim(ZCPT_K063.k0304)
then '·������ ��һ��'
			when rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K063.k0101) and rtrim(K063.K0112)=rtrim(ZCPT_K063.K0112) and rtrim(K001.k0304)<>rtrim(ZCPT_K063.k0304)
then '�����ȼ� ��һ��'
			else ''
END '�ԱȽ��'

from ZCPT_K063
left join k063 on ZCPT_K063.SDDM= rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301
left join k001 on rtrim(k063.k0101)=rtrim(k001.k0101) and k063.k6324>=k001.k0108 and k063.k6324<=k001.k0109
--where   k063.A0102 LIKE '34%' AND k063.A0102 LIKE '34%' and
where K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
(
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) <>	rtrim(ZCPT_K063.k0101) or--·�߱��
rtrim(K063.K0112) <>	rtrim(ZCPT_K063.K0112) or--·������
rtrim(K001.k0304) <>	rtrim(ZCPT_K063.k0304) --�����ȼ�
)
ORDER BY  sddm