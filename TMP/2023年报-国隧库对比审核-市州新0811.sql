--1��ȡ�걨���Կ������ϸ(��Ҫָ��)
drop table #nb
select rtrim(a.a0102) a0102,
		rtrim(a.ha0102) ha0102,
		left(rtriM(a.a0103),6) a0103,
		rtrim(a.k6302) k6302,case when len(rtrim(a.k0101))<10 then rtrim(a.k0101) else left(rtrim(a.k0101),4) end k0101,
		rtrim(b.hk0304) hk0304,
		rtrim(a.k6301) wk6301,a.k6303,k6324,rtrim(hk6127)hk6127,
		(case when len(rtrim(a.k0101))<=9 and charindex('D',rtrim(a.k0101))=0 then rtrim(a.k0101)+left(rtrim(a.a0103),6)+'U'+rtrim(a.K6301)
			when len(rtrim(a.k0101))<=9 and charindex('D',rtrim(a.k0101))<>0 then left(rtrim(a.k0101),charindex('D',rtrim(a.k0101))-1)+left(rtrim(a.a0103),6)+'U'+rtrim(a.K6301)
			when len(rtrim(a.k0101))>9 and left(rtrim(a.k0101),1) in ('G','H','S','T') then left(rtrim(a.k0101),4)+left(rtrim(a.a0103),6)+'U'+rtrim(a.K6301)
			when len(rtrim(a.k0101))>9 and left(rtrim(a.k0101),1) in ('X','J','Y','N','C','Z') then left(rtrim(a.k0101),10)+'U'+rtrim(a.K6301)
			else null end) K6301
into #nb
from k063 a left join k001 b on a.a0102=b.a0102 and a.k0101=b.k0101 and a.k6303>b.k0108 and a.k6303<b.k0109
where left(a.k0101,1) in ('G','H','S','T') and left(a.a0102,3)<>'42A'
order by a.k0101,a.k6303

--2�����ſ⵼�������ļ�
drop table #sdk
select �������,�������,���׮��,·�߱��,·�߼����ȼ�,����׮��,�г�����
into #sdk
from OPENROWSET('MICROSOFT.ACE.OLEDB.12.0','Excel 8.0;HDR=YES;
DATABASE=D:\�����ļ�\��������\20230731\�ĵ�����\42051.xlsx',Sheet1$)
order by �������,���׮��


--3���Ա���Ҫָ��
select a0102,ha0102,a0103,k6302,�������,k0101,·�߱��,hk6127,�г�����,hk0304,·�߼����ȼ�,k6303,���׮��,k6324,����׮��,k6301,�������,
case when  k6302<>������� then '�������һ��'  else '' end ������Ա�,
case when  hk6127<>�г����� then '�г�����һ��'  else '' end �г�����Ա�,
case when  hk0304<>left(·�߼����ȼ�,2) then '����·�߼����ȼ���һ��' else '' end ����·�߼����ȼ��Ա�,
case when  k6303<>���׮�� then '���׮�Ų�һ��' else '' end ���׮�ŶԱ�,
case when  k6324<>����׮�� then '����׮�Ų�һ��' else '' end ����׮�ŶԱ�,
case when  replace(replace(isnull(k6301,''),'H','G'),'T','S')<>replace(replace(isnull(�������,''),'H','G'),'T','S')
OR k6301 IS NULL OR ������� IS NULL then '������벻һ��' else '' end �������Ա�
from
(
select a0102,ha0102,a0103,k6302,�������,k0101,·�߱��,hk0304,·�߼����ȼ�,k6303,���׮��,k6301,�������,k6324,����׮��,hk6127,�г�����
from #nb full join #sdk on  replace(replace(k6301,'H','G'),'T','S')=replace(replace(�������,'H','G'),'T','S')
where k6301 is not null and ������� is not null
union
select a0102,ha0102,a0103,k6302,�������,k0101,·�߱��,hk0304,·�߼����ȼ�,k6303,���׮��,k6301,�������,k6324,����׮��,hk6127,�г�����
from #nb full join #sdk on replace(replace(k6301,'H','G'),'T','S')=replace(replace(�������,'H','G'),'T','S')
where k6301 is null or ������� is null
) as a
where hk0304<>left(·�߼����ȼ�,2) or hk6127<>�г����� or k6303<>���׮��
or replace(replace(k6301,'H','G'),'T','S')<>replace(replace(�������,'H','G'),'T','S')
or k6324<>����׮�� or k6302<>�������
or a0102 is null or ������� is null
order by k6301




--4��ȡ�걨���Կ������ϸ(����ָ��)
drop table #nb2
select rtrim(a.a0102) a0102,
		rtrim(a.ha0102) ha0102,
		left(rtriM(a.a0103),6) a0103,
		rtrim(a.k6302) k6302,case when len(rtrim(a.k0101))<10 then rtrim(a.k0101) else left(rtrim(a.k0101),4) end k0101,
		rtrim(b.hk0304) hk0304,
		rtrim(a.k6301) wk6301,a.k6303,k6324,k6305,rtrim(hk6304)hk6304,k6306,k6307,rtrim(hk6312)hk6312,rtrim(hk6343)hk6343,rtrim(hk6127)hk6127,rtrim(hk6355)hk6355,rtrim(hk6124)hk6124,
replace(a.hk6023,' ','')hk6023,rtrim(hk6310)hk6310,hk6311,replace(hk6313,' ','')hk6313,rtrim(hk6335)hk6335,k6079,k6030,k6031,k6032,a1314,ha1313,k6112,a.k0116,k6340,
		(case when len(rtrim(a.k0101))<=9 and charindex('D',rtrim(a.k0101))=0 then rtrim(a.k0101)+left(rtrim(a.a0103),6)+'U'+rtrim(a.K6301)
			when len(rtrim(a.k0101))<=9 and charindex('D',rtrim(a.k0101))<>0 then left(rtrim(a.k0101),charindex('D',rtrim(a.k0101))-1)+left(rtrim(a.a0103),6)+'U'+rtrim(a.K6301)
			when len(rtrim(a.k0101))>9 and left(rtrim(a.k0101),1) in ('G','H','S','T') then left(rtrim(a.k0101),4)+left(rtrim(a.a0103),6)+'U'+rtrim(a.K6301)
			when len(rtrim(a.k0101))>9 and left(rtrim(a.k0101),1) in ('X','J','Y','N','C','Z') then left(rtrim(a.k0101),10)+'U'+rtrim(a.K6301)
			else null end) K6301
into #nb2
from k063 a left join k001 b on a.a0102=b.a0102 and a.k0101=b.k0101 and a.k6303>b.k0108 and a.k6303<b.k0109
where left(a.k0101,1) in ('G','H','S','T') and left(a.a0102,3)<>'42A'
order by a.k0101,a.k6303



--5�����ſ⵼�������ļ�
drop table #sdk2
select �������,�������,���׮��,·�߱��,·�߼����ȼ�,����׮��,[�������(����)],������ȷ���,[�������(��)],[�������(��)],·������,�����ȼ�,�г�����,�Ƿ��ڳ������Ŀ¼,�Ƿ��ʡ���,replace(��������ȼ�,'g','')��������ȼ�,������ʽ,��������,
����ˮ����,�Ƿ�ˮ�����,���赥λ����,��Ƶ�λ����,ʩ����λ����,����λ����,������λ,������λ����,��ܵ�λ,replace(����ͨ��ʱ��,'-','')����ͨ��ʱ��,�޽����
into #sdk2
from OPENROWSET('MICROSOFT.ACE.OLEDB.12.0','Excel 8.0;HDR=YES;
DATABASE=D:\�����ļ�\��������\20230731\�ĵ�����\42051.xlsx',Sheet1$)
order by �������,���׮��

--6���Ա�����ָ��
select a0102,ha0102,a0103,k6302,k0101,k6301,k6324,k6305,[�������(����)],hk6304,������ȷ���,k6306,[�������(��)],k6307,[�������(��)],hk6312,·������,hk6343,�����ȼ�,hk6127,�г�����,hk6355,�Ƿ��ڳ������Ŀ¼,
hk6124,�Ƿ��ʡ���,hk6023,��������ȼ�,hk6310,������ʽ,hk6311,��������,hk6313,����ˮ����,hk6335,�Ƿ�ˮ�����,k6079,���赥λ����,k6030,��Ƶ�λ����,k6031,ʩ����λ����,k6032,����λ����,a1314,������λ,
ha1313,������λ����,k6112,��ܵ�λ,k0116,����ͨ��ʱ��,k6340,�޽����,
case when  k6305<>[�������(����)] or [�������(����)] is null then '������Ȳ�һ��' else '' end ������ȶԱ�,
case when  hk6304<>������ȷ��� or ������ȷ��� is null then '������ȷ��಻һ��' else '' end ������ȷ���Ա�,
case when  k6306<>[�������(��)] or [�������(��)] is null then '�������һ��' else '' end �������Ա�,
case when  k6307<>[�������(��)] or [�������(��)] is null then '������߲�һ��' else '' end ������߶Ա�,
case when  hk6312<>·������ or ·������ is null then '·�����Ͳ�һ��' else '' end ·�����ͶԱ�,
case when  hk6343<>�����ȼ� or �����ȼ� is null then '�����ȼ���һ��' else '' end �����ȼ��Ա�,
case when  hk6127<>�г����� or �г����� is null then '����λ�ò�һ��' else '' end �г�����Ա�,
case when  hk6355<>�Ƿ��ڳ������Ŀ¼ or �Ƿ��ڳ������Ŀ¼ is null then '��һ��' else '' end ,
case when  hk6124<>�Ƿ��ʡ��� or �Ƿ��ʡ��� is null then '��һ��' else '' end ,
case when  hk6023<>��������ȼ� or ��������ȼ� is null then '��������ȼ���һ��' else '' end ��������ȼ��Ա�,
case when  left(hk6310,3)<>������ʽ or ������ʽ is null then '������ʽ��һ��' else '' end ������ʽ�Ա�,
case when  hk6311<>�������� or �������� is null then '�������Ͳ�һ��' else '' end �������ͶԱ�,
case when  hk6313<>����ˮ���� or ����ˮ���� is null then '����ˮ���Ͳ�һ��' else '' end ����ˮ���ͶԱ�,
case when  hk6335<>�Ƿ�ˮ����� or �Ƿ�ˮ����� is null then '��һ��' else '' end �Ƿ�ˮ������Ա�,
case when  k6079<>���赥λ���� or ���赥λ���� is null then '��һ��' else '' end ���赥λ���ƶԱ�,
case when  k6030<>��Ƶ�λ���� or ��Ƶ�λ���� is null then '��һ��' else '' end ��Ƶ�λ���ƶԱ�,
case when  k6031<>ʩ����λ���� or ʩ����λ���� is null then '��һ��' else '' end ʩ����λ���ƶԱ�,
case when  k6032<>����λ���� or ����λ���� is null then '��һ��' else '' end ����λ���ƶԱ�,
case when  a1314<>������λ or ������λ is null then '��һ��' else '' end ������λ���ƶԱ�,
case when  ha1313<>������λ���� or ������λ���� is null then '��һ��' else '' end ������λ���ʶԱ�,
case when  k6112<>��ܵ�λ or ��ܵ�λ is null then '��һ��' else '' end ��ܵ�λ�Ա�,
case when  k0116<>����ͨ��ʱ�� or ����ͨ��ʱ�� is null then '��һ��' else '' end ͨ��ʱ��Ա�,
case when  k6340<>�޽���� or �޽���� is null then '��һ��' else '' end �޽���ȶԱ�,
case when  replace(replace(isnull(k6301,''),'H','G'),'T','S')<>replace(replace(isnull(�������,''),'H','G'),'T','S')
OR k6301 IS NULL OR ������� IS NULL then '������벻һ��' else '' end �������Ա�
from
(
select a0102,ha0102,a0103,k6302,�������,k0101,·�߱��,hk0304,·�߼����ȼ�,k6303,���׮��,k6301,�������,k6324,����׮��,k6305,[�������(����)],hk6304,������ȷ���,k6306,[�������(��)],k6307,[�������(��)],hk6312,·������,
hk6343,�����ȼ�,hk6127,�г�����,hk6355,�Ƿ��ڳ������Ŀ¼,hk6124,�Ƿ��ʡ���,hk6023,��������ȼ�,hk6310,������ʽ,hk6311,��������,hk6313,����ˮ����,hk6335,�Ƿ�ˮ�����,k6079,���赥λ����,k6030,��Ƶ�λ����,k6031,
ʩ����λ����,k6032,����λ����,a1314,������λ,ha1313,������λ����,k6112,��ܵ�λ,k0116,����ͨ��ʱ��,k6340,�޽����
from #nb2 full join #sdk2 on replace(replace(k6301,'H','G'),'T','S')=replace(replace(�������,'H','G'),'T','S')
where k6301 is not null and ������� is not null
union
select a0102,ha0102,a0103,k6302,�������,k0101,·�߱��,hk0304,·�߼����ȼ�,k6303,���׮��,k6301,�������,k6324,����׮��,k6305,[�������(����)],hk6304,������ȷ���,k6306,[�������(��)],k6307,[�������(��)],hk6312,·������,
hk6343,�����ȼ�,hk6127,�г�����,hk6355,�Ƿ��ڳ������Ŀ¼,hk6124,�Ƿ��ʡ���,hk6023,��������ȼ�,hk6310,������ʽ,hk6311,��������,hk6313,����ˮ����,hk6335,�Ƿ�ˮ�����,k6079,���赥λ����,k6030,��Ƶ�λ����,k6031,
ʩ����λ����,k6032,����λ����,a1314,������λ,ha1313,������λ����,k6112,��ܵ�λ,k0116,����ͨ��ʱ��,k6340,�޽����
from #nb2 full join #sdk2 on replace(replace(k6301,'H','G'),'T','S')=replace(replace(�������,'H','G'),'T','S')
where k6301 is null or ������� is null
) as a
where hk0304<>left(·�߼����ȼ�,2) or k6303<>���׮�� or
replace(replace(k6301,'H','G'),'T','S')=replace(replace(�������,'H','G'),'T','S')
or k6324<>����׮�� or k6305<>[�������(����)] or hk6304<>������ȷ���  or k6306<>[�������(��)]  or k6307<>[�������(��)] or hk6312<>·������
or hk6343<>�����ȼ� or hk6127<>�г����� or hk6355<>�Ƿ��ڳ������Ŀ¼ or hk6124<>�Ƿ��ʡ��� or hk6023<>��������ȼ� or hk6310<>������ʽ or hk6311<>�������� or hk6313<>����ˮ���� or hk6335<>�Ƿ�ˮ����� or k6079<>���赥λ����
 or k6030<>��Ƶ�λ���� or k6031<>ʩ����λ���� or k6032<>����λ���� or a1314<>������λ or ha1313<>������λ���� or k6112<>��ܵ�λ or k0116<>����ͨ��ʱ�� or k6340<>�޽����
or a0102 is null or ������� is null
order by k6301
