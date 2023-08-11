--1、取年报属性库隧道明细(主要指标)
if object_id('tempdb..#nb') is not null drop table #nb
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

--2、国桥库导出最新文件
if object_id('tempdb..#sdk') is not null drop table #sdk
select 隧道代码,隧道名称,起点桩号,路线编号,路线技术等级,中心桩号,行车方向
into #sdk
from OPENROWSET('MICROSOFT.jet.OLEDB.4.0','Excel 5.0;HDR=YES;
DATABASE=E:\6078曹勇嵩\1.工作文件\1.工作文件（日期分类）\20230731 桥梁 隧道\4211\SD\隧道综合信息列表-湖北系统中心(2023-07-31).xls',Sheet1$)
order by 隧道代码,起点桩号


--3、对比主要指标
select a0102,ha0102,a0103,k6302,隧道名称,k0101,路线编号,hk6127,行车方向,hk0304,路线技术等级,k6303,起点桩号,k6324,中心桩号,k6301,隧道代码,
case when  k6302<>隧道名称 then '隧道名不一致'  else '' end 隧道名对比,
case when  hk6127<>行车方向 then '行车方向不一致'  else '' end 行车方向对比,
case when  hk0304<>left(路线技术等级,2) then '所在路线技术等级不一致' else '' end 所在路线技术等级对比,
case when  k6303<>起点桩号 then '起点桩号不一致' else '' end 起点桩号对比,
case when  k6324<>中心桩号 then '中心桩号不一致' else '' end 中心桩号对比,
case when  replace(replace(isnull(k6301,''),'H','G'),'T','S')<>replace(replace(isnull(隧道代码,''),'H','G'),'T','S')
OR k6301 IS NULL OR 隧道代码 IS NULL then '隧道代码不一致' else '' end 隧道代码对比
from
(
select a0102,ha0102,a0103,k6302,隧道名称,k0101,路线编号,hk0304,路线技术等级,k6303,起点桩号,k6301,隧道代码,k6324,中心桩号,hk6127,行车方向
from #nb full join #sdk on  replace(replace(k6301,'H','G'),'T','S')=replace(replace(隧道代码,'H','G'),'T','S')
where k6301 is not null and 隧道代码 is not null
union
select a0102,ha0102,a0103,k6302,隧道名称,k0101,路线编号,hk0304,路线技术等级,k6303,起点桩号,k6301,隧道代码,k6324,中心桩号,hk6127,行车方向
from #nb full join #sdk on replace(replace(k6301,'H','G'),'T','S')=replace(replace(隧道代码,'H','G'),'T','S')
where k6301 is null or 隧道代码 is null
) as a
where hk0304<>left(路线技术等级,2) or hk6127<>行车方向 or k6303<>起点桩号
or replace(replace(k6301,'H','G'),'T','S')<>replace(replace(隧道代码,'H','G'),'T','S')
or k6324<>中心桩号 or k6302<>隧道名称
or a0102 is null or 隧道名称 is null
order by k6301




--4、取年报属性库隧道明细(主要指标)
if object_id('tempdb..#nb2') is not null drop table #nb2

select rtrim(a.a0102) a0102,
		rtrim(a.ha0102) ha0102,
		left(rtriM(a.a0103),6) a0103,
		rtrim(a.k6302) k6302,case when len(rtrim(a.k0101))<10 then rtrim(a.k0101) else left(rtrim(a.k0101),4) end k0101,
		rtrim(b.hk0304) hk0304,
		rtrim(a.k6301) wk6301,a.k6303,k6324,k6305,hk6304,k6306,k6307,hk6312,hk6343,hk6127,hk6355,hk6124,replace(a.hk6023,' ','')hk6023,hk6310,hk6311,replace(hk6313,' ','')hk6313,hk6335,
k6079,k6030,k6031,k6032,a1314,ha1313,k6112,a.k0116,k6340,
		(case when len(rtrim(a.k0101))<=9 and charindex('D',rtrim(a.k0101))=0 then rtrim(a.k0101)+left(rtrim(a.a0103),6)+'U'+rtrim(a.K6301)
			when len(rtrim(a.k0101))<=9 and charindex('D',rtrim(a.k0101))<>0 then left(rtrim(a.k0101),charindex('D',rtrim(a.k0101))-1)+left(rtrim(a.a0103),6)+'U'+rtrim(a.K6301)
			when len(rtrim(a.k0101))>9 and left(rtrim(a.k0101),1) in ('G','H','S','T') then left(rtrim(a.k0101),4)+left(rtrim(a.a0103),6)+'U'+rtrim(a.K6301)
			when len(rtrim(a.k0101))>9 and left(rtrim(a.k0101),1) in ('X','J','Y','N','C','Z') then left(rtrim(a.k0101),10)+'U'+rtrim(a.K6301)
			else null end) K6301
into #nb2
from k063 a left join k001 b on a.a0102=b.a0102 and a.k0101=b.k0101 and a.k6303>b.k0108 and a.k6303<b.k0109
where left(a.k0101,1) in ('G','H','S','T') and left(a.a0102,3)<>'42A'
order by a.k0101,a.k6303



--5、国桥库导出最新文件
if object_id('tempdb..#sdk2') is not null drop table #sdk2
select 隧道代码,隧道名称,起点桩号,路线编号,路线技术等级,中心桩号,[隧道长度(延米)],隧道长度分类,[隧道净宽(米)],[隧道净高(米)],路面类型,养护等级,行车方向,是否在长大隧道目录,是否跨省隧道,replace(抗震设防等级,'g','')抗震设防等级,断面形式,衬砌类型,
防排水类型,是否水下隧道,建设单位名称,设计单位名称,施工单位名称,监理单位名称,养护单位,管养单位性质,监管单位,replace(建成通车时间,'-','')建成通车时间,修建年度
into #sdk2
from OPENROWSET('MICROSOFT.JET.OLEDB.4.0','Excel 5.0;HDR=YES;
DATABASE=E:\6078曹勇嵩\1.工作文件\1.工作文件（日期分类）\20230731 桥梁 隧道\4211\SD\隧道综合信息列表-湖北系统中心(2023-07-31).xls',Sheet1$)
order by 隧道代码,起点桩号

--6、对比其他指标
select a0102,ha0102,a0103,k6302,k0101,k6301,k6324,k6305,[隧道长度(延米)],hk6304,隧道长度分类,k6306,[隧道净宽(米)],k6307,[隧道净高(米)],hk6312,路面类型,hk6343,养护等级,hk6127,行车方向,hk6355,是否在长大隧道目录,
hk6124,是否跨省隧道,hk6023,抗震设防等级,hk6310,断面形式,hk6311,衬砌类型,hk6313,防排水类型,hk6335,是否水下隧道,k6079,建设单位名称,k6030,设计单位名称,k6031,施工单位名称,k6032,监理单位名称,a1314,养护单位,
ha1313,管养单位性质,k6112,监管单位,k0116,建成通车时间,k6340,修建年度,
case when  k6305<>[隧道长度(延米)] then '隧道长度不一致' else '' end 隧道长度对比,
case when  hk6304<>隧道长度分类 then '隧道长度分类不一致' else '' end 隧道长度分类对比,
case when  k6306<>[隧道净宽(米)] then '隧道净宽不一致' else '' end 隧道净宽对比,
case when  k6307<>[隧道净高(米)] then '隧道净高不一致' else '' end 隧道净高对比,
case when  hk6312<>路面类型 then '路面类型不一致' else '' end 路面类型对比,
case when  hk6343<>养护等级 then '养护等级不一致' else '' end 养护等级对比,
case when  hk6127<>行车方向 then '所在位置不一致' else '' end 行车方向对比,
case when  hk6355<>是否在长大隧道目录 then '不一致' else '' end ,
case when  hk6124<>是否跨省隧道 then '不一致' else '' end ,
case when  hk6023<>抗震设防等级 then '抗震设防等级不一致' else '' end 抗震设防等级对比,
case when  left(hk6310,3)<>断面形式 then '断面形式不一致' else '' end 断面形式对比,
case when  hk6311<>衬砌类型 then '衬砌类型不一致' else '' end 衬砌类型对比,
case when  hk6313<>防排水类型 then '防排水类型不一致' else '' end 防排水类型对比,
case when  hk6335<>是否水下隧道 then '不一致' else '' end 是否水下隧道对比,
case when  k6079<>建设单位名称 then '不一致' else '' end 建设单位名称对比,
case when  k6030<>设计单位名称 then '不一致' else '' end 设计单位名称对比,
case when  k6031<>施工单位名称 then '不一致' else '' end 施工单位名称对比,
case when  k6032<>监理单位名称 then '不一致' else '' end 监理单位名称对比,
case when  a1314<>养护单位 then '不一致' else '' end 养护单位名称对比,
case when  ha1313<>管养单位性质 then '不一致' else '' end 管养单位性质对比,
case when  k6112<>监管单位 then '不一致' else '' end 监管单位对比,
case when  k0116<>建成通车时间 then '不一致' else '' end 通车时间对比,
case when  k6340<>修建年度 then '不一致' else '' end 修建年度对比,
case when  replace(replace(isnull(k6301,''),'H','G'),'T','S')<>replace(replace(isnull(隧道代码,''),'H','G'),'T','S')
OR k6301 IS NULL OR 隧道代码 IS NULL then '隧道代码不一致' else '' end 隧道代码对比
from
(
select a0102,ha0102,a0103,k6302,隧道名称,k0101,路线编号,hk0304,路线技术等级,k6303,起点桩号,k6301,隧道代码,k6324,中心桩号,k6305,[隧道长度(延米)],hk6304,隧道长度分类,k6306,[隧道净宽(米)],k6307,[隧道净高(米)],hk6312,路面类型,
hk6343,养护等级,hk6127,行车方向,hk6355,是否在长大隧道目录,hk6124,是否跨省隧道,hk6023,抗震设防等级,hk6310,断面形式,hk6311,衬砌类型,hk6313,防排水类型,hk6335,是否水下隧道,k6079,建设单位名称,k6030,设计单位名称,k6031,
施工单位名称,k6032,监理单位名称,a1314,养护单位,ha1313,管养单位性质,k6112,监管单位,k0116,建成通车时间,k6340,修建年度
from #nb2 full join #sdk2 on replace(replace(k6301,'H','G'),'T','S')=replace(replace(隧道代码,'H','G'),'T','S')
where k6301 is not null and 隧道代码 is not null
union
select a0102,ha0102,a0103,k6302,隧道名称,k0101,路线编号,hk0304,路线技术等级,k6303,起点桩号,k6301,隧道代码,k6324,中心桩号,k6305,[隧道长度(延米)],hk6304,隧道长度分类,k6306,[隧道净宽(米)],k6307,[隧道净高(米)],hk6312,路面类型,
hk6343,养护等级,hk6127,行车方向,hk6355,是否在长大隧道目录,hk6124,是否跨省隧道,hk6023,抗震设防等级,hk6310,断面形式,hk6311,衬砌类型,hk6313,防排水类型,hk6335,是否水下隧道,k6079,建设单位名称,k6030,设计单位名称,k6031,
施工单位名称,k6032,监理单位名称,a1314,养护单位,ha1313,管养单位性质,k6112,监管单位,k0116,建成通车时间,k6340,修建年度
from #nb2 full join #sdk2 on replace(replace(k6301,'H','G'),'T','S')=replace(replace(隧道代码,'H','G'),'T','S')
where k6301 is null or 隧道代码 is null
) as a
where hk0304<>left(路线技术等级,2) or k6303<>起点桩号 or
replace(replace(k6301,'H','G'),'T','S')=replace(replace(隧道代码,'H','G'),'T','S')
or k6324<>中心桩号 or k6305<>[隧道长度(延米)] or hk6304<>隧道长度分类  or k6306<>[隧道净宽(米)]  or k6307<>[隧道净高(米)] or hk6312<>路面类型
or hk6343<>养护等级 or hk6127<>行车方向 or hk6355<>是否在长大隧道目录 or hk6124<>是否跨省隧道 or hk6023<>抗震设防等级 or hk6310<>断面形式 or hk6311<>衬砌类型 or hk6313<>防排水类型 or hk6335<>是否水下隧道 or k6079<>建设单位名称
or k6030<>设计单位名称 or k6031<>施工单位名称 or k6032<>监理单位名称 or a1314<>养护单位 or ha1313<>管养单位性质 or k6112<>监管单位 or k0116<>建成通车时间 or k6340<>修建年度
or a0102 is null or 隧道名称 is null
order by k6301
