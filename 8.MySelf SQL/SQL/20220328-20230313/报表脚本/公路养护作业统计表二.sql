
--公路养护作业统计表二--

select distinct substring(B.K0101,1,4) '路线编号',A.K0112'路线名称',
isnull(B.A3011,0)+isnull(B.A3065,0)+isnull(B.A3078,0)+isnull(B.A3086,0)+isnull(B.A3087,0) '本年投资合计',isnull(B.A3011,0) '日常养护本年完成投资',
isnull(B.A3065,0) '预防养护本年完成投资',isnull(B.A3076,0) '路面工程投资',
isnull(B.A3077,0) '路面工程里程',isnull(B.A3078,0) '修复养护完成投资',isnull(B.A3080,0) '路面工程投资',isnull(B.A3081,0) '路面工程里程',isnull(B.A3082,0) '桥梁工程投资',
isnull(B.A3083,0) '桥梁工程长度',isnull(B.A3084,0) '隧道工程投资',isnull(B.A3085,0) '隧道工程长度',
isnull(B.A3086,0) '专项养护本年完成投资',isnull(B.A3087,0) '应急养护本年完成投资',isnull(B.A3088,0) '本年绿化投入资金合计'
from B17 B,A51 A
where B.A0101 = '2020' and B.K0101=A.K0101 and (A.HA0203 = '一般国道' or A.HA0203 = '省道')