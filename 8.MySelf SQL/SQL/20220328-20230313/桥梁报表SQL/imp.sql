USE [HRP-DBMS2015]

--select * from k060
--30-2��������(��·��)
select rtrim(k0112) k0112,
	   (case when left(rtrim(k0101),1)='H' then replace(rtrim(k0101),'H','G') else 
		case when left(rtrim(k0101),1)='T' then replace(rtrim(k0101),'T','S') else 
		 case when len(rtrim(k0101))>9 then left(rtrim(k0101),4) else rtrim(k0101) end end end) k0101,
       sum(case when k6007='1' then 1 else 0 end) �ش�����,
	   sum(case when k6007='1' then k6008 else 0 end) �ش�����,
       sum(case when k6007='2' then 1 else 0 end) ��������,
	   sum(case when k6007='2' then k6008 else 0 end) ��������,
       sum(case when k6007='3' then 1 else 0 end) ��������,
	   sum(case when k6007='3' then k6008 else 0 end) ��������,
       sum(case when k6007='4' then 1 else 0 end) С������,
	   sum(case when k6007='4' then k6008 else 0 end) С������,
       sum(case when k6007 in ('1','2','3','4') then 1 else 0 end) ������,
	   sum(case when k6007 in ('1','2','3','4') then k6008 else 0 end) ������
from k060
group by rtrim(k0112),(case when left(rtrim(k0101),1)='H' then replace(rtrim(k0101),'H','G') else 
						case when left(rtrim(k0101),1)='T' then replace(rtrim(k0101),'T','S') else 
						 case when len(rtrim(k0101))>9 then left(rtrim(k0101),4) else rtrim(k0101) end end end) with rollup
having grouping(rtrim(k0112))=grouping((case when left(rtrim(k0101),1)='H' then replace(rtrim(k0101),'H','G') else 
						case when left(rtrim(k0101),1)='T' then replace(rtrim(k0101),'T','S') else 
						 case when len(rtrim(k0101))>9 then left(rtrim(k0101),4) else rtrim(k0101) end end end))
order by replace(left((case when left(rtrim(k0101),1)='H' then replace(rtrim(k0101),'H','G') else 
		                case when left(rtrim(k0101),1)='T' then replace(rtrim(k0101),'T','S') else 
		                 case when len(rtrim(k0101))>9 then left(rtrim(k0101),4) else rtrim(k0101) end end end),1),'C','ZZ')

--31-ȫʡ��·�������ܱ�
select rtrim(a.a0102) a0102,
	   rtrim(a.ha0102) ha0102,
       sum(case when a.k6007 in ('1','2','3','4') then 1 else 0 end) ������,
	   sum(case when a.k6007 in ('1','2','3','4') then a.k6008 else 0 end) ������,
       sum(case when a.k6062 ='1' then 1 else 0 end) ��ͨʽ����,
	   sum(case when a.k6062 ='1' then a.k6008 else 0 end) ��ͨʽ����,	
       sum(case when a.k6028 in ('4','5') then 1 else 0 end) Σ������,
	   sum(case when a.k6028 in ('4','5') then a.k6008 else 0 end) Σ������,	
       sum(case when a.k6004 ='1' then 1 else 0 end) ����������,
	   sum(case when a.k6004 ='1' then a.k6008 else 0 end) ����������, 
       sum(case when a.k6004 ='2' then 1 else 0 end) ������������,
	   sum(case when a.k6004 ='2' then a.k6008 else 0 end) ������������, 
       sum(case when a.k6004 ='3' then 1 else 0 end) ��ʱ������,
	   sum(case when a.k6004 ='3' then a.k6008 else 0 end) ��ʱ������,
	   rtrim(a.ha0102) ha0102,
       sum(case when a.k6007 in ('1','2','3','4') then 1 else 0 end) ������2,
	   sum(case when a.k6007 in ('1','2','3','4') then a.k6008 else 0 end) ������2,
       sum(case when a.k6007='1' then 1 else 0 end) �ش�����,
	   sum(case when a.k6007='1' then a.k6008 else 0 end) �ش�����,
       sum(case when a.k6007='2' then 1 else 0 end) ��������,
	   sum(case when a.k6007='2' then a.k6008 else 0 end) ��������,
       sum(case when a.k6007='3' then 1 else 0 end) ��������,
	   sum(case when a.k6007='3' then a.k6008 else 0 end) ��������,
       sum(case when a.k6007='4' then 1 else 0 end) С������,
	   sum(case when a.k6007='4' then a.k6008 else 0 end) С������
from k060 a 
group by rtrim(a.a0102),rtrim(a.ha0102) with rollup
having grouping(rtrim(a.a0102))=grouping(rtrim(a.ha0102))
order by rtrim(a.a0102)

--���
--select rtrim(a0102) a0102,rtrim(ha0102) ha0102 from k060 group by rtrim(a0102),rtrim(ha0102)
select rtrim(b.a0102) a0102,
	   rtrim(b.ha0102) ha0102,
       sum(case when a.k6304 in ('1','2','3','4') then 1 else 0 end) �������,
	   sum(case when a.k6304 in ('1','2','3','4') then a.k6305 else 0 end) �����������
from k063 a right join (select rtrim(a0102) a0102,rtrim(ha0102) ha0102 from k060 group by rtrim(a0102),rtrim(ha0102)) b on rtrim(a.a0102)=rtrim(b.a0102)
group by rtrim(b.a0102),rtrim(b.ha0102) with rollup
having grouping(rtrim(b.a0102))=grouping(rtrim(b.ha0102))
order by rtrim(b.a0102)

--32-������׵���������(��������H)
--����
select rtrim(a.a0102) a0102,
	   rtrim(a.ha0102) ha0102,
       sum(case when a.k6007 in ('1','2','3','4') then 1 else 0 end) ������,
	   sum(case when a.k6007 in ('1','2','3','4') then a.k6008 else 0 end) ������,
       sum(case when a.k6062 ='1' then 1 else 0 end) ��ͨʽ����,
	   sum(case when a.k6062 ='1' then a.k6008 else 0 end) ��ͨʽ����,	
	   '',
       sum(case when a.k6028 in ('4','5') then 1 else 0 end) Σ������,
	   sum(case when a.k6028 in ('4','5') then a.k6008 else 0 end) Σ������,	
       sum(case when a.k6004 ='1' then 1 else 0 end) ����������,
	   sum(case when a.k6004 ='1' then a.k6008 else 0 end) ����������, 
       sum(case when a.k6004 ='2' then 1 else 0 end) ������������,
	   sum(case when a.k6004 ='2' then a.k6008 else 0 end) ������������, 
       sum(case when a.k6004 ='3' then 1 else 0 end) ��ʱ������,
	   sum(case when a.k6004 ='3' then a.k6008 else 0 end) ��ʱ������,
	   rtrim(a.ha0102) ha0102,
       sum(case when a.k6007 in ('1','2','3','4') then 1 else 0 end) ������2,
	   sum(case when a.k6007 in ('1','2','3','4') then a.k6008 else 0 end) ������2,
       sum(case when a.k6007='1' then 1 else 0 end) �ش�����,
	   sum(case when a.k6007='1' then a.k6008 else 0 end) �ش�����,
       sum(case when a.k6007='2' then 1 else 0 end) ��������,
	   sum(case when a.k6007='2' then a.k6008 else 0 end) ��������,
       sum(case when a.k6007='3' then 1 else 0 end) ��������,
	   sum(case when a.k6007='3' then a.k6008 else 0 end) ��������,
       sum(case when a.k6007='4' then 1 else 0 end) С������,
	   sum(case when a.k6007='4' then a.k6008 else 0 end) С������
from k060 a 
where left(a.k0101,1) = 'G'
group by rtrim(a.a0102),rtrim(a.ha0102) with rollup
having grouping(rtrim(a.a0102))=grouping(rtrim(a.ha0102))
order by rtrim(a.a0102)

--���G����H
--select rtrim(a0102) a0102,rtrim(ha0102) ha0102 from k060 group by rtrim(a0102),rtrim(ha0102)
select rtrim(b.a0102) a0102,
	   rtrim(b.ha0102) ha0102,
       sum(case when a.k6304 in ('1','2','3','4') and left(a.k0101,1) = 'G' then 1 else 0 end) �������,
	   sum(case when a.k6304 in ('1','2','3','4') and left(a.k0101,1) = 'G' then a.k6305 else 0 end) �����������
from k063 a right join (select rtrim(a0102) a0102,rtrim(ha0102) ha0102 from k060 where left(k0101,1) = 'G' group by rtrim(a0102),rtrim(ha0102)) b on rtrim(a.a0102)=rtrim(b.a0102)
--where left(a.k0101,1) = 'G'
group by rtrim(b.a0102),rtrim(b.ha0102) with rollup
having grouping(rtrim(b.a0102))=grouping(rtrim(b.ha0102))
order by rtrim(b.a0102)

--ʡ��

select rtrim(a.a0102) a0102,
	   rtrim(a.ha0102) ha0102,
       sum(case when a.k6007 in ('1','2','3','4') then 1 else 0 end) ������,
	   sum(case when a.k6007 in ('1','2','3','4') then a.k6008 else 0 end) ������,
       sum(case when a.k6062 ='1' then 1 else 0 end) ��ͨʽ����,
	   sum(case when a.k6062 ='1' then a.k6008 else 0 end) ��ͨʽ����,	
	   '',
       sum(case when a.k6028 in ('4','5') then 1 else 0 end) Σ������,
	   sum(case when a.k6028 in ('4','5') then a.k6008 else 0 end) Σ������,	
       sum(case when a.k6004 ='1' then 1 else 0 end) ����������,
	   sum(case when a.k6004 ='1' then a.k6008 else 0 end) ����������, 
       sum(case when a.k6004 ='2' then 1 else 0 end) ������������,
	   sum(case when a.k6004 ='2' then a.k6008 else 0 end) ������������, 
       sum(case when a.k6004 ='3' then 1 else 0 end) ��ʱ������,
	   sum(case when a.k6004 ='3' then a.k6008 else 0 end) ��ʱ������,
	   rtrim(a.ha0102) ha0102,
       sum(case when a.k6007 in ('1','2','3','4') then 1 else 0 end) ������2,
	   sum(case when a.k6007 in ('1','2','3','4') then a.k6008 else 0 end) ������2,
       sum(case when a.k6007='1' then 1 else 0 end) �ش�����,
	   sum(case when a.k6007='1' then a.k6008 else 0 end) �ش�����,
       sum(case when a.k6007='2' then 1 else 0 end) ��������,
	   sum(case when a.k6007='2' then a.k6008 else 0 end) ��������,
       sum(case when a.k6007='3' then 1 else 0 end) ��������,
	   sum(case when a.k6007='3' then a.k6008 else 0 end) ��������,
       sum(case when a.k6007='4' then 1 else 0 end) С������,
	   sum(case when a.k6007='4' then a.k6008 else 0 end) С������
from k060 a 
where left(a.k0101,1) = 'S'
group by rtrim(a.a0102),rtrim(a.ha0102) with rollup
having grouping(rtrim(a.a0102))=grouping(rtrim(a.ha0102))
order by rtrim(a.a0102)

--���
--select rtrim(a0102) a0102,rtrim(ha0102) ha0102 from k060 group by rtrim(a0102),rtrim(ha0102)
select rtrim(b.a0102) a0102,
	   rtrim(b.ha0102) ha0102,
       sum(case when a.k6304 in ('1','2','3','4') and left(a.k0101,1) = 'S' then 1 else 0 end) �������,
	   sum(case when a.k6304 in ('1','2','3','4') and left(a.k0101,1) = 'S' then a.k6305 else 0 end) �����������
from k063 a right join (select rtrim(a0102) a0102,rtrim(ha0102) ha0102 from k060 where left(k0101,1) = 'S' group by rtrim(a0102),rtrim(ha0102)) b on rtrim(a.a0102)=rtrim(b.a0102)
--where left(a.k0101,1) = 'G'
group by rtrim(b.a0102),rtrim(b.ha0102) with rollup
having grouping(rtrim(b.a0102))=grouping(rtrim(b.ha0102))
order by rtrim(b.a0102)

--�ص���ר��

select rtrim(a.a0102) a0102,
	   rtrim(a.ha0102) ha0102,
       sum(case when a.k6007 in ('1','2','3','4') then 1 else 0 end) ������,
	   sum(case when a.k6007 in ('1','2','3','4') then a.k6008 else 0 end) ������,
       sum(case when a.k6062 ='1' then 1 else 0 end) ��ͨʽ����,
	   sum(case when a.k6062 ='1' then a.k6008 else 0 end) ��ͨʽ����,	
	   '',
       sum(case when a.k6028 in ('4','5') then 1 else 0 end) Σ������,
	   sum(case when a.k6028 in ('4','5') then a.k6008 else 0 end) Σ������,	
       sum(case when a.k6004 ='1' then 1 else 0 end) ����������,
	   sum(case when a.k6004 ='1' then a.k6008 else 0 end) ����������, 
       sum(case when a.k6004 ='2' then 1 else 0 end) ������������,
	   sum(case when a.k6004 ='2' then a.k6008 else 0 end) ������������, 
       sum(case when a.k6004 ='3' then 1 else 0 end) ��ʱ������,
	   sum(case when a.k6004 ='3' then a.k6008 else 0 end) ��ʱ������,
	   rtrim(a.ha0102) ha0102,
       sum(case when a.k6007 in ('1','2','3','4') then 1 else 0 end) ������2,
	   sum(case when a.k6007 in ('1','2','3','4') then a.k6008 else 0 end) ������2,
       sum(case when a.k6007='1' then 1 else 0 end) �ش�����,
	   sum(case when a.k6007='1' then a.k6008 else 0 end) �ش�����,
       sum(case when a.k6007='2' then 1 else 0 end) ��������,
	   sum(case when a.k6007='2' then a.k6008 else 0 end) ��������,
       sum(case when a.k6007='3' then 1 else 0 end) ��������,
	   sum(case when a.k6007='3' then a.k6008 else 0 end) ��������,
       sum(case when a.k6007='4' then 1 else 0 end) С������,
	   sum(case when a.k6007='4' then a.k6008 else 0 end) С������
from k060 a 
where left(a.k0101,1) in( 'X','Z')
group by rtrim(a.a0102),rtrim(a.ha0102) with rollup
having grouping(rtrim(a.a0102))=grouping(rtrim(a.ha0102))
order by rtrim(a.a0102)

--���
--select rtrim(a0102) a0102,rtrim(ha0102) ha0102 from k060 group by rtrim(a0102),rtrim(ha0102)
select rtrim(b.a0102) a0102,
	   rtrim(b.ha0102) ha0102,
       sum(case when a.k6304 in ('1','2','3','4') and left(a.k0101,1) in( 'X','Z') then 1 else 0 end) �������,
	   sum(case when a.k6304 in ('1','2','3','4') and left(a.k0101,1) in( 'X','Z') then a.k6305 else 0 end) �����������
from k063 a right join (select rtrim(a0102) a0102,rtrim(ha0102) ha0102 from k060 where left(k0101,1) in( 'X','Z') group by rtrim(a0102),rtrim(ha0102)) b on rtrim(a.a0102)=rtrim(b.a0102)
--where left(a.k0101,1) = 'G'
group by rtrim(b.a0102),rtrim(b.ha0102) with rollup
having grouping(rtrim(b.a0102))=grouping(rtrim(b.ha0102))
order by rtrim(b.a0102)


--���ߣ�ʡ����������
select rtrim(a.a0102) a0102,
	   rtrim(a.ha0102) ha0102,
       sum(case when a.k6007 in ('1','2','3','4') then 1 else 0 end) ������,
	   sum(case when a.k6007 in ('1','2','3','4') then a.k6008 else 0 end) ������,
       sum(case when a.k6062 ='1' then 1 else 0 end) ��ͨʽ����,
	   sum(case when a.k6062 ='1' then a.k6008 else 0 end) ��ͨʽ����,	
	   '',
       sum(case when a.k6028 in ('4','5') then 1 else 0 end) Σ������,
	   sum(case when a.k6028 in ('4','5') then a.k6008 else 0 end) Σ������,	
       sum(case when a.k6004 ='1' then 1 else 0 end) ����������,
	   sum(case when a.k6004 ='1' then a.k6008 else 0 end) ����������, 
       sum(case when a.k6004 ='2' then 1 else 0 end) ������������,
	   sum(case when a.k6004 ='2' then a.k6008 else 0 end) ������������, 
       sum(case when a.k6004 ='3' then 1 else 0 end) ��ʱ������,
	   sum(case when a.k6004 ='3' then a.k6008 else 0 end) ��ʱ������,
	   rtrim(a.ha0102) ha0102,
       sum(case when a.k6007 in ('1','2','3','4') then 1 else 0 end) ������2,
	   sum(case when a.k6007 in ('1','2','3','4') then a.k6008 else 0 end) ������2,
       sum(case when a.k6007='1' then 1 else 0 end) �ش�����,
	   sum(case when a.k6007='1' then a.k6008 else 0 end) �ش�����,
       sum(case when a.k6007='2' then 1 else 0 end) ��������,
	   sum(case when a.k6007='2' then a.k6008 else 0 end) ��������,
       sum(case when a.k6007='3' then 1 else 0 end) ��������,
	   sum(case when a.k6007='3' then a.k6008 else 0 end) ��������,
       sum(case when a.k6007='4' then 1 else 0 end) С������,
	   sum(case when a.k6007='4' then a.k6008 else 0 end) С������
from k060 a 
where left(a.k0101,1) in ('H','T')
group by rtrim(a.a0102),rtrim(a.ha0102) with rollup
having grouping(rtrim(a.a0102))=grouping(rtrim(a.ha0102))
order by rtrim(a.a0102)

--���--��T78��һ�������42A74��������Ͷ��Ƹ��ٹ�·��Ӫ�������޹�˾��T78��ǹ��ɽ���
--select rtrim(a0102) a0102,rtrim(ha0102) ha0102 from k060 group by rtrim(a0102),rtrim(ha0102)
select rtrim(b.a0102) a0102,
	   rtrim(b.ha0102) ha0102,
       sum(case when a.k6304 in ('1','2','3','4') and left(a.k0101,1) in ('H','T') then 1 else 0 end) �������,
	   sum(case when a.k6304 in ('1','2','3','4') and left(a.k0101,1) in ('H','T') then a.k6305 else 0 end) �����������
from k063 a right join (
select rtrim(a0102) a0102,rtrim(ha0102) ha0102 from k060 where left(k0101,1) in ('H','T') group by rtrim(a0102),rtrim(ha0102)
  union (select rtriM(a0102) a0102,rtrim(ha0102) ha0102 from k063 where k0101='T78' and a0102='42A74')
) b on rtrim(a.a0102)=rtrim(b.a0102)
--where left(a.k0101,1) = 'G'
group by rtrim(b.a0102),rtrim(b.ha0102) with rollup
having grouping(rtrim(b.a0102))=grouping(rtrim(b.ha0102))
order by rtrim(b.a0102)

--select rtriM(a0102) a0102,rtrim(ha0102) ha0102,1,k6305 from k063 where k0101='T78' and a0102='42A74'