select 
a.a0102,
a.ha0102,--��λ
a.k0101,--·�߱���
rtrim(a.k0112) k0112,
a.k0108,--���׮��
a.k0109,--ֹ��׮��
[��һ·��k0108]=b.k0108,
rtrim(a.k0111) k0111,--ֹ������
[��һ·��k0110]=rtrim(b.k0110),--�������
a.k0183,--ֹ�㾭��
[��һ·��k0283]=b.k0283,--��㾭��
a.k0184,--ֹ��γ��
[��һ·��k0284]=b.k0284,--���γ��
a.k0157,
rtrim(a.hk0157) hk0157,--ֹ���Ƿ�ֽ��
[��һ·��k0153]=b.k0153,
[��һ·��hk0153]=rtrim(b.hk0153),--����Ƿ�ֽ��
a.k0158,
rtrim(a.hk0158) hk0158,--ֹ��ֽ�����
[��һ·��k0154]=b.k0154,
[��һ·��b.hk0154]=rtrim(b.hk0154)--���ֽ�����

from k001 a left join k001 b 
on rtrim(a.k0101) = rtrim(b.k0101)  and a.k0109=b.k0108 
where ( nullif(ltrim(rtrim(a.k0111)),'')< > nullif(ltrim(rtrim(b.k0110)),'') or a.k0183< > b.k0283 or a.k0184< > b.k0284
or nullif(a.k0157,'')< > nullif(b.k0153,'') or nullif(a.k0158,'')< > nullif(b.k0154,'') ) 
and left(a.k0101,1)in('x','y','c','z')
-- and b.k0108 is not null  
--and a.k0283 is null and b.k0284 is null
