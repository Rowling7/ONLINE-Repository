-- 8.1 条件完成
select --*
--concat('k060&a0102 =','''',rtrim(cast(b01.b0111 as varchar)),'''',' and a50.k0101=','''',    rtrim(cast(a50.k0101 as varchar)),'''', 'and k6001=','''',trim(cast(k6001 as varchar)),'''') as  编辑,
b01.b0111,b01.b0101,a50.k0101,a50.k0112,k060.k6008,k060.k6065,k060.k6068,k060.k6018,
k060.a0103,k060.k6007,k060.k6101,k060.a1316,k060.a1317,k060.a1318,k060.a1319
from oydhrp_hb.k060
left join oydhrp_hb.a50 on k060.a50_id=a50.a50_id
left join oydhrp_hb.b01 on k060.b01_id=b01.b01_id
where coalesce(k060.k6008,0)<=coalesce(k060.k6008,0) and (k060.k6018 is not null
or left(k060.k6068::varchar,1)='2');


-- 8.2 条件完成
select *--b01.b0111,b01.b0101,a50.k0101,a50.k0112,k060.k6008,k060.k6065,k060.k6068,k060.k6018,k060.k6017
from oydhrp_hb.k060
left join oydhrp_hb.a50 on k060.a50_id=a50.a50_id
left join oydhrp_hb.b01 on k060.b01_id=b01.b01_id
where ( coalesce(k060.k6065,0)=coalesce(k060.k6063,0) or coalesce(k060.k6065,0)-coalesce(k060.k6063,0)<=1 )
	and (k060.k6017<>'10' or left(k060.k6068::varchar,1)<>'2');

--8.3 可用
select
--'k060'+'&a0102 ='''+(cast(a.a0102 as varchar))+''' and k0101='''+(cast(a.k0101 as varchar))+'''  and k6001 ='''+(cast(a.k6001 as varchar))+''''  as 编辑,
(case when length(rtrim(a50.k0101))<=9 and strpos( rtrim(a50.k0101),'d' )=0 then concat(rtrim(a50.k0101),left(rtrim(a.a0103::varchar),6),'l',rtrim(a.k6001))
when length(rtrim(a50.k0101))<=9 and strpos( rtrim(a50.k0101),'d' )<>0 then concat(left(rtrim(a50.k0101),6),left(rtrim(a.a0103::varchar),6),'l',rtrim(a.k6001))
when length(rtrim(a50.k0101))>9 and left(rtrim(a50.k0101),1) in ('g','h','s','t') then concat(left(rtrim(a50.k0101),4),left(rtrim(a.a0103::varchar),6),'l',rtrim(a.k6001))
when length(rtrim(a50.k0101))>9 and left(rtrim(a50.k0101),1) in ('x','j','y','n','c','z') then concat(left(rtrim(a50.k0101),10),'l',rtrim(a.k6001))   end) k6001 ,
/*a.a0102,*/b01.b0101/*,a.k0101*/,a50.k0101,a.k0112,a.k6002,a.k6003,b.k0108,b.k0109,a.k6007,a.k6028,a.k0199--,a.hk6028,a.hk6007,a.ha0102
from oydhrp_hb.k060 a
left join oydhrp_hb.k001 b on a.a0102=b.a0102 and a.k0101=b.k0101 and a.k6003>=k0108 and a.k6003<=k0109
left join oydhrp_hb.a50 on a.a50_id=a50.a50_id
left join oydhrp_hb.b01 on a.b01_id=b01.b01_id
where ((b.a0102 is null) or a.k6003=b.k0108 or a.k6003=b.k0109)
    --and a.a0102::varchar like '2022%' and b.a0102::varchar like '2022%'
	--and a.a0102 like '#a0102#%' and a.a0102 like '#gldw#%'
	--and b.a0102 like '#a0102#%' and b.a0102 like '#gldw#%'
order by a.a0102,a.k0101,k6003;

--8.4
select
--'k060'+'&a0102 ='''+rtrim(cast(a0102 as varchar))+''' and k0101='''+rtrim(cast(k0101 as varchar))+''' and k6001='''+rtrim(cast(k6001 as varchar))+''''  as 编辑,
/*b01.a0102*/b01.b0101,/*ha0102,*/a50.k0101,
(case when length(rtrim(a50.k0101))<=9 and strpos( rtrim(a50.k0101),'d' )=0 then concat(rtrim(a50.k0101),left(rtrim(k060.a0103::varchar),6),'l',rtrim(k060.k6001))
when length(rtrim(a50.k0101))<=9 and strpos( rtrim(a50.k0101),'d' )<>0 then concat(left(rtrim(a50.k0101),6),left(rtrim(k060.a0103::varchar),6),'l',rtrim(k060.k6001))
when length(rtrim(a50.k0101))>9 and left(rtrim(a50.k0101),1) in ('g','h','s','t') then concat(left(rtrim(a50.k0101),4),left(rtrim(k060.a0103::varchar),6),'l',rtrim(k060.k6001))
when length(rtrim(a50.k0101))>9 and left(rtrim(a50.k0101),1) in ('x','j','y','n','c','z') then concat(left(rtrim(a50.k0101),10),'l',rtrim(k060.k6001))end) k6001 ,
k060.k6003,k060.k6002,S951.S9532/*k060.a0103,ha0103*/
from oydhrp_hb.k060
left join oydhrp_hb.s951 on left(a0103::varchar,6) = S951.S9532
left join oydhrp_hb.a50 on k060.a50_id=a50.a50_id
left join oydhrp_hb.b01 on k060.b01_id=b01.b01_id
where ((length(k060.a0103::varchar)<>6  and length(k060.a0103::varchar)<>9) or S951.S9532 is null
           or left(k060.a0102::varchar,2)<>left(k060.a0103::varchar,2)
or left(k060.a0102::varchar,4)<>left(k060.a0103::varchar,4) and length(k060.a0102::varchar)=6 )
   --and k060.a0102::varchar like '42%' and k060.a0102::varchar like '2022%'
  --and k060.a0102::varchar like '#a0102#%' and k060.a0102::varchar like '#gldw#%'




--8.5
-- select rtrim(a.a0102::varchar),a.k0101,
-- a.k6003,rtrim(a.k6002::varchar),a.a0103,rtrim(a.a0103::varchar),b.k0108,b.k0109,b.a0103,rtrim(b.a0103::varchar)
-- from
-- (select a0102,k0101,k6002,a0103,k6003
-- from oydhrp_hb.k060 /*where A0102 like '#A0102#%' and A0102 like '#GLDW#%'*/) a
-- join
-- (select a0102,k0101,k0108,k0109,a0103
-- from oydhrp_hb.k001 /*where A0102 like '#A0102#%' and A0102 like '#GLDW#%'*/) b
-- on a.a0102 = b.a0102 and a.k0101 = b.k0101 and a.k6003 >= b.k0108 and a.k6003 <= b.k0109
-- where left(a.a0103::varchar,6) <> left(b.a0103::varchar,6)