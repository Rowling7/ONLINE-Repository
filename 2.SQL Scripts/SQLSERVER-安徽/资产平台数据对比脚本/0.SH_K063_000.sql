SELECT 
	rtrim(k001.a0102) '����λ',
	zcpt_k063.SDDM 		'�ʲ�ƽ̨|�������',
	zcpt_k063.K6303 	'�ʲ�ƽ̨|������׮��',
	zcpt_k063.k6302 	'�ʲ�ƽ̨|�������',
	zcpt_k063.k0101 	'�ʲ�ƽ̨|·�߱��',
	zcpt_k063.K0112 	'�ʲ�ƽ̨|·������',
	'δ�ҵ�����λ' 	' �ԱȽ��'
	
FROM zcpt_k063
left JOIN k001
on rtrim(zcpt_k063.k0101)=rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) and ISNULL(zcpt_k063.k6303,0)>=ISNULL(k001.k0108,0) and ISNULL(zcpt_k063.k6303,0)<=ISNULL(k001.k0109,0)
where rtrim(k001.a0102) is null 