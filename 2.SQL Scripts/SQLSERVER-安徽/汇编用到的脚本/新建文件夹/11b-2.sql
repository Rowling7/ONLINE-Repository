/*不显示零*/
select
	'县道',	--路线编号
	'',		--行政区划代码
	'',		--路线名称
	'',		--起点桩号
	'',		--止点桩号
	'',		--检测方向
	'',		--技术等级
	'',		--路面类型
	CAST(CAST((ISNULL(SUM(CASE WHEN ISNULL(A5009,'') IN ('2','3') THEN isnull(a5008,0) END)/2,0)+
	ISNULL(SUM(CASE WHEN ISNULL(A5009,'') IN ('1') THEN isnull(a5008,0) END),0))/1000 AS NUMERIC(18,3)) AS VARCHAR)+'公里',	--路段长度(公里)
	'',		--路段宽度(米)
	CAST(sum(isnull(A5010,0)*isnull(a5008,0))/nullif(sum(isnull(a5008,0)),0) AS NUMERIC(18,2)) MQI,		--MQI
	CAST(sum(isnull(A5011,0)*isnull(a5008,0))/nullif(sum(isnull(a5008,0)),0) AS NUMERIC(18,2)) PQI		--PQI
from  k03 a
where	isnull(A5010,0)<>0 AND isnull(A5011,0)<>0
	AND left(k0101,1) in ('X')
	AND K03.A0102 LIKE '34%'
	AND LEFT(K03.A0101A,4) = '2023'
	AND (SUBSTRING(RTRIM(K03.A0101A),5,1)-1)*3+SUBSTRING(RTRIM(K03.A0101A),6,1)= '12'

