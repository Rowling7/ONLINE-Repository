-- 10.1
-- 渡口起点桩号】位置在K001表中找不到相应路段，或农村公路上的【渡口起点桩号】一般应等于所在断头路路段的起点桩号。
select
b01.b0101 '管理单位名称',
a50.k0101 '路线代码',
a50.k0112 '路线简称',
(case when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')=0 then concat(a50.k0101,left(C.S9532,6),'D',K6501)
	when length(a50.k0101)<=9 and INSTR(a50.k0101,'D')<>0 then concat(left(a50.k0101,INSTR(a50.k0101,'D')-1),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('G','H','S','T') then concat(left(a50.k0101,4),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('X','J','Y','N','C','Z') then concat(left(a50.k0101,10),'D',K6501)else null end) '渡口代码' ,
k.K6502 '渡口名称', 
k.K6503 '渡口起点桩号',
b.k0108 '路段起点桩号',
b.k0109 '路段止点桩号',
b.k0199 '路段K001表中备注'
from K065 k 
left join b01 on b01.b01_id=k.b01_id 
left join a50 on a50.a50_id=k.a50_id 
left join s951 c on c.s951_id=k.a0103
left join k001 b on b.a50_id=k.a50_id and k.k6503 >= b.k0108 and k.k6503 < b.k0109
where -- b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
AND ( b01.b0111 is null or (b01.b0111 is not null and left(a50.k0101,1) in ('X','J','Y','Z','C') and k.K6503<>b.K0108) );


-- 10.2
-- 【行政区划】必须填写，且【行政区划】应填至县级政区
select 
b01.b0101 '管理单位名称',
a50.k0101 '路线代码',
k.k6501 '渡口代码',
(case when length(a50.k0101)<=9 and instr(a50.k0101,'d')=0 then concat(a50.k0101,left(c.s9532,6),'d',k6501)
when length(a50.k0101)<=9 and instr(a50.k0101,'d')<>0 then concat(left(a50.k0101,instr(a50.k0101,'d')-1),left(c.s9532,6),'d',k6501)
when length(a50.k0101)>9 and left(a50.k0101,1) in ('g','h','s','t') then concat(left(a50.k0101,4),left(c.s9532,6),'d',k6501)
when length(a50.k0101)>9 and left(a50.k0101,1) in ('x','j','y','n','c','z') then concat(left(a50.k0101,10),'d',k6501)else null end) '渡口代码',K6503 '渡口起点桩号',
k.k6502 '渡口名称',
c.s9532 '行政区划|代码',
c.s9533 '行政区划|名称'
from k065 k
left join b01 on b01.b01_id=k.b01_id 
left join a50 on a50.a50_id=k.a50_id 
left join s951 c on c.s951_id=k.a0103
WHERE -- b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%') 
and 
(((length(c.s9532)<>6  and length(c.s9532)<>9)
OR b01.b0111 IS NULL OR LEFT(b01.b0111,2)<>LEFT(c.s9532,2)
OR LEFT(b01.b0111,4)<>LEFT(c.s9532,4) AND length(b01.b0111)=6 ));



-- 10.3
-- 渡口所在【行政区划】与所在路段的【行政区划】须保持一致
select 
b01.b0101 '管理单位名称',
a50.k0101 '路线代码',
k.k6501 'k065渡口信息表|渡口代码',
(case when length(a50.k0101)<=9 and instr(a50.k0101,'d')=0 then concat(a50.k0101,left(c.s9532,6),'d',k6501)
when length(a50.k0101)<=9 and instr(a50.k0101,'d')<>0 then concat(left(a50.k0101,instr(a50.k0101,'d')-1),left(c.s9532,6),'d',k6501)
when length(a50.k0101)>9 and left(a50.k0101,1) in ('g','h','s','t') then concat(left(a50.k0101,4),left(c.s9532,6),'d',k6501)
when length(a50.k0101)>9 and left(a50.k0101,1) in ('x','j','y','n','c','z') then concat(left(a50.k0101,10),'d',k6501)else null end) 'k065渡口信息表|渡口桩号',
k.k6502 'k065渡口信息表|渡口名称',
c.s9532 'k065渡口信息表|行政区划|代码',
c.s9533 'k065渡口信息表|行政区划|名称',
b.k0108 'k001路段综合信息表|路段起点桩号',
b.k0109 'k001路段综合信息表|路段止点桩号',
d.s9532 'k001路段综合信息表|行政区划|代码',
d.s9533 'k001路段综合信息表|行政区划|名称'
from k065 k
left join b01 on b01.b01_id=k.b01_id 
left join a50 on a50.a50_id=k.a50_id 
left join s951 c on c.s951_id=k.a0103
left join k001 b on b.a50_id=k.a50_id and k.k6503 >= b.k0108 and k.k6503 < b.k0109
left join s951 d on d.s951_id=b.a0103 
where -- b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
AND c.s9532<>d.s9532;


-- 10.4
-- 渡口宽度的单位是公里，请核对下列信息是否正确
select
b01.b0111 '管理单位代码' ,
b01.b0101 '管理单位名称',
a50.k0101 '路线代码',
a50.k0112 '路线简称',
k.k6501 '渡口编号',
(case when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')=0 then concat(a50.k0101,left(C.S9532,6),'D',K6501)
	when length(a50.k0101)<=9 and INSTR(a50.k0101,'D')<>0 then concat(left(a50.k0101,INSTR(a50.k0101,'D')-1),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('G','H','S','T') then concat(left(a50.k0101,4),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('X','J','Y','N','C','Z') then concat(left(a50.k0101,10),'D',K6501)else null end) '渡口代码' ,
k.K6523 '渡口宽度(公里)',
C.S9532 '行政区划',
k.A0130 '管养单位名称',
k6521 '河流名称'
from k065 k
left join b01 on b01.b01_id=k.b01_id 
left join a50 on a50.a50_id=k.a50_id
left join s951 B on B.s951_id=k.k6504
left join s951 C on C.s951_id=k.A0103
where -- b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
 b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
 and (ifnull(k6523,0)=0 or ifnull(k6523,0)>=15);


-- 10.5
-- 渡口所在的路段应该是断头路路段，检查k001表中是否填报正确；
select 
b01.b0101 '管理单位名称',
a50.k0101 '路线代码',
k.k6501 'k065渡口信息表|渡口代码',
(case when length(a50.k0101)<=9 and instr(a50.k0101,'d')=0 then concat(a50.k0101,left(c.s9532,6),'d',k6501)
when length(a50.k0101)<=9 and instr(a50.k0101,'d')<>0 then concat(left(a50.k0101,instr(a50.k0101,'d')-1),left(c.s9532,6),'d',k6501)
when length(a50.k0101)>9 and left(a50.k0101,1) in ('g','h','s','t') then concat(left(a50.k0101,4),left(c.s9532,6),'d',k6501)
when length(a50.k0101)>9 and left(a50.k0101,1) in ('x','j','y','n','c','z') then concat(left(a50.k0101,10),'d',k6501)else null end) 'k065渡口信息表|渡口桩号',
k.k6502 'k065渡口信息表|渡口名称',
c.s9532 'k065渡口信息表|行政区划|代码',
c.s9533 'k065渡口信息表|行政区划|名称',
b.k0108 'k001路段综合信息表|路段起点桩号',
b.k0109 'k001路段综合信息表|路段止点桩号',
d.s9532 'k001路段综合信息表|行政区划|代码',
d.s9533 'k001路段综合信息表|行政区划|名称',
(case when b.k0123 ='1000001617955771' then 2 when b.k0123='1000000721299854' then 1 end ) 'k001路段综合信息表|是否断头路路段',
b.k0199 'k001路段综合信息表|备注'
from k065 k
left join b01 on b01.b01_id=k.b01_id 
left join a50 on a50.a50_id=k.a50_id 
left join s951 c on c.s951_id=k.a0103
left join k001 b on b.a50_id=k.a50_id and k.k6503 >= b.k0108 and k.k6503 < b.k0109
left join s951 d on d.s951_id=b.a0103 
where -- b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
AND ifnull(b.k0123,'1000001617955771')<>'1000000721299854' and left(a50.k0101,1) not in ('g','s','h','t');


-- 10.6
-- 渡口代码不能重复
SELECT
b01.b0101 '管理单位名称',
a50.k0101 '路线代码',
(case when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')=0 then concat(a50.k0101,left(C.S9532,6),'D',K6501)
when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')<>0 then concat(left(a50.k0101,INSTR(a50.k0101,'D')-1),left(C.S9532,6),'D',K6501)
when LENGTH(a50.k0101)>9 and left(a50.k0101,1) in ('G','H','S','T') then concat(left(a50.k0101,4),left(C.S9532,6),'D',K6501)
when LENGTH(a50.k0101)>9 and left(a50.k0101,1) in ('X','J','Y','N','C','Z') then concat(left(a50.k0101,10),'D',K6501)else null end) '渡口编号'	,
	COUNT(case when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')=0 then concat(a50.k0101,left(C.S9532,6),'D',K6501)
	when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')<>0 then concat(left(a50.k0101,INSTR(a50.k0101,'D')-1),left(C.S9532,6),'D',K6501)
	when LENGTH(a50.k0101)>9 and left(a50.k0101,1) in ('G','H','S','T') then concat(left(a50.k0101,4),left(C.S9532,6),'D',K6501)
	when LENGTH(a50.k0101)>9 and left(a50.k0101,1) in ('X','J','Y','N','C','Z') then concat(left(a50.k0101,10),'D',K6501)else null end)  '渡口代码重复数量'
from k065 K
left join b01 on b01.b01_id=k.b01_id 
left join a50 on a50.a50_id=k.a50_id
left join s951 B on B.s951_id=k.k6504
left join s951 C on C.s951_id=k.A0103
where -- b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
 b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
GROUP BY 
(case when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')=0 then concat(a50.k0101,left(C.S9532,6),'D',K6501)
when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')<>0 then concat(left(a50.k0101,INSTR(a50.k0101,'D')-1),left(C.S9532,6),'D',K6501)
when LENGTH(a50.k0101)>9 and left(a50.k0101,1) in ('G','H','S','T') then concat(left(a50.k0101,4),left(C.S9532,6),'D',K6501)
when LENGTH(a50.k0101)>9 and left(a50.k0101,1) in ('X','J','Y','N','C','Z') then concat(left(a50.k0101,10),'D',K6501)else null end) 	
HAVING '渡口代码重复数量' >1;


-- 10.7
-- 管养单位名称】不能为空
select 
b01.b0111 '管理单位代码' ,
b01.b0101 '管理单位名称',
a50.k0101 '路线代码',
a50.k0112 '路线简称',
k.k6501,
(case when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')=0 then concat(a50.k0101,left(C.S9532,6),'D',K6501)
	when length(a50.k0101)<=9 and INSTR(a50.k0101,'D')<>0 then concat(left(a50.k0101,INSTR(a50.k0101,'D')-1),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('G','H','S','T') then concat(left(a50.k0101,4),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('X','J','Y','N','C','Z') then concat(left(a50.k0101,10),'D',K6501)else null end) '渡口编号' ,
k.k6502 '渡口名称',
k.K6523 '渡口宽度(公里)',
C.S9532 '行政区划',
k.A0130 '管养单位名称'
from k065 k
left join b01 on b01.b01_id=k.b01_id 
left join a50 on a50.a50_id=k.a50_id
left join s951 B on B.s951_id=k.k6504
left join s951 C on C.s951_id=k.A0103
where --   b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
 b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
and NOT(NOT (k.A0130 LIKE '%不%') AND NOT (k.A0130 LIKE '%未%') AND NOT (k.A0130 LIKE '%0%') AND k.A0130 IS NOT NULL AND k.A0130<>'');


-- 10.8
-- 渡口渡船里渡轮的数量、总功率、载车数应该同时填报
select 
b01.b0111 '管理单位代码' ,
b01.b0101 '管理单位名称',
a50.k0101 '路线代码',
(case when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')=0 then concat(a50.k0101,left(C.S9532,6),'D',K6501)
	when length(a50.k0101)<=9 and INSTR(a50.k0101,'D')<>0 then concat(left(a50.k0101,INSTR(a50.k0101,'D')-1),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('G','H','S','T') then concat(left(a50.k0101,4),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('X','J','Y','N','C','Z') then concat(left(a50.k0101,10),'D',K6501)else null end) '渡口编号',	
k6502 '渡口名称',
b.s9532 '渡口分类代码',
b.s9533 '渡口分类名称',
K6584 '拖轮_数量(艘)',
K6585 '拖轮_净载重量(吨位)',
K6586 '拖轮_功率(千瓦)',
K6543 '渡驳_数量(艘)',
K6544 '渡驳_载车数(辆)'
from k065 K
left join b01 on b01.b01_id=k.b01_id 
left join a50 on a50.a50_id=k.a50_id
left join s951 B on B.s951_id=k.k6504
left join s951 C on C.s951_id=k.A0103
where -- b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
 and
(      (ifnull(k6584,0)<>0 and ifnull(k6543,0)=0 ) or 
 not( (ifnull(k6584,0)=0 and ifnull(k6586,0)=0 and ifnull(k6585,0)=0 ) or (ifnull(k6584,0)<>0 and ifnull(k6586,0)<>0 and ifnull(k6585,0)<>0 ) ) or
 not( (ifnull(k6543,0)=0 and ifnull(k6544,0)=0  ) or (ifnull(k6543,0)<>0 and ifnull(k6544,0)<>0 ) )
);


-- 10.9
-- 渡口渡船里渡轮的数量、总功率、载车数应该同时填报
select 
b01.b0111 '管理单位代码' ,
b01.b0101 '管理单位名称',
a50.k0101 '路线代码',
(case when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')=0 then concat(a50.k0101,left(C.S9532,6),'D',K6501)
	when length(a50.k0101)<=9 and INSTR(a50.k0101,'D')<>0 then concat(left(a50.k0101,INSTR(a50.k0101,'D')-1),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('G','H','S','T') then concat(left(a50.k0101,4),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('X','J','Y','N','C','Z') then concat(left(a50.k0101,10),'D',K6501)else null end) '渡口编号',	
k6502 '渡口名称',
b.s9532 '渡口分类代码',
b.s9533 '渡口分类名称',
k6540 '渡轮_数量(艘)',
k6541 '渡轮_总功率(千瓦)',
k6542 '渡轮_载车数(辆)'
from k065 K
left join b01 on b01.b01_id=k.b01_id 
left join a50 on a50.a50_id=k.a50_id
left join s951 B on B.s951_id=k.k6504
left join s951 C on C.s951_id=k.A0103
where -- b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
and
 not( (ifnull(k6540,0)=0 and ifnull(k6541,0)=0 and ifnull(k6542,0)=0 ) or (ifnull(k6540,0)<>0 and ifnull(k6541,0)<>0 and ifnull(k6542,0)<>0 ) );


-- 10.10
-- 机动渡口的机动渡船的数量不能为零或空，非机动渡口(人力渡口)的非机动渡船的数量不能为零或空
select 
b01.b0111 '管理单位代码' ,
b01.b0101 '管理单位名称',
a50.k0101 '路线代码',
(case when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')=0 then concat(a50.k0101,left(C.S9532,6),'D',K6501)
	when length(a50.k0101)<=9 and INSTR(a50.k0101,'D')<>0 then concat(left(a50.k0101,INSTR(a50.k0101,'D')-1),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('G','H','S','T') then concat(left(a50.k0101,4),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('X','J','Y','N','C','Z') then concat(left(a50.k0101,10),'D',K6501)else null end) '渡口编号',	
k6502 '渡口名称',
b.s9532 '渡口分类代码',
b.s9533 '渡口分类名称',
k6581 '机动渡船_数量(艘)',
k6582 '机动渡船_功率(千瓦)',
k6583 '机动渡船_净载重量(吨位)',
k6587 '非机动渡船_数量(艘)',
k6589 '非机动渡船_功率(千瓦)',
k6588 '非机动渡船_净载重量(吨位)'
from k065 k
left join b01 on b01.b01_id=k.b01_id 
left join a50 on a50.a50_id=k.a50_id
left join s951 B on B.s951_id=k.k6504
left join s951 C on C.s951_id=k.A0103
where -- b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
and  ((case when b.s9532='1' then 1 else 0 end)>ifnull(k6581,0)or
 (case when b.s9532='2' then 1 else 0 end)>ifnull(k6587,0));
 
 
 -- 10.11
 -- [机动渡船数量]填有数量时，机动渡船净载重量、总功率不能为零或空；机动渡船数量应大于等于渡轮数量
select 
b01.b0111 '管理单位代码' ,
b01.b0101 '管理单位名称',
a50.k0101 '路线代码',
(case when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')=0 then concat(a50.k0101,left(C.S9532,6),'D',K6501)
	when length(a50.k0101)<=9 and INSTR(a50.k0101,'D')<>0 then concat(left(a50.k0101,INSTR(a50.k0101,'D')-1),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('G','H','S','T') then concat(left(a50.k0101,4),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('X','J','Y','N','C','Z') then concat(left(a50.k0101,10),'D',K6501)else null end) '渡口编号',	
k6502 '渡口名称',
b.s9532 '渡口分类代码',
b.s9533 '渡口分类名称',
k6581 '机动渡船_数量(艘)',
k6582 '机动渡船_功率(千瓦)',
k6583 '机动渡船_净载重量(吨位)',
k6540 '渡轮_数量(艘)',
k6541 '渡轮_总功率(千瓦)',
k6542 '渡轮_载车数(辆)'
from k065 K
left join b01 on b01.b01_id=k.b01_id 
left join a50 on a50.a50_id=k.a50_id
left join s951 B on B.s951_id=k.k6504
left join s951 C on C.s951_id=k.A0103
where -- b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
 and b.s9532='1' and
(
(ifnull(k6581,0)=0 or ifnull(k6582,0)=0 or ifnull(k6583,0)=0) or 
ifnull(k6581,0)<ifnull(k6540,0) or 
ifnull(k6583,0)<ifnull(k6541,0)
);
 
 
 -- 10.12
 -- [非机动渡船数量]填有数量时，非机动渡船净载重量、总功率不能为零或空；非机动渡船数量应大于等于渡驳数量
select 
b01.b0111 '管理单位代码' ,
b01.b0101 '管理单位名称',
a50.k0101 '路线代码',
(case when LENGTH(a50.k0101)<=9 and INSTR(a50.k0101,'D')=0 then concat(a50.k0101,left(C.S9532,6),'D',K6501)
	when length(a50.k0101)<=9 and INSTR(a50.k0101,'D')<>0 then concat(left(a50.k0101,INSTR(a50.k0101,'D')-1),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('G','H','S','T') then concat(left(a50.k0101,4),left(C.S9532,6),'D',K6501)
	when length(a50.k0101)>9 and left(a50.k0101,1) in ('X','J','Y','N','C','Z') then concat(left(a50.k0101,10),'D',K6501)else null end) '渡口编号',	
k6502 '渡口名称',
b.s9532 '渡口分类代码',
b.s9533 '渡口分类名称',
k6581 '机动渡船_数量(艘)',
k6582 '机动渡船_功率(千瓦)',
k6583 '机动渡船_净载重量(吨位)',
k6540 '渡轮_数量(艘)',
k6541 '渡轮_总功率(千瓦)',
k6542 '渡轮_载车数(辆)'
from k065 K
left join b01 on b01.b01_id=k.b01_id 
left join a50 on a50.a50_id=k.a50_id
left join s951 B on B.s951_id=k.k6504
left join s951 C on C.s951_id=k.A0103
where -- b01.b0111 like concat( (select b0111 from b01 where b01_id=#{BO1CODE} ),'%')
b01.b0111 like concat( (select b0111 from b01 where b01_id=1000001653571912),'%')
 and b.s9532='2' and
(
(ifnull(k6587,0)=0 or ifnull(k6589,0)=0 or ifnull(k6588,0)=0) or 
	ifnull(k6587,0)<ifnull(k6543,0) 
);
