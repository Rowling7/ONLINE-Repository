
--公路技术状况统计表县道、乡道、村道、专用公路--

select HA0203 'MQI种类', sum(isnull(A5031,0)) '合计',sum(isnull(A5032,0)) '优等路',sum(isnull(A5033,0)) '良等路',sum(isnull(A5034,0)) '中等路',sum(isnull(A5035,0)) '次等路',sum(isnull(A5076,0)) '差等路',
CAST(sum(isnull(a5032,0)+isnull(a5033,0))*100/nullif(sum(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)),0) as decimal(18,2)) '优良路率',
CAST(sum(isnull(a5010,0)*(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)))/nullif(sum(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)),0) as decimal(18,2)) '评定结果'

from K04
where A0101A = '2020'
group by HA0203

select HA0203 '路面种类', sum(isnull(A5041,0)) '合计',sum(isnull(A5042,0)) '优等路',sum(isnull(A5043,0)) '良等路',sum(isnull(A5044,0)) '中等路',sum(isnull(A5045,0)) '次等路',
sum(isnull(A5046,0)) '差等路',
CAST(sum(isnull(a5032,0)+isnull(a5033,0))*100/nullif(sum(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)),0) as decimal(18,2)) '优良路率',
CAST(sum(isnull(a5010,0)*(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)))/nullif(sum(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)),0) as decimal(18,2)) '评定结果'

from K04
where A0101A = '2020'
group by HA0203

select HA0203 '路基种类', sum(isnull(A5051,0)) '合计',sum(isnull(A5052,0)) '优等路',sum(isnull(A5053,0)) '良等路',sum(isnull(A5054,0)) '中等路',sum(isnull(A5055,0)) '次等路',
sum(isnull(A5056,0)) '差等路',
CAST(sum(isnull(a5032,0)+isnull(a5033,0))*100/nullif(sum(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)),0) as decimal(18,2)) '优良路率',
CAST(sum(isnull(a5010,0)*(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)))/nullif(sum(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)),0) as decimal(18,2)) '评定结果'

from K04
where A0101A = '2020'
group by HA0203

select HA0203 '桥隧种类', sum(isnull(A5061,0)) '合计',sum(isnull(A5062,0)) '优等路',sum(isnull(A5063,0)) '良等路',sum(isnull(A5064,0)) '中等路',sum(isnull(A5065,0)) '次等路',
sum(isnull(A5066,0)) '差等路',
CAST(sum(isnull(a5032,0)+isnull(a5033,0))*100/nullif(sum(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)),0) as decimal(18,2)) '优良路率',
CAST(sum(isnull(a5010,0)*(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)))/nullif(sum(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)),0) as decimal(18,2)) '评定结果'

from K04
where A0101A = '2020'
group by HA0203

select HA0203 '沿线种类', sum(isnull(A5071,0)) '合计',sum(isnull(A5072,0)) '优等路',sum(isnull(A5073,0)) '良等路',sum(isnull(A5074,0)) '中等路',sum(isnull(A5075,0)) '次等路',
sum(isnull(A5076,0)) '差等路',
CAST(sum(isnull(a5032,0)+isnull(a5033,0))*100/nullif(sum(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)),0) as decimal(18,2)) '优良路率',
CAST(sum(isnull(a5010,0)*(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)))/nullif(sum(isnull(a5032,0)+isnull(a5033,0)+isnull(a5034,0)+isnull(a5035,0)+isnull(a5036,0)),0) as decimal(18,2)) '评定结果'

from K04
where A0101A = '2020'
group by HA0203