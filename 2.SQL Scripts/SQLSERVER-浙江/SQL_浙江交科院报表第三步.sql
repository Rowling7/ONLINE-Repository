
----���������

declare @a0102 char(15)
set @a0102='33_0783'

if object_id('tempdb..#k001') is not null drop table #k001
select * into #k001 from k001 where a0102 like rtrim(@a0102)+'%'

if object_id('tempdb..#a50') is not null drop table #a50
select * into #a50 from a50 where a0102 like rtrim(@a0102)+'%'

if object_id('tempdb..#k063') is not null drop table #k063
select * into #k063 from k063 where a0102 like rtrim(@a0102)+'%'

if object_id('tempdb..#k060') is not null drop table #k060
select * into #k060 from k060 where a0102 like rtrim(@a0102)+'%'

update #a50 set a0102=replace(left(a0102,7),'331','332') where left(k0101,1) in ('X','Y','Z','C')
update #k001 set a0102=replace(left(a0102,7),'331','332') where left(k0101,1) in ('X','Y','Z','C')
update #k063 set a0102=replace(left(a0102,7),'331','332') where left(k0101,1) in ('X','Y','Z','C')
update #k060 set a0102=replace(left(a0102,7),'331','332') where left(k0101,1) in ('X','Y','Z','C')
update #a50 set a0102=replace(left(a0102,7),'331','330') where len(k0101)<10
update #k001 set a0102=replace(left(a0102,7),'331','330') where len(k0101)<10
update #k063 set a0102=replace(left(a0102,7),'331','330') where len(k0101)<10
update #k060 set a0102=replace(left(a0102,7),'331','330') where len(k0101)<10
/*
update #a50 set a0102=left(a0102,5)
update #k001 set a0102=left(a0102,5)
update #k063 set a0102=left(a0102,5)
update #k060 set a0102=left(a0102,5)
*/
--����һ����������λ��ɾ���ظ�·��   select * from k001

delete #a50
--select * from #lx where bglx='���' and xgjy<>'·�����ͱ��'
where rtrim(k0101)+rtrim(ha0102) in (
select rtrim(k0101)+max(rtrim(ha0102)) from #a50
group by a0102,k0101
having count(1)>1
)

if object_id('tempdb..#lx') is not null drop table #lx
create table #lx(FHSJ CHAR(50),TPBM CHAR(50),a0102 char(12),gldw char(20),ha0102 varchar(50),
Yk0101 char(15),Yk0112 varchar(50),Yk0108 numeric(18,3),Yk0109 numeric(18,3),YK0114 NUMERIC(18,3),YHK5104 VARCHAR(50),
WK0101 CHAR(15),Wk0108 numeric(18,3),Wk0109 numeric(18,3),WK0114 NUMERIC(18,3),WHK5104 VARCHAR(50),cflx char(50),WCJWT VARCHAR(255),
BGLX CHAR(20),BGYY VARCHAR(255),XGJY CHAR(255),B1 CHAR(255),B2 CHAR(255),B3 CHAR(255)
)
-- ���� 331125 331102 ��� ����
INSERT #lx(fhsj,tpbm,gldw,YK0101,YK0112,YK0108,YK0109,YK0114,YHK5104,WK0101,WK0108,WK0109,WK0114,WHK5104,cflx,WCJWT,BGLX,BGYY,XGJY)
Select a,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19  from
OpenRowSet
(
'MSDASQL',
'DRIVER=Microsoft Excel Driver (*.xls);
DBQ=E:\6078������\1.�����ļ�\1.�����ļ������ڷ��ࣩ\20230923 �㽭\map\330783����\���ݺ˲�-�𻪶���-����.xls;
UID=admin;
PWS=',
'SELECT * from [·��$]')
DELETE FROM #LX WHERE yk0101 LIKE 'CYS%'
--SELECT * from #lx
-- delete #lx where a0102='3320503'          select * from #k001 where a0102='33103811'
-- select * from #lx order by isnull(yk0101,wk0101)
-- select right(rtrim(yk0101),6) from #lx group by right(rtrim(yk0101),6)

if object_id('tempdb..#ql') is not null drop table #ql
create table #ql(FHSJ CHAR(50),TPBM CHAR(50),gldw char(20),a0102 char(12),ha0102 varchar(50),
Yk0101 char(15),Yk0112 varchar(50),k6001 char(20),k6002 char(50),yk6003 NUMERIC(18,3),
WK0101 CHAR(15),wk6003 numeric(18,3),WCJWT VARCHAR(255),
BGLX CHAR(20),BGYY VARCHAR(255),XGJY CHAR(50),B1 CHAR(255),B2 CHAR(255),B3 CHAR(255)
)

-- ���� 331125 331102 ��� ����
INSERT #ql(fhsj,tpbm,gldw,YK0101,YK0112,k6001,k6002,yk6003,WK0101,wk6003,WCJWT,BGLX,BGYY,XGJY)
Select a,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14 from
OpenRowSet
(
'MSDASQL',
'DRIVER=Microsoft Excel Driver (*.xls);
DBQ=E:\6078������\1.�����ļ�\1.�����ļ������ڷ��ࣩ\20230923 �㽭\map\330783����\���ݺ˲�-�𻪶���-����.xls;
UID=admin;
PWS=',
'SELECT * from [����$]')

-- select * from #ql where wk0101 is not null and wk6003 is null
-- select right(rtrim(yk0101),6) from #ql group by right(rtrim(yk0101),6)

if object_id('tempdb..#sd') is not null drop table #sd
create table #sd(FHSJ CHAR(50),TPBM CHAR(50),gldw char(20),a0102 char(12),ha0102 varchar(50),
Yk0101 char(15),Yk0112 varchar(50),k6301 char(20),k6302 char(50),yk6303 NUMERIC(18,3),
WK0101 CHAR(15),wk6303 numeric(18,3),WCJWT VARCHAR(255),
BGLX CHAR(20),BGYY VARCHAR(255),XGJY CHAR(50),B1 CHAR(255),B2 CHAR(255),B3 CHAR(255)
)

-- ���� 331125 331102 ��� ����
INSERT #sd(fhsj,tpbm,gldw,YK0101,YK0112,k6301,k6302,yk6303,WK0101,wk6303,WCJWT,BGLX,BGYY,XGJY)
Select a,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14  from
OpenRowSet
(
'MSDASQL',
'DRIVER=Microsoft Excel Driver (*.xls);
DBQ=E:\6078������\1.�����ļ�\1.�����ļ������ڷ��ࣩ\20230923 �㽭\map\330783����\���ݺ˲�-�𻪶���-����.xls;
UID=admin;
PWS=',
'SELECT * from [���$]')
delete #ql where a0102 is null
-- select right(rtrim(yk0101),6) from #sd group by right(rtrim(yk0101),6)\
--��ȡ��ҵδ�ɼ���·������  select * from #lx where yk0101='Y010330502'
/*
select @wts=(select count(1) from (
	select k0101 from #k001  a
	left join #lx on rtrim(k0101)=rtrim(yk0101) and rtrim(k0108)=rtrim(yk0108)
	where 1=1
	and yk0101 is null
	and isnull(k0124,'')=''
	and isnull(k0123,2)<>1
	and a.a0102 like rtrim(@a0102)+'%'
	and left(k0101,1) in ('G','S','X','Y','Z','C')
	group by k0101
) a)
*/

--������ҵδ�ɼ���·��
insert into #lx(yk0101,yk0112,yk0108,yk0109,yk0114,yhk5104,bglx,xgjy)
select k0101,k0112,k0108,k0109,k0114,hk5104,'����','����' from #k001  a
left join #lx on rtrim(k0101)=rtrim(yk0101) and rtrim(k0108)=rtrim(yk0108)
where 1=1
and yk0101 is null
and isnull(k0124,'')=''
and isnull(k0123,2)<>1
--and len(k0101)>=10
and a.a0102 like rtrim(@a0102)+'%'
and left(k0101,1) in ('G','S','X','Y','Z','C')


/*
select sum(yk0114) from #lx where isnull(b3,'') in ('1','2','4')
select sum(yk0114) from #lx where isnull(b3,'') in ('5')
select * from #lx where isnull(b3,'')='' and yk0108 is not null

select k0101,k0112,k0108,k0109,k0114,hk5104,'����','����' from #k001  a
left join #lx on rtrim(k0101)=rtrim(yk0101) and rtrim(k0108)=rtrim(yk0108)
where 1=1
and yk0101 is null
and isnull(k0124,'')=''
and isnull(k0123,2)<>1
and len(k0101)<=10
and a.a0102 like rtrim('33_1127')+'%'
and left(k0101,1) in ('G','S','X','Y','Z','C')
*/

--������ҵδ�ɼ�������  select * from #ql
insert into #ql(yk0101,yk0112,k6001,k6002,yk6003,bglx,xgjy)
select k0101,k0112,rtrim(k0101)+'L'+rtrim(a.k6001),a.k6002,a.k6003,'�޷��ж�','' from #k060 a left join #ql on rtrim(k0101)=rtrim(yk0101) and rtrim(k6003)=rtrim(yk6003)
where yk0101 is null
and a.a0102 like rtrim(@a0102)+'%'
and left(k0101,1) in ('G','S','X','Y','Z','C')

--������ҵδ�ɼ������  select * from #sd
insert into #sd(yk0101,yk0112,k6301,k6302,yk6303,bglx,xgjy)
select k0101,k0112,rtrim(k0101)+'U'+rtrim(a.k6301),a.k6302,a.k6303,'�޷��ж�','' from #k063 a left join #sd on rtrim(k0101)=rtrim(yk0101) and rtrim(k6303)=rtrim(yk6303)
where yk0101 is null
and a.a0102 like rtrim(@a0102)+'%'
and left(k0101,1) in ('G','S','X','Y','Z','C')




--select * from #k060 where left(k0101,1) in ('Y','X','C')
-------����·�ߺ˲�����
update #lx set yk0101=case when len(wk0101)>=10 then left(wk0101,10) else left(wk0101,len(wk0101)-1) end where isnull(yk0101,'')=''
----�������ݿ��ȡ����λ
--ԭ���ݿ�����-
update a set a.a0102=b.a0102,a.ha0102=b.ha0102
from #lx a join #k001 b on a.yk0101=b.k0101 AND A.YK0108=B.K0108

--��ҵ���ݻ��ߺ����ݿ��Ӧ���ϵ�����
update a set a.a0102=b.a0102,a.ha0102=b.ha0102
from #lx a join #k001 b on left(a.yk0101,10)=b.k0101 and wk0108>=k0108 and wk0108<=k0109
where a.a0102 is null

update a set a.a0102=b.a0102,a.ha0102=b.ha0102
from #lx a join (
select * from #k001 where rtrim(a0102)+k0101 in(
select rtrim(max(a0102))+k0101 a from #k001 group by k0101)
) b on left(a.yk0101,10)=b.k0101
where a.a0102 is null


--ɾ�������ڵ�����  select * from #k001
--select * from #lx where a0102 is null and wk0101 is null
delete #lx where a0102 is null and wk0101 is null

---ɾ���˲���ظ����
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
--����·������
update #lx set b1=case when left(yhk5104,2)='����' then '11' else case when left(yhk5104,2)='ˮ��' then '12' else '13' end end where yhk5104 is not null
update #lx set b2=case when left(whk5104,2)='����' then '11' else case when left(whk5104,2)='ˮ��' then '12' else '13' end end where whk5104 is not null
--��ѯ���������û����д�����ݣ�����һ�����ղ�����д
--select * from #lx
update #lx set bglx='����',xgjy='����'
where yk0101 is not null and yk0108 is not null and bglx is null

--���±��·��
update #lx set bglx=ltrim(rtrim(bglx))

UPDATE #LX SET B3=case WHEN isnull(bglx,'')='����' THEN '1' ELSE
case WHEN isnull(bglx,'') in ('���') THEN '2' ELSE
case WHEN isnull(bglx,'')='����' THEN '3' ELSE
case WHEN isnull(bglx,'')='ɾ��' THEN '4' ELSE
case WHEN isnull(bglx,'')='�޷��ж�' THEN '5' ELSE null end end end end end

--select * from #lx where isnull(yk0101,'')<>'' and yk0108 is not null and b3

--�������  select * from #a50
update #lx set yk0114=convert(decimal(8,3),isnull(yk0109,0)-isnull(yk0108,0)),wk0114=convert(decimal(8,3),isnull(wk0109,0)-isnull(wk0108,0))

update a set yhk5104=rtrim(hk5104)
from #lx a join #k001 b on yk0101=k0101 and yk0108=k0108

update #lx set whk5104=null where bglx='����'
------����
update #ql set yk0101=left(wk0101,10) where isnull(yk0101,'')=''
--�������ݿ���������Ĺ���λ
update a set a.a0102=b.a0102,a.ha0102=b.ha0102,a.yk0112=b.k0112
from #ql a left join #k060 b on left(a.yk0101,10)=left(b.k0101,10) and yk6003=k6003
--������ҵ�ɼ������ݵĹ���λ
update a set a.a0102=b.a0102,a.ha0102=b.ha0102
from #ql a left join #a50 b on left(a.yk0101,10)=left(b.k0101,10)
where a.a0102 is null

--���±������
update #ql set bglx=ltrim(rtrim(bglx))
UPDATE #ql SET B3=case WHEN isnull(bglx,'')='����' THEN '1' ELSE
case WHEN isnull(bglx,'') in ('���') THEN '2' ELSE
case WHEN isnull(bglx,'')='����' THEN '3' ELSE
case WHEN isnull(bglx,'')='ɾ��' THEN '4' ELSE
case WHEN isnull(bglx,'')='�޷��ж�' THEN '5' ELSE null end end end end end
--ɾ����������
--select * from #ql where a0102 is null
delete #ql where a0102 is null


--���
update #sd set yk0101=left(wk0101,10) where isnull(yk0101,'')=''

update a set a.a0102=b.a0102,a.ha0102=b.ha0102,a.yk0112=b.k0112
from #sd a left join #a50 b on left(a.yk0101,10)=left(b.k0101,10)
update a set a.a0102=b.a0102,a.ha0102=b.ha0102
from #sd a left join #a50 b on left(a.wk0101,10)=left(b.k0101,10)
where a.a0102 is null

--ɾ����������
--select * from #sd where a0102 is null
delete #sd where a0102 is null
--���±������
update #sd set bglx=ltrim(rtrim(bglx))
UPDATE #sd SET B3=case WHEN isnull(bglx,'')='����' THEN '1' ELSE
case WHEN isnull(bglx,'') in ('���') THEN '2' ELSE
case WHEN isnull(bglx,'')='����' THEN '3' ELSE
case WHEN isnull(bglx,'')='ɾ��' THEN '4' ELSE
case WHEN isnull(bglx,'')='�޷��ж�' THEN '5' ELSE null end end end end end

select * from #lx
--declare @a0102 char(15)
--set @a0102=@a0102  select * from #lx

SELECT zLX.A0102,zLX.HA0102,
case when zlx.objname='AG' and left(zlx.a0102,3)='331' THEN '��ͨ��ʡ��' else
case when zlx.objname='AG' and left(zlx.a0102,3)='330' then '���ٹ�·' else
case when zlx.objname='AX' THEN 'ũ�幫·' else
RTRIM(ZLX.OBJJC) end END END,
lc,lqlc,snlc,qtlc,ts,ql,sd,
isnull(wlc,0) wlc,isnull(wcwlc,0) wcwlc,isnull(wlccwl,0),
    ISNULL(wts,0) WTS,isnull(WCWTS,0) FHTS,isnull(WTSCWL,0),
	isnull(wql,0) wql,isnull(wcwql,0) wcwql,isnull(wqlcwl,0),
	isnull(wsd,0) wsd,isnull(wcwsd,0) wcwsd,isnull(wsdcwl,0),
	isnull(YLC,0) ylc,isnull(YLQ,0) ylq,isnull(YSN,0) ysn,isnull(YQT,0) yqt,isnull(YQL,0) yql,isnull(YSD,0) ysd,
	isnull(fhlc,0) fhlc,isnull(wfpdlc,0) wfpdlc,isnull(lcfhl,0),
	isnull(fhql,0) fhql,isnull(wfpdql,0) wfpdql,isnull(qlfhl,0),
	isnull(fhsd,0) fhsd,isnull(wfpdsd,0) wfpdsd,isnull(sdfhl,0),
	isnull(yts,0) YTS,isnull(fhts,0) FHTS,isnull(tsfhl,0),
	isnull(bblc,0) bblc,
	isnull(bbts,0) bbts,
	isnull(bbql,0) bbql,
	isnull(bbsd,0) bbsd,
	isnull(xzlc,0) xzlc,
	isnull(xzts,0) xzts,
	isnull(xzlq,0) xzlq,
	isnull(xzsn,0) xzsn,
	isnull(xzqt,0) xzqt,
	isnull(xzql,0) xzql,
	isnull(xzsd,0) xzsd,
	isnull(sclc,0) sclc,
	isnull(scts,0) scts,
	isnull(sclq,0) sclq,
	isnull(scsn,0) scsn,
	isnull(scqt,0) scqt,
	isnull(scql,0) scql,
	isnull(scsd,0) scsd,
	isnull(tzlc,0) tzlc,
	isnull(tzlq,0) tzlq,
	isnull(tzsn,0) tzsn,
	isnull(tzqt,0) tzqt,
	isnull(tzts,0) tzts,
	isnull(lqtz,0) lqtz,isnull(lqbb,0) lqbb,isnull(lqbh,0) lqbh,
	isnull(sntz,0) sntz,isnull(snbb,0) snbb,isnull(snbh,0) snbh,
	isnull(qttz,0) qttz,isnull(qtbb,0) qtbb,isnull(qtbh,0) qtbh,
	isnull(bgql,0) bgql,isnull(bgsd,0) bgsd
FROM (
	select YLX.A0102,YLX.HA0102,YLX.OBJNAME,YLX.OBJJC,LC,LQLC,SNLC,QTLC,TS,ISNULL(QL,0) QL,ISNULL(SD,0) SD
	from
	(

		select
		case when grouping(a.a0102)=1 and grouping(objname)=1 then 'A' else max(rtrim(a.a0102)) end a0102,
		case when grouping(a.a0102)=1 and grouping(objname)=1 then 'A' else max(rtrim(a.ha0102)) end ha0102,
		case when grouping(A.a0102)=1 and grouping(objname)=1 then 'A' else
		case when grouping(A.a0102)=0 and grouping(objname)=1 then 'A'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(OBJNAME,'S','G'),'C','X'),'Y','X'),'Z','X')) else max(rtrim(objname)) end end objname,
		case when grouping(objname)=1 then '�ϼ�' else space(2)++max(rtrim(objjc)) end objjc,
		sum(k0114) LC,
		sum(case when k5104='11' then k0114 else 0 end) LQLC,
		sum(case when k5104='12' then k0114 else 0 end) SNLC,
		sum(case when k5104 not in ('11','12') then k0114 else 0 end) QTLC
		from #k001 a
		join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
		join da0201 on left(a.k0101,1)=objname
		where ''=''
		and isnull(k0180,'1')<>'3'
		and a.A0102 like rtrim(@a0102)+'%'
		and left(a.K0101,1) in ('G','S','X','Y','Z','C')
		--and len(a.k0101)>=10
		and isnull(k0123,2)<>1
		and isnull(k0124,'')=''
		group by a.a0102,objname
		with rollup
		--order by grouping(a.a0102) DESC,MAX(A.A0102),replace(objname,'C','YY')  select * from da0201
	) YLX full join
	(
	--·������
		select
		case when grouping(a0102)=1 and grouping(objname)=1 then 'A' else max(rtrim(a0102)) end a0102,
		case when grouping(a0102)=1 and grouping(objname)=1 then 'A' else max(rtrim(ha0102)) end ha0102,
		case when grouping(a0102)=1 and grouping(objname)=1 then 'A' else
		case when grouping(a0102)=0 and grouping(objname)=1 then 'A'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(OBJNAME,'S','G'),'C','X'),'Y','X'),'Z','X')) else max(rtrim(objname)) end end objname,
		case when grouping(objname)=1 then '�ϼ�' else space(2)++max(rtrim(objjc)) end objjc,
		sum(1) TS
		from
		(
			select MAX(a.A0102) A0102,MAX(a.HA0102) ha0102,replace(replace(replace(a.k0101,'D001',''),'D002',''),'D003','') k0101
			from #k001 a join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
			where isnull(k0180,'1')<>'3' and a.A0102 like rtrim(@a0102)+'%'
			and left(a.K0101,1) in ('G','S','X','Y','Z','C')
			----and len(a.k0101)>=10
			and isnull(k0123,2)<>1
			and k0124 is null
			group by a.a0102,replace(replace(replace(a.k0101,'D001',''),'D002',''),'D003','')
		) #k001 join da0201 on left(k0101,1)=objname
		group by a0102,objname
		with rollup
	--order by replace(objname,'C','YY')
	) YTS ON YLX.A0102=YTS.A0102 AND YLX.OBJNAME=YTS.OBJNAME

	FULL JOIN
	 (
	--����
		select
		case when grouping(a0102)=1 and grouping(objname)=1 then 'A' else max(rtrim(a0102)) end a0102,
		case when grouping(a0102)=1 and grouping(objname)=1 then 'A' else max(rtrim(ha0102)) end ha0102,
		case when grouping(a0102)=1 and grouping(objname)=1 then 'A' else
		case when grouping(a0102)=0 and grouping(objname)=1 then 'A'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(OBJNAME,'S','G'),'C','X'),'Y','X'),'Z','X')) else max(rtrim(objname)) end end objname,
		case when grouping(objname)=1 then '�ϼ�' else space(2)++max(rtrim(objjc)) end objjc,
		sum(1) QL
		from
		(
		select a.a0102,a.ha0102,a.k0101,a.k6001,a.k6002,a.k6003
		from #k060 a join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
		where isnull(k0180,'1')<>'3' and a.A0102 like rtrim(@a0102)+'%'
		and left(a.K0101,1) in ('G','S','X','Y','Z','C')
		----and len(a.k0101)>=10
		) #k001 join da0201 on left(k0101,1)=objname
			group by a0102,objname
		with rollup
	--order by replace(objname,'C','YY')
	) YQL ON YLX.A0102=YQL.A0102 AND YLX.OBJNAME=YQL.OBJNAME
	full join
	(
		--���
		select
			case when grouping(a0102)=1 and grouping(objname)=1 then 'A' else max(rtrim(a0102)) end a0102,
			case when grouping(a0102)=1 and grouping(objname)=1 then 'A' else max(rtrim(ha0102)) end ha0102,
			case when grouping(a0102)=1 and grouping(objname)=1 then 'A' else
			case when grouping(a0102)=0 and grouping(objname)=1 then 'A'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(OBJNAME,'S','G'),'C','X'),'Y','X'),'Z','X')) else max(rtrim(objname)) end end objname,
			case when grouping(objname)=1 then '�ϼ�' else space(2)++max(rtrim(objjc)) end objjc,
		sum(1) SD
		from
		(
			select a.a0102,A.HA0102,a.k0101,a.k6301,a.k6302,a.k6303
			from #k063 a join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
			where isnull(k0180,'1')<>'3' and a.A0102 like rtrim(@a0102)+'%'
			and left(a.K0101,1) in ('G','S','X','Y','Z','C')
			----and len(a.k0101)>=10
		) #k001 join da0201 on left(k0101,1)=objname
		group by a0102,objname
		with rollup
		--order by replace(objname,'C','YY')
	) YSD ON YLX.A0102=YSD.A0102 AND YLX.OBJNAME=YSD.OBJNAME
) ZLX
FULL JOIN
(
	select
	case when grouping(a0102)=1 and grouping(objname)=1 then 'A' else max(rtrim(a0102)) end a0102,
	case when grouping(a0102)=1 and grouping(objname)=1 then 'A' else max(rtrim(ha0102)) end ha0102,
	case when grouping(a0102)=1 and grouping(objname)=1 then 'A' else
	case when grouping(a0102)=0 and grouping(objname)=1 then 'A'+MAX(REPLACE(REPLACE(REPLACE(REPLACE(OBJNAME,'S','G'),'C','X'),'Y','X'),'Z','X')) else max(rtrim(objname)) end end objname,
	case when grouping(objname)=1 then '�ϼ�' else space(2)++max(rtrim(objjc)) end objjc,
    sum(wlc) wlc,sum(wcwlc) wcwlc,round(sum(wcwlc)*100/case when sum(isnull(wlc,0))=0 then 1 else sum(wlc) end,2) wlccwl,
	sum(wql) wql,sum(wcwql) wcwql,isnull(round(sum(wcwql)*100/case when sum(isnull(wql,0))=0 then 1 else sum(wql) end,2),0) wqlcwl,
	sum(wsd) wsd,sum(wcwsd) wcwsd,isnull(round(sum(wcwsd)*100/case when sum(isnull(wsd,0))=0 then 1 else sum(wsd) end,2),0) wsdcwl,
	sum(YLC) ylc,sum(YLQ) ylq,sum(YSN) ysn,sum(YQT) yqt,sum(YQL) yql,sum(YSD) ysd,
	sum(fhlc) fhlc,sum(wfpdlc) wfpdlc,isnull(round(sum(fhlc)*100/case when sum(ylc)=0 then 1 else sum(ylc) end ,2),0) lcfhl,
	sum(fhql) fhql,sum(wfpdql) wfpdql,isnull(round(sum(fhql)*100/case when sum(yql)=0 then 1 else sum(yql) end,2),0) qlfhl,
	sum(fhsd) fhsd,sum(wfpdsd) wfpdsd,isnull(round(sum(fhsd)*100/case when sum(ysd)=0 then 1 else sum(ysd) end,2),0) sdfhl,
	sum(yts) YTS,sum(fhts) FHTS,round(sum(fhts)*100/sum(yts),2) tsfhl,
	sum(yts) WTS,sum(YTS-FHTS) WCWTS,round(sum(YTS-FHTS)*100/sum(yts),2) WTSCWL,
	sum(bblc) bblc,
	sum(bbts) bbts,
	sum(bbql) bbql,
	sum(bbsd) bbsd,
	sum(xzlc) xzlc,
	sum(xzlq) xzlq,
	sum(xzsn) xzsn,
	sum(xzqt) xzqt,
	sum(xzts) xzts,
	sum(xzql) xzql,
	sum(xzsd) xzsd,
	sum(sclc) sclc,
	sum(sclq) sclq,
	sum(scsn) scsn,
	sum(scqt) scqt,
	sum(scts) scts,
	sum(scql) scql,
	sum(scsd) scsd,
	sum(tzlc) tzlc,
	sum(tzlq) tzlq,
	sum(tzsn) tzsn,
	sum(tzqt) tzqt,
	sum(tzts) tzts,
	sum(lqtz) lqtz,sum(lqbb) lqbb,sum(lqbh) lqbh,
	sum(sntz) sntz,sum(snbb) snbb,sum(snbh) snbh,
	sum(qttz) qttz,sum(qtbb) qtbb,sum(qtbh) qtbh,
	sum(bgql) bgql,sum(bgsd) bgsd
	from
	(
	select ylc.A0102,ylc.HA0102,ylc.k0101,ylc.k0112,YLC,YLQ,YSN,YQT,isnull(YQL,0) yql,isnull(YSD,0)  ysd,yts,
	isnull(wlc,0) wlc,isnull(wcwlc,0) wcwlc,-- round(wcwlc*100/case when isnull(wlc,0)=0 then 1 else wlc end,2) wlccwl,
	isnull(wql,0) wql,isnull(wcwql,0) wcwql,--isnull(round(wcwql*100/case when isnull(wql,0)=0 then 1 else wql end,2),0) wqlcwl,
	isnull(wsd,0) wsd,isnull(wcwsd,0) wcwsd,--isnull(round(wcwsd*100/case when isnull(wsd,0)=0 then 1 else wsd end,2),0) wsdcwl,
	case when fhts>0 then 1 else 0 end fhts,
	isnull(fhlc,0) fhlc,isnull(wfpdlc,0) wfpdlc,--isnull(round((fhlc)*100/case when isnull(ylc,0)=0 then 1 else ylc end ,2),0) lcfhl,
	isnull(fhql,0) fhql,isnull(wfpdql,0) wfpdql,--isnull(round((fhql)*100/case when isnull(yql,0)=0 then 1 else yql end,2),0) qlfhl,
	isnull(fhsd,0) fhsd,isnull(wfpdsd,0) wfpdsd,--isnull(round((fhsd)*100/case when isnull(ysd,0)=0 then 1 else ysd end,2),0) sdfhl,
	case when BGLX=1 then ylc else 0 end bblc,
	case when BGLX=1 then 1 else 0 end bbts,
	isnull(bbql,0) bbql,
	isnull(bbsd,0) bbsd,
	isnull(xzlc,0) xzlc,
	isnull(xzlq,0) xzlq,
	isnull(xzsn,0) xzsn,
	isnull(xzqt,0) xzqt,
	isnull(xzts,0) xzts,
	isnull(xzql,0) xzql,
	isnull(xzsd,0) xzsd,
	isnull(sclc,0) sclc,
	isnull(sclq,0) sclq,
	isnull(scsn,0) scsn,
	isnull(scqt,0) scqt,
	case when sclx is null then 0 else sclx end scts,
	--isnull(sclx,0) scts,
	isnull(scql,0) scql,
	isnull(scsd,0) scsd,
	isnull(LXBG_LCBG,0) tzlc,
	isnull(LXBG_lqBG,0) tzlq,
	isnull(LXBG_snBG,0) tzsn,
	isnull(LXBG_qtBG,0) tzqt,
	case when isnull(LXBG_tsBG,0)<>0 then 1 else 0 end tzts,
	lqtz,lqbb,lqbh,
	sntz,snbb,snbh,
	qttz,qtbb,qtbh,
	isnull(bgql,0) bgql,isnull(bgsd,0) bgsd
	from
	(
		select
		rtrim(max(a.a0102)) a0102,rtrim(max(a.ha0102)) ha0102,a.k0101,rtrim(max(a.k0112)) k0112,
		sum(k0114) YLC,
		sum(case when k5104='11' then k0114 else 0 end) YLQ,
		sum(case when k5104='12' then k0114 else 0 end) YSN,
		sum(case when k5104 not in ('11','12') then k0114 else 0 end) YQT,
		1 Yts
		from #k001 a join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
		where isnull(k0180,'1')<>'3' and a.A0102 like rtrim(@a0102)+'%'
		and left(a.K0101,1) in ('G','S','X','Y','Z','C')
		----and len(a.k0101)>=10
		and isnull(k0123,2)<>1
		and isnull(k0124,'')=''
		and a.k0101 in (select yk0101 from #lx where left(yK0101,1) in ('G','S','X','Y','Z','C'))
		group by a.a0102,a.k0101
		--with rollup order by a.k0101

	) ylc
		LEFT join
	 (
		--����
		select
		max(a0102) a0102,k0101,
		sum(1) yql
		from
		(
			select a.a0102,a.k0101,a.k6001,a.k6002,a.k6003,a.a0103
			from #k060 a join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
			where isnull(k0180,'1')<>'3' and a.A0102 like rtrim(@a0102)+'%'
			and left(a.K0101,1) in ('G','S','X','Y','Z','C')
			----and len(a.k0101)>=10
			and a.k0101 in (select yk0101 from #lx)
		) #k001
		grOUP by k0101
		--with rollup order by k0101

		) YQL ON ylc.A0102=YQL.A0102 AND ylc.K0101=YQL.K0101
		LEFT join
	 (
		--���
		select
		max(a0102) a0102,k0101,
		sum(1) YSD
		from
		(
		select a.a0102,a.k0101,a.k6301,a.k6302,a.k6303,A.a0103
		from #k063 a join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
		where isnull(k0180,'1')<>'3' and a.A0102 like rtrim(@a0102)+'%'
		and left(a.K0101,1) in ('G','S','X','Y','Z','C')
		----and len(a.k0101)>=10
		and a.k0101 in (select yk0101 from #lx)
		) #k001
		grOUP by k0101
		--with rollup order by k0101
		) YSD ON ylc.A0102=YSD.A0102 AND ylc.K0101=YSD.K0101
 LEFT JOIN
(
 --   select sum(yk0114) from #lx  where b3 is not null where isnull(b3,'')=  update #lx set whk5104='���������' , b2='11'  where yk0108 is not null and whk5104 is null
	select
	 A0102,MAX(HA0102) ha0102,Yk0101,
	 sum(case when b3 in ('1','2','4') then 1 else 0 end) fhts,
	 sum(isnull(wk0114,0)) wlc,--��ҵ�ɼ����
	 sum(case when isnull(wcjwt,'')<>''then isnull(wk0114,0) else 0 end) wcwlc,--��ҵ�ɼ��������
	-- round(sum(case when isnull(wcjwt,'')<>''then wk0114 else 0 end)*100/sum(wk0114),2) wlccwl,
	sum(case when isnull(b3,'') in ('1','2','4') then yk0114 else 0 end) fhlc, --�������
	sum(case when isnull(b3,'') in ('5') then yk0114 else 0 end) wfpdlc, --�޷��ж����
	max(case when yk0108 is not null then b3 else 4 end) BGLX, --����·�߷��飬��ȡ���ı������,
	sum(case when isnull(b3,'')='3' then wk0114 else 0 end) XZLC, --����
	sum(case when isnull(b3,'')='3' and b2='11' then wk0114 else 0 end) XZLQ, --��������
	sum(case when isnull(b3,'')='3' and b2='12' then wk0114 else 0 end) XZSN, --ˮ������
	sum(case when isnull(b3,'')='3' and b2='13' then wk0114 else 0 end) XZQT, --��������
	sum(case when isnull(b3,'')='3' and isnull(wcjwt,'') like '��ԭ���ݿ�%' then 1 else 0 end) XZTS, --��������
	sum(case when isnull(b3,'')='4' then yk0114 else 0 end) scLC, --ɾ��
	sum(case when isnull(b3,'')='4' and b1='11' then yk0114 else 0 end) scLQ, --����ɾ��
	sum(case when isnull(b3,'')='4' and b1='12' then yk0114 else 0 end) scSN, --ˮ��ɾ��
	sum(case when isnull(b3,'')='4' and b1='13' then yk0114 else 0 end) scQT, --����ɾ��

	sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'·�����ͱ��' and
	(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8) then wk0114-yk0114 else 0 end) LXBG_LCBG,  --·�߱��-��̱��

	sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'·�����ͱ��' and b1='11' and
	(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8) then wk0114-yk0114 else 0 end) LXBG_lqBG,  --·�߱��-��̱��-����
	sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'·�����ͱ��' and b1='12' and
	(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8) then wk0114-yk0114 else 0 end) LXBG_snBG,  --·�߱��-��̱��-ˮ��
	sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'·�����ͱ��' and b1='13' and
	(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8) then wk0114-yk0114 else 0 end) LXBG_qtBG,  --·�߱��-��̱��-����
	sum(case when (isnull(b3,'')='2' and isnull(xgjy,'')<>'·�����ͱ��' and
	(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8)) or b3='4' then 1 else 0 end) LXBG_tsBG,  --·�߱��-��̱��-����
	----·�����ͱ��
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='11' and b2<>'11' then yk0114 else 0 end) lqtz, --����·�����
	sum(case when isnull(b3,'')='1' and b1='11' then yk0114 else 0 end) lqbb, --����·�治��
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1<>'11' and b2='11' then yk0114 else 0 end)-
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='11' and b2<>'11' then yk0114 else 0 end) lqbh, --����·��仯
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='12' and b2<>'12' then yk0114 else 0 end) sntz, --ˮ��·�����
	sum(case when isnull(b3,'')='1' and b1='12' then yk0114 else 0 end) snbb, --ˮ��·�治��
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1<>'12' and b2='12' then yk0114 else 0 end)-
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='12' and b2<>'12' then yk0114 else 0 end) snbh, --ˮ��·��仯
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='13' and b2<>'13' then yk0114 else 0 end) qttz, --����·�����
	sum(case when isnull(b3,'')='1' and b1='13' then yk0114 else 0 end) qtbb, --����·�治��
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1<>'13' and b2='13' then yk0114 else 0 end)-
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='13' and b2<>'13' then yk0114 else 0 end) qtbh, --����·��仯
	sum(case when isnull(bglx,'') in ('���') then yk0114 else 0 end) BgLC, --���
	sum(case when isnull(bglx,'')='���' and isnull(xgjy,'')<>'·�����ͱ��' then yk0114 else 0 end) LXBG_THXX,--·�߱��-�滻����
	sum(case when isnull(bglx,'')='���' and isnull(xgjy,'')='·�����ͱ��' then yk0114 else 0 end) LXBG_LMLX,--·�߱��-·������
    sum(case when isnull(bglx,'')='�޷��ж�' then yk0114 else 0 end) WFPD, --�����޷��ж�
	null w
	from #LX a
	where left(yK0101,1) in ('G','S','X','Y','Z','C')
	group by A0102,yk0101
--	with rollup  order by  A0102,yk0101

) fhlc on ylc.a0102=fhlc.a0102 and ylc.k0101=fhlc.yk0101
left join
 --ɾ��·��
(
	select yk0101,max(a0102) a0102,1 sclx from #lx
	where yk0108 is not null
	and yk0101 not in (select Yk0101 from #lx where b3<>4 and Yk0108 is not null)
	group by yk0101
) sclx on ylc.a0102=sclx.a0102 and ylc.k0101=sclx.yk0101

left join
 (  --- select * from #ql
	select
	max(a0102) a0102,max(ha0102) ha0102,yk0101,
	SUM(case when isnull(wk6003,'0')<>'0' then 1 else 0 end) wql,--��ҵ�ɼ�����
	SUM(case when isnull(k6001,'')='' and wcjwt like '%����%' then 1 else 0 end) wcwql,--��������
	sum(case when isnull(k6001,'')<>'' and b3 in ('1','2','4') then 1 else 0 end) fhql, --��������
	SUM(case when isnull(k6001,'')<>'' and b3='2' then 1 else 0 end) bgql,--�������
	SUM(case when isnull(k6001,'')<>'' and b3='4' then 1 else 0 end) scql,--ɾ������
	SUM(case when b3='3' then 1 else 0 end) xzql,--��������
	SUM(case when isnull(k6001,'')<>'' and b3='1' then 1 else 0 end) bbql,--��������
	SUM(case when isnull(k6001,'')<>'' and b3='5' then 1 else 0 end) wfpdql --�޷��ж�����
	from
	(
		select *
		from #ql a
		where left(yK0101,1) in ('G','S','X','Y','Z','C')
	) #k001
	group by a0102,yk0101
	--with rollup order by grouping(a0102) desc,grouping(yk0101) desc

	) hcql ON ylc.A0102=hcql.A0102 AND ylc.k0101=hcql.yk0101
	LEFT join
( --- select * from  #sd
	select
	max(a0102) a0102,max(ha0102) ha0102,yk0101,
	SUM(case when isnull(k6301,'')='' and isnull(wk6303,'0')<>'0' then 1 else 0 end) wsd,--��ҵ�ɼ����
	SUM(case when isnull(k6301,'')='' and wcjwt like '%����%' then 1 else 0 end) wcwsd,--�������
	sum(case when isnull(k6301,'')<>'' and b3 in ('1','2','4') then 1 else 0 end) fhsd, --�������
	SUM(case when isnull(k6301,'')<>'' and b3='2' then 1 else 0 end) bgsd,--������
	SUM(case when isnull(k6301,'')<>'' and b3='4' then 1 else 0 end) scsd,--ɾ�����
	SUM(case when isnull(k6301,'')='' and b3='3' then 1 else 0 end) xzsd,--�������
	SUM(case when isnull(k6301,'')<>'' and b3='1' then 1 else 0 end) bbsd,--�������
	SUM(case when isnull(k6301,'')<>'' and b3='5' then 1 else 0 end) wfpdsd --�޷��ж����
	from
	( -- select *from #sd
		select *
		from #sd a
		where left(a.yK0101,1) in ('G','S','X','Y','Z','C')
	) #k001
	group by yk0101
	--order by replace(objname,'C','YY')
	) hcsd ON ylc.A0102=hcsd.A0102 AND ylc.k0101=hcsd.yk0101

	) a
	join da0201 on left(k0101,1)=objname

	group by a0102,objname
	with rollup
) FHLX ON ZLX.A0102=FHLX.A0102 AND ZLX.OBJNAME=FHLX.OBJNAME
order by case when zlx.a0102='a' then '1' else zlx.a0102 end,
    case when zlx.objname in ('G','S','AG') THEN '1'+REPLACE(ZLX.OBJNAME,'S','GG') ELSE '2'+REPLACE(ZLX.OBJNAME,'C','YY') END


    -----------------------------------��·��ͳ��
   ---�˲�����  select * from #lx
	select ylc.A0102,ylc.HA0102,
	ylc.k0101,ylc.k0112,YLC,YLQ,YSN,YQT,isnull(YQL,0) yql,isnull(YSD,0)  ysd,
	isnull(wlc,0) wlc,isnull(wcwlc,0) wcwlc, round(wcwlc*100/case when isnull(wlc,0)=0 then 1 else wlc end,2) wlccwl,
	isnull(wql,0) wql,isnull(wcwql,0) wcwql,isnull(round(wcwql*100/case when isnull(wql,0)=0 then 1 else wql end,2),0) wqlcwl,
	isnull(wsd,0) wsd,isnull(wcwsd,0) wcwsd,isnull(round(wcwsd*100/case when isnull(wsd,0)=0 then 1 else wsd end,2),0) wsdcwl,
	isnull(fhlc,0) fhlc,isnull(wfpdlc,0) wfpdlc,isnull(round((fhlc)*100/case when isnull(ylc,0)=0 then 1 else ylc end ,2),0) lcfhl,
	isnull(fhql,0) fhql,isnull(wfpdql,0) wfpdql,isnull(round((fhql)*100/case when isnull(yql,0)=0 then 1 else yql end,2),0) qlfhl,
	isnull(fhsd,0) fhsd,isnull(wfpdsd,0) wfpdsd,isnull(round((fhsd)*100/case when isnull(ysd,0)=0 then 1 else ysd end,2),0) sdfhl,
	case when BGLX=1 then ylc else 0 end bblc,
	case when BGLX=1 then 1 else 0 end bblc,
	isnull(bbql,0) bbql,
	isnull(bbsd,0) bbsd,
	isnull(xzlc,0) xzlc,
	isnull(xzlq,0) xzlq,
	isnull(xzsn,0) xzsn,
	isnull(xzqt,0) xzqt,
	isnull(xzts,0) xzts,
	isnull(xzql,0) xzql,
	isnull(xzsd,0) xzsd,
	isnull(sclc,0) sclc,
	isnull(sclq,0) sclq,
	isnull(scsn,0) scsn,
	isnull(scqt,0) scqt,
	case when sclx is null then 0 else sclx end scts,
	--isnull(sclx,0) scts,
	isnull(scql,0) scql,
	isnull(scsd,0) scsd,
	isnull(LXBG_LCBG,0) tzlc,
	isnull(LXBG_lqBG,0) tzlq,
	isnull(LXBG_snBG,0) tzsn,
	isnull(LXBG_qtBG,0) tzqt,
	case when isnull(LXBG_tsBG,0)<>0 then 1 else 0 end tzts,
	lqtz,lqbb,lqbh,
	sntz,snbb,snbh,
	qttz,qtbb,qtbh,
	isnull(bgql,0) bgql,isnull(bgsd,0) bgsd
	/*
	ylc-sclc+xzlc+LXBG_LCBG fhhlc,
	ylq+xzlq-sclq+LXBG_lqBG+lqbh fhhlq,
	ysn+xzsn-scsn+LXBG_snBG+snbh fhhsn,
	yqt+xzqt-scqt+LXBG_qtBG+qtbh fhhqt,
	1-case when sclx is null then 0 else sclx end+xzts fhhts,
	yql+xzql-scql fhhql,
	ysd+xzsd-scsd fhhsd,
	bz*/

	from
	(   -- select * from #a50 where k0101='C604330803'
		select
		rtrim(max(a.a0102)) a0102,rtrim(max(a.ha0102)) ha0102,a.k0101,rtrim(max(a.k0112)) k0112,
		sum(k0114) YLC,
		sum(case when k5104='11' then k0114 else 0 end) YLQ,
		sum(case when k5104='12' then k0114 else 0 end) YSN,
		sum(case when k5104 not in ('11','12') then k0114 else 0 end) YQT
		from #k001 a join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
		where isnull(k0180,'1')<>'3' and a.A0102 like rtrim(@a0102)+'%'
		and left(a.K0101,1) in ('G','S','X','Y','Z','C')
		--and len(a.k0101)>=10
		and isnull(k0123,2)<>1
		and isnull(k0124,'')=''
		and a.k0101 in (select yk0101 from #lx where left(yK0101,1) in ('G','S','X','Y','Z','C'))
		group by a.a0102,a.k0101
		--with rollup order by a.k0101
	) ylc
		LEFT join
	 (
		--����
		select
		max(a0102) a0102,k0101,
		sum(1) yql
		from
		(
			select a.a0102,a.k0101,a.k6001,a.k6002,a.k6003,a.a0103
			from #K060 a join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
			where isnull(k0180,'1')<>'3' and a.A0102 like rtrim(@a0102)+'%'
			and left(a.K0101,1) in ('G','S','X','Y','Z','C')
			--and len(a.k0101)>=10
			and a.k0101 in (select yk0101 from #lx)
		) #k001
		grOUP by k0101
		--with rollup order by k0101

		) YQL ON ylc.A0102=YQL.A0102 AND ylc.K0101=YQL.K0101
		LEFT join
	 (
		--���
		select
		max(a0102) a0102,k0101,
		sum(1) YSD
		from
		(
		select a.a0102,a.k0101,a.k6301,a.k6302,a.k6303,A.a0103
		from #K063 a join #a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
		where isnull(k0180,'1')<>'3' and a.A0102 like rtrim(@a0102)+'%'
		and left(a.K0101,1) in ('G','S','X','Y','Z','C')
		--and len(a.k0101)>=10
		and a.k0101 in (select yk0101 from #lx)
		) #k001
		grOUP by k0101
		--with rollup order by k0101
		) YSD ON ylc.A0102=YSD.A0102 AND ylc.K0101=YSD.K0101
 LEFT JOIN
(
 --   select sum(yk0114) from #lx where yk0108 is not null
	select
	 A0102,MAX(HA0102) ha0102,Yk0101,
	 sum(isnull(wk0114,0)) wlc,--��ҵ�ɼ����
	 sum(case when isnull(wcjwt,'')<>''  then isnull(wk0114,0) else 0 end) wcwlc,--��ҵ�ɼ��������
	-- round(sum(case when isnull(wcjwt,'')<>''then wk0114 else 0 end)*100/sum(wk0114),2) wlccwl,
	sum(case when isnull(b3,'') in ('1','2','4') then yk0114 else 0 end) fhlc, --�������
	sum(case when isnull(b3,'') in ('5') then yk0114 else 0 end) wfpdlc, --�޷��ж����
	max(case when yk0108 is not null then b3 else 4 end) BGLX, --����·�߷��飬��ȡ���ı������,
	sum(case when isnull(b3,'')='3' then wk0114 else 0 end) XZLC, --����
	sum(case when isnull(b3,'')='3' and b2='11' then wk0114 else 0 end) XZLQ, --��������
	sum(case when isnull(b3,'')='3' and b2='12' then wk0114 else 0 end) XZSN, --ˮ������
	sum(case when isnull(b3,'')='3' and b2='13' then wk0114 else 0 end) XZQT, --��������
	sum(case when isnull(b3,'')='3' and isnull(wcjwt,'') like '��ԭ���ݿ�%' then 1 else 0 end) XZTS, --��������
	sum(case when isnull(b3,'')='4' then yk0114 else 0 end) scLC, --ɾ��
	sum(case when isnull(b3,'')='4' and b1='11' then yk0114 else 0 end) scLQ, --����ɾ��
	sum(case when isnull(b3,'')='4' and b1='12' then yk0114 else 0 end) scSN, --ˮ��ɾ��
	sum(case when isnull(b3,'')='4' and b1='13' then yk0114 else 0 end) scQT, --����ɾ��

	sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'·�����ͱ��' and
	(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8) then wk0114-yk0114 else 0 end) LXBG_LCBG,  --·�߱��-��̱��
	sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'·�����ͱ��' and b1='11' and
	(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8) then wk0114-yk0114 else 0 end) LXBG_lqBG,  --·�߱��-��̱��-����
	sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'·�����ͱ��' and b1='12' and
	(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8) then wk0114-yk0114 else 0 end) LXBG_snBG,  --·�߱��-��̱��-ˮ��
	sum(case when isnull(b3,'')='2' and isnull(xgjy,'')<>'·�����ͱ��' and b1='13' and
	(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8) then wk0114-yk0114 else 0 end) LXBG_qtBG,  --·�߱��-��̱��-����
	sum(case when (isnull(b3,'')='2' and isnull(xgjy,'')<>'·�����ͱ��' and
	(yk0114/(case when wk0114=0 then 1 else wk0114 end)>=1.2 or yk0114/(case when wk0114=0 then 1 else wk0114 end)<=0.8)) or b3='4' then 1 else 0 end) LXBG_tsBG,  --·�߱��-��̱��-����
	----·�����ͱ��
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='11' and b2<>'11' then yk0114 else 0 end) lqtz, --����·�����
	sum(case when isnull(b3,'')='1' and b1='11' then yk0114 else 0 end) lqbb, --����·�治��
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1<>'11' and b2='11' then yk0114 else 0 end)-
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='11' and b2<>'11' then yk0114 else 0 end) lqbh, --����·��仯
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='12' and b2<>'12' then yk0114 else 0 end) sntz, --ˮ��·�����
	sum(case when isnull(b3,'')='1' and b1='12' then yk0114 else 0 end) snbb, --ˮ��·�治��
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1<>'12' and b2='12' then yk0114 else 0 end)-
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='12' and b2<>'12' then yk0114 else 0 end) snbh, --ˮ��·��仯
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='13' and b2<>'13' then yk0114 else 0 end) qttz, --����·�����
	sum(case when isnull(b3,'')='1' and b1='13' then yk0114 else 0 end) qtbb, --����·�治��
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1<>'13' and b2='13' then yk0114 else 0 end)-
	sum(case when isnull(b3,'')='2' and isnull(b2,'')<>'' and b1<>b2 and b1='13' and b2<>'13' then yk0114 else 0 end) qtbh, --����·��仯
	sum(case when isnull(bglx,'') in ('���') then yk0114 else 0 end) BgLC, --���
	sum(case when isnull(bglx,'')='���' and isnull(xgjy,'')<>'·�����ͱ��' then yk0114 else 0 end) LXBG_THXX,--·�߱��-�滻����
	sum(case when isnull(bglx,'')='���' and isnull(xgjy,'')='·�����ͱ��' then yk0114 else 0 end) LXBG_LMLX,--·�߱��-·������
    sum(case when isnull(bglx,'')='�޷��ж�' then yk0114 else 0 end) WFPD, --�����޷��ж�
   -- max(bz) bz,
	null w
	from #LX a
	where left(yK0101,1) in ('G','S','X','Y','Z','C')
	group by A0102,yk0101
--	with rollup  order by  A0102,yk0101

) fhlc on ylc.a0102=fhlc.a0102 and ylc.k0101=fhlc.yk0101
left join
 --ɾ��·��
(  --- select * from #lx
	select yk0101,max(a0102) a0102,1 sclx from #lx
	where yk0108 is not null
	and yk0101 not in (select Yk0101 from #lx where b3<>4 and Yk0108 is not null)
	group by yk0101
) sclx on ylc.a0102=sclx.a0102 and ylc.k0101=sclx.yk0101

left join
 (  --- select * from #ql
	select
	max(a0102) a0102,max(ha0102) ha0102,yk0101,
	SUM(case when isnull(wk0101,'')=yk0101 and isnull(wk6003,'0')<>'0' then 1 else 0 end) wql,--��ҵ�ɼ�����
	SUM(case when isnull(k6001,'')='' and wcjwt like '%����%' then 1 else 0 end) wcwql,--��������
	sum(case when isnull(k6001,'')<>'' and b3 in ('1','2','4') then 1 else 0 end) fhql, --��������
	SUM(case when isnull(k6001,'')<>'' and b3='2' then 1 else 0 end) bgql,--�������
	SUM(case when isnull(k6001,'')<>'' and b3='4' then 1 else 0 end) scql,--ɾ������
	SUM(case when b3='3' then 1 else 0 end) xzql,--��������
	SUM(case when isnull(k6001,'')<>'' and b3='1' then 1 else 0 end) bbql,--��������
	SUM(case when isnull(k6001,'')<>'' and b3='5' then 1 else 0 end) wfpdql --�޷��ж�����
	from
	(
		select *
		from #ql a
		where left(yK0101,1) in ('G','S','X','Y','Z','C')
	) #k001
	group by a0102,yk0101
	--with rollup order by grouping(a0102) desc,grouping(yk0101) desc

	) hcql ON ylc.A0102=hcql.A0102 AND ylc.k0101=hcql.yk0101
	LEFT join
( --- select * from  #sd
	select
	max(a0102) a0102,max(ha0102) ha0102,yk0101,
	SUM(case when isnull(wk6303,'0')<>'0' and isnull(wk0101,'')=yk0101 then 1 else 0 end) wsd,--��ҵ�ɼ����
	SUM(case when isnull(k6301,'')='' and wcjwt like '%����%' then 1 else 0 end) wcwsd,--�������
	sum(case when isnull(k6301,'')<>'' and b3 in ('1','2','4') then 1 else 0 end) fhsd, --�������
	SUM(case when isnull(k6301,'')<>'' and b3='2' then 1 else 0 end) bgsd,--������
	SUM(case when isnull(k6301,'')<>'' and b3='4' then 1 else 0 end) scsd,--ɾ�����
	SUM(case when isnull(k6301,'')='' and b3='3' then 1 else 0 end) xzsd,--�������
	SUM(case when isnull(k6301,'')<>'' and b3='1' then 1 else 0 end) bbsd,--�������
	SUM(case when isnull(k6301,'')<>'' and b3='5' then 1 else 0 end) wfpdsd --�޷��ж����
	from
	( -- select *from #sd
		select *
		from #sd a
		where left(a.yK0101,1) in ('G','S','X','Y','Z','C')
	) #k001
	group by yk0101
	--order by replace(objname,'C','YY')
	) hcsd ON ylc.A0102=hcsd.A0102 AND ylc.k0101=hcsd.yk0101
--where left(ylc.k0101,1)='C' and xzlc>0
order by ylc.a0102,replace(ylc.k0101,'C','YY')

select * from #ql where bglx='����' and left(yk0101,1) in ('C','X','Y')
--select sum(k0114) from k001 where left(hk5104,2) not in ('����','ˮ��')

--select hk5104,* from k001 where left(hk5104,2) not in ('����','ˮ��')

--select * from #lx where left(yk0101,1)='G'

