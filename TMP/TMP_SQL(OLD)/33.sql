select 
t1.k0101 '·�ߴ���',
t1.K0105 'A50·�߻�����Ϣ��|���|׮��',
t1.K0103 'A50·�߻�����Ϣ��|���|����',
t1.K0106 'A50·�߻�����Ϣ��|ֹ��|׮��',
t1.K0104 'A50·�߻�����Ϣ��|ֹ��|����',
t2.k0108 'K01·���ۺ���Ϣ��|���|׮��',
t2.k0110 'K01·���ۺ���Ϣ��|���|����',
t3.K0109 'K01·���ۺ���Ϣ��|ֹ��|׮��',
t3.k0111 'K01·���ۺ���Ϣ��|ֹ��|����'
from a50  t1
	/*(select	a50_id,K0112,k0101,k0105,k0106,k0103,k0104 from a50
	) t1*/
join
	(select a.a50_id,a.k0108,b.k0110 
		from k001 b right join (select a50_id,min(k0108) k0108 from k001  group by a50_id) a
		on a.a50_id=b.a50_id and a.k0108=b.k0108
	) t2 
		on t1.a50_id=t2.a50_id 
join 
	(select distinct a.a50_id,a.k0109,b.k0111 
		from (select a50_id,max(k0109) k0109 from k001  group by k001.a50_id) a  
		join k001 b on a.a50_id=b.a50_id and a.k0109=b.k0109
	) t3 
		on t1.a50_id=t3.a50_id 
where t1.k0105 <> t2.k0108 
   or t1.k0106 <> t3.k0109
   or t1.k0103 <> t2.k0110
   or t1.k0104 <> t3.k0111
   
   
   
   
   
  /* 
select a.a50_id,a.k0108,b.k0110 -- into @k001_n2 , @k001_m2, @k001_p2
from k001 b 
right join (select a50_id,min(k0108) k0108 from k001  group by a50_id) a
on a.a50_id=b.a50_id and a.k0108=b.k0108


select a.a50_id,a.k0109,b.k0111 
from (select a50_id,max(k0109) k0109 from k001  group by k001.a50_id) a  
join k001 b on a.a50_id=b.a50_id and a.k0109=b.k0109
*/

create TABLE if not EXISTS TIME_k1

