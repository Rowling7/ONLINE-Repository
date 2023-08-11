/*2021->2022*/

/* if object_id('tempdb..#t1') is not null drop table #t1
select * into #t1 from k05 where a0102='   '
--update #t1 set a0101a='2022',ha0101a='2022'
--insert into k05
select * from #t1 
*/

/*清空k05*/
--truncate table 

/*重置里程*/
select  rtrim(k0101),isnull( k0105,0),isnull(k0106,0),(isnull(k0106,0)-isnull( k0105,0))*1000  里程,isnull(a5008,0)/1000
--update k05 set a5008 =(isnull(k0106,0)-isnull( k0105,0))*1000
from k05 
where isnull(k0106,0)-isnull( k0105,0)<>isnull(a5008,0)/1000 and a0101a ='2022' --and a0102 like '14356j9%'

/*置空评定值*/
select * 
--update k05 set a5010=null,a5011=null,a5011a=null,a5011b=null,a5011c=null,a5011f=null,a5011g=null,a5011d=null,a5011e=null,a5012=null,a5013=null,a5014=null,a1103=null,a1104=null,a1107=null,a1105=null,a1106=null,a0129=null
from k05 
where a0101a ='2022' and a0102 like '14356j9%'

/*修改备注*/
select  a0129,*
--update k05 set a0129 =' '
from k05
where  a0101a ='2022' and a0129 like '    %'

/*查询备注不规范数据*/
select   a5010 ,a5011 ,a5011a ,a5011b ,a5011c ,a5011f ,a5011g ,a5011d ,a5011e ,a5012 ,a5013 ,a5014 ,a1103 ,a1104 ,a1107 ,a1105 ,a1106 ,  cast(isnull(a0129,'') as varchar(100))
from k05
where  a0129 is not null and  not  (cast(isnull(a0129,'') as varchar(100)) like '%市政道路%'
 or  cast(isnull(a0129,'') as varchar(100)) like '%改扩建施工%'
 or  cast(isnull(a0129,'') as varchar(100)) like '%预防养护施工%'
 or  cast(isnull(a0129,'') as varchar(100)) like '%修复养护施工%'
 or  cast(isnull(a0129,'') as varchar(100)) like '%其他施工-%'
 or  cast(isnull(a0129,'') as varchar(100)) like '%其他单位-%'
 or  cast(isnull(a0129,'') as varchar(100)) like '%缺陷责任期-%'
)
and (isnull(a5010,0)=0 and isnull(a5011,0)=0 and isnull(a5011a,0)=0 and isnull(a5011b,0)=0 and isnull(a5011c,0)=0 and isnull(a5011f,0)=0 and isnull(a5011g,0)=0 and isnull(a5011d,0)=0 and isnull(a5011e,0)=0 and isnull(a5012,0)=0 and isnull(a5013,0)=0 and isnull(a5014,0)=0and isnull(a1105,0)=0 and isnull(a1106,0)=0 and isnull(a1107,0)=0)
--group by cast(isnull(a0129,'') as varchar(100)) with rollup
order by cast(isnull(a0129,'') as varchar(100)) desc

/*修改备注*/
select   a5010 ,a5011 ,a5011a ,a5011b ,a5011c ,a5011f ,a5011g ,a5011d ,a5011e ,a5012 ,a5013 ,a5014 ,a1103 ,a1104 ,a1107 ,a1105 ,a1106 ,  cast(isnull(a0129,'') as varchar(100))
--update k05 set a0129 ='缺陷责任期-20241210'
from k05 
where a0101a ='2022' and
--cast(isnull(a0129,'') as varchar(100)) ='' and
cast(isnull(a0129,'') as varchar(100)) like '%缺陷责任期-%'and
(isnull(a5010,0)=0 and isnull(a5011,0)=0 and isnull(a5011a,0)=0 and isnull(a5011b,0)=0 and isnull(a5011c,0)=0 and isnull(a5011f,0)=0 and isnull(a5011g,0)=0 and isnull(a5011d,0)=0 and isnull(a5011e,0)=0 and isnull(a5012,0)=0 and isnull(a5013,0)=0 and isnull(a5014,0)=0and isnull(a1105,0)=0 and isnull(a1106,0)=0 and isnull(a1107,0)=0)