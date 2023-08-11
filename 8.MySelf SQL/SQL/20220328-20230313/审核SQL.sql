--<------------------------------<---SQLSERVER--->------------------------------>--


--判空
	where nullif(a0103,'') is null
--where 条件
	where AND A0102 LIKE '#A0102#%' AND A0102 LIKE '#GLDW#%' 
--国家高速公路、省道高速公路（无匝道） 
	--k0304技术等级-10：高速
	WHERE len(ltrim(rtrim(k0101)))<=9 and k0304='10' 
--纳入里程统计
	--K0123不是断头路，K0124没有重复路段
	where isnull(k0123,'2')='2' and nullif(k0124,'') is null