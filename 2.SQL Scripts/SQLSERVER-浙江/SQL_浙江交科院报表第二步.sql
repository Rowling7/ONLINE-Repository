-- 填写管理单位代码
declare @A0102 char(15)
set @A0102='33_0783'

if object_id('tempdb..#A01') is not null drop table #A01
create table #A01(A0102 CHAR(20),HA0102 CHAR(50),K0101 CHAR(20))

if object_id('tempdb..#a50') is not null drop table #a50
select * into #a50 from a50 where a0102 like rtrim(@A0102)+'%'

if object_id('tempdb..#k001') is not null drop table #k001
select * into #k001 from k001 where a0102 like rtrim(@A0102)+'%'

if object_id('tempdb..#k063') is not null drop table #k063
select * into #k063 from k063 where a0102 like rtrim(@A0102)+'%'

if object_id('tempdb..#k060') is not null drop table #k060
select * into #k060 from k060 where a0102 like rtrim(@A0102)+'%'

update #a50 set a0102=replace(left(a0102,7),'331','332') where left(k0101,1) in ('X','Y','Z','C')
update #k001 set a0102=replace(left(a0102,7),'331','332') where left(k0101,1) in ('X','Y','Z','C')
update #k063 set a0102=replace(left(a0102,7),'331','332') where left(k0101,1) in ('X','Y','Z','C')
update #k060 set a0102=replace(left(a0102,7),'331','332') where left(k0101,1) in ('X','Y','Z','C')
update #a50 set a0102=replace(left(a0102,7),'331','330') where len(k0101)<10
update #k001 set a0102=replace(left(a0102,7),'331','330') where len(k0101)<10
update #k063 set a0102=replace(left(a0102,7),'331','330') where len(k0101)<10
update #k060 set a0102=replace(left(a0102,7),'331','330') where len(k0101)<10
update #a50 set a0102=left(a0102,7)
update #k001 set a0102=left(a0102,7)
update #k063 set a0102=left(a0102,7)
update #k060 set a0102=left(a0102,7)

INSERT INTO #A01 VALUES(replace(@A0102,'_','0'),'','G')
INSERT INTO #A01 VALUES(replace(@A0102,'_','0'),'','S')
INSERT INTO #A01 VALUES(replace(@A0102,'_','1'),'','G')
INSERT INTO #A01 VALUES(replace(@A0102,'_','1'),'','S')
INSERT INTO #A01 VALUES(replace(@A0102,'_','2'),'','X')
INSERT INTO #A01 VALUES(replace(@A0102,'_','2'),'','Y')
INSERT INTO #A01 VALUES(replace(@A0102,'_','2'),'','C')
UPDATE #A01 SET HA0102=OBJJC
FROM DA0102 WHERE REPLACE(A0102,'330','331')=OBJNAME

-- SELECT * from #a01
/*  select * from #lx
update #a50 set a0102=left(a0102,5)
update #k001 set a0102=left(a0102,5)
update #k063 set a0102=left(a0102,5)
update #k060 set a0102=left(a0102,5)
*/
--整合一个县区管理单位后，删除重复路线
delete #a50
where rtrim(k0101) in (
select rtrim(k0101) from #a50
group by a0102,k0101
having count(1)>1
) and
rtrim(k0101)+rtrim(ha0102) not in (
select rtrim(k0101)+max(rtrim(ha0102)) from #a50
group by a0102,k0101
having count(1)>1
)

-- !!读取EXCEL表中 路线 页签的数据
if object_id('tempdb..#lx') is not null drop table #lx
create table #lx(FHSJ CHAR(50),TPBM CHAR(50),gldw char(20),a0102 char(12),ha0102 varchar(50),
Yk0101 char(15),Yk0112 varchar(50),Yk0108 numeric(18,3),Yk0109 numeric(18,3),YK0114 NUMERIC(18,3),YHK5104 VARCHAR(50),
WK0101 CHAR(15),Wk0108 numeric(18,3),Wk0109 numeric(18,3),WK0114 NUMERIC(18,3),WHK5104 VARCHAR(50),cflx char(20),WCJWT VARCHAR(255),
BGLX CHAR(20),BGYY VARCHAR(255),XGJY CHAR(255),B1 CHAR(255),B2 CHAR(255),B3 CHAR(255),B4 char(255)
)
INSERT #lx(fhsj,tpbm,gldw,YK0101,YK0112,YK0108,YK0109,YK0114,YHK5104,WK0101,WK0108,WK0109,WK0114,WHK5104,cflx,WCJWT,BGLX,BGYY,XGJY)
Select a,f2,f3,f4,f5,f6,f7,f8,f9,F10,f11,f12,f13,f14,f15,f16,f17,f18,f19  from
--OPENROWSET('Microsoft.ACE.OLEDB.12.0','Excel 8.0;HDR=YES;
OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;
DATABASE=E:\My Files\Work-DFYD\给交科院-金华复核20230923\数据核查-金华永康-汇总-20230923.xlsx'
,路线$)
DELETE FROM #LX WHERE yk0101 LIKE 'CYS%'

-- !!读取EXCEL表中 桥梁 页签的数据
if object_id('tempdb..#ql') is not null drop table #ql
create table #ql(FHSJ CHAR(50),TPBM CHAR(50),gldw char(20),a0102 char(12),ha0102 varchar(50),
Yk0101 char(15),Yk0112 varchar(50),k6001 char(20),k6002 char(50),yk6003 NUMERIC(18,3),
WK0101 CHAR(15),wk6003 numeric(18,3),WCJWT VARCHAR(255),
BGLX CHAR(20),BGYY VARCHAR(255),XGJY CHAR(50),B1 CHAR(255),B2 CHAR(255),B3 CHAR(255),B4 char(255)
)
INSERT #ql(fhsj,tpbm,gldw,YK0101,YK0112,k6001,k6002,yk6003,WK0101,wk6003,WCJWT,BGLX,BGYY,XGJY)
Select a,f2,f3,f4,f5,f6,f7,f8,F9,f10,f11,f12,f13,f14  from
--OPENROWSET('Microsoft.ACE.OLEDB.12.0','Excel 8.0;HDR=YES;
OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;
DATABASE=E:\My Files\Work-DFYD\给交科院-金华复核20230923\数据核查-金华永康-汇总-20230923.xlsx'
,桥梁$)
DELETE FROM #ql WHERE yk0101 LIKE 'CYS%'

-- !!读取EXCEL表中 隧道 页签的数据
if object_id('tempdb..#sd') is not null drop table #sd
create table #sd(FHSJ CHAR(50),TPBM CHAR(50),gldw char(20),a0102 char(12),ha0102 varchar(50),
Yk0101 char(15),Yk0112 varchar(50),k6301 char(20),k6302 char(50),yk6303 NUMERIC(18,3),
WK0101 CHAR(15),wk6303 numeric(18,3),WCJWT VARCHAR(255),
BGLX CHAR(20),BGYY VARCHAR(255),XGJY CHAR(50),B1 CHAR(255),B2 CHAR(255),B3 CHAR(255),B4 char(255)
)
INSERT #sd(fhsj,tpbm,gldw,YK0101,YK0112,k6301,k6302,yk6303,WK0101,wk6303,WCJWT,BGLX,BGYY,XGJY)
Select a,f2,f3,f4,f5,f6,f7,f8,F9,f10,f11,f12,f13,f14 from
-- !!写法一
--OPENROWSET('Microsoft.ACE.OLEDB.12.0','Excel 8.0;HDR=YES;
OPENROWSET('Microsoft.JET.OLEDB.4.0','Excel 5.0;HDR=YES;
DATABASE=E:\My Files\Work-DFYD\给交科院-金华复核20230923\数据核查-金华永康-汇总-20230923.xlsx'
,桥梁$)
/*  !!写法二
OpenRowSet
('MSDASQL','DRIVER=Microsoft Excel Driver (*.xls);
DBQ=E:\6078曹勇嵩\1.工作文件\1.工作文件（日期分类）\20230923 浙江\map\330783东阳\数据核查-金华东阳-汇总.xls;
UID=admin; PWS=','SELECT * from [隧道$]')*/



------------------------------------------------------路线------------------------------------------------------
--插入外业未采集的路线
insert into #lx(yk0101,yk0112,yk0108,yk0109,yk0114,yhk5104,bglx,xgjy,B4)
select k0101,k0112,k0108,k0109,k0114,hk5104,'不变','不变','未采集' from #k001  a
left join #lx on rtrim(k0101)=rtrim(yk0101) and rtrim(k0108)=rtrim(yk0108)
where 1=1
and yk0101 is null
and isnull(k0124,'')=''
and isnull(k0123,2)<>1
--and len(k0101)>=10
and a.a0102 like rtrim(@A0102)+'%'
and left(k0101,1) in  ('G','S','X','Y','C')


--插入外业未采集的桥梁
insert into #ql(yk0101,yk0112,k6001,k6002,yk6003,bglx,xgjy,B4)
select k0101,k0112,rtrim(k0101)+'L'+rtrim(a.k6001),a.k6002,a.k6003,'无法判断','','未采集' from #k060 a left join #ql on rtrim(k0101)=rtrim(yk0101) and rtrim(k6003)=rtrim(yk6003)
where yk0101 is null
and a.a0102 like rtrim(@A0102)+'%'
and left(k0101,1) in  ('G','S','X','Y','C')

--插入外业未采集的隧道
insert into #sd(yk0101,yk0112,k6301,k6302,yk6303,bglx,xgjy,B4)
select k0101,k0112,rtrim(k0101)+'U'+rtrim(a.k6301),a.k6302,a.k6303,'无法判断','','未采集' from #k063 a left join #sd on rtrim(k0101)=rtrim(yk0101) and rtrim(k6303)=rtrim(yk6303)
where yk0101 is null
and a.a0102 like rtrim(@A0102)+'%'
and left(k0101,1) in  ('G','S','X','Y','C')

-- 处理路线核查数据
update #lx set yk0101=case when len(wk0101)>=10 then left(wk0101,10) else left(wk0101,len(wk0101)-1) end where isnull(yk0101,'')=''

-- 根据数据库获取管理单位
-- 原数据库数据
update a set a.a0102=b.a0102,a.ha0102=b.ha0102
from #lx a join #k001 b on a.yk0101=b.k0101 AND A.YK0108=B.K0108

-- 外业数据或者和数据库对应不上的数据
-- !!更新对不上数据的管理单位
update a set a.a0102=b.a0102,a.ha0102=b.ha0102
from #lx a join #k001 b on left(a.yk0101,10)=b.k0101 and wk0108>=k0108 and wk0108<=k0109
where a.a0102 is null

update a set a.a0102=b.a0102,a.ha0102=b.ha0102
from #lx a join (
select * from #k001 where rtrim(a0102)+k0101 in(
select rtrim(max(a0102))+k0101 a from #k001 group by k0101)
) b on left(a.yk0101,10)=b.k0101
where a.a0102 is null

--删除不存在的数据
delete #lx where a0102 is null and wk0101 is null

---删除核查的重复里程
if object_id('tempdb..#cf') is not null drop table #cf
select a.* into #cf
from #lx a left join #k001 on yk0101=k0101 and yk0108=k0108
where yk0101 is not null and yk0108 is not null
and (isnull(k0124,'')<>''
or isnull(k0123,2)=1)
delete a
from #lx a left join #k001 on yk0101=k0101 and yk0108=k0108
where yk0101 is not null and yk0108 is not null
and (isnull(k0124,'')<>''
or isnull(k0123,2)=1)

--更新路面类型
update #lx set b1=case when left(yhk5104,2)='沥青' then '11' else case when left(yhk5104,2)='水泥' then '12' else '13' end end
where yhk5104 is not null
update #lx set b2=case when left(whk5104,2)='沥青' then '11' else case when left(whk5104,2)='水泥' then '12' else '13' end end
where whk5104 is not null

--查询出变更类型没有填写的数据，并且一并按照不变填写
update #lx set bglx='不变',xgjy='不变'
where yk0101 is not null and yk0108 is not null and bglx is null

--更新变更路线
update #lx set bglx=ltrim(rtrim(bglx))

UPDATE #LX SET B3=case WHEN isnull(bglx,'')='不变' THEN '1' ELSE
case WHEN isnull(bglx,'') in ('变更') THEN '2' ELSE
case WHEN isnull(bglx,'')='新增' THEN '3' ELSE
case WHEN isnull(bglx,'')='删除' THEN '4' ELSE
case WHEN isnull(bglx,'')='无法判断' THEN '5' ELSE null end end end end end

-- 修正里程
-- !!重新计算路段长度 k0114 wk0114
update #lx set yk0114=convert(decimal(8,3),isnull(yk0109,0)-isnull(yk0108,0)),wk0114=convert(decimal(8,3),isnull(wk0109,0)-isnull(wk0108,0))

update a set yhk5104=rtrim(hk5104)
from #lx a join #k001 b on yk0101=k0101 and yk0108=k0108

update #lx set whk5104=null where bglx='不变'


------------------------------------------------------桥梁------------------------------------------------------
update #ql set yk0101=left(wk0101,10) where isnull(yk0101,'')=''
--根据数据库更新桥梁的管理单位
update a set a.a0102=b.a0102,a.ha0102=b.ha0102,a.yk0112=b.k0112
from #ql a left join #k060 b on left(a.yk0101,10)=left(b.k0101,10) and yk6003=k6003
--更新外业采集的数据的管理单位
update a set a.a0102=b.a0102,a.ha0102=b.ha0102
from #ql a left join #a50 b on left(a.yk0101,10)=left(b.k0101,10)
where a.a0102 is null

--更新变更类型  select * from #ql   select * from #k060
update #ql set bglx=ltrim(rtrim(bglx))
UPDATE #ql SET B3=case WHEN isnull(bglx,'')='不变' THEN '1' ELSE
case WHEN isnull(bglx,'') in ('变更') THEN '2' ELSE
case WHEN isnull(bglx,'')='新增' THEN '3' ELSE
case WHEN isnull(bglx,'')='删除' THEN '4' ELSE
case WHEN isnull(bglx,'')='无法判断' THEN '5' ELSE null end end end end end
--删除错误数据
--select * from #ql where a0102 is null
delete #ql where a0102 is null


------------------------------------------------------隧道------------------------------------------------------
update #sd set yk0101=left(wk0101,10) where isnull(yk0101,'')=''

update a set a.a0102=b.a0102,a.ha0102=b.ha0102,a.yk0112=b.k0112
from #sd a left join #a50 b on left(a.yk0101,10)=left(b.k0101,10)
update a set a.a0102=b.a0102,a.ha0102=b.ha0102
from #sd a left join #a50 b on left(a.wk0101,10)=left(b.k0101,10)
where a.a0102 is null

--删除错误数据
delete #sd where a0102 is null
--更新变更类型
update #sd set bglx=ltrim(rtrim(bglx))
UPDATE #sd SET B3=case WHEN isnull(bglx,'')='不变' THEN '1' ELSE
case WHEN isnull(bglx,'') in ('变更') THEN '2' ELSE
case WHEN isnull(bglx,'')='新增' THEN '3' ELSE
case WHEN isnull(bglx,'')='删除' THEN '4' ELSE
case WHEN isnull(bglx,'')='无法判断' THEN '5' ELSE null end end end end end


------------------------------------------------------公路普查结论表------------------------------------------------------
-- !表2-1
-- !!查询路线条数
SELECT
'公路普查结论表' '!!表2-1',1 A,*
FROM (
	select LEFT(min(A01.A0102),7) A0102,MAX(YTS.HA0102) HA0102,
	case when grouping(A01.A0102)=1 and grouping(A01.K0101)=1 then 'zzZ' else
	case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)='330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X'))+rtrim('S') else
	case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)<>'330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X')) else
	case when grouping(A01.A0102)=0 and grouping(A01.K0101)=0 and left(A01.a0102,3)='330' then max(rtrim(A01.K0101))+rtrim('S')
	else max(rtrim(A01.K0101)) end end end end k0101,
	SUM(ISNULL(YTS,0)) YTS,
	'——' F10,
	SUM(ISNULL(WTS,0))    WTS,
	SUM(ISNULL(YTS,0))+SUM(case when XZTS is null then 0 else isnull(XZTS,0) END)-SUM(case when SCTS is null then 0 else isnull(SCTS,0) END) FHTS,
	'——' A2,
	((SUM(ISNULL(YTS,0))+SUM(case when XZTS is null then 0 else isnull(XZTS,0) END)-SUM(case when SCTS is null then 0 else isnull(SCTS,0) END)-SUM(			ISNULL(YTS,0)))*1.0/CASE WHEN SUM(ISNULL(YTS,0))=0 THEN 1 ELSE SUM(ISNULL(YTS,0)) END)*100 BHL
from
(	select MAX(a.A0102) A0102,MAX(a.HA0102) ha0102,replace(replace(replace(a.k0101,'D001',''),'D002',''),'D003','') k0101,1 YTS
	from #k001 a join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
	where isnull(k0180,'1')<>'3' and
	a.A0102 like rtrim(@A0102)+'%' /*@A0102*/
	and left(a.K0101,1) in ('G','S','X','Y','C')
	and isnull(k0123,2)<>1
	and k0124 is null
	group by a.a0102,replace(replace(replace(a.k0101,'D001',''),'D002',''),'D003','')
) YTS
FULL join (
	select 1 WTS,replace(replace(replace(yk0101,'D001',''),'D002',''),'D003','') k0101,a0102 from #lx
	where left(yk0101,1) in ('G','S','X','Y','C') AND isnull(B4,'')<>'未采集'
	group by a0102,replace(replace(replace(yk0101,'D001',''),'D002',''),'D003','')
) WTS ON YTS.A0102=WTS.A0102 AND YTS.K0101=WTS.K0101
FULL JOIN (
	select yk0101 K0101,max(a0102) a0102,1 SCTS from #lx
	where yk0108 is not null
	and yk0101 not in (select Yk0101 from #lx where b3<>4 and Yk0108 is not null)
	AND left(yk0101,1) in ('G','S','X','Y','C')
	group by yk0101
) SCTS ON YTS.A0102=SCTS.A0102 AND YTS.K0101=SCTS.K0101
FULL JOIN (
	select yk0101 K0101,max(a0102) a0102,count(1) XZTS from #lx
	where left(yk0101,1) in ('G','S','X','Y','C')
	AND isnull(b3,'')='3' and isnull(wcjwt,'') like '非原数据库%'
	group by yk0101
) XZTS ON YTS.A0102=XZTS.A0102 AND YTS.K0101=XZTS.K0101
left JOIN #A01 A01 ON YTS.A0102=A01.A0102 AND LEFT(YTS.K0101,1)=A01.K0101
GROUP BY A01.A0102,A01.K0101
WITH ROLLUP
)  AS TS WHERE LEFT(K0101,1)='z'

UNION

--!!查询路线里程
SELECT '公路普查结论表' '公路普查结论表',2 A,*
FROM (
SELECT LEFT(min(A01.A0102),7) A0102,MAX(YLC.HA0102) HA0102,
	case when grouping(A01.A0102)=1 and grouping(A01.K0101)=1 then 'zzZ' else
	case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)='330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X'))+rtrim('S') else
	case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)<>'330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X')) else
	case when grouping(A01.A0102)=0 and grouping(A01.K0101)=0 and left(A01.a0102,3)='330' then max(rtrim(A01.K0101))+rtrim('S')
	else max(rtrim(A01.K0101)) end end end end k0101,
	SUM(ISNULL(YLC.K0114,0)) K0114
	,'——' F10,
	SUM(ISNULL(FHLC.WLC,0)) WLC,
	SUM(ISNULL(YLC.K0114,0))+SUM(ISNULL(FHLC.XZLC,0))-SUM(ISNULL(FHLC.SCLC,0))+SUM(ISNULL(FHLC.LXBG_LCBG,0)) FHHLC,
	'——' A2,
	((SUM(ISNULL(YLC.K0114,0))+SUM(ISNULL(FHLC.XZLC,0))-SUM(ISNULL(FHLC.SCLC,0))+SUM(ISNULL(FHLC.LXBG_LCBG,0))-SUM(ISNULL(YLC.K0114,0)))*1.0/CASE WHEN 		SUM(ISNULL(YLC.K0114,0))=0 THEN 1 ELSE SUM(ISNULL(YLC.K0114,0)) END )*100 LCBHL
 FROM (
	select  max(A.A0102) A0102,max(A.HA0102) HA0102,max(A.K0101) K0101,sum(k0114) K0114 from #k001 a
	join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
	join da0201 on left(a.k0101,1)=objname
	where isnull(k0180,'1')<>'3' and
	a.A0102 like rtrim(@A0102)+'%'
	and left(a.K0101,1) in ('G','S','X','Y','C')
	and isnull(k0123,2)<>1
	and isnull(k0124,'')=''
	GROUP BY A.A0102,replace(replace(replace(a.k0101,'D001',''),'D002',''),'D003','')
	) YLC
LEFT JOIN (
	select
		A0102,MAX(HA0102) ha0102,Yk0101,
		sum(isnull(wk0114,0)) wlc,--外业采集里程
		sum(case when isnull(b3,'')='3' then wk0114 else 0 end) XZLC, --新增
		sum(case when isnull(b3,'')='4' then yk0114 else 0 end) scLC, --删除
		sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更' and
		(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8) then wk0114-yk0114 else 0 			end) LXBG_LCBG,  --路线变更-里程变更
		null w
	from #LX a
	where left(yK0101,1) in  ('G','S','X','Y','C')
	group by A0102,yk0101
	) FHLC ON YLC.A0102=FHLC.A0102 AND YLC.K0101=FHLC.YK0101
FULL JOIN
	#A01 A01 ON YLC.A0102=A01.A0102 AND LEFT(YLC.K0101,1)=A01.K0101
	GROUP BY A01.A0102,A01.K0101 WITH ROLLUP
	) LC WHERE LEFT(K0101,1)='z'

UNION
--!!查询桥梁数据
SELECT '公路普查结论表' '公路普查结论表',3,*
FROM (
SELECT
	CASE WHEN A01.A0102 IS NULL THEN MIN(FHQL.A0102) ELSE LEFT(min(A01.A0102),7) END A0102,
	CASE WHEN MAX(YQL.HA0102) IS NULL THEN MAX(FHQL.HA0102) ELSE MAX(YQL.HA0102) END HA0102,
	case when grouping(A01.A0102)=1 and grouping(A01.K0101)=1 then 'zzZ' else
	case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)='330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X'))+rtrim('S') else
	case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)<>'330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X')) else
	case when grouping(A01.A0102)=0 and grouping(A01.K0101)=0 and left(A01.a0102,3)='330' then max(rtrim(A01.K0101))+rtrim('S')
	else max(rtrim(A01.K0101)) end end end end k0101,
	SUM(ISNULL(YQL,0)) YQL,
	'——' F10,
	SUM(ISNULL(WQL,0)) WQL,
	SUM(ISNULL(YQL,0))+SUM(ISNULL(XZQL,0))-SUM(ISNULL(SCQL,0)) FHQL,
	'——' A2,
	((SUM(ISNULL(YQL,0))+SUM(ISNULL(XZQL,0))-SUM(ISNULL(SCQL,0))-SUM(ISNULL(YQL,0)))*1.0/case when SUM(ISNULL(YQL,0))=0 then 1 else SUM(ISNULL(YQL,0)) 		end)*100 QLBHL
FROM (
	select B.a0102,max(B.ha0102) ha0102,MAX(B.k0101) K0101,SUM(CASE WHEN A.A0102 IS NULL THEN 0 ELSE 1 END) YQL
	from #k060 a FULL join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
	where isnull(k0180,'1')<>'3' and B.A0102 like rtrim(@A0102)+'%'
	and left(B.K0101,1) in ('G','S','X','Y','C')
	group by B.a0102,B.k0101
) YQL
FULL JOIN (
	select A0102,MAX(HA0102) HA0102,YK0101 K0101,SUM(CASE WHEN WK6003 IS NOT NULL THEN 1 ELSE 0 END) WQL,
	SUM(CASE WHEN B3='3' THEN 1 ELSE 0 END) XZQL,SUM(CASE WHEN B3='4' THEN 1 ELSE 0 END) SCQL
	from #ql a
	where left(yK0101,1) in  ('G','S','X','Y','C')
	GROUP BY A0102,YK0101
) FHQL ON YQL.A0102=FHQL.A0102 AND YQL.K0101=FHQL.K0101
FULL JOIN
	#A01 A01 ON YQL.A0102=A01.A0102 AND LEFT(YQL.K0101,1)=A01.K0101
GROUP BY A01.A0102,A01.K0101 WITH ROLLUP
) QL WHERE LEFT(K0101,1)='z'

UNION
--!!查询隧道数据
SELECT '公路普查结论表' '公路普查结论表',4,*
FROM (
SELECT
	CASE WHEN MAX(A01.A0102) IS NULL THEN MIN(FHSD.A0102) ELSE LEFT(min(A01.A0102),7) END A0102,
	CASE WHEN MAX(YSD.HA0102) IS NULL THEN MAX(FHSD.HA0102) ELSE MAX(YSD.HA0102) END HA0102,
	case when grouping(A01.A0102)=1 and grouping(A01.K0101)=1 then 'zzZ' else
	case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)='330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S',	'G'),'C','X'),'Y','X'),'Z','X'))+rtrim('S') else
	case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)<>'330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X')) else
	case when grouping(A01.A0102)=0 and grouping(A01.K0101)=0 and left(A01.a0102,3)='330' then max(rtrim(A01.K0101))+rtrim('S')
	else max(rtrim(A01.K0101)) end end end end k0101,
	SUM(ISNULL(YSD,0)) YSD,
	'——' F10,
	SUM(ISNULL(WSD,0)) WSD,
	SUM(ISNULL(YSD,0))+SUM(ISNULL(XZSD,0))-SUM(ISNULL(SCSD,0)) FHSD,'——' A2,
	((SUM(ISNULL(YSD,0))+SUM(ISNULL(XZSD,0))-SUM(ISNULL(SCSD,0))-SUM(ISNULL(YSD,0)))*1.0/CASE WHEN SUM(ISNULL(YSD,0))=0 THEN 1 ELSE SUM(ISNULL(YSD,0)) END)*100 QLBHL
FROM (
	select B.a0102,max(B.ha0102) ha0102,MAX(B.k0101) K0101,SUM(CASE WHEN A.A0102 IS NULL THEN 0 ELSE 1 END) YSD
	from #k063 a FULL join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
	where isnull(k0180,'1')<>'3' and B.A0102 like rtrim(@A0102)+'%'
	and left(B.K0101,1) in ('G','S','X','Y','C')
	group by B.a0102,B.k0101
) YSD
FULL JOIN (
	select A0102,MAX(HA0102) HA0102,YK0101 K0101,SUM(CASE WHEN WK6303 IS NOT NULL THEN 1 ELSE 0 END) WSD,
	SUM(CASE WHEN B3='3' THEN 1 ELSE 0 END) XZSD,SUM(CASE WHEN B3='4' THEN 1 ELSE 0 END) SCSD
	from #SD a
	where left(yK0101,1) in  ('G','S','X','Y','C')
	GROUP BY A0102,YK0101
) FHSD ON YSD.A0102=FHSD.A0102 AND YSD.K0101=FHSD.K0101
FULL JOIN
	#A01 A01 ON YSD.A0102=A01.A0102 AND LEFT(YSD.K0101,1)=A01.K0101
GROUP BY A01.A0102,A01.K0101 WITH ROLLUP
) SD WHERE LEFT(K0101,1)='z'
ORDER BY A,A0102,K0101 DESC

------------------------------------------------------干线公路普查结论表------------------------------------------------------
---路线条数
	SELECT '干线公路普查结论表' '干线公路普查结论表',* FROM (
	SELECT 1 A,* FROM (
	    select
	LEFT(min(A01.A0102),7) A0102,MAX(YTS.HA0102) HA0102,
		case when grouping(A01.A0102)=1 and grouping(A01.K0101)=1 then 'zzZ' else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)='330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X'))+rtrim('S') else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)<>'330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X')) else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=0 and left(A01.a0102,3)='330' then max(rtrim(A01.K0101))+rtrim('S')
		else max(rtrim(A01.K0101)) end end end end k0101,
	SUM(case when YTS is null then 0 else isnull(YTS,0) END) YTS,'——' F10,SUM(case when WTS is null then 0 else isnull(WTS,0) END) WTS,SUM(case when YTS is null then 0 else isnull(YTS,0) END)+SUM(case when XZTS is null then 0 else isnull(XZTS,0) END)-SUM(case when SCTS is null then 0 else isnull(SCTS,0) END) FHTS,'——' A2,
	((SUM(case when YTS is null then 0 else isnull(YTS,0) END)+SUM(case when XZTS is null then 0 else isnull(XZTS,0) END)-SUM(case when SCTS is null then 0 else isnull(SCTS,0) END)-SUM(case when YTS is null then 0 else isnull(YTS,0) END))*1.0/CASE WHEN SUM(case when YTS is null then 0 else isnull(YTS,0) END)=0 THEN 1 ELSE SUM(case when YTS is null then 0 else isnull(YTS,0) END) END)*100 BHL
	from
	(
		select MAX(a.A0102) A0102,MAX(a.HA0102) ha0102,replace(replace(replace(a.k0101,'D001',''),'D002',''),'D003','') k0101,1 YTS
		from #k001 a join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
		where isnull(k0180,'1')<>'3'
		and a.A0102 like rtrim(@A0102)+'%'
		and left(a.K0101,1) in ('G','S')
		----and len(a.k0101)>=10
		and isnull(k0123,2)<>1
		and k0124 is null
		group by a.a0102,replace(replace(replace(a.k0101,'D001',''),'D002',''),'D003','')
	) YTS FULL join (
		select 1 WTS,replace(replace(replace(yk0101,'D001',''),'D002',''),'D003','') k0101,a0102 from #lx
		where left(yk0101,1) in ('G','S')  AND isnull(B4,'')<>'未采集'
		group by a0102,replace(replace(replace(yk0101,'D001',''),'D002',''),'D003','')
	) WTS ON YTS.A0102=WTS.A0102 AND YTS.K0101=WTS.K0101
	FULL JOIN (
		select yk0101 K0101,max(a0102) a0102,1 SCTS from #lx
		where yk0108 is not null
		and yk0101 not in (select Yk0101 from #lx where b3<>4 and Yk0108 is not null)
		AND left(yk0101,1) in ('G','S')
		group by yk0101
	) SCTS ON YTS.A0102=SCTS.A0102 AND YTS.K0101=SCTS.K0101
	FULL JOIN (
	select yk0101 K0101,max(a0102) a0102,count(1) XZTS from #lx
	where left(yk0101,1) in ('G','S')
	AND isnull(b3,'')='3' and isnull(wcjwt,'') like '非原数据库%'
	group by yk0101
	) XZTS ON YTS.A0102=XZTS.A0102 AND YTS.K0101=XZTS.K0101
	FULL JOIN (select * from #A01 where k0101 in ('G','S')) A01 ON YTS.A0102=A01.A0102 AND LEFT(YTS.K0101,1)=A01.K0101
	GROUP BY A01.A0102,A01.K0101
	WITH ROLLUP
	) TS

	UNION

	--路线里程
	SELECT 2 A,* FROM (
	SELECT
	LEFT(min(A01.A0102),7) A0102,MAX(YLC.HA0102) HA0102,
		case when grouping(A01.A0102)=1 and grouping(A01.K0101)=1 then 'zzZ' else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)='330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X'))+rtrim('S') else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)<>'330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X')) else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=0 and left(A01.a0102,3)='330' then max(rtrim(A01.K0101))+rtrim('S')
		else max(rtrim(A01.K0101)) end end end end k0101,
		SUM(ISNULL(YLC.K0114,0)) K0114,'——' F10,SUM(ISNULL(FHLC.WLC,0)) WLC,
		SUM(ISNULL(YLC.K0114,0))+SUM(ISNULL(FHLC.XZLC,0))-SUM(ISNULL(FHLC.SCLC,0))+SUM(ISNULL(FHLC.LXBG_LCBG,0)) FHHLC,'——' A2,
		((SUM(ISNULL(YLC.K0114,0))+SUM(ISNULL(FHLC.XZLC,0))-SUM(ISNULL(FHLC.SCLC,0))+SUM(ISNULL(FHLC.LXBG_LCBG,0))-SUM(ISNULL(YLC.K0114,0)))*1.0/CASE WHEN SUM(ISNULL(YLC.K0114,0))=0 THEN 1 ELSE SUM(ISNULL(YLC.K0114,0)) END)*100 LCBHL

	FROM (
	select  max(A.A0102) A0102,max(A.HA0102) HA0102,max(replace(replace(replace(a.k0101,'D001',''),'D002',''),'D003','')) K0101,sum(k0114) K0114 from #k001 a
	join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
	join da0201 on left(a.k0101,1)=objname
	where isnull(k0180,'1')<>'3'
	and a.A0102 like rtrim(@A0102)+'%'
	and left(a.K0101,1) in ('G','S')
	----and len(a.k0101)>=10
	and isnull(k0123,2)<>1
	and isnull(k0124,'')=''
	GROUP BY A.A0102,replace(replace(replace(a.k0101,'D001',''),'D002',''),'D003','')
	) YLC LEFT JOIN (
	select
	 A0102,MAX(HA0102) ha0102,Yk0101,
	 sum(isnull(wk0114,0)) wlc,--外业采集里程
	 --sum(case when isnull(wcjwt,'')<>''then isnull(wk0114,0) else 0 end) wcwlc,--外业采集错误里程
	--sum(case when isnull(b3,'') in ('1','2','4') then yk0114 else 0 end) fhlc, --复核里程
	sum(case when isnull(b3,'')='3' then wk0114 else 0 end) XZLC, --新增
	sum(case when isnull(b3,'')='4' then yk0114 else 0 end) scLC, --删除
	sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更' and
	(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8) then wk0114-yk0114 else 0 end) LXBG_LCBG,  --路线变更-里程变更
	null w
	from #LX a
	where left(yK0101,1) in ('G','S')
	group by A0102,yk0101
	) FHLC ON YLC.A0102=FHLC.A0102 AND YLC.K0101=FHLC.YK0101
	FULL JOIN (select * from #A01 where k0101 in ('G','S')) A01 ON YLC.A0102=A01.A0102 AND LEFT(YLC.K0101,1)=A01.K0101
	GROUP BY A01.A0102,A01.K0101 WITH ROLLUP
	) LC

	UNION
	--桥梁
	SELECT 3,* FROM (
	SELECT
	CASE WHEN A01.A0102 IS NULL THEN MIN(A01.A0102) ELSE LEFT(min(A01.A0102),7) END A0102,CASE WHEN MAX(A01.HA0102) IS NULL THEN MAX(A01.HA0102) ELSE MAX(A01.HA0102) END HA0102,
		case when grouping(A01.A0102)=1 and grouping(A01.K0101)=1 then 'zzZ' else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)='330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X'))+rtrim('S') else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)<>'330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X')) else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=0 and left(A01.a0102,3)='330' then max(rtrim(A01.K0101))+rtrim('S')
		else max(rtrim(A01.K0101)) end end end end k0101,
		SUM(ISNULL(YQL,0)) YQL,'——' F10,SUM(ISNULL(WQL,0)) WQL,
		SUM(ISNULL(YQL,0))+SUM(ISNULL(XZQL,0))-SUM(ISNULL(SCQL,0)) FHQL,'——' A2,
		((SUM(ISNULL(YQL,0))+SUM(ISNULL(XZQL,0))-SUM(ISNULL(SCQL,0))-SUM(ISNULL(YQL,0)))*1.0/CASE WHEN SUM(ISNULL(YQL,0))=0 THEN 1 ELSE SUM(ISNULL(YQL,0)) END)*100 QLBHL
	FROM (
		select B.a0102,max(B.ha0102) ha0102,MAX(B.k0101) K0101,SUM(CASE WHEN A.A0102 IS NULL THEN 0 ELSE 1 END) YQL
		from #k060 a FULL join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
		where isnull(k0180,'1')<>'3' and B.A0102 like rtrim(@A0102)+'%'
		and left(B.K0101,1) in ('G','S')
		group by B.a0102,B.k0101
	) YQL
	FULL JOIN (
	select A0102,MAX(HA0102) HA0102,YK0101 K0101,SUM(CASE WHEN WK6003 IS NOT NULL THEN 1 ELSE 0 END) WQL,
	SUM(CASE WHEN B3='3' THEN 1 ELSE 0 END) XZQL,SUM(CASE WHEN B3='4' THEN 1 ELSE 0 END) SCQL
	from #ql a
	where left(yK0101,1) in ('G','S')
	GROUP BY A0102,YK0101
	) FHQL ON YQL.A0102=FHQL.A0102 AND YQL.K0101=FHQL.K0101
	FULL JOIN (select * from #A01 where k0101 in ('G','S')) A01 ON YQL.A0102=A01.A0102 AND LEFT(YQL.K0101,1)=A01.K0101
	GROUP BY A01.A0102,A01.K0101 WITH ROLLUP
	) QL

	UNION
	--隧道
	SELECT 4,* FROM (
	SELECT
	CASE WHEN MAX(A01.A0102) IS NULL THEN MIN(A01.A0102) ELSE LEFT(min(A01.A0102),7) END A0102,
	CASE WHEN MAX(A01.HA0102) IS NULL THEN MAX(A01.HA0102) ELSE MAX(A01.HA0102) END HA0102,
		case when grouping(A01.A0102)=1 and grouping(A01.K0101)=1 then 'zzZ' else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)='330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X'))+rtrim('S') else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)<>'330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X')) else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=0 and left(A01.a0102,3)='330' then max(rtrim(A01.K0101))+rtrim('S')
		else max(rtrim(A01.K0101)) end end end end k0101,
		SUM(ISNULL(YSD,0)) YSD,'——' F10,SUM(ISNULL(WSD,0)) WSD,SUM(ISNULL(YSD,0))+SUM(ISNULL(XZSD,0))-SUM(ISNULL(SCSD,0)) FHSD,'——' A2,
		((SUM(ISNULL(YSD,0))+SUM(ISNULL(XZSD,0))-SUM(ISNULL(SCSD,0))-SUM(ISNULL(YSD,0)))*1.0/CASE WHEN SUM(ISNULL(YSD,0))=0 THEN 1 ELSE SUM(ISNULL(YSD,0)) END)*100 QLBHL
	FROM (
		select B.a0102,max(B.ha0102) ha0102,MAX(B.k0101) K0101,SUM(CASE WHEN A.A0102 IS NULL THEN 0 ELSE 1 END) YSD
		from #k063 a FULL join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
		where isnull(k0180,'1')<>'3' and B.A0102 like rtrim(@A0102)+'%'
		and left(B.K0101,1) in ('G','S')
		group by B.a0102,B.k0101
	) YSD
	FULL JOIN (
	select A0102,MAX(HA0102) HA0102,YK0101 K0101,SUM(CASE WHEN WK6303 IS NOT NULL THEN 1 ELSE 0 END) WSD,
	SUM(CASE WHEN B3='3' THEN 1 ELSE 0 END) XZSD,SUM(CASE WHEN B3='4' THEN 1 ELSE 0 END) SCSD
	from #SD a
	where left(yK0101,1) in ('G','S')
	GROUP BY A0102,YK0101
	) FHSD ON YSD.A0102=FHSD.A0102 AND YSD.K0101=FHSD.K0101
	FULL JOIN (select * from #A01 where k0101 in ('G','S')) A01 ON YSD.A0102=A01.A0102 AND LEFT(YSD.K0101,1)=A01.K0101
	GROUP BY A01.A0102,A01.K0101 WITH ROLLUP
	) SD
	) A
	ORDER BY A,A0102,CASE WHEN LEFT(k0101,1)='G' THEN 'SSS' ELSE K0101 END DESC



	-------------------------------------------农村公路普查结论表
	---路线条数
	SELECT '农村公路普查结论表' '农村公路普查结论表',* FROM (
	SELECT 1 A,* FROM (
    select
	LEFT(min(A01.A0102),7) A0102,MAX(A01.HA0102) HA0102,
		case when grouping(A01.A0102)=1 and grouping(A01.K0101)=1 then 'zzZ' else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)='330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X'))+rtrim('S') else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)<>'330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X')) else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=0 and left(A01.a0102,3)='330' then max(rtrim(A01.K0101))+rtrim('S')
		else max(rtrim(A01.K0101)) end end end end k0101,
	SUM(ISNULL(YTS,0)) YTS,'——' F10,
	SUM(ISNULL(WTS,0)) WTS,SUM(YTS)+SUM(case when XZTS is null then 0 else isnull(XZTS,0) END)-SUM(case when SCTS is null then 0 else isnull(SCTS,0) END) FHTS,'——' A2,
	((SUM(ISNULL(YTS,0))+SUM(case when XZTS is null then 0 else isnull(XZTS,0) END)-SUM(case when SCTS is null then 0 else isnull(SCTS,0) END)-SUM(ISNULL(YTS,0)))*1.0/CASE WHEN SUM(ISNULL(YTS,0))=0 THEN 1 ELSE SUM(ISNULL(YTS,0)) END)*100 BHL
	from
	(
		select MAX(a.A0102) A0102,MAX(a.HA0102) ha0102,replace(replace(replace(a.k0101,'D001',''),'D002',''),'D003','') k0101,1 YTS
		from #k001 a join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
		where isnull(k0180,'1')<>'3'
		and a.A0102 like rtrim(@A0102)+'%'
		and left(a.K0101,1) in ('X','Y','C')
		----and len(a.k0101)>=10
		and isnull(k0123,2)<>1
		and k0124 is null
		group by a.a0102,replace(replace(replace(a.k0101,'D001',''),'D002',''),'D003','')
	) YTS LEFT join (
		select 1 WTS,yk0101 k0101,a0102 from #lx
		where left(yk0101,1) in ('X','Y','C') AND isnull(B4,'')<>'未采集'
		group by a0102,yk0101
	) WTS ON YTS.A0102=WTS.A0102 AND YTS.K0101=WTS.K0101
	FULL JOIN (
		select yk0101 K0101,max(a0102) a0102,1 SCTS from #lx
		where yk0108 is not null
		and yk0101 not in (select Yk0101 from #lx where b3<>4 and Yk0108 is not null)
		AND left(yk0101,1) in ('X','Y','C')
		group by yk0101
	) SCTS ON YTS.A0102=SCTS.A0102 AND YTS.K0101=SCTS.K0101
	FULL JOIN (
	select yk0101 K0101,max(a0102) a0102,count(1) XZTS from #lx
	where left(yk0101,1) in ('X','Y','C')
	AND isnull(b3,'')='3' and isnull(wcjwt,'') like '非原数据库%'
	group by yk0101
	) XZTS ON YTS.A0102=XZTS.A0102 AND YTS.K0101=XZTS.K0101
	FULL JOIN (select * from #A01 where k0101 in ('X','Y','C')) A01 ON YTS.A0102=A01.A0102 AND LEFT(YTS.K0101,1)=A01.K0101
	GROUP BY A01.A0102,A01.K0101
	WITH ROLLUP
	) TS
	where isnull(k0101,'')<>'ZZZ'

	UNION

	--路线里程
	SELECT 2 A,* FROM (
	SELECT
	LEFT(min(A01.A0102),7) A0102,MAX(A01.HA0102) HA0102,
		case when grouping(A01.A0102)=1 and grouping(A01.K0101)=1 then 'zzZ' else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)='330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X'))+rtrim('S') else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)<>'330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X')) else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=0 and left(A01.a0102,3)='330' then max(rtrim(A01.K0101))+rtrim('S')
		else max(rtrim(A01.K0101)) end end end end k0101,
		SUM(ISNULL(YLC.K0114,0)) K0114,'——' F10,
		SUM(ISNULL(FHLC.WLC,0)) WLC,SUM(ISNULL(YLC.K0114,0))+SUM(ISNULL(FHLC.XZLC,0))-SUM(ISNULL(FHLC.SCLC,0))+SUM(ISNULL(FHLC.LXBG_LCBG,0)) FHHLC,'——' A2,
		((SUM(ISNULL(YLC.K0114,0))+SUM(ISNULL(FHLC.XZLC,0))-SUM(ISNULL(FHLC.SCLC,0))+SUM(ISNULL(FHLC.LXBG_LCBG,0))-SUM(ISNULL(YLC.K0114,0)))*1.0/CASE WHEN SUM(ISNULL(YLC.K0114,0))=0 THEN 1 ELSE SUM(ISNULL(YLC.K0114,0)) END)*100 LCBHL

	FROM (
	select  max(A.A0102) A0102,max(A.HA0102) HA0102,max(A.K0101) K0101,sum(k0114) K0114 from #k001 a
	join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
	join da0201 on left(a.k0101,1)=objname
	where isnull(k0180,'1')<>'3'
	and a.A0102 like rtrim(@A0102)+'%'
	and left(a.K0101,1) in ('X','Y','C')
	----and len(a.k0101)>=10
	and isnull(k0123,2)<>1
	and isnull(k0124,'')=''
	GROUP BY A.A0102,replace(replace(replace(a.k0101,'D001',''),'D002',''),'D003','')
	) YLC LEFT JOIN (
	select
	 A0102,MAX(HA0102) ha0102,Yk0101,
	 sum(isnull(wk0114,0)) wlc,--外业采集里程
	 --sum(case when isnull(wcjwt,'')<>''then isnull(wk0114,0) else 0 end) wcwlc,--外业采集错误里程
	--sum(case when isnull(b3,'') in ('1','2','4') then yk0114 else 0 end) fhlc, --复核里程
	sum(case when isnull(b3,'')='3' then wk0114 else 0 end) XZLC, --新增
	sum(case when isnull(b3,'')='4' then yk0114 else 0 end) scLC, --删除
	sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更' and
	(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8) then wk0114-yk0114 else 0 end) LXBG_LCBG,  --路线变更-里程变更
	null w
	from #LX a
	where left(yK0101,1) in ('X','Y','C')
	group by A0102,yk0101
	) FHLC ON YLC.A0102=FHLC.A0102 AND YLC.K0101=FHLC.YK0101
	FULL JOIN (select * from #A01 where k0101 in ('X','Y','C')) A01 ON YLC.A0102=A01.A0102 AND LEFT(YLC.K0101,1)=A01.K0101
	GROUP BY A01.A0102,A01.K0101 WITH ROLLUP
	) LC
	where isnull(k0101,'')<>'ZZZ'

	UNION
	--桥梁
	SELECT 3,* FROM (
	SELECT
	CASE WHEN A01.A0102 IS NULL THEN MIN(A01.A0102) ELSE LEFT(min(A01.A0102),7) END A0102,CASE WHEN MAX(A01.HA0102) IS NULL THEN MAX(A01.HA0102) ELSE MAX(A01.HA0102) END HA0102,
		case when grouping(A01.A0102)=1 and grouping(A01.K0101)=1 then 'zzZ' else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)='330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X'))+rtrim('S') else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)<>'330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X')) else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=0 and left(A01.a0102,3)='330' then max(rtrim(A01.K0101))+rtrim('S')
		else max(rtrim(A01.K0101)) end end end end k0101,
		SUM(ISNULL(YQL,0)) YQL,'——' F10,SUM(ISNULL(WQL,0)) WQL,
		SUM(ISNULL(YQL,0))+SUM(ISNULL(XZQL,0))-SUM(ISNULL(SCQL,0)) FHQL,'——' A2,
		((SUM(ISNULL(YQL,0))+SUM(ISNULL(XZQL,0))-SUM(ISNULL(SCQL,0))-SUM(ISNULL(YQL,0)))*1.0/case when SUM(ISNULL(YQL,0))=0 then 1 else SUM(ISNULL(YQL,0)) end)*100 QLBHL
	FROM (
		select B.a0102,max(B.ha0102) ha0102,MAX(B.k0101) K0101,SUM(CASE WHEN A.A0102 IS NULL THEN 0 ELSE 1 END) YQL
		from #k060 a FULL join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
		where isnull(k0180,'1')<>'3' and B.A0102 like rtrim(@A0102)+'%'
		and left(B.K0101,1) in ('X','Y','C')
		group by B.a0102,B.k0101
	) YQL
	FULL JOIN (
	select A0102,MAX(HA0102) HA0102,YK0101 K0101,SUM(CASE WHEN WK6003 IS NOT NULL THEN 1 ELSE 0 END) WQL,
	SUM(CASE WHEN B3='3' THEN 1 ELSE 0 END) XZQL,SUM(CASE WHEN B3='4' THEN 1 ELSE 0 END) SCQL
	from #ql a
	where left(yK0101,1) in ('X','Y','C')
	GROUP BY A0102,YK0101
	) FHQL ON YQL.A0102=FHQL.A0102 AND YQL.K0101=FHQL.K0101
	FULL JOIN (select * from #A01 where k0101 in ('X','Y','C')) A01 ON YQL.A0102=A01.A0102 AND LEFT(YQL.K0101,1)=A01.K0101
	GROUP BY A01.A0102,A01.K0101 WITH ROLLUP
	) QL
	where isnull(k0101,'')<>'ZZZ'

	UNION
	--隧道
	SELECT 4,* FROM (
	SELECT
	CASE WHEN MAX(A01.A0102) IS NULL THEN MIN(A01.A0102) ELSE LEFT(min(A01.A0102),7) END A0102,
	CASE WHEN MAX(A01.HA0102) IS NULL THEN MAX(A01.HA0102) ELSE MAX(A01.HA0102) END HA0102,
		case when grouping(A01.A0102)=1 and grouping(A01.K0101)=1 then 'zzZ' else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)='330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X'))+rtrim('S') else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=1 and left(A01.a0102,3)<>'330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(A01.K0101,'S','G'),'C','X'),'Y','X'),'Z','X')) else
		case when grouping(A01.A0102)=0 and grouping(A01.K0101)=0 and left(A01.a0102,3)='330' then max(rtrim(A01.K0101))+rtrim('S')
		else max(rtrim(A01.K0101)) end end end end k0101,
		SUM(ISNULL(YSD,0)) YSD,'——' F10,SUM(ISNULL(WSD,0)) WSD,
		SUM(ISNULL(YSD,0))+SUM(ISNULL(XZSD,0))-SUM(ISNULL(SCSD,0)) FHSD,'——' A2,
		((SUM(ISNULL(YSD,0))+SUM(ISNULL(XZSD,0))-SUM(ISNULL(SCSD,0))-SUM(ISNULL(YSD,0)))*1.0/CASE WHEN SUM(ISNULL(YSD,0))=0 THEN 1 ELSE SUM(ISNULL(YSD,0)) END)*100 QLBHL
	FROM (
		select B.a0102,max(B.ha0102) ha0102,MAX(B.k0101) K0101,SUM(CASE WHEN A.A0102 IS NULL THEN 0 ELSE 1 END) YSD
		from #k063 a FULL join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
		where isnull(k0180,'1')<>'3' and B.A0102 like rtrim(@A0102)+'%'
		and left(B.K0101,1) in ('X','Y','C')
		group by B.a0102,B.k0101
	) YSD
	FULL JOIN (
	select A0102,MAX(HA0102) HA0102,YK0101 K0101,SUM(CASE WHEN WK6303 IS NOT NULL THEN 1 ELSE 0 END) WSD,
	SUM(CASE WHEN B3='3' THEN    1 ELSE 0 END) XZSD,SUM(CASE WHEN B3='4' THEN 1 ELSE 0 END) SCSD
	from #SD a
	where left(yK0101,1) in ('X','Y','C')
	GROUP BY A0102,YK0101
	) FHSD ON YSD.A0102=FHSD.A0102 AND YSD.K0101=FHSD.K0101
	FULL JOIN (select * from #A01 where k0101 in ('X','Y','C')) A01 ON YSD.A0102=A01.A0102 AND LEFT(YSD.K0101,1)=A01.K0101
	GROUP BY A01.A0102,A01.K0101 WITH ROLLUP
	) SD
	where isnull(k0101,'')<>'ZZZ'
	) A
	ORDER BY A,A0102,REPLACE(K0101,'Y','cc') DESC




--------------------------------------------------------------------分页段落-------------------------------------------------------------
-----------------------农村公路线路条数--------------------

--原路线条数


SELECT '农村公路线路条数' '农村公路线路条数',OBJNAME,rtrim(YTS),rtrim(XZTS),rtrim(SCTS),rtrim(TZHTS) FROM (
select '1' A,YTS.a0102 A0102,objname,
cast(ISNULL(TS,0) as char(50)) YTS,
cast(ISNULL(XZTS,0) as char(50)) XZTS,
cast(ISNULL(SCTS,0) as char(50)) SCTS,
cast(ISNULL(TS,0)+ISNULL(XZTS,0)-ISNULL(SCTS,0) as char(50)) TZHTS from (
    select
	 max(rtrim(a0102)) a0102,
	case when grouping(a0102)=1 and grouping(objname)=1 then 'A' else max(rtrim(ha0102)) end ha0102,
	case when grouping(a0102)=1 and grouping(objname)=1 then 'A' else
	case when grouping(a0102)=0 and grouping(objname)=1 then 'A'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(OBJNAME,'S','G'),'C','X'),'Y','X'),'Z','X')) else max(rtrim(objname)) end end objname,
	case when grouping(objname)=1 then '合计' else space(2)++max(rtrim(objjc)) end objjc,
	sum(1) TS
	from
	(
		select MAX(a.A0102) A0102,MAX(a.HA0102) ha0102,replace(replace(replace(a.k0101,'D001',''),'D002',''),'D003','') k0101
		from #k001 a join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
		where isnull(k0180,'1')<>'3' and a.A0102 like rtrim(@a0102)+'%'
		--and left(a.K0101,1) in ('G','S','X','Y','Z','C')
		and left(a.K0101,1) in ('X','Y','C')
		--and len(a.k0101)>=10
		and isnull(k0123,2)<>1
		and k0124 is null
		group by a.a0102,replace(replace(replace(a.k0101,'D001',''),'D002',''),'D003','')
	) #k001 join da0201 on left(k0101,1)=objname
	group by a0102,objname
	with rollup
	) YTS full join
	(
	---新增路线条数
	select
	max(rtrim(a0102)) a0102,
	case when grouping(a0102)=1 and grouping(left(wk0101,1))=1 then 'A' else
	case when grouping(a0102)=0 and grouping(left(wk0101,1))=1 then 'A'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(wk0101,1),'S','G'),'C','X'),'Y','X'),'Z','X'))
	else max(rtrim(left(wk0101,1))) end end k0101,
	sum(1) xzts
	from (select * from #lx where bglx='新增' and isnull(wcjwt,'') like '非原数据库%') a
	group by a0102,left(wk0101,1) with rollup
	) XZTS ON YTS.A0102=XZTS.A0102 AND YTS.OBJNAME=XZTS.K0101
	full join
	(
	--删除路线条数
	select
	max(rtrim(a0102)) a0102,
	case when grouping(a0102)=1 and grouping(left(yk0101,1))=1 then 'A' else
	case when grouping(a0102)=0 and grouping(left(yk0101,1))=1 then 'A'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(yk0101,1),'S','G'),'C','X'),'Y','X'),'Z','X'))
	else max(rtrim(left(yk0101,1))) end end k0101
	,sum(sclx) scts from (
	select yk0101,max(a0102) a0102,1 sclx from #lx
	where yk0108 is not null and left(yK0101,1) in ('X','Y','C')
	and yk0101 not in (select Yk0101 from #lx where b3<>4 and Yk0108 is not null)
	group by a0102,yk0101
	) scts
	group by a0102,left(yk0101,1) with rollup
	) SCTS ON YTS.A0102=SCTS.A0102 AND YTS.OBJNAME=SCTS.K0101
    --ORDER BY YTS.OBJNAME
	UNION
	SELECT '2' A,'','','管理单位编码','管理单位名称','删除路线编码','删除路线名称'
	union
	SELECT '3' A,'','',A0102,MAX(HA0102) HA0102,
	K0101,MAX(K0112) FROM K001 WHERE K0101 IN (
	select yk0101 from #lx
	where yk0108 is not null
	and yk0101 not in (select Yk0101 from #lx where b3<>4 and Yk0108 is not null)
	group by a0102,yk0101 )
	GROUP BY A0102,K0101
	--ORDER BY A,A0102,OBJNAME,SCTS
	) A
	where objname<>'A'
	ORDER BY A,A0102,replace(OBJNAME,'C','YY'),SCTS

	-----------------------------线路轨迹--------------------  select * from #lx

	--将外业采集轨迹、电子地图轨迹、原数据库轨迹三者进行比对，对外业采集轨迹线形更平滑，更符合电子地图轨迹走向的路段建议调整轨迹，调整变化路线共**条，其中县道**条，乡道**条，村道**条，涉及公路里程共计**公里。

	select '将外业采集轨迹、电子地图轨迹、原数据库轨迹三者进行比对，对外业采集轨迹线形更平滑，更符合电子地图轨迹走向的路段建议调整轨迹，调整变化路线共'+
	rtrim(sum(case when k0101='zx' then ts else 0 end))
	+'条，其中县道'+rtrim(sum(case when k0101='x' then ts else 0 end))+'条，乡道'+rtrim(sum(case when k0101='Y' then ts else 0 end))+'条，村道'+rtrim(sum(case when k0101='C' then ts else 0 end))+
	'条，涉及公路里程共计'+rtrim(sum(case when k0101='zx' then k0114 else 0 end))+'公里。'
	from (
	SELECT MAX(A0102) a0102,
	case when grouping(a0102)=1 and grouping(left(k0101,1))=1 then 'Zz' else
	case when grouping(a0102)=0 and grouping(left(k0101,1))=1 then 'z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(k0101,1),'S','G'),'C','X'),'Y','X'),'Z','X')) else max(rtrim(left(k0101,1))) end end k0101
	,SUM(TS) ts,SUM(K0114) k0114 FROM (
	select a0102,k0101,1 TS,SUM(K0114) K0114 from #k001 where k0101 in (select yk0101 from #lx where bglx='变更' and xgjy='替换线形')
	AND isnull(k0124,'')=''
	and isnull(k0123,2)<>1
	and left(K0101,1) in ('X','Y','C')
	group by a0102,k0101
	) A GROUP BY a0102,LEFT(K0101,1) WITH ROLLUP
	) a
	group by a0102

	----------------------------线路里程---------------------------

    select '线路里程''线路里程',* from (
    select
	max(a0102) a0102,max(ha0102) ha0102,
	case when grouping(left(k0101,1))=1 then 'Z' else max(left(k0101,1)) end k0101,
	sum(ylc) ylc,
	sum(ylc)+sum(J_xzlc)+sum(j_LXBG_LCBG_bhl)-sum(J_sclc) fhlc,
	((sum(ylc)+sum(J_xzlc)+sum(j_LXBG_LCBG_bhl)-sum(J_sclc))/sum(ylc)-1)*100 bhl,
	sum(j_lcbb) j_lcbb,
	sum(j_lxbg_lmbb_lcbb) j_lxbg_lmbb_lcbb,
	sum(j_lmbg_lcbb) j_lmbg_lcbb,
	sum(j_lxbg_lmbg_lcbb) j_lxbg_lmbg_lcbb,
	sum(j_wfpd) j_wfpd,
	sum(j_lcbb)+
	sum(j_lxbg_lmbb_lcbb)+
	sum(j_lmbg_lcbb)+
	sum(j_lxbg_lmbg_lcbb)+
	sum(j_wfpd) j_bblc,
	sum(j_LXBG_LCBG_ylc) j_LXBG_LCBG_ylc,  --路线变更-里程变更-原里程
	sum(j_LXBG_LCBG_bhl) j_LXBG_LCBG_bhl,  --路线变更-里程变更-变化量
	sum(j_LXBG_LCBG_ylc)+
	sum(j_LXBG_LCBG_bhl) j_LXBG_lcbg,
	sum(j_lxXZLC) j_lxXZLC, --路线新增
	sum(j_ycXZLC) j_ycXZLC, --延长新增
	sum(j_lxXZLC)+
	sum(j_ycXZLC) j_xzlc, --延长新增
	sum(case when bglx1=4 and bglx2=4 then J_scLC else 0 end) j_wqsc,
	sum(case when bglx1<>4 or bglx2<>4 then J_scLC else 0 end) j_bfscsc,
	sum(j_scLC) j_scLC, --删除
	(sum(j_lcbb)+sum(j_lxbg_lmbb_lcbb)+sum(j_lmbg_lcbb)+sum(j_lxbg_lmbg_lcbb)+sum(j_wfpd))
	+(sum(j_LXBG_LCBG_ylc)+sum(j_LXBG_LCBG_bhl))
	+(sum(j_lxXZLC)+sum(j_ycXZLC)) tzjg,
	(sum(j_lcbb)+sum(j_lxbg_lmbb_lcbb)+sum(j_lmbg_lcbb)+sum(j_lxbg_lmbg_lcbb)+sum(j_wfpd))
	+(sum(j_LXBG_LCBG_ylc))
	+sum(j_scLC)  ylcs
	 from (
		select
		 A.A0102,MAX(A.HA0102) ha0102, yk0101 k0101,
		----给交科院数据
		sum(yk0114) ylc,
		sum(case when isnull(b3,'')='1' then yk0114 else 0 end) j_lcbb,  --里程不变
		sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更' and
		(yk0114/(case when wk0114=0 then yk0114 else wk0114 end)>0.8 and
				yk0114/(case when wk0114=0 then yk0114 else wk0114 end)<1.2) and b1=b2 then yk0114 else 0 end) j_lxbg_lmbb_lcbb,  --路线变更-路面不变-里程不变

		sum(case when isnull(b3,'')='2' and isnull(xgjy,'')='路面类型变更' then yk0114 else 0 end) j_lmbg_lcbb,  --路面变更-里程不变
		sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更' and
		(yk0114/(case when wk0114=0 then yk0114 else wk0114 end)>0.8 and
				yk0114/(case when wk0114=0 then yk0114 else wk0114 end)<1.2)  and b1<>b2  then yk0114 else 0 end)
		 j_lxbg_lmbg_lcbb,  --路线变更-路面变更-里程不变
		sum(case when isnull(b3,'')='5' then yk0114 else 0 end) j_wfpd,  --无法判断
		sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更' and
		(yk0114/(case when wk0114=0 then yk0114 else wk0114 end)>=1.2 or
				yk0114/(case when wk0114=0 then yk0114 else wk0114 end)<=0.8) then yk0114 else 0 end) j_LXBG_LCBG_ylc,  --路线变更-里程变更-原里程

		sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更' and
		(yk0114/(case when wk0114=0 then yk0114 else wk0114 end)>=1.2 or
				yk0114/(case when wk0114=0 then yk0114 else wk0114 end)<=0.8) then wk0114-yk0114 else 0 end) j_LXBG_LCBG_bhl,  --路线变更-里程变更-变化量
		sum(case when isnull(b3,'')='3' and isnull(wcjwt,'')='非原数据库数据' then wk0114 else 0 end) j_lxXZLC, --路线新增
		sum(case when isnull(b3,'')='3' and isnull(wcjwt,'')<>'非原数据库数据' then wk0114 else 0 end) j_ycXZLC, --延长新增
		sum(case when isnull(b3,'')='3' then wk0114 else 0 end) j_xzlc,
		min(case when yk0108 is not null then b3 else 4 end) BGLX1, --根据路线分组，获取最大的变更类型,
		max(case when yk0108 is not null then b3 else 4 end) BGLX2, --根据路线分组，获取最大的变更类型,
		sum(case when isnull(b3,'')='4' then yk0114 else 0 end) J_scLC --删除

		from #LX a left join #a50 b on a.a0102=b.a0102 and a.Yk0101=b.k0101
		where isnull(k0180,'1')<>'3' and a.A0102 like rtrim(@a0102)+'%'
		--and left(a.K0101,1) in ('G','S','X','Y','Z','C')
		and left(a.YK0101,1) in ('X','Y','C')
		--and len(a.k0101)>=10
		--and isnull(k0123,2)<>1
		--and k0124 is null
		group by A.A0102,yk0101
	) a
	group by left(k0101,1)
    with rollup
    --order by  replace(left(max(k0101),1),'C','yy')
    ) a
    order by  replace(k0101,'C','yy')
    /*

	select * from #lx where b3=3 or bglx='新增'

	select * from #lx where yk0101 in (
	select yk0101 from #lx where  yk0114<>0
	group by yk0101,yk0108
	having count(1)>1)
	and yk0114<>0
	order by yk0101,yk0108
	*/
    -------------查询出里程变更的数据
select '查询出里程变更的数据' '查询出里程变更的数据',yk0101,yk0112,yk0108,yk0109,yk0114,yhk5104,wk0108,wk0109,wk0114,whk5104 from (SELECT * FROM #lx WHERE isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更') A
where ((yk0114/(case when wk0114=0 then yk0114 else wk0114 end)>=1.2 or
		yk0114/(case when wk0114=0 then yk0114 else wk0114 end)<=0.8))
order by replace(yk0101,'C','YY'),yk0108

--SELECT * FROM #LX WHERE isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更'

--------------------------路面类型-----------------------

select '路面类型''路面类型',--YLC.OBJNAME,
YLC.LQLC,YLC.SNLC,YLC.QTLC,
LQLC+LQBH+LXBG_lqBG+XZLQ-SCLQ TZHLQ,
CAST((((LQLC+LQBH+LXBG_lqBG+XZLQ-SCLQ-LQLC)/CASE WHEN LQLC=0 THEN 1 ELSE LQLC END))*100 AS DECIMAL(8,3)) LQBHL,
SNLC+SNBH+LXBG_SNBG+XZSN-SCSN TZHSN,
CAST((((SNLC+SNBH+LXBG_SNBG+XZSN-SCSN-SNLC)/CASE WHEN SNLC=0 THEN 1 ELSE SNLC END))*100 AS DECIMAL(8,3)) SNBHL,
QTLC+QTBH+LXBG_QTBG+XZQT-SCQT TZHQT,
CAST((((QTLC+QTBH+LXBG_QTBG+XZQT-SCQT-QTLC)/CASE WHEN QTLC=0 THEN 1 ELSE QTLC END))*100 AS DECIMAL(8,3)) QTBHL,
XZLQ,XZSN,XZQT,SCLQ,SCSN,SCQT,
LQBH+LXBG_LQBG LQBHL,SNBH+LXBG_SNBG SNBHL,QTBH+LXBG_QTBG QTBHL
from (
	select
	max(rtrim(a.a0102)) a0102,
	case when grouping(a.a0102)=1 and grouping(objname)=1 then 'zZ' else max(rtrim(a.ha0102)) end ha0102,
	case when grouping(A.a0102)=1 and grouping(objname)=1 then 'zZ' else
	case when grouping(A.a0102)=0 and grouping(objname)=1 then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(OBJNAME,'S','G'),'C','X'),'Y','X'),'Z','X')) else max(rtrim(objname)) end end objname,
	case when grouping(objname)=1 then '合计' else space(2)++max(rtrim(objjc)) end objjc,
	sum(k0114) LC,
	sum(case when k5104='11' then k0114 else 0 end) LQLC,
	sum(case when k5104='12' then k0114 else 0 end) SNLC,
	sum(case when k5104 not in ('11','12') then k0114 else 0 end) QTLC
	from #k001 a join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
	join da0201 on left(a.k0101,1)=objname
	where isnull(k0180,'1')<>'3'
	and a.A0102 like rtrim(@a0102)+'%'
	and left(a.K0101,1) in ('X','Y','C')
	----and len(a.k0101)>=10
	and isnull(k0123,2)<>1
	and isnull(k0124,'')=''
	group by a.a0102,objname
	with rollup
	) YLC
	full join (
select
	 max(A0102) a0102,MAX(HA0102) ha0102,
	case when grouping(A.a0102)=1 and grouping(left(yK0101,1))=1 then 'zZ' else
	case when grouping(A.a0102)=0 and grouping(left(yK0101,1))=1 then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(yK0101,1),'S','G'),'C','X'),'Y','X'),'Z','X')) else max(rtrim(left(yK0101,1))) end end k0101,
	sum(case when isnull(b3,'')='3' then wk0114 else 0 end) XZLC, --新增
	sum(case when isnull(b3,'')='3' and b2='11' then wk0114 else 0 end) XZLQ, --沥青新增
	sum(case when isnull(b3,'')='3' and b2='12' then wk0114 else 0 end) XZSN, --水泥新增
	sum(case when isnull(b3,'')='3' and b2='13' then wk0114 else 0 end) XZQT, --其他新增
	sum(case when isnull(b3,'')='4' then yk0114 else 0 end) scLC, --删除
	sum(case when isnull(b3,'')='4' and b1='11' then yk0114 else 0 end) scLQ, --沥青删除
	sum(case when isnull(b3,'')='4' and b1='12' then yk0114 else 0 end) scSN, --水泥删除
	sum(case when isnull(b3,'')='4' and b1='13' then yk0114 else 0 end) scQT, --其他删除
	sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更' and
	(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8) then wk0114-yk0114 else 0 end) LXBG_LCBG,  --路线变更-里程变更
	sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更' and b1='11' and
	(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8) then wk0114-yk0114 else 0 end) LXBG_lqBG,  --路线变更-里程变更-沥青
	sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更' and b1='12' and
	(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8) then wk0114-yk0114 else 0 end) LXBG_snBG,  --路线变更-里程变更-水泥
	sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更' and b1='13' and
	(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8) then wk0114-yk0114 else 0 end) LXBG_qtBG,  --路线变更-里程变更-其他
	sum(case when (isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更' and
	(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8)) or b3='4' then 1 else 0 end) LXBG_tsBG,  --路线变更-里程变更-条数
	----路面类型变更
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='11' and b2<>'11' then yk0114 else 0 end) lqtz, --沥青路面调整
	sum(case when isnull(b3,'')='1' and b1='11' then yk0114 else 0 end) lqbb, --沥青路面不变
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1<>'11' and b2='11' then yk0114 else 0 end)-
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='11' and b2<>'11' then yk0114 else 0 end) lqbh, --沥青路面变化
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='12' and b2<>'12' then yk0114 else 0 end) sntz, --水泥路面调整
	sum(case when isnull(b3,'')='1' and b1='12' then yk0114 else 0 end) snbb, --水泥路面不变
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1<>'12' and b2='12' then yk0114 else 0 end)-
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='12' and b2<>'12' then yk0114 else 0 end) snbh, --水泥路面变化
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='13' and b2<>'13' then yk0114 else 0 end) qttz, --其他路面调整
	sum(case when isnull(b3,'')='1' and b1='13' then yk0114 else 0 end) qtbb, --其他路面不变
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1<>'13' and b2='13' then yk0114 else 0 end)-
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='13' and b2<>'13' then yk0114 else 0 end) qtbh, --其他路面变化
	sum(case when isnull(bglx,'') in ('变更') then yk0114 else 0 end) BgLC, --变更
	sum(case when isnull(bglx,'')='变更' and isnull(xgjy,'')<>'路面类型变更' then yk0114 else 0 end) LXBG_THXX,--路线变更-替换线形
	sum(case when isnull(bglx,'')='变更' and isnull(xgjy,'')='路面类型变更' then yk0114 else 0 end) LXBG_LMLX,--路线变更-路面类型
    sum(case when isnull(bglx,'')='无法判断' then yk0114 else 0 end) WFPD, --线形无法判断
	null w
	from #LX a
	where left(yK0101,1) in ('X','Y','C')
	group by A0102,left(yK0101,1)  with rollup
	) FHLC on YLC.A0102=FHLC.A0102 AND YLC.OBJNAME=FHLC.K0101
	WHERE OBJNAME<>'ZZ'
	ORDER BY REPLACE(OBJNAME,'c','YY')


	-------------------------------------桥梁------------------------------

	select Yql.K0101,BBql,WFPDql,BGql,SCql,XZql,Yql,Yql+XZql-SCql FHHql,
	cast(((((XZql-SCql)*1.0)/Yql))*100 as DECIMAL(8,3)) BHL
	from (
		select
		max(a0102) a0102,
		case when grouping(a0102)=1 and grouping(left(K0101,1))=1 then 'zZ' else
		case when grouping(a0102)=0 and grouping(left(K0101,1))=1 then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(K0101,1),'S','G'),'C','X'),'Y','X'),'Z','X')) else max(rtrim(left(K0101,1))) end end k0101,
		sum(1) yql
		from
		(
			select a.a0102,a.k0101,a.k6001,a.k6002,a.k6003,a.a0103
			from #k060 a join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
			where isnull(k0180,'1')<>'3' and a.A0102 like rtrim(@a0102)+'%'
			and left(a.K0101,1) in ('X','Y','C')
			----and len(a.k0101)>=10
			and a.k0101 in (select yk0101 from #lx)
		) #k001
		grOUP by a0102,left(k0101,1)
		with rollup --order by left(k0101,1)
		) Yql full join (
	select
	max(a0102) a0102,max(ha0102) ha0102,
		case when grouping(a0102)=1 and grouping(left(YK0101,1))=1 then 'zZ' else
		case when grouping(a0102)=0 and grouping(left(YK0101,1))=1 then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(YK0101,1),'S','G'),'C','X'),'Y','X'),'Z','X')) else max(rtrim(left(YK0101,1))) end end k0101,
	SUM(case when isnull(k6001,'')<>'' and b3='1' then 1 else 0 end) bbql,--不变桥梁
	SUM(case when isnull(k6001,'')<>'' and b3='5' then 1 else 0 end) wfpdql, --无法判断桥梁
	SUM(case when isnull(k6001,'')<>'' and b3='2' then 1 else 0 end) bgql,--变更桥梁
	SUM(case when isnull(k6001,'')<>'' and b3='4' then 1 else 0 end) scql,--删除桥梁
	SUM(case when b3='3' then 1 else 0 end) xzql--新增桥梁
	from
	(
		select *
		from #ql a
		where left(yK0101,1) in ('X','Y','C')
	) #k001
	group by a0102,left(yk0101,1)
	with rollup --order by grouping(a0102) desc,grouping(left(yk0101,1)) desc
	) FHql ON Yql.A0102=FHql.A0102 AND Yql.K0101=FHql.K0101
	where yql.k0101<>'zz'
	ORDER BY REPLACE(Yql.K0101,'C','YY')

	----------------------------------------隧道---------------------------
	select case when isnull(Ysd.K0101,'')='' then FHsd.k0101 else isnull(Ysd.K0101,'') end  k0101,BBsd,WFPDsd,BGsd,SCsd,XZsd,isnull(Ysd,''),isnull(Ysd+XZsd-SCsd,'') FHHsd,
	cast((((isnull(XZsd-SCsd,''))*1.0/isnull(Ysd,1)))*100 as DECIMAL(8,3)) BHL from (
		select
		max(a0102) a0102,
		case when grouping(a0102)=1 and grouping(left(K0101,1))=1 then 'zZ' else
		case when grouping(a0102)=0 and grouping(left(K0101,1))=1 then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(K0101,1),'S','G'),'C','X'),'Y','X'),'Z','X')) else max(rtrim(left(K0101,1))) end end k0101,
		sum(1) ysd
		from
		(
			select a.a0102,a.k0101,a.k6301,a.k6302,a.k6303,a.a0103
			from #k063 a join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
			where isnull(k0180,'1')<>'3' and a.A0102 like rtrim(@A0102)+'%'
			and left(a.K0101,1) in ('X','Y','C')
			----and len(a.k0101)>=10
			and a.k0101 in (select yk0101 from #lx)
		) #k001
		grOUP by a0102,left(k0101,1)
		with rollup --order by left(k0101,1)
		) Ysd full join (
	select
	max(a0102) a0102,max(ha0102) ha0102,
		case when grouping(a0102)=1 and grouping(left(YK0101,1))=1 then 'zZ' else
		case when grouping(a0102)=0 and grouping(left(YK0101,1))=1 then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(YK0101,1),'S','G'),'C','X'),'Y','X'),'Z','X')) else max(rtrim(left(YK0101,1))) end end k0101,
	SUM(case when isnull(k6301,'')<>'' and b3='1' then 1 else 0 end) bbsd,--不变隧道
	SUM(case when isnull(k6301,'')<>'' and b3='5' then 1 else 0 end) wfpdsd, --无法判断隧道
	SUM(case when isnull(k6301,'')<>'' and b3='2' then 1 else 0 end) bgsd,--变更隧道
	SUM(case when isnull(k6301,'')<>'' and b3='4' then 1 else 0 end) scsd,--删除隧道
	SUM(case when b3='3' then 1 else 0 end) xzsd--新增隧道
	from
	(
		select *
		from #sd a
		where left(yK0101,1) in ('X','Y','C')
	) #k001
	group by a0102,left(yk0101,1)
	with rollup --order by grouping(a0102) desc,grouping(left(yk0101,1)) desc
	) FHsd ON Ysd.A0102=FHsd.A0102 AND Ysd.K0101=FHsd.K0101
	where isnull(ysd.k0101,'')<>'zz'
	ORDER BY REPLACE(case when isnull(Ysd.K0101,'')='' then FHsd.k0101 else isnull(Ysd.K0101,'') end,'C','YY')





	select '------------------干线公路---------------------------------------------------'
	-- select * from #lx
---------------路面类型


select '干线公路-路面类型' '干线公路-路面类型',YLC.OBJNAME,YLC.LQLC,YLC.SNLC,YLC.QTLC,
LQLC+LQBH+LXBG_lqBG+XZLQ-SCLQ TZHLQ,CAST((((LQLC+LQBH+LXBG_lqBG+XZLQ-SCLQ)/CASE WHEN LQLC=0 THEN 1 ELSE LQLC END)-1)*100 AS DECIMAL(8,3)) LQBHL,
SNLC+SNBH+LXBG_SNBG+XZSN-SCSN TZHSN,CAST((((SNLC+SNBH+LXBG_SNBG+XZSN-SCSN)/CASE WHEN SNLC=0 THEN 1 ELSE SNLC END)-1)*100 AS DECIMAL(8,3)) SNBHL,
QTLC+QTBH+LXBG_QTBG+XZQT-SCQT TZHQT,CAST((((QTLC+QTBH+LXBG_QTBG+XZQT-SCQT)/CASE WHEN QTLC=0 THEN 1 ELSE QTLC END)-1)*100 AS DECIMAL(8,3)) QTBHL,
XZLQ,XZSN,XZQT,SCLQ,SCSN,SCQT,
LQBH+LXBG_LQBG LQBHL,SNBH+LXBG_SNBG SNBHL,QTBH+LXBG_QTBG QTBHL
from (

	select
	min(rtrim(a.a0102)) a0102,
	case when grouping(a.a0102)=1 and grouping(objname)=1 then 'zzZ' else max(rtrim(a.ha0102)) end ha0102,
	case when grouping(A.a0102)=1 and grouping(objname)=1 then 'zzZ' else
	case when grouping(A.a0102)=0 and grouping(objname)=1 and left(a.a0102,3)='330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(OBJNAME,'S','G'),'C','X'),'Y','X'),'Z','X'))+rtrim('S') else
	case when grouping(A.a0102)=0 and grouping(objname)=1 and left(a.a0102,3)='331' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(OBJNAME,'S','G'),'C','X'),'Y','X'),'Z','X')) else
	case when grouping(A.a0102)=0 and grouping(objname)=0 and left(a.a0102,3)='330' then max(rtrim(objname))+rtrim('S')
	else max(rtrim(objname)) end end end end objname,
	case when grouping(objname)=1 then '合计' else space(2)++max(rtrim(objjc)) end objjc,
	sum(k0114) LC,
	sum(case when k5104='11' then k0114 else 0 end) LQLC,
	sum(case when k5104='12' then k0114 else 0 end) SNLC,
	sum(case when k5104 not in ('11','12') then k0114 else 0 end) QTLC
	from #k001 a join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
	join da0201 on left(a.k0101,1)=objname
	where isnull(k0180,'1')<>'3'
	and a.A0102 like rtrim(@a0102)+'%'
	and left(a.K0101,1) in ('G','S')
	----and len(a.k0101)>=10
	and isnull(k0123,2)<>1
	and isnull(k0124,'')=''
	group by a.a0102,objname
	with rollup

	) YLC
	full join (
select
	 min(A0102) a0102,MAX(HA0102) ha0102,
	case when grouping(A.a0102)=1 and grouping(left(yk0101,1))=1 then 'zzZ' else
	case when grouping(A.a0102)=0 and grouping(left(yk0101,1))=1 and left(a.a0102,3)='330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(yk0101,1),'S','G'),'C','X'),'Y','X'),'Z','X'))+rtrim('S') else
	case when grouping(A.a0102)=0 and grouping(left(yk0101,1))=1 and left(a.a0102,3)='331' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(yk0101,1),'S','G'),'C','X'),'Y','X'),'Z','X')) else
	case when grouping(A.a0102)=0 and grouping(left(yk0101,1))=0 and left(a.a0102,3)='330' then max(rtrim(left(yk0101,1)))+rtrim('S')
	else max(rtrim(left(yk0101,1))) end end end end k0101,
	--case when grouping(left(yk0101,1))=1 then '合计' else space(2)++max(rtrim(objjc)) end objjc,
	sum(case when isnull(b3,'')='3' then wk0114 else 0 end) XZLC, --新增
	sum(case when isnull(b3,'')='3' and b2='11' then wk0114 else 0 end) XZLQ, --沥青新增
	sum(case when isnull(b3,'')='3' and b2='12' then wk0114 else 0 end) XZSN, --水泥新增
	sum(case when isnull(b3,'')='3' and b2='13' then wk0114 else 0 end) XZQT, --其他新增
	sum(case when isnull(b3,'')='4' then yk0114 else 0 end) scLC, --删除
	sum(case when isnull(b3,'')='4' and b1='11' then yk0114 else 0 end) scLQ, --沥青删除
	sum(case when isnull(b3,'')='4' and b1='12' then yk0114 else 0 end) scSN, --水泥删除
	sum(case when isnull(b3,'')='4' and b1='13' then yk0114 else 0 end) scQT, --其他删除
	sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更' and
	(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8) then wk0114-yk0114 else 0 end) LXBG_LCBG,  --路线变更-里程变更
	sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更' and b1='11' and
	(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8) then wk0114-yk0114 else 0 end) LXBG_lqBG,  --路线变更-里程变更-沥青
	sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更' and b1='12' and
	(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8) then wk0114-yk0114 else 0 end) LXBG_snBG,  --路线变更-里程变更-水泥
	sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更' and b1='13' and
	(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8) then wk0114-yk0114 else 0 end) LXBG_qtBG,  --路线变更-里程变更-其他
	sum(case when (isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更' and
	(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8)) or b3='4' then 1 else 0 end) LXBG_tsBG,  --路线变更-里程变更-条数
	----路面类型变更
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='11' and b2<>'11' then yk0114 else 0 end) lqtz, --沥青路面调整
	sum(case when isnull(b3,'')='1' and b1='11' then yk0114 else 0 end) lqbb, --沥青路面不变
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1<>'11' and b2='11' then yk0114 else 0 end)-
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='11' and b2<>'11' then yk0114 else 0 end) lqbh, --沥青路面变化
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='12' and b2<>'12' then yk0114 else 0 end) sntz, --水泥路面调整
	sum(case when isnull(b3,'')='1' and b1='12' then yk0114 else 0 end) snbb, --水泥路面不变
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1<>'12' and b2='12' then yk0114 else 0 end)-
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='12' and b2<>'12' then yk0114 else 0 end) snbh, --水泥路面变化
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='13' and b2<>'13' then yk0114 else 0 end) qttz, --其他路面调整
	sum(case when isnull(b3,'')='1' and b1='13' then yk0114 else 0 end) qtbb, --其他路面不变
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1<>'13' and b2='13' then yk0114 else 0 end)-
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='13' and b2<>'13' then yk0114 else 0 end) qtbh, --其他路面变化
	sum(case when isnull(bglx,'') in ('变更') then yk0114 else 0 end) BgLC, --变更
	sum(case when isnull(bglx,'')='变更' and isnull(xgjy,'')<>'路面类型变更' then yk0114 else 0 end) LXBG_THXX,--路线变更-替换线形
	sum(case when isnull(bglx,'')='变更' and isnull(xgjy,'')='路面类型变更' then yk0114 else 0 end) LXBG_LMLX,--路线变更-路面类型
    sum(case when isnull(bglx,'')='无法判断' then yk0114 else 0 end) WFPD, --线形无法判断
	null w
	from #LX a
	where left(yK0101,1) in ('G','S')
	group by A0102,left(yK0101,1)  with rollup
	) FHLC on YLC.A0102=FHLC.A0102 AND YLC.OBJNAME=FHLC.K0101
	ORDER BY case when objname='zzz' then 1
	 when objname='ZGS' then 2 when objname='SS' then 3 when objname='GS' then 4 when objname='ZG' then 5 when objname='S' then 6 when objname='G' then 7 end
	desc

	-------------------------------------桥梁------------------------------
	select yql.a0102,Yql.K0101,BBql,WFPDql,BGql,SCql,XZql,Yql,Yql+XZql-SCql FHHql,
	cast(((((Yql+XZql-SCql)*1.0)/Yql)-1.0)*100 as DECIMAL(8,3)) BHL from (
		select
		max(a0102) a0102,
		case when grouping(a0102)=1 and grouping(left(k0101,1))=1 then 'zzZ' else
		case when grouping(a0102)=0 and grouping(left(k0101,1))=1 and left(a0102,3)='330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(k0101,1),'S','G'),'C','X'),'Y','X'),'Z','X'))+rtrim('S') else
		case when grouping(a0102)=0 and grouping(left(k0101,1))=1 and left(a0102,3)='331' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(k0101,1),'S','G'),'C','X'),'Y','X'),'Z','X')) else
		case when grouping(a0102)=0 and grouping(left(k0101,1))=0 and left(a0102,3)='330' then max(rtrim(left(k0101,1)))+rtrim('S')
		else max(rtrim(left(k0101,1))) end end end end k0101,
		sum(1) yql
		from
		(
			select a.a0102,a.k0101,a.k6001,a.k6002,a.k6003,a.a0103
			from #k060 a join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
			where isnull(k0180,'1')<>'3' and a.A0102 like rtrim(@a0102)+'%'
			and left(a.K0101,1) in ('G','S')
			----and len(a.k0101)>=10
			and a.k0101 in (select yk0101 from #lx)
		) k001
		grOUP by a0102,left(k0101,1)
		with rollup --order by left(k0101,1)
		) Yql full join (
	select
	max(a0102) a0102,max(ha0102) ha0102,
	case when grouping(a0102)=1 and grouping(left(yk0101,1))=1 then 'zzZ' else
	case when grouping(a0102)=0 and grouping(left(yk0101,1))=1 and left(a0102,3)='330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(yk0101,1),'S','G'),'C','X'),'Y','X'),'Z','X'))+rtrim('S') else
	case when grouping(a0102)=0 and grouping(left(yk0101,1))=1 and left(a0102,3)='331' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(yk0101,1),'S','G'),'C','X'),'Y','X'),'Z','X')) else
	case when grouping(a0102)=0 and grouping(left(yk0101,1))=0 and left(a0102,3)='330' then max(rtrim(left(yk0101,1)))+rtrim('S')
	else max(rtrim(left(yk0101,1))) end end end end k0101,
	SUM(case when isnull(k6001,'')<>'' and b3='1' then 1 else 0 end) bbql,--不变桥梁
	SUM(case when isnull(k6001,'')<>'' and b3='5' then 1 else 0 end) wfpdql, --无法判断桥梁
	SUM(case when isnull(k6001,'')<>'' and b3='2' then 1 else 0 end) bgql,--变更桥梁
	SUM(case when isnull(k6001,'')<>'' and b3='4' then 1 else 0 end) scql,--删除桥梁
	SUM(case when b3='3' then 1 else 0 end) xzql--新增桥梁
	from
	(
		select *
		from #ql a
		where left(yK0101,1) in ('G','S')
	) #k001
	group by a0102,left(yk0101,1)
	with rollup --order by grouping(a0102) desc,grouping(left(yk0101,1)) desc
	) FHql ON Yql.A0102=FHql.A0102 AND Yql.K0101=FHql.K0101
	ORDER BY case when yql.k0101='ZZZ' then left(replace(Yql.A0102,'331','330'),7) else yql.a0102 end,REPLACE(Yql.K0101,'G','SS') desc


	----------------------------------------隧道---------------------------
	select isnull(Ysd.K0101,'') k0101,BBsd,WFPDsd,BGsd,SCsd,XZsd,isnull(Ysd,''),isnull(Ysd+XZsd-SCsd,'') FHHsd,
	cast((((isnull(Ysd+XZsd-SCsd,''))*1.0/isnull(Ysd,1))-1.0)*100 as DECIMAL(8,3)) BHL from (
		select
		max(a0102) a0102,
		case when grouping(a0102)=1 and grouping(left(k0101,1))=1 then 'zzZ' else
		case when grouping(a0102)=0 and grouping(left(k0101,1))=1 and left(a0102,3)='330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(k0101,1),'S','G'),'C','X'),'Y','X'),'Z','X'))+rtrim('S') else
		case when grouping(a0102)=0 and grouping(left(k0101,1))=1 and left(a0102,3)='331' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(k0101,1),'S','G'),'C','X'),'Y','X'),'Z','X')) else
		case when grouping(a0102)=0 and grouping(left(k0101,1))=0 and left(a0102,3)='330' then max(rtrim(left(k0101,1)))+rtrim('S')
		else max(rtrim(left(k0101,1))) end end end end k0101,
		sum(1) ysd
		from
		(
			select a.a0102,a.k0101,a.k6301,a.k6302,a.k6303,a.a0103
			from #k063 a join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
			where isnull(k0180,'1')<>'3' and a.A0102 like rtrim(@a0102)+'%'
			and left(a.K0101,1) in ('G','S')
			----and len(a.k0101)>=10
			and a.k0101 in (select yk0101 from #lx)
		) #k001
		grOUP by a0102,left(k0101,1)
		with rollup --order by left(k0101,1)
		) Ysd full join (
	select
	max(a0102) a0102,max(ha0102) ha0102,
	case when grouping(a0102)=1 and grouping(left(yk0101,1))=1 then 'zzZ' else
	case when grouping(a0102)=0 and grouping(left(yk0101,1))=1 and left(a0102,3)='330' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(yk0101,1),'S','G'),'C','X'),'Y','X'),'Z','X'))+rtrim('S') else
	case when grouping(a0102)=0 and grouping(left(yk0101,1))=1 and left(a0102,3)='331' then 'Z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(yk0101,1),'S','G'),'C','X'),'Y','X'),'Z','X')) else
	case when grouping(a0102)=0 and grouping(left(yk0101,1))=0 and left(a0102,3)='330' then max(rtrim(left(yk0101,1)))+rtrim('S')
	else max(rtrim(left(yk0101,1))) end end end end k0101,
	SUM(case when isnull(k6301,'')<>'' and b3='1' then 1 else 0 end) bbsd,--不变隧道
	SUM(case when isnull(k6301,'')<>'' and b3='5' then 1 else 0 end) wfpdsd, --无法判断隧道
	SUM(case when isnull(k6301,'')<>'' and b3='2' then 1 else 0 end) bgsd,--变更隧道
	SUM(case when isnull(k6301,'')<>'' and b3='4' then 1 else 0 end) scsd,--删除隧道
	SUM(case when b3='3' then 1 else 0 end) xzsd--新增隧道
	from
	(
		select *
		from #sd a
		where left(yK0101,1) in ('G','S')
	) #k001
	group by a0102,left(yk0101,1)
	with rollup --order by grouping(a0102) desc,grouping(left(yk0101,1)) desc
	) FHsd ON Ysd.A0102=FHsd.A0102 AND Ysd.K0101=FHsd.K0101
	ORDER BY case when ysd.k0101='ZZZ' then left(replace(Ysd.A0102,'331','330'),7) else ysd.a0102 end,replace(Ysd.K0101,'G','SS') desc



	/*
----------------------线路条数--------------------

--原路线条数
SELECT OBJNAME,rtrim(YTS),rtrim(XZTS),rtrim(SCTS),rtrim(TZHTS) FROM (
select '1' A,YTS.a0102 A0102,objname,
cast(ISNULL(TS,0) as char(50)) YTS,
cast(ISNULL(XZTS,0) as char(50)) XZTS,
cast(ISNULL(SCTS,0) as char(50)) SCTS,
cast(ISNULL(TS,0)+ISNULL(XZTS,0)-ISNULL(SCTS,0) as char(50)) TZHTS from (
    select
	 min(rtrim(a0102)) a0102,
	case when grouping(a0102)=1 and grouping(objname)=1 then 'A' else max(rtrim(ha0102)) end ha0102,
	case when grouping(a0102)=1 and grouping(objname)=1 then 'A'
	 when grouping(a0102)=0 and grouping(objname)=1 and left(max(a0102),3)='331' then 'A'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(OBJNAME,'S','G'),'C','X'),'Y','X'),'Z','X'))
	 when grouping(a0102)=0 and grouping(objname)=1 and left(max(a0102),3)='330' then 'A'+rtrim(MAX(REPLACE(REPLACE(REPLACE(REPLACE(OBJNAME,'S','G'),'C','X'),'Y','X'),'Z','X')))+'S'
	 when grouping(a0102)=0 and grouping(objname)=0 and left(max(a0102),3)='330' then max(rtrim(objname))+'S' else
	max(rtrim(objname)) end objname,
	case when grouping(objname)=1 then '合计' else space(2)++max(rtrim(objjc)) end objjc,
	sum(1) TS
	from
	(
		select min(a.A0102) A0102,MAX(a.HA0102) ha0102,replace(replace(replace(a.k0101,'D001',''),'D002',''),'D003','') k0101
		from #k001 a join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
		where isnull(k0180,'1')<>'3' and a.A0102 like rtrim(@a0102)+'%'
		--and left(a.K0101,1) in ('G','S','X','Y','Z','C')
		and left(a.K0101,1) in ('G','S')
		--and len(a.k0101)>=10
		and isnull(k0123,2)<>1
		and k0124 is null
		group by a.a0102,replace(replace(replace(a.k0101,'D001',''),'D002',''),'D003','')
	) #k001 join da0201 on left(k0101,1)=objname
	group by a0102,objname
	with rollup
	) YTS full join
	(
	---新增路线条数
	select
	max(rtrim(a0102)) a0102,
	case when grouping(a0102)=1 and grouping(left(wk0101,1))=1 then 'A'
	 when grouping(a0102)=0 and grouping(left(wk0101,1))=1 and left(max(a0102),3)='331' then 'A'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(wk0101,1),'S','G'),'C','X'),'Y','X'),'Z','X'))
	 when grouping(a0102)=0 and grouping(left(wk0101,1))=1 and left(max(a0102),3)='330' then 'A'+rtrim(MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(wk0101,1),'S','G'),'C','X'),'Y','X'),'Z','X')))+'S'
	 when grouping(a0102)=0 and grouping(left(wk0101,1))=0 and left(max(a0102),3)='330' then max(rtrim(left(wk0101,1)))+'S' else
	max(rtrim(left(wk0101,1))) end k0101,
	sum(1) xzts
	from (select * from #lx where bglx='新增' and isnull(wcjwt,'') like '非原数据库%' and left(yK0101,1) in ('G','S')) a
	group by a0102,left(wk0101,1) with rollup
	) XZTS ON YTS.A0102=XZTS.A0102 AND YTS.OBJNAME=XZTS.K0101
	full join
	(
	--删除路线条数
	select
	max(rtrim(a0102)) a0102,
	case when grouping(a0102)=1 and grouping(left(yk0101,1))=1 then 'A'
	 when grouping(a0102)=0 and grouping(left(yk0101,1))=1 and left(max(a0102),3)='331' then 'A'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(yk0101,1),'S','G'),'C','X'),'Y','X'),'Z','X'))
	 when grouping(a0102)=0 and grouping(left(yk0101,1))=1 and left(max(a0102),3)='330' then 'A'+rtrim(MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(yk0101,1),'S','G'),'C','X'),'Y','X'),'Z','X')))+'S'
	 when grouping(a0102)=0 and grouping(left(yk0101,1))=0 and left(max(a0102),3)='330' then max(rtrim(left(yk0101,1)))+'S' else
	max(rtrim(left(yk0101,1))) end k0101,
	sum(sclx) scts from (
	select yk0101,max(a0102) a0102,1 sclx from #lx
	where yk0108 is not null
	and yk0101 not in (select Yk0101 from #lx where b3<>4 and Yk0108 is not null) and left(yK0101,1) in ('G','S')
	group by a0102,yk0101
	) scts
	group by a0102,left(yk0101,1) with rollup
	) SCTS ON YTS.A0102=SCTS.A0102 AND YTS.OBJNAME=SCTS.K0101
	) A
	ORDER BY A,A0102,replace(OBJNAME,'S','GG'),SCTS

	-----------------------------线路轨迹--------------------

	--将外业采集轨迹、电子地图轨迹、原数据库轨迹三者进行比对，对外业采集轨迹线形更平滑，更符合电子地图轨迹走向的路段建议调整轨迹，调整变化路线共**条，其中国道高速**条，省道高速**条，普通国道**条，普通省道**条，涉及公路里程共计**公里。

	select '将外业采集轨迹、电子地图轨迹、原数据库轨迹三者进行比对，对外业采集轨迹线形更平滑，更符合电子地图轨迹走向的路段建议调整轨迹，调整变化路线共'+
	isnull(rtrim(sum(case when k0101='zZ' then ts else 0 end)),0)
	+'条，其中国道高速'+rtrim(sum(case when k0101='G' and left(a0102,3)='330' then ts else 0 end))+'条，省道高速'+rtrim(sum(case when k0101='S' and left(a0102,3)='330' then ts else 0 end))+
	'条，普通国道'+rtrim(sum(case when k0101='G' and left(a0102,3)='331' then ts else 0 end))+'条，普通省道'+rtrim(sum(case when k0101='S' and left(a0102,3)='331' then ts else 0 end))+
	'条，涉及公路里程共计'+rtrim(sum(case when k0101='zZ' then k0114 else 0 end))+'公里。'
	from (
	SELECT min(A0102) a0102,
	case when grouping(a0102)=1 and grouping(left(k0101,1))=1 then 'Zz' else
	case when grouping(a0102)=0 and grouping(left(k0101,1))=1 then 'z'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(k0101,1),'S','G'),'C','X'),'Y','X'),'Z','X')) else max(rtrim(left(k0101,1))) end end k0101
	,SUM(TS) ts,SUM(K0114) k0114 FROM (
	select a0102,replace(replace(k0101,'D001',''),'D002','') k0101,1 TS,SUM(K0114) K0114 from #k001 where ''='' and k0101 in (select yk0101 from #lx where bglx='变更' and xgjy='替换线形')
	AND isnull(k0124,'')=''
	and isnull(k0123,2)<>1
	and left(k0101,1) in ('G','S')
	group by a0102,k0101
	) A GROUP BY a0102,LEFT(K0101,1) WITH ROLLUP
	) a


	----------------------------线路里程---------------------------    select * from #lx

    select * from (
    select
	max(a0102) a0102,max(ha0102) ha0102,
	case when grouping(a0102)=1 and grouping(left(k0101,1))=1 then 'A'
	 when grouping(a0102)=0 and grouping(left(k0101,1))=1 and left(max(a0102),3)='331' then 'A'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(k0101,1),'S','G'),'C','X'),'Y','X'),'Z','X'))
	 when grouping(a0102)=0 and grouping(left(k0101,1))=1 and left(max(a0102),3)='330' then 'A'+rtrim(MAX(REPLACE(REPLACE(REPLACE(REPLACE(left(k0101,1),'S','G'),'C','X'),'Y','X'),'Z','X')))+'S'
	 when grouping(a0102)=0 and grouping(left(k0101,1))=0 and left(max(a0102),3)='330' then max(rtrim(left(k0101,1)))+'S' else
	 max(rtrim(left(k0101,1))) end k0101,
	sum(ylc) ylc,
	sum(ylc)+sum(J_xzlc)+sum(j_LXBG_LCBG_bhl)-sum(J_sclc) fhlc,
	((sum(ylc)+sum(J_xzlc)+sum(j_LXBG_LCBG_bhl)-sum(J_sclc))/sum(ylc)-1)*100 bhl,
	sum(j_lcbb) j_lcbb,
	sum(j_lxbg_lmbb_lcbb) j_lxbg_lmbb_lcbb,
	sum(j_lmbg_lcbb) j_lmbg_lcbb,
	sum(j_lxbg_lmbg_lcbb) j_lxbg_lmbg_lcbb,
	sum(j_wfpd) j_wfpd,
	sum(j_lcbb)+
	sum(j_lxbg_lmbb_lcbb)+
	sum(j_lmbg_lcbb)+
	sum(j_lxbg_lmbg_lcbb)+
	sum(j_wfpd) j_bblc,
	sum(j_LXBG_LCBG_ylc) j_LXBG_LCBG_ylc,  --路线变更-里程变更-原里程
	sum(j_LXBG_LCBG_bhl) j_LXBG_LCBG_bhl,  --路线变更-里程变更-变化量
	sum(j_LXBG_LCBG_ylc)+
	sum(j_LXBG_LCBG_bhl) j_LXBG_lcbg,
	sum(j_lxXZLC) j_lxXZLC, --路线新增
	sum(j_ycXZLC) j_ycXZLC, --延长新增
	sum(j_lxXZLC)+
	sum(j_ycXZLC) j_xzlc, --延长新增
	sum(case when bglx1=4 and bglx2=4 then J_scLC else 0 end) j_wqsc,
	sum(case when bglx1<>4 or bglx2<>4 then J_scLC else 0 end) j_bfscsc,
	sum(j_scLC) j_scLC, --删除
	(sum(j_lcbb)+sum(j_lxbg_lmbb_lcbb)+sum(j_lmbg_lcbb)+sum(j_lxbg_lmbg_lcbb)+sum(j_wfpd))
	+(sum(j_LXBG_LCBG_ylc)+sum(j_LXBG_LCBG_bhl))
	+(sum(j_lxXZLC)+sum(j_ycXZLC)) tzjg,
	(sum(j_lcbb)+sum(j_lxbg_lmbb_lcbb)+sum(j_lmbg_lcbb)+sum(j_lxbg_lmbg_lcbb)+sum(j_wfpd))
	+(sum(j_LXBG_LCBG_ylc))
	+sum(j_scLC)  ylcs
	 from (
		select
		 A0102,min(HA0102) ha0102, replace(replace(yk0101,'D001',''),'D002','') k0101,
		----给交科院数据     select * from #lx where left(yK0101,1) in ('G','S')
		sum(yk0114) ylc,
		sum(case when isnull(b3,'')='1' then yk0114 else 0 end) j_lcbb,  --里程不变
		sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更' and
		(yk0114/(case when wk0114=0 then yk0114 else wk0114 end)>0.8 and
				yk0114/(case when wk0114=0 then yk0114 else wk0114 end)<1.2) and b1=b2 then yk0114 else 0 end) j_lxbg_lmbb_lcbb,  --路线变更-路面不变-里程不变

		sum(case when isnull(b3,'')='2' and isnull(xgjy,'')='路面类型变更' then yk0114 else 0 end) j_lmbg_lcbb,  --路面变更-里程不变
		sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更' and
		(yk0114/(case when wk0114=0 then yk0114 else wk0114 end)>0.8 and
				yk0114/(case when wk0114=0 then yk0114 else wk0114 end)<1.2)  and b1<>b2  then yk0114 else 0 end)
		 j_lxbg_lmbg_lcbb,  --路线变更-路面变更-里程不变
		sum(case when isnull(b3,'')='5' then yk0114 else 0 end) j_wfpd,  --无法判断
		sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更' and
		(yk0114/(case when wk0114=0 then yk0114 else wk0114 end)>=1.2 or
				yk0114/(case when wk0114=0 then yk0114 else wk0114 end)<=0.8) then yk0114 else 0 end) j_LXBG_LCBG_ylc,  --路线变更-里程变更-原里程

		sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'路面类型变更' and
		(yk0114/(case when wk0114=0 then yk0114 else wk0114 end)>=1.2 or
				yk0114/(case when wk0114=0 then yk0114 else wk0114 end)<=0.8) then wk0114-yk0114 else 0 end) j_LXBG_LCBG_bhl,  --路线变更-里程变更-变化量
		sum(case when isnull(b3,'')='3' and isnull(wcjwt,'')='非原数据库数据' then wk0114 else 0 end) j_lxXZLC, --路线新增
		sum(case when isnull(b3,'')='3' and isnull(wcjwt,'')<>'非原数据库数据' then wk0114 else 0 end) j_ycXZLC, --延长新增
		sum(case when isnull(b3,'')='3' then wk0114 else 0 end) j_xzlc,
		min(case when yk0108 is not null then b3 else 4 end) BGLX1, --根据路线分组，获取最大的变更类型,
		max(case when yk0108 is not null then b3 else 4 end) BGLX2, --根据路线分组，获取最大的变更类型,
		sum(case when isnull(b3,'')='4' then yk0114 else 0 end) J_scLC --删除
		from #LX a
		where left(yK0101,1) in ('G','S')
		group by A0102,yk0101
	) a
	group by a0102,left(k0101,1)
    with rollup
    --order by  replace(left(max(k0101),1),'C','yy') -- select * from #ql
    ) a
    order by  a0102,replace(k0101,'G','SS')  desc
   */
