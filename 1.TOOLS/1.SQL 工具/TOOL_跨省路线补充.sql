select [����λ����],a.a0102,[����λ����],a.ha0102,[·�ߴ���],[·�����],[·��ֹ��],a.hk0192,[��������],[���ֽ�����],a.hk0154,[ֹ��ֽ�����],a.hk0158,[�ظ�·�δ���],a.k0124
from OPENROWSET('Microsoft.ACE.OLEDB.12.0','Excel 8.0;HDR=YES;DATABASE=E:\6078������\1.�����ļ�\1.�����ļ������ڷ��ࣩ\20230830 ���ߺ˲�\xycz ��ʡ��·��\xycz ��ʡ��·��0.1.xlsx',sheet1$)
left join  k001 a on [·�ߴ���]=rtrim(k0101) and [·�����]=k0108




select a0102,rtrim(ha0102),rtrim(k0101) k0101,k0108,k0109,rtrim(hk0192),rtrim(hk0154),rtrim(hk0158),
case when k0154='1' and isnull(k0158,'0')<>'1' then '���' when isnull(k0154,'0')<>'1' and k0158 ='1' then '����' else '�������Ҳ�ǳ���' end,
k0124 from k001 where left(a0102,3)<>'42A' and left(k0101,1) in ('C','Y','X','Z') and (k0154='1' or k0158='1')
order by k0101,k0108
