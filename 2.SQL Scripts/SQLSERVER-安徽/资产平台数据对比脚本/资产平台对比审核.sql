SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS �༭, 

rtrim(k001.A0102)	'�걨|����λ����',rtrim(k001.hA0102)	'�걨|����λ����',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'�걨|·�߱���',	rtrim(zcpt_k001.k0101)	'�ʲ�ƽ̨|·�߱���',
rtrim(k001.A0103)	'�걨|��������',	rtrim(zcpt_k001.A0103)	'�ʲ�ƽ̨|��������',
rtrim(k001.A0130)	'�걨|������λ',	rtrim(zcpt_k001.A0130)	'�ʲ�ƽ̨|������λ',
rtrim(k001.K0112)	'�걨|·������',	rtrim(zcpt_k001.K0112)	'�ʲ�ƽ̨|·������',
rtrim(k001.K0110)	'�걨|���׮������',	rtrim(zcpt_k001.K0110)	'�ʲ�ƽ̨|���׮������',
rtrim(k001.K0111)	'�걨|ֹ��׮������',	rtrim(zcpt_k001.K0111)	'�ʲ�ƽ̨|ֹ��׮������',
k001.K0108	'�걨|���׮��',	zcpt_k001.K0108	'�ʲ�ƽ̨|���׮��',
k001.K0109	'�걨|ֹ��׮��',	zcpt_k001.K0109	'�ʲ�ƽ̨|ֹ��׮��',
k001.K0114	'�걨|���',	zcpt_k001.K0114	'�ʲ�ƽ̨|���',
rtrim(k001.K0304)	'�걨|�����ȼ�',	rtrim(zcpt_k001.K0304)	'�ʲ�ƽ̨|�����ȼ�',
rtrim(k001.HK0304)	'�걨|�Ƿ�һ������',	rtrim(zcpt_k001.HK0304)	'�ʲ�ƽ̨|�Ƿ�һ������',
rtrim(k001.HK0126)	'�걨|��������',	rtrim(zcpt_k001.HK0126)	'�ʲ�ƽ̨|��������',
rtrim(k001.K0404)	'�걨|�������',	rtrim(zcpt_k001.K0404)	'�ʲ�ƽ̨|�������',
rtrim(k001.HK5104)	'�걨|·�����',	rtrim(zcpt_k001.HK5104)	'�ʲ�ƽ̨|·�����',
k001.K4002	'�걨|·����',	zcpt_k001.K4002	'�ʲ�ƽ̨|·����',
k001.K5404	'�걨|�����',	zcpt_k001.K5404	'�ʲ�ƽ̨|�����',
k001.K5222	'�걨|���ʱ��',	zcpt_k001.K5222	'�ʲ�ƽ̨|���ʱ��(km/h)',
k001.K0306	'�걨|�޽����',	zcpt_k001.K0306	'�ʲ�ƽ̨|�޽����',
rtrim(k001.K0180)	'�걨|�Ľ����',	rtrim(zcpt_k001.K0180)	'�ʲ�ƽ̨|�Ľ����',
rtrim(k001.K0181)	'�걨|���һ�δ��������',	rtrim(zcpt_k001.K0181)	'�ʲ�ƽ̨|���һ�δ��������',
rtrim(k001.K0155)	'�걨|��������',	rtrim(zcpt_k001.K0155)	'�ʲ�ƽ̨|��������',
rtrim(k001.hK0182)	'�걨|�Ƿ�ǹ�',	rtrim(zcpt_k001.hK0182)	'�ʲ�ƽ̨|�Ƿ�ǹ�',
rtrim(k001.HK0121)	'�걨|�Ƿ��ͷ',	rtrim(zcpt_k001.HK0121)	'�ʲ�ƽ̨|�Ƿ��ͷ',
rtrim(k001.HK0123)	'�걨|·���շ�����',	rtrim(zcpt_k001.HK0123)	'�ʲ�ƽ̨|·���շ�����',
rtrim(k001.HK0136)	'�걨|�ظ�·�α���',	rtrim(zcpt_k001.HK0136)	'�ʲ�ƽ̨|�ظ�·�α���',
rtrim(k001.K0124)	'�걨|�ظ�·�����׮��',	rtrim(zcpt_k001.K0124)	'�ʲ�ƽ̨|�ظ�·�����׮��',
k001.K0162	'�걨|�ظ�·��ֹ��׮��',	zcpt_k001.K0162	'�ʲ�ƽ̨|�ظ�·��ֹ��׮��',
k001.K0163	'�걨|�������',	zcpt_k001.K0163	'�ʲ�ƽ̨|�������',
k001.A1001	'�걨|���̻����',	zcpt_k001.A1001	'�ʲ�ƽ̨|���̻����',
k001.A3101	'�걨|���̻����',	zcpt_k001.A3101	'�ʲ�ƽ̨|���̻����',
k001.A3102	'�걨|��ò',	zcpt_k001.A3102	'�ʲ�ƽ̨|��ò',
rtrim(k001.HK9508)	'�걨|��������',	rtrim(zcpt_k001.HK9508)	'�ʲ�ƽ̨|��������',
k001.A0522	'�걨|ʡ�ʳ����',	zcpt_k001.A0522	'�ʲ�ƽ̨|ʡ�ʳ����',
rtrim(k001.HK0156)	'�걨|��������ǰ·�߱��',	rtrim(zcpt_k001.HK0156)	'�ʲ�ƽ̨|��������ǰ·�߱��',
rtrim(k001.K3990)	'�걨|�Ƿ񰴸��߹�·�������',	rtrim(zcpt_k001.K3990)	'�ʲ�ƽ̨|�Ƿ񰴸��߹�·�������',
rtrim(k001.HK0138)	'�걨|�Ƿ�Ϊ�ʲ�����',	rtrim(zcpt_k001.HK0138)	'�ʲ�ƽ̨|�Ƿ�Ϊ�ʲ�����',
k001.K0199	'�걨|��ע',	zcpt_k001.K0199	'�ʲ�ƽ̨|��ע'

from K001
left join ZCPT_K001 on rtrim(k001.a0103)=rtrim(ZCPT_K001.a0103) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
where  k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
--where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
(
rtrim(k001.A0130)<>rtrim(zcpt_k001.A0130)	or
rtrim(k001.K0112)<>rtrim(zcpt_k001.K0112)	or
rtrim(k001.K0110)<>rtrim(zcpt_k001.K0110)	or
rtrim(k001.K0111)<>rtrim(zcpt_k001.K0111)	or
k001.K0109<>zcpt_k001.K0109	or
k001.K0114<>zcpt_k001.K0114	or
rtrim(k001.K0304)<>rtrim(zcpt_k001.K0304)	or
rtrim(k001.HK0304)<>rtrim(zcpt_k001.HK0304)	or
rtrim(k001.HK0126)<>rtrim(zcpt_k001.HK0126)	or
rtrim(k001.K0404)<>rtrim(zcpt_k001.K0404)	or
rtrim(k001.HK5104)<>rtrim(zcpt_k001.HK5104)	or
k001.K4002<>zcpt_k001.K4002	or
k001.K5404<>zcpt_k001.K5404	or
k001.K5222<>zcpt_k001.K5222	or
k001.K0306<>zcpt_k001.K0306	or
rtrim(k001.K0180)<>rtrim(zcpt_k001.K0180)	or
rtrim(k001.K0181)<>rtrim(zcpt_k001.K0181)	or
rtrim(k001.K0155)<>rtrim(zcpt_k001.K0155)	or
rtrim(k001.hK0182)<>rtrim(zcpt_k001.hK0182)	or
rtrim(k001.HK0121)<>rtrim(zcpt_k001.HK0121)	or
rtrim(k001.HK0123)<>rtrim(zcpt_k001.HK0123)	or
rtrim(k001.HK0136)<>rtrim(zcpt_k001.HK0136)	or
rtrim(k001.K0124)<>rtrim(zcpt_k001.K0124)	or
k001.K0162<>zcpt_k001.K0162	or
k001.K0163<>zcpt_k001.K0163	or
k001.A1001<>zcpt_k001.A1001	or
k001.A3101<>zcpt_k001.A3101	or
k001.A3102<>zcpt_k001.A3102	or
rtrim(k001.HK9508)<>rtrim(zcpt_k001.HK9508)	or
k001.A0522<>zcpt_k001.A0522	or
rtrim(k001.HK0156)<>rtrim(zcpt_k001.HK0156)	or
rtrim(k001.K3990)<>rtrim(zcpt_k001.K3990)	or
rtrim(k001.HK0138)<>rtrim(zcpt_k001.HK0138)
)