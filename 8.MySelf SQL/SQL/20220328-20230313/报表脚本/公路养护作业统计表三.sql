
--公路养护作业统计表三--

select 
sum(isnull(A3011,0)+isnull(A3065,0)+isnull(A3078,0)+isnull(A3086,0)+isnull(A3087,0)) '本年投资合计',
sum(isnull(A3011,0)) '日常养护本年完成投资',sum(isnull(A3012,0)) '日常养护本年完成里程',
sum(isnull(A3065,0)) '预防修复本年完成投资',sum(isnull(A3066,0)) '预防修复本年完成里程',
sum(isnull(A3078,0)) '修复养护本年完成投资',sum(isnull(A3079,0)) '修复养护本年完成里程',
sum(isnull(A3086,0)) '专项养护本年完成投资',sum(isnull(A3089,0)) '专项养护本年完成里程',
sum(isnull(A3087,0)) '应急养护本年完成投资',sum(isnull(A3090,0)) '应急养护本年完成里程',
sum(isnull(A3088,0)) '本年绿化投入资金合计',min(A0102) '县级政区代码'
from A17 
where A0101 = '2020' and (A0203 = 'X' or A0203 = 'Y' or A0203 = 'Z' or A0203 = 'C')

--and (A.HA0203 = '县道' or A.HA0203 = '乡道' or A.HA0203 = '村道' or A.HA0203 = '专用公路')   
