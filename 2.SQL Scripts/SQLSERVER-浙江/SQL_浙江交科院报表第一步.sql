----����һ�µ�ͼ���ݵ���ֹ��׮�ŵ�-ֻ����һ�Σ�
update openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',Lx_C)
set qdzh=convert(decimal(8,3),qdzh),zdzh=convert(decimal(8,3),zdzh)
update openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',Lx_Y)
set qdzh=convert(decimal(8,3),qdzh),zdzh=convert(decimal(8,3),zdzh)
update openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',Lx_X)
set qdzh=convert(decimal(8,3),qdzh),zdzh=convert(decimal(8,3),zdzh)
update openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',Lx_G)
set qdzh=convert(decimal(8,3),qdzh),zdzh=convert(decimal(8,3),zdzh)
update openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',Lx_S)
set qdzh=convert(decimal(8,3),qdzh),zdzh=convert(decimal(8,3),zdzh)
update openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',ql)
set wzzh=convert(decimal(8,3),wzzh)
update openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',sd)
set wzzh=convert(decimal(8,3),wzzh)
update openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',W_Sd)
set wzzh=convert(decimal(8,3),wzzh)
update openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',W_ql)
set wzzh=convert(decimal(8,3),wzzh)

---���δ�˲������
if object_id('tempdb..#lx') is not null drop table #lx
create table #lx(FHSJ CHAR(50),TPBM CHAR(50),a0102 char(12),gldw char(20),ha0102 varchar(50),
Yk0101 char(15),Yk0112 varchar(50),Yk0108 numeric(18,3),Yk0109 numeric(18,3),YK0114 NUMERIC(18,3),YHK5104 VARCHAR(50),
WK0101 CHAR(15),Wk0108 numeric(18,3),Wk0109 numeric(18,3),WK0114 NUMERIC(18,3),WHK5104 VARCHAR(50),cflx char(50),WCJWT VARCHAR(255),
BGLX CHAR(20),BGYY VARCHAR(255),XGJY CHAR(255),B1 CHAR(255),B2 CHAR(255),B3 CHAR(255)
)
INSERT #lx(fhsj,tpbm,gldw,YK0101,YK0112,YK0108,YK0109,YK0114,YHK5104,WK0101,WK0108,WK0109,WK0114,WHK5104,cflx,WCJWT,BGLX,BGYY,XGJY,b1,b2,b3)
Select a,f2,rtrim(f3),f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,f21,f22  from
OpenRowSet
(
'MSDASQL',
'DRIVER=Microsoft Excel Driver (*.xls);
DBQ=E:\20230923�㽭\map\330703��\���ݺ˲�-�𻪽�-����.xls;
UID=admin;
PWS=',
'SELECT * from [·��$]')

-----------�򵥴���һ��excel����     select * from #lx

declare @a0102 char(15)
set @a0102='33_0225'
-------����·�ߺ˲�����
update #lx set yk0101=case when len(wk0101)>=10 then left(wk0101,10) else left(wk0101,len(wk0101)-1) end where isnull(yk0101,'')=''
----�������ݿ��ȡ����λ
--ԭ���ݿ�����-  select * from #lx
update a set a.a0102=b.a0102,a.ha0102=b.ha0102
from #lx a join k001 b on a.yk0101=b.k0101 AND A.YK0108=B.K0108

--��ҵ���ݻ��ߺ����ݿ��Ӧ���ϵ�����     select * from #lx order by yk0101
update a set a.a0102=b.a0102,a.ha0102=b.ha0102
from #lx a join k001 b on left(a.yk0101,10)=b.k0101
where a.a0102 is null and b.a0102 like rtrim(@a0102)+'%'

update a set a.a0102=b.a0102,a.ha0102=b.ha0102
from #lx a join (
select * from k001 where rtrim(a0102)+k0101 in(
select rtrim(max(a0102))+k0101 a from k001 group by k0101)
) b on left(a.yk0101,10)=b.k0101
where a.a0102 is null and b.a0102 like rtrim(@a0102)+'%'


--ɾ�������ڵ�����  select * from k001
delete #lx where a0102 is null and wk0101 is null

--��ѯ���������û����д�����ݣ�����һ�����ղ�����д
--select * from #lx
update #lx set bglx='����',xgjy='����'
where yk0101 is not null and yk0108 is not null and bglx is null

--���±��·��
update #lx set bglx=ltrim(rtrim(bglx))
--�������  select * from a50
update #lx set yk0114=convert(decimal(8,3),isnull(yk0109,0)-isnull(yk0108,0)),wk0114=convert(decimal(8,3),isnull(wk0109,0)-isnull(wk0108,0))

update a set yhk5104=rtrim(hk5104)
from #lx a join k001 b on yk0101=k0101 and yk0108=k0108

update #lx set whk5104=null where bglx='����'


----���excel���Ƿ��ظ�
--·��
select '���excel���Ƿ��ظ�' '���excel���Ƿ��ظ�',* from #lx where yk0101 in (
select yk0101 from #lx
where yk0101 is not null and isnull(yk0108,1)<>1
group by yk0101,yk0108
having count(1)>1)
order by yk0101,yk0108

----�͵�ͼ�Ƚ�-�յ�׮�Ų�һ�µ�����
select '�͵�ͼ�Ƚ�-�յ�׮�Ų�һ�µ�����' '�͵�ͼ�Ƚ�-�յ�׮�Ų�һ�µ�����',a.DWDM,a.DWMC,a.LXBM,a.LXMC,QDZH,ZDZH,ZDZH-QDZH K0114,yk0101,yk0108,yk0109,yk0114,c.a0102,c.ha0102,c.k0101,c.k0108,c.k0109,c.k0114,k0124,hk0123,bglx
--into #a   select * from #lx
from (
	 SELECT * FROM (
	 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
	'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_C)
	union
	 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
	'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_Y)
	union
	 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
	'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_X)
	union
	 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
	'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_Z)
	union
	 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
	'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_G)
	union
	 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
	'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_S)
	) A WHERE ISNULL(LDBM,'')<>''
	AND rtrim(dwdm)+rtrim(lxbm) IN
	(select rtrim(a0102)+rtrim(yk0101) from #lx where left(yk0101,1) in ('G','S','X','Y','C','Z') and yk0101 is not null)
) a
full join (select * from #lx where left(yk0101,1) in ('G','S','X','Y','C','Z') and yk0108 is not null) b
on RTRIM(a.DWDM)=RTRIM(b.a0102) and
RTRIM(a.LXBM)=RTRIM(b.yk0101) and rtrim(convert(decimal(18,3),qdzh))=RTRIM(convert(decimal(18,3),b.yk0108))
full join (select * from k001 where rtrim(k0101)+rtrim(a0102) in (select rtrim(yk0101)+rtrim(a0102) from #lx where left(yk0101,1) in ('G','S','X','Y','C','Z'))) c
on RTRIM(a.DWDM)=RTRIM(c.a0102) and
RTRIM(a.LXBM)=RTRIM(c.k0101) and rtrim(convert(decimal(18,3),qdzh))=RTRIM(convert(decimal(18,3),c.k0108))
where (rtrim(convert(decimal(18,3),isnull(ZDZH,0)))<>rtrim(convert(decimal(18,3),isnull(yk0109,0)))
or rtrim(convert(decimal(18,3),isnull(ZDZH,0)))<>rtrim(convert(decimal(18,3),isnull(k0109,0)))
--or rtrim(convert(decimal(18,3),isnull(k0109,0)))<>rtrim(convert(decimal(18,3),isnull(yk0109,0)))
)
and (isnull(k0124,'')=''
and isnull(k0123,2)=2
)
order by
case when LXBM is null then right(yk0101,6) else right(LXBM,6) end,
case when LXBM is null then yk0101 else LXBM end


----�������� ȥ���ظ�·�ߺͶ�ͷ·��������·��
--��ѯ
select '�������� ȥ���ظ�·�ߺͶ�ͷ·��������·��' '�������� ȥ���ظ�·�ߺͶ�ͷ·��������·��',* from #lx a
join (
select a.a0102,a.k0101,a.k0112,a.k0108,a.k0109,a.k0114,a.hk5104,k0124 from k001  a join a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
		where (isnull(k0180,'1')='3'
		--and len(a.k0101)>=10
		or isnull(k0123,2)=1
		or isnull(k0124,'')<>'')
		and a.a0102 in (select a0102 from #lx)
		) b on a.yk0101=b.k0101 and a.yk0108=b.k0108

---�޸��ظ�·��
		update a set a.cflx=isnull(a.cflx,k0124),bglx='����',xgjy='����'
from #lx a
join (
select a.a0102,a.k0101,a.k0112,a.k0108,a.k0109,a.k0114,a.hk5104,k0124 from k001  a join a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
		where ( isnull(k0124,'')<>'')
		and a.a0102 in (select a0102 from #lx)
		) b on a.yk0101=b.k0101 and a.yk0108=b.k0108

		---ɾ����ͷ·����������·��
delete a
from #lx a
join (
select a.a0102,a.k0101,a.k0112,a.k0108,a.k0109,a.k0114,a.hk5104,k0124 from k001  a join a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
		where (isnull(k0180,'1')='3'
		--and len(a.k0101)>=10
		or isnull(k0123,2)=1 )
		and a.a0102 in (select a0102 from #lx)
		) b on a.yk0101=b.k0101 and a.yk0108=b.k0108



-----------���excel���в����ڵ�����-·��
select '���excel���в����ڵ�����-·��' '���excel���в����ڵ�����-·��',a.a0102,a.k0101,a.k0112,k0108,k0109,k0114,Hk5104 from k001 a left join a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
where isnull(k0180,'1')<>'3'
and left(a.k0101,1) in ('G','S','X','Y','C','Z')
and a.a0102 in (select a0102 from #lx)
and isnull(k0124,'')=''
and isnull(k0123,2)=2
and  rtrim(a.a0102)+rtrim(a.k0101) not in (select  rtrim(a0102)+rtrim(yk0101) from #lx)


---�Ѳ����ڵ����ݲ��뵽excel����,�������Ϊ���޷��жϡ�����ҵ�ɼ�����Ϊ��δ�ɼ���  select * from #lx
insert into #lx(a0102,ha0102,yk0101,yk0112,yk0108,yk0109,yk0114,yhk5104,wcjwt,bglx)
select a.a0102,a.ha0102,a.k0101,a.k0112,k0108,k0109,k0114,Hk5104,'δ�ɼ�','�޷��ж�'
from k001 a left join a50 b on a.a0102=b.a0102 and a.k0101=b.k0101
where isnull(k0180,'1')<>'3'
and left(a.k0101,1) in ('G','S','X','Y','C','Z')
and a.a0102 in (select a0102 from #lx)
and isnull(k0124,'')=''
and isnull(k0123,2)=2
and  rtrim(a.a0102)+rtrim(a.k0101) not in (select  rtrim(a0102)+rtrim(yk0101) from #lx)

--����#lx����--��ѯ�����ݸ��µ�excel�� ��ע��-�ظ�·�ߺ�·����ֹ�����Ĳ�û����sqlɾ����ֻ���ֶ�ɾ����
select '',
rtrim(isnull(tpbm,'')),rtrim(isnull(a0102,'')),rtrim(isnull(yk0101,'')),rtrim(isnull(yk0112,''))
,rtrim(isnull(cast(yk0108 as char(50)),'')),rtrim(isnull(cast(yk0109 as char(50)),'')),rtrim(isnull(cast(yk0114 as char(50)),'')),rtrim(isnull(yhk5104,''))
,rtrim(isnull(wk0101,'')),rtrim(isnull(cast(wk0108 as char(50)),'')),rtrim(isnull(cast(wk0109 as char(50)),'')),rtrim(isnull(cast(wk0114 as char(50)),'')),rtrim(isnull(whk5104,''))
,rtrim(isnull(cflx,'')),rtrim(isnull(wcjwt,'')),rtrim(isnull(bglx,'')),rtrim(isnull(bgyy,'')),rtrim(isnull(xgjy,'')),rtrim(isnull(b1,'')),rtrim(isnull(b2,'')),rtrim(isnull(b3,''))
-- select *
from #lx
order by a0102,replace(yk0101,'C','YY'),isnull(yk0108,99999.99999),wk0108

------------�����ҵ����   select * from #lx
----�͵�ͼ�Ƚ�-�յ�׮�Ų�һ�µ�����-��������Ϊ�滻���ε�����
select '�͵�ͼ�Ƚ�-�յ�׮�Ų�һ�µ�����-��������Ϊ�滻���ε�����' '�͵�ͼ�Ƚ�-�յ�׮�Ų�һ�µ�����-��������Ϊ�滻���ε�����',a.DWDM,a.DWMC,a.LXBM,a.LXMC,QDZH,ZDZH,ZDZH-QDZH K0114,wk0101,wk0108,wk0109,wk0114,bglx
--into #a
from (
 SELECT * FROM (
 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_C)
union
 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_Y)
union
 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_X)
union
 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_Z)
union
 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_G)
union
 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_S)
) A WHERE ISNULL(LDBM,'')='' AND left(LXBM,10) IN (select yk0101 from #lx where left(yk0101,1) in ('G','S','X','Y','C','Z'))
) a
full join (select * from #lx where left(yk0101,1) in ('G','S','X','Y','C','Z') and wk0108 is not null) b
on --RTRIM(a.DWDM)=RTRIM(b.a0102) and
left(RTRIM(a.LXBM),10)=left(RTRIM(b.wk0101),10) and rtrim(convert(decimal(18,3),qdzh))=RTRIM(convert(decimal(18,3),b.wk0108))
where rtrim(convert(decimal(18,3),isnull(ZDZH,0)))<>rtrim(convert(decimal(18,3),isnull(wk0109,0)))
and bglx in ('����','���')  ---ֻ���������ͱ������ҵ����
order by
case when LXBM is null then right(RTRIM(Wk0101),6) else right(RTRIM(LXBM),6) end,
case when LXBM is null then Wk0101 else LXBM end,isnull(qdzh,wk0108)

-----------������ҵ����--������ʾ��ҵ·�ߴ����·������
 SELECT '������ҵ����--������ʾ��ҵ·�ߴ����·������' '������ҵ����--������ʾ��ҵ·�ߴ����·������',* FROM (
 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_C)
union
 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_Y)
union
 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_X)
union
 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_Z)
union
 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_G)
union
 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_S)
) a where lxbm in
(
select wk0101
--into #a
from (
 SELECT * FROM (
 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_C)
union
 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_Y)
union
 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_X)
union
 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_Z)
union
 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_G)
union
 select dwdm,dwmc,ldbm,lxbm,lxmc,qdzh,zdzh,OYD_LSNF from openrowset('Microsoft.Jet.OLEDB.4.0',
'E:\20230923�㽭\map\330703��\330703\mapdata.sdd';'admin';'',lx_S)
) A WHERE ISNULL(LDBM,'')='' AND left(LXBM,10) IN (select yk0101 from #lx where left(yk0101,1) in ('G','S','X','Y','C','Z'))
) a
full join (select * from #lx where left(yk0101,1) in ('G','S','X','Y','C','Z') and wk0108 is not null) b
on --RTRIM(a.DWDM)=RTRIM(b.a0102) and
left(RTRIM(a.LXBM),10)=left(RTRIM(b.wk0101),10) and rtrim(convert(decimal(18,3),qdzh))=RTRIM(convert(decimal(18,3),b.wk0108))
where rtrim(convert(decimal(18,3),isnull(ZDZH,0)))<>rtrim(convert(decimal(18,3),isnull(wk0109,0)))
and bglx in ('����','���')  ---ֻ���������ͱ������ҵ����
)


---�鿴����б�����滻����·��  ���ϴ���Ҫ�鿴
select '�鿴����б�����滻����·��  ���ϴ���Ҫ�鿴''�鿴����б�����滻����·��  ���ϴ���Ҫ�鿴',yk0114-wk0114,rtrim(a0102),rtrim(ha0102),rtrim(yk0101),rtrim(yk0112),yk0108,yk0109,Yk0114,rtrim(YHK5104) ,rtrim(wk0101),wk0108,wk0109,wk0114,rtrim(whk5104),rtrim(bglx)
,rtrim(bgyy),rtrim(xgjy)
from #lx
where bglx='���' and isnull(wK0114,0)<>0 and yk0114<>0
and ((yk0114-wk0114)/yk0114>=0.2 or (yk0114-wk0114)/yk0114<=-0.2)
