--9.1.1
SELECT
rtrim(k001.A0102)	'�걨|����λ����',rtrim(k001.hA0102)	'�걨|����λ����',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'�걨|·�߱���',
rtrim(zcpt_k001.k0101)	'�ʲ�ƽ̨|·�߱���',
k001.K0108	'�걨|���׮��',
zcpt_k001.K0108	'�ʲ�ƽ̨|���׮��',
k001.K0109	'�걨|ֹ��׮��',
zcpt_k001.K0109	'�ʲ�ƽ̨|ֹ��׮��',
rtrim(k001.K0112)	'�걨|·������',
rtrim(zcpt_k001.K0112)	'�ʲ�ƽ̨|·������',
'�걨·�߷ֶκ��ʲ�ƽ̨·�߷ֶ� ��һ�£�' '�ԱȽ��'
FROM zcpt_k001
full JOIN  k001
ON   rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) +CAST(k001.K0108 as VARCHAR(20)) +CAST(k001.K0109 as VARCHAR(20))=rtrim(zcpt_k001.k0101) +CAST(zcpt_k001.K0108 as VARCHAR(20)) +CAST(zcpt_k001.K0109 as VARCHAR(20))
WHERE k001.k0101 IS NULL or rtrim(zcpt_k001.k0101) IS NULL
and LEFT(K001.K0101,1) IN ('G','S')  AND k001.A0102 LIKE '341%' and rtrim(k001.k0112) not like '%����%'
and  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%'


--9.1.2
SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS �༭,
rtrim(k001.A0102)	'�걨|����λ����',rtrim(k001.hA0102)	'�걨|����λ����',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'�걨|·�߱���',	rtrim(zcpt_k001.k0101)	'�ʲ�ƽ̨|·�߱���',
rtrim(k001.A0103)	'�걨|��������',	rtrim(zcpt_k001.A0103)	'�ʲ�ƽ̨|��������',

rtrim(replace(replace(replace(replace(replace(k001.k3990,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'�걨|��������ǰ·�߱��',	rtrim(zcpt_k001.K3990)	'�ʲ�ƽ̨|��������ǰ·�߱��',
rtrim(k001.HK0138)	'�걨|�Ƿ񰴸��߹�·�������',	rtrim(zcpt_k001.HK0138)	'�ʲ�ƽ̨|�Ƿ񰴸��߹�·�������',

case
when rtrim(replace(replace(replace(replace(replace(k001.k3990,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(zcpt_k001.K3990)	and rtrim(k001.HK0138)=rtrim(zcpt_k001.HK0138)		then '��������ǰ·�߱�� ��һ��'
when rtrim(replace(replace(replace(replace(replace(k001.k3990,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(zcpt_k001.K3990)	and rtrim(k001.HK0138)<>rtrim(zcpt_k001.HK0138)		then '�Ƿ񰴸��߹�·������� ��һ��'
else '��������ǰ·�߱��/�Ƿ񰴸��߹�·������� ��һ��'end '�ԱȽ��'

from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
--where   k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101)
and k001.k0108=ZCPT_K001.k0108 and  LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%' AND k001.A0102 LIKE '341%'and
(
rtrim(replace(replace(replace(replace(replace(k001.k3990,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(zcpt_k001.K3990)	or -- ��������ǰ·�߱��,
rtrim(k001.HK0138)<>rtrim(zcpt_k001.HK0138)	 -- �Ƿ񰴸��߹�·�������
)

--9.1.3
SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS �༭,
rtrim(k001.A0102)	'�걨|����λ����',rtrim(k001.hA0102)	'�걨|����λ����',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'�걨|·�߱���',	rtrim(zcpt_k001.k0101)	'�ʲ�ƽ̨|·�߱���',
rtrim(k001.A0103)	'�걨|��������',	rtrim(zcpt_k001.A0103)	'�ʲ�ƽ̨|��������',

rtrim(k001.HK9508)	'�걨|��ò',	rtrim(zcpt_k001.HK9508)	'�ʲ�ƽ̨|��ò',
k001.A0522	'�걨|��������',	zcpt_k001.A0522	'�ʲ�ƽ̨|��������',

case
when rtrim(k001.HK9508)<>rtrim(zcpt_k001.HK9508)	and isnull(k001.A0522,0)=isnull(zcpt_k001.A0522,0)		then '��ò ��һ��'
when rtrim(k001.HK9508)=rtrim(zcpt_k001.HK9508)	and isnull(k001.A0522,0)<>isnull(zcpt_k001.A0522,0)		then '�������� ��һ��'
else '��ò/�������� ��һ��'end '�ԱȽ��'

from K001
full join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
--where   k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101)
and k001.k0108=ZCPT_K001.k0108 and k001.k0108=ZCPT_K001.k0108 and  LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%' AND k001.A0102 LIKE '341%'and
(
rtrim(k001.HK9508)<>rtrim(zcpt_k001.HK9508)	or -- ��ò,
isnull(k001.A0522,0)<>isnull(zcpt_k001.A0522,0)	 -- ��������,
)

--9.1.4
SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS �༭,
rtrim(k001.A0102)	'�걨|����λ����',rtrim(k001.hA0102)	'�걨|����λ����',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'�걨|·�߱���',	rtrim(zcpt_k001.k0101)	'�ʲ�ƽ̨|·�߱���',
rtrim(k001.A0103)	'�걨|��������',	rtrim(zcpt_k001.A0103)	'�ʲ�ƽ̨|��������',

k001.A1001	'�걨|�������',	zcpt_k001.A1001	'�ʲ�ƽ̨|�������',
k001.A3101	'�걨|���̻����',	zcpt_k001.A3101	'�ʲ�ƽ̨|���̻����',
k001.A3102	'�걨|���̻����',		zcpt_k001.A3102		'�ʲ�ƽ̨|���̻����',

CASE 	when isnull(k001.A1001,0)<>isnull(zcpt_k001.A1001,0) and isnull(k001.A3101,0)<>isnull(zcpt_k001.A3101,0) and isnull(k001.A3102,0)<>isnull(zcpt_k001.A3102,0)
then '�������/���̻����/���̻���� ��һ��'
			when isnull(k001.A1001,0)<>isnull(zcpt_k001.A1001,0) and isnull(k001.A3101,0)<>isnull(zcpt_k001.A3101,0) and isnull(k001.A3102,0)=isnull(zcpt_k001.A3102,0)
then '�������/���̻���� ��һ��'
			when isnull(k001.A1001,0)<>isnull(zcpt_k001.A1001,0) and isnull(k001.A3101,0)=isnull(zcpt_k001.A3101,0)  and isnull(k001.A3102,0)<>isnull(zcpt_k001.A3102,0)
then '�������/���̻���� ��һ��'
			when isnull(k001.A1001,0)=isnull(zcpt_k001.A1001,0)  and isnull(k001.A3101,0)<>isnull(zcpt_k001.A3101,0) and isnull(k001.A3102,0)<>isnull(zcpt_k001.A3102,0)
then '���̻����/���̻���� ��һ��'
			WHEN isnull(k001.A1001,0)<>isnull(zcpt_k001.A1001,0) and isnull(k001.A3101,0)=isnull(zcpt_k001.A3101,0) and isnull(k001.A3102,0)=isnull(zcpt_k001.A3102,0)
THEN '������� ��һ��'
      when isnull(k001.A1001,0)=isnull(zcpt_k001.A1001,0)  and isnull(k001.A3101,0)<>isnull(zcpt_k001.A3101,0) and isnull(k001.A3102,0)=isnull(zcpt_k001.A3102,0)
then '���̻���� ��һ��'
			when isnull(k001.A1001,0)=isnull(zcpt_k001.A1001,0) and isnull(k001.A3101,0)=isnull(zcpt_k001.A3101,0) and isnull(k001.A3102,0)<>isnull(zcpt_k001.A3102,0)
then '���̻���� ��һ��'
			else 'error'
END '�ԱȽ��'

from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
--where   k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101)
and k001.k0108=ZCPT_K001.k0108 and k001.k0108=ZCPT_K001.k0108 and  LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%' AND k001.A0102 LIKE '341%'and
(
isnull(k001.A1001,0)<>isnull(zcpt_k001.A1001,0)	or -- �������,
isnull(k001.A3101,0)<>isnull(zcpt_k001.A3101,0)	or -- ���̻����,
isnull(k001.A3102,0)<>isnull(zcpt_k001.A3102,0)	 -- ���̻����,
)

--9.1.5
SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS �༭,
rtrim(k001.A0102)	'�걨|����λ����',rtrim(k001.hA0102)	'�걨|����λ����',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'�걨|·�߱���',	rtrim(zcpt_k001.k0101)	'�ʲ�ƽ̨|·�߱���',
rtrim(k001.A0103)	'�걨|��������',	rtrim(zcpt_k001.A0103)	'�ʲ�ƽ̨|��������',


rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))'�걨|�ظ�·�α���',	rtrim(zcpt_k001.K0124)	'�ʲ�ƽ̨|�ظ�·�α���',
k001.K0162	'�걨|�ظ�·�����׮��',	zcpt_k001.K0162	'�ʲ�ƽ̨|�ظ�·�����׮��',
k001.K0163	'�걨|�ظ�·��ֹ��׮��',	zcpt_k001.K0163 '�ʲ�ƽ̨|�ظ�·��ֹ��׮��',
k001.hk0176	'�걨|�Ƿ����ظ�',

CASE 	when rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(zcpt_k001.K0124) and k001.K0162<>zcpt_k001.K0162 and k001.K0163<>zcpt_k001.K0163
then '�ظ�·�α���/ �ظ�·�����׮��/�ظ�·��ֹ��׮�� ��һ��'
			when rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(zcpt_k001.K0124) and k001.K0162<>zcpt_k001.K0162 and k001.K0163=zcpt_k001.K0163
then '�ظ�·�α���/ �ظ�·�����׮�� ��һ��'
			when rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(zcpt_k001.K0124) and k001.K0162=zcpt_k001.K0162  and k001.K0163<>zcpt_k001.K0163
then '�ظ�·�α���/�ظ�·��ֹ��׮�� ��һ��'
			when rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(zcpt_k001.K0124)  and k001.K0162<>zcpt_k001.K0162 and k001.K0163<>zcpt_k001.K0163
then ' �ظ�·�����׮��/�ظ�·��ֹ��׮�� ��һ��'
			WHEN rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(zcpt_k001.K0124) and k001.K0162=zcpt_k001.K0162 and k001.K0163=zcpt_k001.K0163
THEN '�ظ�·�α��� ��һ��'
      when rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(zcpt_k001.K0124)  and k001.K0162<>zcpt_k001.K0162 and k001.K0163=zcpt_k001.K0163
then ' �ظ�·�����׮�� ��һ��'
			when rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(zcpt_k001.K0124) and k001.K0162=zcpt_k001.K0162 and k001.K0163<>zcpt_k001.K0163
then '�ظ�·��ֹ��׮�� ��һ��'
			else 'error'
END '�ԱȽ��'


from K001
full outer join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
--where   k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101)
and k001.k0108=ZCPT_K001.k0108 and k001.k0108=ZCPT_K001.k0108 and  LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%' AND k001.A0102 LIKE '341%'and
(
rtrim(replace(replace(replace(replace(replace(k001.k0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))<>rtrim(zcpt_k001.K0124)	or -- �ظ�·�α���,
k001.K0162<>zcpt_k001.K0162	or -- �ظ�·�����׮��,
k001.K0163<>zcpt_k001.K0163	 -- �ظ�·��ֹ��׮��,
)

--9.1.6
SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS �༭,
rtrim(k001.A0102)	'�걨|����λ����',rtrim(k001.hA0102)	'�걨|����λ����',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'�걨|·�߱���',	rtrim(zcpt_k001.k0101)	'�ʲ�ƽ̨|·�߱���',
rtrim(k001.A0103)	'�걨|��������',	rtrim(zcpt_k001.A0103)	'�ʲ�ƽ̨|��������',

rtrim(k001.HK0121)	'�걨|�Ƿ�ǹ�',	rtrim(zcpt_k001.HK0121)	'�ʲ�ƽ̨|�Ƿ�ǹ�', case when rtrim(k001.HK0121)<>rtrim(zcpt_k001.HK0121) then '�Ƿ�ǹ� ��һ��' else null end '�Ƿ�ǹܶԱ�',
rtrim(k001.HK0136)	'�걨|·���շ�����',	rtrim(zcpt_k001.HK0136) '�ʲ�ƽ̨|·���շ�����',case when rtrim(k001.HK0136)<>rtrim(zcpt_k001.HK0136) then '·���շ����� ��һ��' else null end '·���շ����ʶԱ�',
rtrim(k001.HK0156) '�걨|ʡ�ʳ����',		rtrim(zcpt_k001.HK0156) '�ʲ�ƽ̨|ʡ�ʳ����',case when rtrim(k001.HK0156)<>rtrim(zcpt_k001.HK0156) then 'ʡ�ʳ���� ��һ��' else null end 'ʡ�ʳ���ڶԱ�'

from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
--where   k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101)
and k001.k0108=ZCPT_K001.k0108 and k001.k0108=ZCPT_K001.k0108 and  LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%' AND k001.A0102 LIKE '341%'and
(
rtrim(k001.HK0136)<>rtrim(zcpt_k001.HK0136)	or -- ·���շ�����,
rtrim(k001.HK0121)<>rtrim(zcpt_k001.HK0121)	or -- �Ƿ�ǹ�,
rtrim(k001.HK0156)<>rtrim(zcpt_k001.HK0156)	 -- ʡ�ʳ����,
)

--9.1.7
SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS �༭,
rtrim(k001.A0102)	'�걨|����λ����',rtrim(k001.hA0102)	'�걨|����λ����',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'�걨|·�߱���',	rtrim(zcpt_k001.k0101)	'�ʲ�ƽ̨|·�߱���',
rtrim(k001.A0103)	'�걨|��������',	rtrim(zcpt_k001.A0103)	'�ʲ�ƽ̨|��������',

rtrim(k001.hK0182)	'�걨|��������',
(case when rtrim(zcpt_k001.hK0182) = '·����ǰһ·�β�����' then '������·��'
		when rtrim(zcpt_k001.hK0182) = '��������ǰ��׮�Ų�����·������' then '����'
		when rtrim(zcpt_k001.hK0182) = '��ͷ·��' then '��ͷ·��'
		when rtrim(zcpt_k001.hK0182) = '����' then '����'
		when rtrim(zcpt_k001.hK0182) = '����·��' then '����·��'
		else null	end)  '�ʲ�ƽ̨|��������',
rtrim(k001.HK0123)	'�걨|�Ƿ��ͷ',	rtrim(zcpt_k001.HK0123) '�ʲ�ƽ̨|�Ƿ��ͷ',
case
when isnull(rtrim(k001.hK0182),'����·��')<>isnull(rtrim(zcpt_k001.hK0182),'����·��')	and isnull(rtrim(k001.HK0123),'��')=isnull(rtrim(zcpt_k001.HK0123),'��')		then '�������� ��һ��'
when isnull(rtrim(k001.hK0182),'����·��')=isnull(rtrim(zcpt_k001.hK0182),'����·��')	and isnull(rtrim(k001.HK0123),'��')<>isnull(rtrim(zcpt_k001.HK0123),'��')	then '�Ƿ��ͷ ��һ��'
else '��������/�Ƿ��ͷ ��һ��'end '�ԱȽ��'
from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
--where   k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101)
and k001.k0108=ZCPT_K001.k0108 and  LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%' AND k001.A0102 LIKE '341%'and
(
isnull(rtrim(k001.hK0182),'����·��')<>isnull(rtrim(zcpt_k001.hK0182),'����·��')	or -- ��������,
isnull(rtrim(k001.HK0123),'��')<>isnull(rtrim(zcpt_k001.HK0123),'��')	 -- �Ƿ��ͷ,
)

--9.1.8
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
			else ''
END '�ԱȽ��'
from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
-- where  k001.A0102 LIKE '34%' AND k001.A0102 LIKE '34%' and
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101)
and k001.k0108=ZCPT_K001.k0108 and  LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%' AND k001.A0102 LIKE '341%'and

(
isnull(left(k001.K0180,4),'0')<>isnull(left(zcpt_k001.K0180,4),'0')	or -- �޽����,
isnull(left(k001.K0181,4),'0')<>isnull(left(zcpt_k001.K0181,4),'0')	or -- �Ľ����,
isnull(left(k001.k0155,4),'0')<>isnull(left(zcpt_k001.k0155,4),'0') -- ���һ�δ��������,
)


--9.1.9
SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS �༭,
rtrim(k001.A0102)	'�걨|����λ����',rtrim(k001.hA0102)	'�걨|����λ����',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'�걨|·�߱���',	rtrim(zcpt_k001.k0101)	'�ʲ�ƽ̨|·�߱���',
rtrim(k001.A0103)	'�걨|��������',	rtrim(zcpt_k001.A0103)	'�ʲ�ƽ̨|��������',

rtrim(k001.HK5104)	'�걨|�������',	rtrim(zcpt_k001.HK5104)	'�ʲ�ƽ̨|�������',CASE 	WHEN rtrim(k001.HK5104)<>rtrim(zcpt_k001.HK5104) THEN '������� ��һ��' else ''END '������ͶԱ�',
k001.K4002	'�걨|·�����',	zcpt_k001.K4002	'�ʲ�ƽ̨|·�����',CASE when k001.K4002<>zcpt_k001.K4002 then '·����� ��һ��'else ''END'·����ȶԱ�',
k001.K5404	'�걨|·����',	zcpt_k001.K5404	'�ʲ�ƽ̨|·����',CASE when k001.K5404<>zcpt_k001.K5404 then '·���� ��һ��'else ''END'·���� �Ա�',
k001.K0306	'�걨|�����',	zcpt_k001.K0306	'�ʲ�ƽ̨|�����',CASE when k001.K0306<>zcpt_k001.K0306 then '����� ��һ��'else ''END'����ȶԱ�'

from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
  LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%' AND k001.A0102 LIKE '341%'and
(
rtrim(k001.HK5104)<>rtrim(zcpt_k001.HK5104)	or -- �������,
k001.K4002<>zcpt_k001.K4002	or -- ·�����,
k001.K5404<>zcpt_k001.K5404	or -- ·����,
k001.K0306<>zcpt_k001.K0306	 -- �����,
)

--9.1.10
SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS �༭,
rtrim(k001.A0102)	'�걨|����λ����',rtrim(k001.hA0102)	'�걨|����λ����',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'�걨|·�߱���',	rtrim(zcpt_k001.k0101)	'�ʲ�ƽ̨|·�߱���',
rtrim(k001.A0103)	'�걨|��������',	rtrim(zcpt_k001.A0103)	'�ʲ�ƽ̨|��������',
k001.k0108,ZCPT_K001.k0108,

rtrim(k001.HK0126)	'�걨|�Ƿ�һ������',	rtrim(zcpt_k001.HK0126)	'�ʲ�ƽ̨|�Ƿ�һ������',case when isnull(rtrim(k001.HK0126),'��')<>isnull(rtrim(zcpt_k001.HK0126),'��')		then '�Ƿ�һ������ ��һ��'else '' end '�Ƿ�һ�����ٶԱ�',
rtrim(k001.HK0304)	'�걨|�����ȼ�',	rtrim(LEFT(zcpt_k001.hK0304, 2))	'�ʲ�ƽ̨|�����ȼ�',case when rtrim(k001.hK0304)<>rtrim(LEFT(zcpt_k001.hK0304, 2))	then '�����ȼ� ��һ��' else '' end '�����ȼ��Ա�',
rtrim(k001.K0404)	'�걨|���ʱ��',	rtrim(zcpt_k001.K0404) '�ʲ�ƽ̨|���ʱ��(km/h)',case when rtrim(k001.K0404)<>isnull(rtrim(zcpt_k001.K0404),99999)		then '���ʱ�� ��һ��'else '' end '���ʱ�ٶԱ�',
k001.K5222	'�걨|��������',	zcpt_k001.K5222	'�ʲ�ƽ̨|��������',case when k001.K5222<>zcpt_k001.K5222		then '�������� ��һ��'else '' end '���������Ա�'

from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%'  and
rtrim(zcpt_k001.k0101)is not null and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%' AND k001.A0102 LIKE '341%'and
(
rtrim(k001.hK0304)<>rtrim(LEFT(zcpt_k001.hK0304, 2))	or -- �걨|�����ȼ�,
isnull(rtrim(k001.HK0126),'��')<>isnull(rtrim(zcpt_k001.HK0126),'��')	or -- �Ƿ�һ������,
rtrim(k001.K0404)<>isnull(rtrim(zcpt_k001.K0404),99999)	or -- ���ʱ��,
k001.K5222<>zcpt_k001.K5222	 -- ��������
)

--9.1.11
SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS �༭,

rtrim(k001.A0102)	'�걨|����λ����',rtrim(k001.hA0102)	'�걨|����λ����',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'�걨|·�߱���',	rtrim(zcpt_k001.k0101)	'�ʲ�ƽ̨|·�߱���',
rtrim(k001.A0103)	'�걨|��������',	rtrim(zcpt_k001.A0103)	'�ʲ�ƽ̨|��������',

rtrim(k001.K0112)	'�걨|·������',	rtrim(zcpt_k001.K0112)	'�ʲ�ƽ̨|·������',
k001.K0108 '���׮��',
rtrim(k001.K0110)	'�걨|���׮������',	rtrim(zcpt_k001.K0110)	'�ʲ�ƽ̨|���׮������',
rtrim(k001.K0111)	'�걨|ֹ��׮������',	rtrim(zcpt_k001.K0111)	'�ʲ�ƽ̨|ֹ��׮������',

case when rtrim(k001.K0110)=rtrim(zcpt_k001.K0110)	and rtrim(k001.K0111)<>rtrim(zcpt_k001.K0111)		then '���׮������ ��һ��'
when rtrim(k001.K0110)<>rtrim(zcpt_k001.K0110)	and rtrim(k001.K0111)=rtrim(zcpt_k001.K0111)		then 'ֹ��׮������ ��һ��'
else '���׮������/ֹ��׮������ ��һ��'end '�ԱȽ��'

from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
where  k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%' AND k001.A0102 LIKE '341%' and
(
rtrim(k001.K0112)<>rtrim(zcpt_k001.K0112) or
rtrim(k001.K0110)<>rtrim(zcpt_k001.K0110)	or
rtrim(k001.K0111)<>rtrim(zcpt_k001.K0111)
)

--9.1.12
SELECT
'K001'+'&A0102 ='''+RTRIM(CAST(k001.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k001.K0101 AS VARCHAR))+''' AND K0108 ='+RTRIM(CAST(k001.K0108 AS VARCHAR))  AS �༭,

rtrim(k001.A0102)	'�걨|����λ����',rtrim(k001.hA0102)	'�걨|����λ����',
rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))	'�걨|·�߱���',	rtrim(zcpt_k001.k0101)	'�ʲ�ƽ̨|·�߱���',
rtrim(k001.A0103)	'��������',

rtrim(k001.A0130)	'�걨|������λ',	rtrim(zcpt_k001.A0130)	'�ʲ�ƽ̨|������λ',
'������λ��һ��' '�ԱȽ��'
from K001
left join ZCPT_K001 on rtrim(k001.a0102)=rtrim(ZCPT_K001.a0102) and rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(ZCPT_K001.k0101) and k001.k0108=ZCPT_K001.k0108
where k001.A0102 LIKE '#A0102#%' AND k001.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%' AND k001.A0102 LIKE '341%' and
(
rtrim(k001.A0130)<>rtrim(zcpt_k001.A0130)	or
rtrim(k001.K0112)<>rtrim(zcpt_k001.K0112)
)

--9.3.1
SELECT distinct
RTRIM(K063.A0102) A0102,RTRIM(K063.HA0102) HA0102,
K063.K6302 '�������',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '�������',
'�걨�д��� �� �ʲ�ƽ̨������ ' '�ԱȽ��'
from k063
where rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 not in (select ZCPT_K063.SDDM from ZCPT_K063)
union
SELECT distinct
RTRIM(ZCPT_K063.A0102) A0102,RTRIM(ZCPT_K063.HA0102) HA0102,
ZCPT_K063.K6302 '�������',
ZCPT_K063.SDDM '�������',
'�ʲ�ƽ̨���� �� �걨�в����� ' '�ԱȽ��'
from ZCPT_K063
where ZCPT_K063.SDDM    not in (select rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 from K063 left join k001 on rtrim(k063.k0101)=rtrim(k001.k0101) and k063.k6324>=k001.k0108 and k063.k6324<=k001.k0109  where --K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%' AND k001.A0102 LIKE '341%'
)

--9.3.2
SELECT
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS �༭,
RTRIM(K001.A0102) A0102,RTRIM(K001.HA0102) HA0102,
K063.K6302 '�걨|�������',	ZCPT_K063.K6302 '�ʲ�ƽ̨|�������',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '�걨|�������',	ZCPT_K063.SDDM '�ʲ�ƽ̨|�������',

K063.K6303 '�걨|������׮��',	ZCPT_K063.K6303 '�ʲ�ƽ̨|������׮��',
K063.K0199 '�걨|��ע',	ZCPT_K063.K0199 '�ʲ�ƽ̨|��ע',
CASE 	when rtrim(K063.K6302)<>rtrim(ZCPT_K063.K6302) and rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+rtrim(k063.k6301)<>rtrim(ZCPT_K063.SDDM) and isnull(K063.K6303,0) <>isnull(ZCPT_K063.K6303,0)
then '�������/�������/������׮�� ��һ��'
			when rtrim(K063.K6302)<>rtrim(ZCPT_K063.K6302) and rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+rtrim(k063.k6301)<>rtrim(ZCPT_K063.SDDM) and isnull(K063.K6303,0) =isnull(ZCPT_K063.K6303,0)
then '�������/������� ��һ��'
			when rtrim(K063.K6302)<>rtrim(ZCPT_K063.K6302) and rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+rtrim(k063.k6301)=rtrim(ZCPT_K063.SDDM)  and isnull(K063.K6303,0) <>isnull(ZCPT_K063.K6303,0)
then '�������/������׮�� ��һ��'
			when rtrim(K063.K6302)<>rtrim(ZCPT_K063.K6302)  and rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+rtrim(k063.k6301)<>rtrim(ZCPT_K063.SDDM) and isnull(K063.K6303,0) <>isnull(ZCPT_K063.K6303,0)
then '�������/������׮�� ��һ��'
			WHEN rtrim(K063.K6302)<>rtrim(ZCPT_K063.K6302) and rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+rtrim(k063.k6301)=rtrim(ZCPT_K063.SDDM) and isnull(K063.K6303,0) =isnull(ZCPT_K063.K6303,0)
THEN '������� ��һ��'
      when rtrim(K063.K6302)=rtrim(ZCPT_K063.K6302)  and rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+rtrim(k063.k6301)<>rtrim(ZCPT_K063.SDDM) and isnull(K063.K6303,0) =isnull(ZCPT_K063.K6303,0)
then '������� ��һ��'
			when rtrim(K063.K6302)=rtrim(ZCPT_K063.K6302) and rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+rtrim(k063.k6301)=rtrim(ZCPT_K063.SDDM) and isnull(K063.K6303,0) <>isnull(ZCPT_K063.K6303,0)
then '������׮�� ��һ��'
			else ''
END '�ԱȽ��'

from ZCPT_K063
left join k063 on ZCPT_K063.SDDM= rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301
left join k001 on rtrim(k063.k0101)=rtrim(k001.k0101) and k063.k6324>=k001.k0108 and k063.k6324<=k001.k0109
--where   k063.A0102 LIKE '34%' AND k063.A0102 LIKE '34%' and
where K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%' AND k001.A0102 LIKE '341%' and

(
rtrim(K063.K6302) <>rtrim(ZCPT_K063.K6302) or --�������
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+rtrim(k063.k6301) <> rtrim(ZCPT_K063.SDDM) or --�������
isnull(K063.K6303,0) <> isnull(ZCPT_K063.K6303,0)  --������׮��
)
ORDER BY  sddm

--9.3.3
SELECT
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS �༭,
RTRIM(K001.A0102) A0102 ,RTRIM(K001.HA0102) HA0102,
K063.K6302 '�걨|�������',	ZCPT_K063.K6302 '�ʲ�ƽ̨|�������',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '�걨|�������',	ZCPT_K063.SDDM '�ʲ�ƽ̨|�������',

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

--9.3.4
SELECT
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS �༭,
RTRIM(K001.A0102) A0102,RTRIM(K001.HA0102) HA0102,
K063.K6302 '�걨|�������',	ZCPT_K063.K6302 '�ʲ�ƽ̨|�������',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '�걨|�������',	ZCPT_K063.SDDM '�ʲ�ƽ̨|�������',

K063.K6305 '�걨|�������(��)',	ZCPT_K063.K6305 '�ʲ�ƽ̨|�������(��)',
K063.K6306 '�걨|�������(��)',	ZCPT_K063.K6306 '�ʲ�ƽ̨|�������(��)',
K063.K6307 '�걨|�������(��)',	ZCPT_K063.K6307 '�ʲ�ƽ̨|�������(��)',
K063.K0199 '�걨|��ע',	ZCPT_K063.K0199 '�ʲ�ƽ̨|��ע',

CASE 	when isnull(K063.K6305,0)<>isnull(ZCPT_K063.K6305,0) and isnull(K063.K6306,0)<>isnull(ZCPT_K063.K6306,0) and isnull(K063.K6307,0)<>isnull(ZCPT_K063.K6307,0)
then '�������(��)/�������(��)/�������(��) ��һ��'
			when isnull(K063.K6305,0)<>isnull(ZCPT_K063.K6305,0) and isnull(K063.K6306,0)<>isnull(ZCPT_K063.K6306,0) and isnull(K063.K6307,0)=isnull(ZCPT_K063.K6307,0)
then '�������(��)/�������(��) ��һ��'
			when isnull(K063.K6305,0)<>isnull(ZCPT_K063.K6305,0) and isnull(K063.K6306,0)=isnull(ZCPT_K063.K6306,0)  and isnull(K063.K6307,0)<>isnull(ZCPT_K063.K6307,0)
then '�������(��)/�������(��) ��һ��'
			when isnull(K063.K6305,0)<>isnull(ZCPT_K063.K6305,0) and isnull(K063.K6306,0)<>isnull(ZCPT_K063.K6306,0) and isnull(K063.K6307,0)<>isnull(ZCPT_K063.K6307,0)
then '�������(��)/�������(��) ��һ��'
			WHEN isnull(K063.K6305,0)<>isnull(ZCPT_K063.K6305,0) and isnull(K063.K6306,0)=isnull(ZCPT_K063.K6306,0) and isnull(K063.K6307,0)=isnull(ZCPT_K063.K6307,0)
THEN '�������(��) ��һ��'
      when isnull(K063.K6305,0)=isnull(ZCPT_K063.K6305,0)  and isnull(K063.K6306,0)<>isnull(ZCPT_K063.K6306,0) and isnull(K063.K6307,0)=isnull(ZCPT_K063.K6307,0)
then '�������(��) ��һ��'
			when isnull(K063.K6305,0)=isnull(ZCPT_K063.K6305,0) and isnull(K063.K6306,0)=isnull(ZCPT_K063.K6306,0) and isnull(K063.K6307,0)<>isnull(ZCPT_K063.K6307,0)
then '�������(��) ��һ��'
			else ''
END '�ԱȽ��'

from ZCPT_K063
left join k063 on ZCPT_K063.SDDM= rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301
left join k001 on rtrim(k063.k0101)=rtrim(k001.k0101) and k063.k6324>=k001.k0108 and k063.k6324<=k001.k0109
--where   k063.A0102 LIKE '34%' AND k063.A0102 LIKE '34%' and
where K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%' AND k001.A0102 LIKE '341%' and
(
isnull(K063.K6305,0) <>isnull(ZCPT_K063.K6305,0) or --�������(��)
isnull(K063.K6306,0) <>isnull(ZCPT_K063.K6306,0) or --�������(��)
isnull(K063.K6307,0) <>isnull(ZCPT_K063.K6307,0) --�������(��)
)
ORDER BY  sddm


--9.3.5
SELECT
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS �༭,
RTRIM(K001.A0102) A0102,RTRIM(K001.HA0102) HA0102,
K063.K6302 '�걨|�������',	ZCPT_K063.K6302 '�ʲ�ƽ̨|�������',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '�걨|�������',	ZCPT_K063.SDDM '�ʲ�ƽ̨|�������',

K063.K6304 '�걨|��������ȷ������',	ZCPT_K063.K6304 '�ʲ�ƽ̨|��������ȷ������',
K063.hK6304 '�걨|��������ȷ��຺��',	ZCPT_K063.hK6304 '�ʲ�ƽ̨|��������ȷ��຺�� ',
K063.hK6355 '�걨|�Ƿ��ڳ������Ŀ¼��',	ZCPT_K063.K6355 '�ʲ�ƽ̨|�Ƿ��ڳ������Ŀ¼��',
K063.K0199 '�걨|��ע',	ZCPT_K063.K0199 '�ʲ�ƽ̨|��ע',

CASE 	when rtrim(K063.K6304)<>rtrim(ZCPT_K063.K6304) and rtrim(K063.hK6304)<>rtrim(ZCPT_K063.hK6304) and rtrim(K063.hK6355) <>rtrim(ZCPT_K063.K6355)
then '��������ȷ������/��������ȷ��຺��/�Ƿ��ڳ������Ŀ¼�� ��һ��'
			when rtrim(K063.K6304)<>rtrim(ZCPT_K063.K6304) and rtrim(K063.hK6304)<>rtrim(ZCPT_K063.hK6304) and rtrim(K063.hK6355) =rtrim(ZCPT_K063.K6355)
then '��������ȷ������/��������ȷ��຺�� ��һ��'
			when rtrim(K063.K6304)<>rtrim(ZCPT_K063.K6304) and rtrim(K063.hK6304)=rtrim(ZCPT_K063.hK6304)  and rtrim(K063.hK6355) <>rtrim(ZCPT_K063.K6355)
then '��������ȷ������/�Ƿ��ڳ������Ŀ¼�� ��һ��'
			when rtrim(K063.K6304)<>rtrim(ZCPT_K063.K6304)  and rtrim(K063.hK6304)<>rtrim(ZCPT_K063.hK6304) and rtrim(K063.hK6355) <>rtrim(ZCPT_K063.K6355)
then '��������ȷ��຺��/�Ƿ��ڳ������Ŀ¼�� ��һ��'
			WHEN rtrim(K063.K6304)<>rtrim(ZCPT_K063.K6304) and rtrim(K063.hK6304)=rtrim(ZCPT_K063.hK6304) and rtrim(K063.hK6355) =rtrim(ZCPT_K063.K6355)
THEN '��������ȷ������ ��һ��'
      when rtrim(K063.K6304)=rtrim(ZCPT_K063.K6304)  and rtrim(K063.hK6304)<>rtrim(ZCPT_K063.hK6304) and rtrim(K063.hK6355) =rtrim(ZCPT_K063.K6355)
then '��������ȷ��຺�� ��һ��'
			when rtrim(K063.K6304)=rtrim(ZCPT_K063.K6304) and rtrim(K063.hK6304)=rtrim(ZCPT_K063.hK6304) and rtrim(K063.hK6355) <>rtrim(ZCPT_K063.K6355)
then '�Ƿ��ڳ������Ŀ¼�� ��һ��'
			else ''
END '�ԱȽ��'



from ZCPT_K063
left join k063 on ZCPT_K063.SDDM= rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301
left join k001 on rtrim(k063.k0101)=rtrim(k001.k0101) and k063.k6324>=k001.k0108 and k063.k6324<=k001.k0109
--where   k063.A0102 LIKE '34%' AND k063.A0102 LIKE '34%' and
where K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%' AND k001.A0102 LIKE '341%' and
(
rtrim(K063.K6304) <>	rtrim(ZCPT_K063.K6304) or --��������ȷ������',
rtrim(K063.hK6304) <>	rtrim(ZCPT_K063.hK6304) or --��������ȷ��຺�� ',
rtrim(K063.hK6355) <>	rtrim(ZCPT_K063.K6355)  -- �Ƿ��ڳ������Ŀ¼��',
)

ORDER BY  sddm

--9.3.6
SELECT
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS �༭,
RTRIM(K001.A0102) A0102,RTRIM(K001.HA0102) HA0102,
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
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%' AND k001.A0102 LIKE '341%' and
(
K063.hK6335 <>	ZCPT_K063.K6335 or --�Ƿ�ˮ�����',
K063.hK6371 <>	ZCPT_K063.K6371  --�Ƿ��ʡ���',
)
ORDER BY  sddm

--9.3.7
SELECT
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS �༭,
RTRIM(K001.A0102) A0102,RTRIM(K001.HA0102) HA0102,
K063.K6302 '�걨|�������',	ZCPT_K063.K6302 '�ʲ�ƽ̨|�������',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '�걨|�������',	ZCPT_K063.SDDM '�ʲ�ƽ̨|�������',

K063.HK6343 '�걨|��������ȼ�',	ZCPT_K063.K6343 '�ʲ�ƽ̨|��������ȼ�',
K063.K0199 '�걨|��ע',	ZCPT_K063.K0199 '�ʲ�ƽ̨|��ע',
'��������ȼ� ��һ��' AS '�ԱȽ��'

from ZCPT_K063
left join k063 on ZCPT_K063.SDDM= rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301
left join k001 on rtrim(k063.k0101)=rtrim(k001.k0101) and k063.k6324>=k001.k0108 and k063.k6324<=k001.k0109
--where   k063.A0102 LIKE '34%' AND k063.A0102 LIKE '34%' and
where K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%' AND k001.A0102 LIKE '341%' and
(
K063.HK6343<>	ZCPT_K063.K6343 --��������ȼ�',
)
ORDER BY  sddm

--9.3.8
SELECT
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS �༭,
RTRIM(K001.A0102) A0102,RTRIM(K001.HA0102) HA0102,
K063.K6302 '�걨|�������',	ZCPT_K063.K6302 '�ʲ�ƽ̨|�������',
rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301 '�걨|�������',	ZCPT_K063.SDDM '�ʲ�ƽ̨|�������',

RTRIM(K063.K6079) '�걨|���赥λ����',	RTRIM(ZCPT_K063.K6079) '�ʲ�ƽ̨|���赥λ����',CASE WHEN RTRIM(K063.K6079) <>	RTRIM(ZCPT_K063.K6079) THEN '���赥λ���� ��һ��' else null end '���赥λ���� �Ա�',
RTRIM(K063.K6030) '�걨|��Ƶ�λ����',	RTRIM(ZCPT_K063.K6030) '�ʲ�ƽ̨|��Ƶ�λ����',CASE WHEN RTRIM(K063.K6030) <>	RTRIM(ZCPT_K063.K6030) THEN '��Ƶ�λ���� ��һ��' else null end '��Ƶ�λ���� �Ա�',
RTRIM(K063.K6031) '�걨|ʩ����λ����',	RTRIM(ZCPT_K063.K6031) '�ʲ�ƽ̨|ʩ����λ����',CASE WHEN RTRIM(K063.K6031) <>	RTRIM(ZCPT_K063.K6031) THEN 'ʩ����λ���� ��һ��' else null end 'ʩ����λ���� �Ա�',
RTRIM(K063.K6032) '�걨|����λ����',	RTRIM(ZCPT_K063.K6032) '�ʲ�ƽ̨|����λ����',CASE WHEN RTRIM(K063.K6032) <>	RTRIM(ZCPT_K063.K6032) THEN '����λ���� ��һ��' else null end '����λ���� �Ա�',
RTRIM(K063.K0116) '�걨|����ͨ��ʱ��',	RTRIM(ZCPT_K063.K0116) '�ʲ�ƽ̨|����ͨ��ʱ��',CASE WHEN RTRIM(K063.K0116) <>	RTRIM(ZCPT_K063.K0116) THEN '����ͨ��ʱ�� ��һ��' else null end '����ͨ��ʱ�� �Ա�',
K063.K0199 '�걨|��ע',	ZCPT_K063.K0199 '�ʲ�ƽ̨|��ע'

from ZCPT_K063
left join k063 on ZCPT_K063.SDDM= rtrim(replace(replace(replace(replace(replace(k063.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k063.a0103,6)+'U'+k063.k6301
left join k001 on rtrim(k063.k0101)=rtrim(k001.k0101) and k063.k6324>=k001.k0108 and k063.k6324<=k001.k0109
--where   k063.A0102 LIKE '34%' AND k063.A0102 LIKE '34%' and
where K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%' AND k001.A0102 LIKE '341%' and
(
RTRIM(K063.K6079) <>	RTRIM(ZCPT_K063.K6079) OR --���赥λ����',
RTRIM(K063.K6030) <>	RTRIM(ZCPT_K063.K6030) OR --��Ƶ�λ����',
RTRIM(K063.K6031) <>	RTRIM(ZCPT_K063.K6031) OR --ʩ����λ����',
RTRIM(K063.K6032) <>	RTRIM(ZCPT_K063.K6032) OR --����λ����',
RTRIM(K063.K0116) <>	RTRIM(ZCPT_K063.K0116)  --����ͨ��ʱ��',
)
ORDER BY  sddm

--9.3.9
SELECT
'K063'+'&A0102 ='''+RTRIM(CAST(k063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(CAST(k063.K6301 AS VARCHAR))  AS �༭,
RTRIM(K001.A0102) A0102,RTRIM(K001.HA0102) HA0102,
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
where --K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%' AND k001.A0102 LIKE '341%' and
(
K063.A1313 <>ZCPT_K063.A1313 OR--��λ���ʴ���',
K063.A0130 <>ZCPT_K063.A0130 OR--������λ����',
K063.K6111 <>	ZCPT_K063.K6111 --��ܵ�λ����'
)
ORDER BY  sddm

--9.3.10
select 'K063'+'&A0102 ='''+RTRIM(CAST(K063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(K063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(right(CAST(K063.K6301 AS VARCHAR),4))  AS �༭,
a0102,ha0102,K6302,k0101,k6301,K6303,
hK6336 ,ZCPT���������ȼ�,case when isnull(hK6336,'')<>isnull(ZCPT���������ȼ�,'null') then '���������ȼ���һ��' else null end ���������ȼ��Ա�,
K6344 ,ZCPT������������,case when isnull(K6344,'')<>isnull(ZCPT������������,'null') then '�����������ڲ�һ��' else null end �����������ڶԱ�,
K6345 ,ZCPT����������λ,case when isnull(K6345,'')<>isnull(ZCPT����������λ,'null') then '����������λ��һ��' else null end ����������λ�Ա�,
hK6346 ,ZCPT���������ȼ�,case when isnull(hK6346,'')<>isnull(ZCPT���������ȼ�,'null') then '���������ȼ���һ��' else null end ���������ȼ��Ա�,
K6347 ,ZCPT������������,case when isnull(K6347,'')<>isnull(ZCPT������������,'null') then '�����������ڲ�һ��' else null end �����������ڶԱ�,
K6348 ,ZCPT����������λ,case when isnull(K6348,'')<>isnull(ZCPT����������λ,'null') then '����������λ��һ��' else null end ����������λ�Ա�,
hK6349 ,ZCPT���������ȼ�,case when isnull(hK6349,'')<>isnull(ZCPT���������ȼ�,'null') then '���������ȼ���һ��' else null end ���������ȼ��Ա�,
K6350 ,ZCPT������������,case when isnull(K6350,'')<>isnull(ZCPT������������,'null') then '�����������ڲ�һ��' else null end �����������ڶԱ�,
K6351 ,ZCPT����������λ,case when isnull(K6351,'')<>isnull(ZCPT����������λ,'null') then '����������λ��һ��' else null end ����������λ�Ա�,
hK6352 ,ZCPT���������ȼ�,case when isnull(hK6352,'')<>isnull(ZCPT���������ȼ�,'null') then '���������ȼ���һ��' else null end ���������ȼ��Ա�,
K6353 ,ZCPT������������,case when isnull(K6353,'')<>isnull(ZCPT������������,'null') then '�����������ڲ�һ��' else null end �����������ڶԱ�,
K6354 ,ZCPT����������λ,case when isnull(K6354,'')<>isnull(ZCPT����������λ,'null') then '����������λ��һ��' else null end ����������λ�Ա�
from (
select rtrim(a.a0102) a0102,rtrim(a.ha0102) ha0102,rtrim(a.K6302) K6302,rtrim(a.k0101) k0101,
rtrim(replace(replace(replace(replace(replace(a.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(a.a0103,6)+'U'+a.k6301 k6301,
a.K6303,
a.hK6336,case when isnull(b.hK6336,0)='1' then 'һ��' when isnull(b.hK6336,0)='2' then '����'  when isnull(b.hK6336,0)='3' then '����' when isnull(b.hK6336,0)='3' then '����' when isnull(b.hK6336,0)='5' then '����' else null end 'ZCPT���������ȼ�',
a.K6344,b.K6344 'ZCPT������������',
rtrim(a.K6345) K6345,rtrim(b.K6345) 'ZCPT����������λ',
a.hK6346,case when isnull(b.hK6346,0)='1' then 'һ��' when isnull(b.hK6346,0)='2' then '����'  when isnull(b.hK6346,0)='3' then '����' when isnull(b.hK6346,0)='3' then '����' when isnull(b.hK6346,0)='5' then '����' else null end 'ZCPT���������ȼ�',
a.K6347,b.K6347 'ZCPT������������',
rtrim(a.K6348) K6348,rtrim(b.K6348) 'ZCPT����������λ',
a.hK6349,case when isnull(b.hK6349,0)='1' then 'һ��' when isnull(b.hK6349,0)='2' then '����'  when isnull(b.hK6349,0)='3' then '����' when isnull(b.hK6349,0)='3' then '����' when isnull(b.hK6349,0)='5' then '����' else null end 'ZCPT���������ȼ�',
a.K6350,b.K6350 'ZCPT������������',
rtrim(a.K6351) K6351,rtrim(b.K6351) 'ZCPT����������λ',
a.hK6352,case when isnull(b.hK6352,0)='1' then 'һ��' when isnull(b.hK6352,0)='2' then '����'  when isnull(b.hK6352,0)='3' then '����' when isnull(b.hK6352,0)='3' then '����' when isnull(b.hK6352,0)='5' then '����' else null end 'ZCPT���������ȼ�',
a.K6353,b.K6353 'ZCPT������������',
rtrim(a.K6354) K6354,rtrim(b.K6354) 'ZCPT����������λ'
from K063 a inner join ZCPT_K063 b on rtrim(replace(replace(replace(replace(replace(a.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(a.a0103,6)+'U'+a.k6301=rtrim(b.SDDM)
) K063
where  K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and

COALESCE(case when isnull(hK6336,'')<>isnull(ZCPT���������ȼ�,'null') then '���������ȼ���һ��' else null end ,
case when isnull(K6344,'')<>isnull(ZCPT������������,'null') then '�����������ڲ�һ��' else null end,
case when isnull(K6345,'')<>isnull(ZCPT����������λ,'null') then '����������λ��һ��' else null end ,
case when isnull(hK6346,'')<>isnull(ZCPT���������ȼ�,'null') then '���������ȼ���һ��' else null end,
case when isnull(K6347,'')<>isnull(ZCPT������������,'null') then '�����������ڲ�һ��' else null end,
case when isnull(K6348,'')<>isnull(ZCPT����������λ,'null') then '����������λ��һ��' else null end,
case when isnull(hK6349,'')<>isnull(ZCPT���������ȼ�,'null') then '���������ȼ���һ��' else null end,
case when isnull(K6350,'')<>isnull(ZCPT������������,'null') then '�����������ڲ�һ��' else null end,
case when isnull(K6351,'')<>isnull(ZCPT����������λ,'null') then '����������λ��һ��' else null end,
case when isnull(hK6352,'')<>isnull(ZCPT���������ȼ�,'null') then '���������ȼ���һ��' else null end,
case when isnull(K6353,'')<>isnull(ZCPT������������,'null') then '�����������ڲ�һ��' else null end,
case when isnull(K6354,'')<>isnull(ZCPT����������λ,'null') then '����������λ��һ��' else null end
)  like '%��һ��%'
order by K063.k6301

--9.3.11
select 'K063'+'&A0102 ='''+RTRIM(CAST(K063.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(K063.K0101 AS VARCHAR))+''' AND K6301 ='+RTRIM(right(CAST(K063.K6301 AS VARCHAR),4))  AS �༭,
a0102,ha0102,K6302,k0101,k6301,K6303,
K0181 ,ZCPT�������,case when isnull(K0181,'')<>isnull(ZCPT�������,'null') then '������Ȳ�һ��' else null end ������ȶԱ�,
A1316 ,ZCPT�깤����,case when isnull(A1316,'')<>isnull(ZCPT�깤����,'null') then '�깤���ڲ�һ��' else null end �깤���ڶԱ�,
K6337 ,ZCPT���첿λ,case when isnull(K6337,'')<>isnull(ZCPT���첿λ,'null') then '���첿λ��һ��' else null end ���첿λ�Ա�,
A1318 ,ZCPT��������,case when isnull(A1318,'')<>isnull(ZCPT��������,'null') then '�������ʲ�һ��' else null end �������ʶԱ�,
K6338 ,ZCPT������λ,case when isnull(K6338,'')<>isnull(ZCPT������λ,'null') then '������λ��һ��' else null end ������λ�Ա�,
K6339 ,ZCPT��������,case when isnull(K6339,'')<>isnull(ZCPT��������,'null') then '����������һ��' else null end ���������Ա�

from (
select rtrim(a.a0102) a0102,rtrim(a.ha0102) ha0102,rtrim(a.K6302) K6302,rtrim(a.k0101) k0101,
rtrim(replace(replace(replace(replace(replace(a.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(a.a0103,6)+'U'+a.k6301 k6301,
a.K6303,
a.K0181,b.K0181 'ZCPT�������',
rtrim(a.A1316) A1316,rtrim(b.A1316) 'ZCPT�깤����',
a.K6337,b.K6337 'ZCPT���첿λ',
rtrim(a.A1318) A1318,rtrim(b.A1318) 'ZCPT��������',
a.K6338,b.K6338 'ZCPT������λ',
rtrim(a.K6339) K6339,rtrim(b.K6339) 'ZCPT��������'

from K063 a inner join ZCPT_K063 b on rtrim(replace(replace(replace(replace(replace(a.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(a.a0103,6)+'U'+a.k6301=rtrim(b.SDDM)
) K063
where K063.A0102 LIKE '#A0102#%' AND K063.A0102 LIKE '#GLDW#%' and
COALESCE(
case when isnull(K0181,'')<>isnull(ZCPT�������,'null') then '������Ȳ�һ��' else null end,
case when isnull(A1316,'')<>isnull(ZCPT�깤����,'null') then '�깤���ڲ�һ��' else null end,
case when isnull(K6337,'')<>isnull(ZCPT���첿λ,'null') then '���첿λ��һ��' else null end,
case when isnull(A1318,'')<>isnull(ZCPT��������,'null') then '�������ʲ�һ��' else null end,
case when isnull(K6338,'')<>isnull(ZCPT������λ,'null') then '������λ��һ��' else null end,
case when isnull(K6339,'')<>isnull(ZCPT��������,'null') then '����������һ��' else null end
)  like '%��һ��%'
order by K063.k6301


--9.2.1
SELECT distinct
RTRIM(k060.A0102) A0102,RTRIM(k060.HA0102) HA0102,
k060.K6002 '��������',
case when left(k060.k0101,1)in ('H','G','T','S') then rtrim(replace(replace(replace(replace(replace(replace(replace(k060.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001)
else left(k060.k0101,4)+left(k060.a0103,6)+'L'+rtrim(k060.k6001) end '��������',
'�걨�д��� �� �ʲ�ƽ̨������ ' '�ԱȽ��'
from k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
where k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%' AND k001.A0102 LIKE '341%'and
(case when left(k060.k0101,1)in ('H','G','T','S') then rtrim(replace(replace(replace(replace(replace(replace(replace(k060.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001)
else left(k060.k0101,4)+left(k060.a0103,6)+'L'+rtrim(k060.k6001) end)  not in (select ZCPT_K060.k6001 from ZCPT_K060)

union

SELECT distinct
t.a0102 ,null,
ZCPT_K060.K6002 '��������',
ZCPT_K060.k6001 '��������',
'�ʲ�ƽ̨���� �� �걨�в����� ' '�ԱȽ��'
from ZCPT_K060
left join (SELECT distinct
case when left(k060.k0101,1)in ('H','G','T','S') then rtrim(replace(replace(replace(replace(replace(replace(replace(k060.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001)
else left(k060.k0101,4)+left(k060.a0103,6)+'L'+rtrim(k060.k6001) end  k6001,k060.a0102
from k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
where  k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(K001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%' AND k001.A0102 LIKE '341%'
)t on ZCPT_K060.k6001=t.k6001
where ZCPT_K060.A0102 LIKE '#A0102#%' AND ZCPT_K060.A0102 LIKE '#GLDW#%' and
 t.a0102 is null
order by '�ԱȽ��'

--9.2.2
SELECT  'K060'+'&A0102 ='''+RTRIM(CAST(k060.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k060.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(k060.K6003 AS VARCHAR))  AS �༭,
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(k060.k6002) '�걨|��������',rtrim(ZCPT_K060.k6002) '�ʲ�ƽ̨|��������',
rtrim(k060.k6003) '�걨|��������׮��',rtrim(ZCPT_K060.k6003) '�ʲ�ƽ̨|��������׮��',
rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) '�걨|��������',
rtrim(ZCPT_K060.k6001) '�ʲ�ƽ̨|��������',
rtrim(K060.K6040) nk6040,rtrim(ZCPT_K060.K6040) zk6040,
'��������� ��һ��' '�ԱȽ��'
from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where --k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
rtrim(K060.K6040) <>rtrim(ZCPT_K060.K6040) and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'


--9.2.3
SELECT
'K060'+'&A0102 ='''+RTRIM(CAST(k060.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(k060.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(k060.K6003 AS VARCHAR))  AS �༭,
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(replace(replace(k060.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) '�걨|·�߱���',
rtrim(ZCPT_K060.K0101) '�ʲ�ƽ̨|·�߱���',

(case when left(k060.k0101,1)in ('H','G','T','S') then rtrim(replace(replace(replace(replace(replace(replace(replace(k060.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001)
else left(k060.k0101,4)+left(k060.a0103,6)+'L'+rtrim(k060.k6001) end) '�걨|��������',rtrim(ZCPT_K060.k6001) '�ʲ�ƽ̨|��������',
rtrim(k060.k6002) '�걨|��������',rtrim(ZCPT_K060.k6002) '�ʲ�ƽ̨|��������',
rtrim(k060.k6003) '�걨|��������׮��',rtrim(ZCPT_K060.k6003) '�ʲ�ƽ̨|��������׮��',

case WHEN rtrim(k060.k6002)<>rtrim(ZCPT_K060.k6002) and rtrim(k060.k6003)=rtrim(ZCPT_K060.k6003) then '�������� ��һ��'
WHEN rtrim(k060.k6002)=rtrim(ZCPT_K060.k6002) and rtrim(k060.k6003)<>rtrim(ZCPT_K060.k6003) then '��������׮�� ��һ��'
else '��������/��������׮�� ��һ��' END '�ԱȽ��'

from k060
left join ZCPT_K060 on
(case when left(k060.k0101,1)in ('H','G','T','S') then rtrim(replace(replace(replace(replace(replace(replace(replace(k060.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001)
else left(k060.k0101,4)+left(k060.a0103,6)+'L'+rtrim(k060.k6001) end) = rtrim(ZCPT_K060.k6001)
where  --k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(K060.K0101,1) IN ('G','S') and rtrim(k060.k0112) not like '%����%'AND k060.A0102 LIKE '341%' and
(
rtrim(k060.k6002)<>rtrim(ZCPT_K060.k6002) or -- ��������,
rtrim(k060.k6003)<>rtrim(ZCPT_K060.k6003)	 -- ��������׮��,
)

--9.2.3
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,rtrim(NBZC.zk0101)'�ʲ�ƽ̨|����·�ߴ���',
CASE WHEN rtrim(NBZC.k0101)<>rtrim(NBZC.zk0101) THEN '����·�ߴ��� ��һ��'	ELSE null END '����·�ߴ��� �Ա�',
rtrim(NBZC.k6002) k6002,rtrim(NBZC.zk6002) '�ʲ�ƽ̨|��������',
CASE WHEN rtrim(NBZC.k6002)<>rtrim(NBZC.zk6002) THEN '�������� ��һ��'	ELSE null END '�������� �Ա�',
rtrim(NBZC.k6003) k6003,rtrim(NBZC.zk6003) '�ʲ�ƽ̨|��������׮��',
CASE WHEN rtrim(NBZC.k6003)<>rtrim(NBZC.zk6003) THEN '��������׮�� ��һ��'	ELSE null END'��������׮�� �Ա�',
nbzc.K6040 '���������/�������'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,
rtrim(ZCPT_K060.K0101) zK0101,
rtrim(k060.k6002) k6002,rtrim(ZCPT_K060.k6002) zk6002,
rtrim(k060.k6003) k6003,rtrim(ZCPT_K060.k6003) zk6003,
rtrim(K060.K6040) K6040
from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,
rtrim(ZCPT_K060.K0101) zK0101,
rtrim(k060.k6002) k6002,rtrim(ZCPT_K060.k6002) zk6002,
rtrim(k060.k6003) k6003,rtrim(ZCPT_K060.k6003) zk6003,
rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001
from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and(
rtrim(NBZC.k6002)<>rtrim(NBZC.zk6002) or -- ��������,
rtrim(NBZC.k6003)<>rtrim(NBZC.zk6003) or -- ��������׮��
rtrim(NBZC.k0101)<>rtrim(NBZC.zk0101)
)	 -- ·�ߴ���,
order by k0101

--9.2.4
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,
NBZC.K6003 k6003,
NBZC.k6063 k6063,NBZC.zk6063 '�ʲ�ƽ̨|�������羶',
CASE WHEN k6063<>zk6063 THEN '�������羶 ��һ��'	ELSE null END'�������羶 �Ա�',
NBZC.k6064 k6064,NBZC.zk6064 '�ʲ�ƽ̨|�����羶���',
CASE WHEN k6064<>zk6064 THEN '�����羶��� ��һ��'	ELSE null END'�����羶��� �Ա�',
nbzc.K6040 '���������/�������'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.k6063) k6063,rtrim(ZCPT_K060.k6063) zk6063,
rtrim(k060.k6064) k6064,rtrim(ZCPT_K060.k6064) zk6064

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.k6063) k6063,rtrim(ZCPT_K060.k6063) zk6063,
rtrim(k060.k6064) k6064,rtrim(ZCPT_K060.k6064) zk6064

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.k6063)<>rtrim(NBZC.zk6063)	or -- �������羶,
rtrim(NBZC.k6064)<>rtrim(NBZC.zk6064)	 -- �����羶���,
)
order by k0101

--9.2.5
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,
NBZC.K6003 k6003,
NBZC.K6007 K6007,NBZC.zK6007 '�ʲ�ƽ̨|�����羶�������',
CASE WHEN K6007<>zK6007 THEN '�����羶������� ��һ��'	ELSE null END'�����羶������� �Ա�',
NBZC.HK6007 HK6007,NBZC.zHK6007 '�ʲ�ƽ̨|�����羶����',
CASE WHEN HK6007<>zHK6007 THEN '�����羶���� ��һ��'	ELSE null END'�����羶���� �Ա�',
NBZC.K6004 K6004,NBZC.zK6004 '�ʲ�ƽ̨|��ʹ�����޷ִ���',
CASE WHEN K6004<>zK6004 THEN '��ʹ�����޷ִ��� ��һ��'	ELSE null END'��ʹ�����޷ִ��� �Ա�',
NBZC.HK6004 HK6004,NBZC.zHK6004 '�ʲ�ƽ̨|��ʹ�����޷ֺ���',
CASE WHEN REPLACE(HK6004, '��', '')<>zHK6004 THEN '��ʹ�����޷ֺ��� ��һ��'	ELSE null END'��ʹ�����޷ֺ��� �Ա�',
nbzc.K6040 '���������/�������'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.K6007)K6007,rtrim(ZCPT_K060.K6007) zK6007,
rtrim(k060.HK6007)HK6007,rtrim(ZCPT_K060.HK6007)	zHK6007,
rtrim(k060.K6004)K6004,rtrim(ZCPT_K060.K6004)	zK6004,
rtrim(k060.HK6004)HK6004,rtrim(ZCPT_K060.HK6004)	zHK6004

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.K6007)K6007,rtrim(ZCPT_K060.K6007) zK6007,
rtrim(k060.HK6007)HK6007,rtrim(ZCPT_K060.HK6007)	zHK6007,
rtrim(k060.K6004)K6004,rtrim(ZCPT_K060.K6004)	zK6004,
rtrim(k060.HK6004)HK6004,rtrim(ZCPT_K060.HK6004)	zHK6004

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where
NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
rtrim(NBZC.K6007)<>rtrim(NBZC.zK6007) or --  �����羶�������,
rtrim(NBZC.HK6007)<>rtrim(NBZC.zHK6007)	or--  �����羶����,
rtrim(NBZC.K6004)<>rtrim(NBZC.zK6004)	or --  ��ʹ�����޷ִ���,
REPLACE(HK6004, '��', '')<>zHK6004
)
order by k0101

--9.2.6
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,
NBZC.K6003 k6003,
NBZC.K6017 k6017,NBZC.zk6017 '�ʲ�ƽ̨|�Ŷ����ʹ���',
CASE WHEN k6017<>zk6017 THEN '�Ŷ����ʹ��� ��һ��'	ELSE null END'�Ŷ����ʹ��� �Ա�',
NBZC.hk6017 hk6017,NBZC.zhk6017 '�ʲ�ƽ̨|�Ŷ�����',
CASE WHEN hk6017<>zhk6017 THEN '�Ŷ����� ��һ��'	ELSE null END'�Ŷ����� �Ա�',
NBZC.k6022 k6022,NBZC.zk6022 '�ʲ�ƽ̨|��ƺ��صȼ�����',
CASE WHEN k6022<>zk6022 THEN '��ƺ��صȼ����� ��һ��'	ELSE null END'��ƺ��صȼ����� �Ա�',
NBZC.hk6022 hk6022,NBZC.zhk6022 '�ʲ�ƽ̨|��ƺ��صȼ�',
CASE WHEN k6022<>zk6022 THEN '��ƺ��صȼ� ��һ��'	ELSE null END'��ƺ��صȼ� �Ա�',
nbzc.K6040 '���������/�������'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(K060.k6017)k6017,rtrim(ZCPT_K060.k6017) zk6017,
rtrim(K060.hk6017)hk6017,rtrim(ZCPT_K060.hk6017) zhk6017,
rtrim(K060.k6022)k6022,rtrim(ZCPT_K060.k6022) zk6022,
rtrim(K060.hk6022)hk6022,rtrim(ZCPT_K060.hk6022) zhk6022

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(K060.k6017)k6017,rtrim(ZCPT_K060.k6017) zk6017,
rtrim(K060.hk6017)hk6017,rtrim(ZCPT_K060.hk6017) zhk6017,
rtrim(K060.k6022)k6022,rtrim(ZCPT_K060.k6022) zk6022,
rtrim(K060.hk6022)hk6022,rtrim(ZCPT_K060.hk6022) zhk6022

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where
NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(

rtrim(NBZC.k6017)<>rtrim(NBZC.zk6017) or --  �Ŷ����ʹ���,
rtrim(NBZC.hk6017)<>rtrim(NBZC.zhk6017)	or --  �Ŷ�����,
rtrim(NBZC.k6022)<>rtrim(NBZC.zk6022)	 --  ��ƺ��صȼ�����,

)
order by k0101

--9.2.7
SELECT 'K060'+'&A0102 ='''+RTRIM(CAST(NBZC.A0102 AS VARCHAR))+''' AND K0101='''+RTRIM(CAST(NBZC.K0101 AS VARCHAR))+''' AND K6003 ='+RTRIM(CAST(NBZC.K6003 AS VARCHAR))  AS �༭,

rtrim(NBZC.A0102) A0102,rtrim(NBZC.hA0102) hA0102,
rtrim(replace(replace(replace(replace(replace(NBZC.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101 ,
NBZC.k6002 k6002,
NBZC.K6003 k6003,
NBZC.K6016 K6016,NBZC.zK6016 '�ʲ�ƽ̨|�ϲ��ṹ���ʹ���',
CASE WHEN HK6016<>zHK6016 THEN '�ϲ��ṹ���ʹ��� ��һ��'	ELSE null END'�ϲ��ṹ���ʹ��� �Ա�',
NBZC.HK6016 HK6016,NBZC.zHK6016 '�ʲ�ƽ̨|�ϲ��ṹ����',
CASE WHEN HK6016<>zHK6016 THEN '�ϲ��ṹ���� ��һ��'	ELSE null END'�ϲ��ṹ���� �Ա�',
NBZC.K6110 K6110,NBZC.zK6110 '�ʲ�ƽ̨|�ϲ��ṹ���ϴ���',
CASE WHEN K6110<>zK6110 THEN '�ϲ��ṹ���ϴ��� ��һ��'	ELSE null END'�ϲ��ṹ���ϴ��� �Ա�',
NBZC.HK6110 HK6110,NBZC.zHK6110 '�ʲ�ƽ̨|�ϲ��ṹ����',
CASE WHEN HK6110<>zHK6110 THEN '�ϲ��ṹ���� ��һ��'	ELSE null END'�ϲ��ṹ���� �Ա�',

nbzc.K6040 '���������/�������'
from (
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(K060.K6040) K6040,

rtrim(k060.K6016)K6016,rtrim(ZCPT_K060.K6016)zK6016,
rtrim(k060.HK6016)HK6016,rtrim(ZCPT_K060.HK6016)zHK6016,
rtrim(k060.K6110)K6110,rtrim(ZCPT_K060.K6110)zK6110,
rtrim(k060.HK6110)HK6110,rtrim(ZCPT_K060.HK6110) zHK6110

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(K060.K6040)=rtrim(ZCPT_K060.K6040)
where rtrim(K060.K6040)is not null and rtrim(ZCPT_K060.K6040) is not null and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
UNION
SELECT
rtrim(K060.A0102) A0102,rtrim(K060.hA0102) hA0102,
rtrim(K060.K0101) K0101,rtrim(k060.k6002) k6002,rtrim(k060.k6003) k6003,rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) k6001,

rtrim(k060.K6016)K6016,rtrim(ZCPT_K060.K6016)zK6016,
rtrim(k060.HK6016)HK6016,rtrim(ZCPT_K060.HK6016)zHK6016,
rtrim(k060.K6110)K6110,rtrim(ZCPT_K060.K6110)zK6110,
rtrim(k060.HK6110)HK6110,rtrim(ZCPT_K060.HK6110) zHK6110

from  k060
left join k001 on rtrim(k060.k0101)=rtrim(k001.k0101) and k060.k6003>=k001.k0108 and k060.k6003<=k001.k0109
full join ZCPT_K060  on rtrim(replace(replace(replace(replace(replace(k060.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001) = rtrim(ZCPT_K060.k6001)
where k060.k6040 is null  and
k060.A0102 LIKE '#A0102#%' AND k060.A0102 LIKE '#GLDW#%' and
LEFT(k001.K0101,1) IN ('G','S') and rtrim(k001.k0112) not like '%����%'AND k001.A0102 LIKE '341%'
)NBZC
where 
NBZC.A0102 LIKE '#A0102#%' AND NBZC.A0102 LIKE '#GLDW#%' and
(
HK6016<>zHK6016 or--  �ϲ��ṹ����,
K6110<>zK6110 or--  �ϲ��ṹ���ϴ���,
HK6110<>zHK6110-- �ϲ��ṹ����,
)
order by k0101

--9.2.8

