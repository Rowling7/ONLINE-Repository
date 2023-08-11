

--报表脚本

/*不显示零*/
select
rtrim(k6002),--桥梁名称
rtrim(k60.k6001),--桥梁代码
k6003,--桥梁中心桩号
--k60.k0101,--路线编号
(case when (charindex('D',k60.k0101) = 0 and len(k60.k0101)>9 and left(k60.k0101,1)<>'X') then left(rtrim(k60.k0101),4) else 
     (case when charindex('D',rtrim(k60.k0101))=11 then left(k60.k0101,4)+right(rtrim(k60.k0101),4) else rtrim(k60.k0101) end)  end),--路线编号
rtrim(a50.k0112),--路线名称
rtrim(d.objjc) hk0304,--技术等级
k6008,--桥梁全长
k6065,--跨径总长
k6063,--单孔最大跨径
k6064,--跨径组合

A6066,--桥梁全宽

k6009,--桥面净宽
k6007,hk6007,--跨径分
k6004,hk6004,--使用年限分
k6016,hk6016,--主桥上部结构形式
k6035,hk6035,--主桥上部结构材料
k6017,hk6017,--桥墩类型
k6022,hk6022,--设计荷载等级
k6023,hk6023,--抗震等级
k6005,hk6005,--跨越类型
k6006,--跨越地物名称
hk6024,--通航等级
ha1328,--墩台防撞类型
(case when k6062='1' then '是' else '否' end),--是否互通立交
k6079,--建设单位
k6030,--设计单位
k6031,--施工单位
k6032,--监理单位
k0180,--修建年度
k60.k0116,--通车日期
a1313,--管养单位性质代码
a1314,--管养单位名称
K6034,--监管单位名称
--a1302,ha1302,--收费性质
isnull(rtrim(a1302),'1'),(case when rtrim(a1302)='2' then '还贷' when rtrim(a1302)='3' then '经营' else '非收费' end),
k6028,hk6028,--评定等级
a1305,--评定日期
rtrim(k6050),--评定单位
k0183,--改造年度
a1316,--改造完工日期
ha1317,--改造部位
ha1318,--工程性质代码
rtrim(k6051),--改造施工单位
(case when a1319 is null then '否' else rtrim(ha1319) end),--是否部补足项目
--k6091,
rtrim(hk6091),--主要病害位置
rtrim(k6093),--主要病害描述
isnull(rtrim(a1307),'1'),isnull(rtrim(ha1307),'正常使用'),--采取交通管制措施
left(k60.a0103,6), --政区代码
rtrim(hk6117),--桥梁所在位置
rtrim(hk6118),--是否窄路宽桥
rtrim(hk6119),--是否在长大桥梁目录中
rtrim(hk6120),--是否跨省桥梁
--k60.k0199  --备注
(case when charindex('D',rtrim(k60.k0101))<>0 then '长链'  else 
	(case when k6016='90' then rtrim(cast(k60.k0199 as char)) else null end) end)
from k60 
	left join 
		(select a.a0102,a.k0101,a.k6001,max(b.k0304) k0304
		from K60 a left join K01 b on a.a0102=b.a0102 and a.k0101=b.k0101 and a.k6003>=b.k0108 and a.k6003<=b.k0109
		where left(a.k0101,1) in ('G','H','S','T','X','J')  and a.A0102 like '#oyds_单位代码#%' and a.a0101 = '#oyds_报表年限#'
		group by a.a0102,a.k0101,a.k6001) c
	     on k60.a0102=c.a0102 and k60.k0101=c.k0101 and k60.k6001=c.k6001
	left join D002 d  on  d.objname=c.k0304
	left join a50  on k60.a0102=a50.a0102 and k60.k0101=a50.k0101
where (left(k60.k0101,1) in ('G','H','S','T','X','Y','C','Z') )	
and k60.A0102 like '#oyds_单位代码#%' and a0101 = '#oyds_报表年限#'
