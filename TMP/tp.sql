/*
if object_id('tempdb..#backupA52') is not null 	drop table #backupA52
select a0102,k0101,a0101,k0105,a3219,K0116,A0410 into #backupA52 from A52 where left(A0101,4)='2023'

if object_id('tempdb..#backupK01') is not null 	drop table #backupK01
select a0102,k0101,a0101,k0108,
  rtrim(BG0101) LD01,rtrim(BG0102) LD02,rtrim(HBG0102) LD03,rtrim(BG0103) LD04,rtrim(BG0104) LD05,rtrim(BG0105) LD06,
  rtrim(BG0131) LD07,rtrim(HBG0131) LD08,rtrim(BG0132) LD09,rtrim(HBG0132) LD10,rtrim(BG0133) LD11,rtrim(HBG0133) LD12,
  rtrim(BG0109) LD13,rtrim(BG0110) LD14,rtrim(BG0111) LD15,BG0199 LD16
into #backupK01 from K01 where left(A0101,4)='2023' and BG0102 is not null

if object_id('tempdb..#backupK60') is not null 	drop table #backupK60
select a0102,k0101,a0101,k6001,
  rtrim(BG0101) QL01,rtrim(BG0202) QL02,rtrim(HBG0202) QL03,rtrim(BG0231) QL04,rtrim(HBG0231) QL05,
  rtrim(BG0232) QL06,rtrim(HBG0232) QL07,rtrim(BG0233) QL08,rtrim(HBG0233) QL09,rtrim(BG0103) QL10,rtrim(BG0203) QL11,
  rtrim(BG0109) QL12,rtrim(BG0110) QL13,rtrim(BG0111) QL14,BG0299 QL15
into #backupK60 from K60 where left(A0101,4)='2023' and BG0202 is not null

if object_id('tempdb..#backupK63') is not null 	drop table #backupK63
select a0102,k0101,a0101,k6301,
  rtrim(BG0101) SD01,rtrim(BG0302) SD02,rtrim(HBG0302) SD03,rtrim(BG0331) SD04,rtrim(HBG0331) SD05,
  rtrim(BG0332) SD06,rtrim(HBG0332) SD07,rtrim(BG0333) SD08,rtrim(HBG0333) SD09,rtrim(BG0103) SD10,rtrim(BG0303) SD11,
  rtrim(BG0109) SD12,rtrim(BG0110) SD13,rtrim(BG0111) SD14,BG0399 SD15
into #backupK63 from K63 where left(A0101,4)='2023' and BG0302 is not null
select GETDATE(),'完成'
-----------------A01---------------------
---更新管理单位信息
update a
set	A0102 = b.A0102,--管理单位名称
  HA0102 = b.HA0102,--管理单位名称
  A0174 = b.A0174,--是否贫困县
  HA0174 = b.HA0174,--是否贫困县
  A0175 =b.a0175,--是否民族地区
  HA0175 =b.Ha0175,--是否民族地区
  A0103 = b.A0103,--行政区划
  HA0103 = b.HA0103,--行政区划
  A0121 = b.A0121,--单位负责人
  A0122 = b.A0122,--统计负责人
  A0123 = b.A0123,--电话号码
  A0124 = b.A0124,--传真号码
  A0125 = b.A0125,--地址
  A0126 = b.A0126,--邮政编码
  A0127 = b.A0127,--网址
  A0128 = b.A0128,--电子信箱
  A0129 = b.A0129,--备注
  A0131 = b.A0131,--管养单位性质
  HA0131 = b.HA0131,--管养单位性质
  A0134 = b.A0133 --填报人
from A01 a join [HRP-DBMS2015]..A01 b on a.A0102=b.A0102

--追加管理单位
insert A01(
A0102,--管理单位名称
HA0102,--管理单位名称
A0174,--是否贫困县
HA0174,--是否贫困县
A0175,--是否民族地区
HA0175,--是否民族地区
A0103,--行政区划
HA0103,--行政区划
A0121,--单位负责人
A0122,--统计负责人
A0123,--电话号码
A0124,--传真号码
A0125,--地址
A0126,--邮政编码
A0127,--网址
A0128,--电子信箱
A0129,--备注
A0131,--管养单位性质
HA0131,--管养单位性质
A0134--填报人
)
select
a.A0102,--管理单位名称
a.HA0102,--管理单位名称
a.A0174,--是否贫困县
a.HA0174,--是否贫困县
a.A0175,--是否民族地区
a.HA0175,--是否民族地区
a.A0103,--行政区划
a.HA0103,--行政区划
a.A0121,--单位负责人
a.A0122,--统计负责人
a.A0123,--电话号码
a.A0124,--传真号码
a.A0125,--地址
a.A0126,--邮政编码
a.A0127,--网址
a.A0128,--电子信箱
a.A0129,--备注
a.A0131,--管养单位性质
a.HA0131,--管养单位性质
a.A0133 --填报人
from [HRP-DBMS2015]..A01 a left join A01 b on a.A0102=b.A0102
where b.A0102 is null
select GETDATE(),'A01完成'
---------------A50------------------
--更新未变更路线的属性
update a
set
A0130=rtrim(b.A0130),--管养单位名称
A0131=rtrim(b.A0131),
hA0131=rtrim(b.hA0131),--管养单位性质
A0203=rtrim(b.A0203),
hA0203=rtrim(b.hA0203),--行政等级
K0102=rtrim(b.K0102),--路线全称
K0103=rtrim(b.K0103),--路线起点名称
K0104=rtrim(b.K0104),--路线终点名称
K0105=b.K0105,--路线起点桩号
K0106=b.K0106,--路线终点桩号
K0112=rtrim(b.K0112),--路线简称
K0113=rtrim(b.K0113),--途经行政区划代码
K0116=rtrim(b.K0116),--通车日期
A0410=rtrim(b.K0117),--验收日期
K6039=rtrim(b.K6039),--填报单位名称
K1602=b.K1602,--断链桩号
K1603=b.K1603,--断链值
K1301=rtrim(b.K1301),--路线调整情况
hk1301=rtrim(b.hk1301),
A9903=rtrim(b.A9903),--原路线代码
A9912=rtrim(b.A9912),--原路线简称
A9918=b.A9918,--原路线起点桩号
A9919=b.A9919,--原路线止点桩号
K0199=b.K0199 --备注
from A50 a join [HRP-DBMS2015]..A50 b
on a.A0102=b.A0102 and a.K0101=b.K0101

--追加新增路线
insert A50(
A0102,hA0102,--管理单位名称
A0130,--管养单位名称
A0131,hA0131,--管养单位性质
A0203,hA0203,--行政等级
K0101,--路线代码
K0102,--路线全称
K0103,--路线起点名称
K0104,--路线终点名称
K0105,--路线起点桩号
K0106,--路线终点桩号
K0112,--路线简称
K0113,--途经行政区划代码
K0116,--通车日期
A0410,--验收日期
K6039,--填报单位名称
K1602,--断链桩号
K1603,--断链值
K1301,hk1301,--路线调整情况
A9903,--原路线代码
A9912,--原路线简称
A9918,--原路线起点桩号
A9919,--原路线止点桩号
K0199 --备注
)
select
rtrim(a.A0102),rtrim(a.hA0102),--管理单位名称
rtrim(a.A0130),--管养单位名称
rtrim(a.A0131),rtrim(a.hA0131),--管养单位性质
rtrim(a.A0203),rtrim(a.hA0203),--行政等级
rtrim(a.K0101),--路线代码
rtrim(a.K0102),--路线全称
rtrim(a.K0103),--路线起点名称
rtrim(a.K0104),--路线终点名称
a.K0105,--路线起点桩号
a.K0106,--路线终点桩号
rtrim(a.K0112),--路线简称
rtrim(a.K0113),--主要控制点
rtrim(a.K0116),--通车日期
rtrim(a.K0117),--验收日期
rtrim(a.K6039),--填报单位名称
a.K1602,--断链桩号
a.K1603,--断链值
rtrim(a.K1301),rtrim(a.hk1301),--路线调整情况
a.A9903,--原路线代码
a.A9912,--原路线简称
a.A9918,--原路线起点桩号
a.A9919,--原路线止点桩号
a.K0199 --备注
from (select * from [HRP-DBMS2015]..A50
  where k0101 in (select distinct rtrim(k0101) k0101 from [HRP-DBMS2015]..k001 where isnull(v0301,'2')='2')
    and left(k0101,1) in ('G','H','S','T','X','J','Y','N','Z','C')) a
  left join A50 b
  on rtrim(a.A0102)=rtrim(b.A0102) and rtrim(a.K0101)=rtrim(b.K0101)
    and left(a.k0101,1) in ('G','H','S','T','X','J','Y','N','Z','C')
where b.A0102 is null
select GETDATE(),'A50完成'

---------------------K60-------------------------------
truncate table K60
INSERT 	K60
(A0101,hA0101,--时间
A0102,hA0102,--管理单位名称
A0103,hA0103,--行政区划
A1313,hA1313,--管养单位性质
A0521,--匝道(平米)
A0531,--匝道(公里)
A1302,hA1302,--收费性质
A1305,--评定日期
K6091,hK6091,--主要病害位置
A1307,hA1307,--已采取交通管制措施
A1314,--管养单位名称
A1316,--改造完工日期
A1317,hA1317,--改造部位
A1318,hA1318,--工程性质
A1319,hA1319,--是否部补助项目
A1328,hA1328,--墩台防撞设施类型
A9902,hA9902,--原管理单位
A9903,--原路线代码
A9904,hA9904,--操作顺序
A9905,--平移值
A9906,hA9906,--是否桩号反向重排
A9907,hA9907,--是否删除
A9908,--反排路线里程
K0101,--路线代码
K0112,--路线简称
K0116,--通车日期
K0183,--改造年度
K0199,--备注
K6026,--竣工日期
K3904,hK3904,--路网调整类型
K6001,--桥梁代码
K6002,--桥梁名称
K6003,--桥梁中心桩号
K6004,hK6004,--桥梁性质
K6005,hK6005,--跨越地物类型
K6006,--跨越地物名称
K6007,hK6007,--桥梁跨径分类
K6008,--桥梁全长
K6009,--桥面净宽
K6010,--主桥孔数
K6011,--主桥主跨
K6012,--主桥边跨
K6013,--前引桥长
K6014,--后引桥长
K6015,--桥下净空
K6016,hK6016,--上部结构形式
K6017,hK6017,--桥墩类型
K6018,hK6018,--桥台类型
K6019,hK6019,--桥面铺装类型
K6020,hK6020,--伸缩缝类型
K6021,hK6021,--支座类型
K6022,hK6022,--设计荷载等级
K6023,hK6023,--抗震等级
K6024,hK6024,--通航等级

K6025,--弯坡斜特征
K6028,hK6028,--技术状况评定
K6029,--总造价
K6030,--设计单位名称
K6031,--施工单位名称
K6032,--监理单位名称
K6033,hK6033,--桥梁验算荷载
K6050,--技术状况评定单位
K6051,--改造施工单位
K6060,--设计洪水频率(年)
K6062,hK6062,--立交桥类别
K6063,--单孔最大跨径
K6064,--桥梁跨径组合(孔*米)
K6065,--跨径总长
A6066,--桥梁全宽
K6068,hK6068,--下部结构形式
K6069,--人行道宽
K6070,--桥梁所在地点
K6093,--主要病害描述
K6079,--建设单位名称
K6035,hK6035,--上部结构材料
K6034,--监管单位名称
K6115,hk6115,--路网调整后行政等级
KWYID,--唯一ID
V0310,--计划项目唯一编码
V0311,--计划项目路线编码
V0312,--计划项目路线名称
V0315,--计划项目桥梁桩号
K0180,--修建年度
K6071,hK6071,--是否列养
K0117,--变更日期
A3219,hA3219, --建设性质

K3909,HK3909,--变更原因
K6067,--桥面全宽(米)
A1331,HA1331,--是否属于危桥改造项目
K6120,HK6120,--是否跨省桥梁
K6117,HK6117,--桥梁所在位置
K6118,HK6118,--是否宽路窄桥
K6119,HK6119, --是否在长大桥梁目录中
K0149,HK0149,--防洪标准(年)
K6040,--桥梁身份码
K6044,HK6044 --是否公铁两用桥梁
)
SELECT
'2023','2023'+'年',  --时间
rtrim(A0102),rtrim(hA0102),--管理单位名称
--rtrim(A0103),rtrim(hA0103),--行政区划
rtrim(left(A0103,9)),rtrim(objjc) hA0103,--行政区划
rtrim(A1313),rtrim(hA1313),--管养单位性质
A0521,--匝道(平米)
A0531,--匝道(公里)
rtrim(A1302),rtrim(hA1302),--收费性质
A1305,--评定日期
rtrim(A1306),rtrim(hA1306),--主要病害位置
rtrim(A1307),rtrim(hA1307),--已采取交通管制措施
rtrim(A1314),--管养单位名称
rtrim(A1316),--改造完工日期
rtrim(A1317),rtrim(hA1317),--改造部位
rtrim(A1318),rtrim(hA1318),--工程性质
rtrim(A1319),rtrim(hA1319),--是否部补助项目
rtrim(A1328),rtrim(hA1328),--墩台防撞设施类型
A9902,hA9902,--原管理单位
A9903,--原路线代码
A9904,hA9904,--操作顺序
A9905,--平移值
A9906,hA9906,--是否桩号反向重排
A9907,hA9907,--是否删除
A9908,--反排路线里程
rtrim(K0101),--路线代码
rtrim(K0112),--路线简称
rtrim(K0116),--通车日期
rtrim(K6101),--改造年度
K0199,--备注
rtrim(K3902),--竣工日期
rtrim(K3904),rtrim(hK3904),--路网调整类型
(case when len(rtrim(k0101))<=9 and charindex('D',rtrim(k0101))=0 then rtrim(k0101)+left(rtrim(a0103),6)+'L'+rtrim(K6001)
  when len(rtrim(k0101))<=9 and charindex('D',rtrim(k0101))<>0 then left(rtrim(k0101),charindex('D',rtrim(k0101))-1)+left(rtrim(a0103),6)+'L'+rtrim(K6001)
  when len(rtrim(k0101))>9 and left(rtrim(k0101),1) in ('G','H','S','T') then left(rtrim(k0101),4)+left(rtrim(a0103),6)+'L'+rtrim(K6001)
  when len(rtrim(k0101))>9 and left(rtrim(k0101),1) in ('X','J','Y','N','C','Z') then left(rtrim(k0101),10)+'L'+rtrim(K6001)
  else null end),--桥梁编号
rtrim(K6002),--桥梁名称
K6003,--桥梁中心桩号
rtrim(K6004),rtrim(hK6004),--按使用年限分
rtrim(K6005),rtrim(hK6005),--跨越地物类型
rtrim(K6006),--跨越地物名称
rtrim(K6007),rtrim(hK6007),--桥梁跨径分类
K6008,--桥梁全长(米)
K6009,--桥面净宽(米)
K6010,--主桥孔数(孔)
K6011,--主桥主跨(米)
K6012,--主桥边跨(米)
K6013,--前引桥长(米)
K6014,--后引桥长(米)
K6015,--桥下净空(米)
rtrim(K6016),rtrim(hK6016),--上部结构类型
rtrim(K6017),rtrim(hK6017),--桥墩类型
rtrim(K6018),rtrim(hK6018),--桥台类型
rtrim(K6019),rtrim(hK6019),--桥面铺装类型
rtrim(K6020),rtrim(hK6020),--伸缩缝类型
rtrim(K6021),rtrim(hK6021),--支座类型
rtrim(K6022),rtrim(hK6022),--设计荷载等级
rtrim(K6023),rtrim(hK6023),--抗震等级
rtrim(K6024),rtrim(hK6024),--通航等级
--K6025,
rtrim(hK6025),--弯坡斜特征
rtrim(K6028),rtrim(hK6028),--技术状况评定
K6029,--总造价(万元)
rtrim(K6030),--设计单位名称
rtrim(K6031),--施工单位名称
rtrim(K6032),--监理单位名称
rtrim(K6033),rtrim(hK6033),--桥梁验算荷载
rtrim(K6050),--技术状况评定单位
rtrim(K6051),--改造施工单位
K6060,--设计洪水频率(年)
rtrim(K6062),rtrim(hK6062),--立交桥类别
K6063,--单孔最大跨径(米)
K6064,--桥梁跨径组合(孔*米)
K6065,--跨径总长(米)
K6066,--桥梁全宽(米)
rtrim(K6068),rtrim(hK6068),--下部结构形式
K6069,--人行道宽(米)
K6070,--桥梁所在地点
K6072,--主要病害描述
rtrim(K6079),--建设单位名称
rtrim(K6111),rtrim(hK6111),--上部结构材料
rtrim(K6112),--监管单位名称
rtrim(K6115),rtrim(hk6115),--路网调整后行政等级
KWYID,--唯一ID
V0310,--计划项目唯一编码
V0311,--计划项目路线编码
V0312,--计划项目路线名称
V0315,--计划项目桥梁桩号
rtrim(K6100),--修建年度(作为新建数纳入统计的年度)
rtrim(K6071A),rtrim(hK6071A),--是否列养
--rtrim(K0191),--改建变更日期
(case when left(rtrim(K6101),4)='2023' and rtrim(K0191) is null then rtrim(K6101) else rtrim(K0191) end) K0117,--改建变更日期
(case when left(rtrim(k6100),4)='2023' then '1'
    when left(rtrim(K6101),4)='2023' then '2' else '9' end),--建设性质
(case when left(rtrim(k6100),4)='2023' then '新建'
    when left(rtrim(K6101),4)='2023' then '改建' else '其他' end), --建设性质

rtrim(K3909),rtrim(HK3909),--变更原因
K6067,--桥面全宽(米)
rtrim(A1331),rtrim(HA1331),--是否属于危桥改造项目
rtrim(K6120),rtrim(HK6120),--是否跨省桥梁
rtrim(K6117),rtrim(HK6117),--桥梁所在位置
rtrim(K6118),rtrim(HK6118),--是否宽路窄桥
rtrim(K6119),rtrim(HK6119), --是否在长大桥梁目录中
rtrim(K0149),rtrim(HK0149),--防洪标准(年)
rtrim(K6040),--桥梁身份码
rtrim(K6044),rtrim(HK6044) --是否公铁两用桥梁
FROM 	[HRP-DBMS2015]..K060 left join D020 on rtrim(left(A0103,9))=rtrim(objname)
where left(k0101,1) in ('G','H','S','T','X','J','Y','N','Z','C')
select GETDATE(),'k60完成'
------------------K63-------------------------------
truncate table K63
INSERT 	K63
(A0101,hA0101,--时间
A0102,hA0102,--管理单位名称
A0103,hA0103,--行政区划
A1305,--评定日期
A1313,hA1313,--管养单位性质
A1314,--管养单位名称
A1316,--改造完工日期
A9902,hA9902,--原管理单位
A9903,--原路线代码
A9904,hA9904,--操作顺序
A9905,--平移值
A9906,hA9906,--是否桩号反向重排
A9907,hA9907,--是否删除
A9908,--反排路线里程
K0101,--路线代码
K0112,--路线简称
K0116,--通车日期
K0181,--改建年度
K0199,--备注
K3904,hK3904,--路网调整类型
K6050,--技术状况评定单位
K6301,--隧道代码
K6302,--隧道名称
K6303,--隧道入口桩号
K6304,hK6304,--隧道按长度分类
K6305,--隧道长度
K6306,--隧道净宽
K6307,--隧道净高
K6308,--人行道宽
K6309,hK6309,--洞口形式
K6310,hK6310,--断面形式
K6311,hK6311,--衬砌材料
K6312,hK6312,--路面面层类型
K6313,hK6313,--隧道排水类型
K6314,--安全通道数量
K6315,hK6315,--隧道照明
K6316,hK6316,--隧道通风
K6317,hK6317,--隧道电子设备

K6318,--消防设施
K6079,--建设单位名称
K6340,--监管单位名称
K6320,--设计单位名称
K6321,--施工单位名称
K6322,--监理单位名称
K0180,--修建年度
K6319,--隧道修建日期
K6324,--隧道中心桩号
K6326,--隧道所在地点
K6327,--隧道全宽
K6335,hK6335,--是否水下隧道

K6337,hK6337,--改造部位
K6338,hK6338,--主要病害部位
K6339,--主要病害描述
K6115,hk6115,--路网调整后行政等级
KWYID,--唯一ID
V0310,--计划项目唯一编码
V0311,--计划项目路线编码
V0312,--计划项目路线名称
V0316,--计划项目隧道桩号
A1318,hA1318,--工程性质
K0117,--变更日期
A3219,hA3219, --建设性质

K6343,HK6343,--隧道养护等级

K3909,HK3909,--变更原因
K6127,HK6127,--隧道所在位置
K6124,HK6124,--是否跨省隧道
K6355,HK6355,--是否在长大隧道目录中
K6336,hK6336,--评定等级(总体)
K6344,--评定日期(总体)
K6345,--评定单位(总体)
K6346,hK6346,--评定等级(土建结构)
K6347,--评定日期(土建结构)
K6348,--评定单位(土建结构)
K6349,hK6349,--评定等级(机电设施)
K6350,--评定日期(机电设施)
K6351,--评定单位(机电设施)
K6352,hK6352,--评定等级(其他工程设施)
K6353,--评定日期(其他工程设施)
K6354, --评定单位(其他工程设施)
K6023,hK6023,--抗震等级
K0149,HK0149--防洪标准(年)
)
SELECT
'2023','2023'+'年',  --时间
rtrim(A0102),rtrim(hA0102),--管理单位名称
--rtrim(A0103),rtrim(hA0103),--行政区划
rtrim(left(A0103,9)),rtrim(objjc) hA0103,--行政区划
rtrim(A1305),--评定日期
rtrim(A1313),rtrim(hA1313),--管养单位性质
rtrim(A1314),--管养单位名称
rtrim(A1316),--改造完工日期
A9902,hA9902,--原管理单位
A9903,--原路线代码
A9904,hA9904,--操作顺序
A9905,--平移值
A9906,hA9906,--是否桩号反向重排
A9907,hA9907,--是否删除
A9908,--反排路线里程
rtrim(K0101),--路线代码
rtrim(K0112),--路线简称
rtrim(K0116),--通车日期
rtrim(K6101),--改造年度
K0199,--备注
rtrim(K3904),rtrim(hK3904),--路网调整类型
rtrim(K6050),--技术状况评定单位
(case when len(rtrim(k0101))<=9 and charindex('D',rtrim(k0101))=0 then rtrim(k0101)+left(rtrim(a0103),6)+'U'+rtrim(K6301)
  when len(rtrim(k0101))<=9 and charindex('D',rtrim(k0101))<>0 then left(rtrim(k0101),charindex('D',rtrim(k0101))-1)+left(rtrim(a0103),6)+'U'+rtrim(K6301)
  when len(rtrim(k0101))>9 and left(rtrim(k0101),1) in ('G','H','S','T') then left(rtrim(k0101),4)+left(rtrim(a0103),6)+'U'+rtrim(K6301)
  when len(rtrim(k0101))>9 and left(rtrim(k0101),1) in ('X','J','Y','N','C','Z') then left(rtrim(k0101),10)+'U'+rtrim(K6301)
  else null end),--隧道编号
rtrim(K6302),--隧道名称
K6303,--隧道入口桩号
rtrim(K6304),rtrim(hK6304),--隧道按长度分类
K6305,--隧道长度(米)
K6306,--隧道净宽(米)
K6307,--隧道净高(米)
K6308,--人行道宽(米)
rtrim(K6309),rtrim(hK6309),--洞口形式
rtrim(K6310),rtrim(hK6310),--断面形式
rtrim(K6311),rtrim(hK6311),--衬砌材料
rtrim(K6312),rtrim(hK6312),--路面面层类型
rtrim(K6313),rtrim(hK6313),--隧道排水类型
K6314,--安全通道数量
rtrim(K6315),rtrim(hK6315),--隧道照明
rtrim(K6316),rtrim(hK6316),--隧道通风
rtrim(K6317),rtrim(hK6317),--隧道电子设备
--K6318,
rtrim(hK6318),--消防设施
rtrim(K6079),--建设单位名称
rtrim(K6112),--监管单位名称
rtrim(K6030),--设计单位名称
rtrim(K6031),--施工单位名称
rtrim(K6032),--监理单位名称
rtrim(K6340),--修建年度(作为新建数纳入统计的年度)
rtrim(K3901),--开工日期
K6324,--隧道中心桩号
rtrim(K6326),--隧道所在地点
K6327,--隧道全宽(米)
rtrim(K6335),rtrim(hK6335),--是否水下隧道

rtrim(K6337),rtrim(hK6337),--隧道改造部位
rtrim(K6338),rtrim(hK6338),--隧道主要病害部位
rtrim(K6339),--隧道主要病害描述
rtrim(K6115),rtrim(hk6115),--路网调整后行政等级
KWYID,--唯一ID
V0310,--计划项目唯一编码
V0311,--计划项目路线编码
V0312,--计划项目路线名称
V0316,--计划项目隧道桩号
rtrim(A1318),rtrim(hA1318),--工程性质
--rtrim(K0191),--改建变更日期
(case when left(rtrim(K6101),4)='2023' and rtrim(K0191) is null then rtrim(K6101) else rtrim(K0191) end) K0117,--改建变更日期
(case when left(rtrim(K6340),4)='2023' then '1'
    when left(rtrim(K6101),4)='2023' then '2' else '9' end),--建设性质
(case when left(rtrim(K6340),4)='2023' then '新建'
    when left(rtrim(K6101),4)='2023' then '改建' else '其他' end), --建设性质

rtrim(K6343),rtrim(HK6343),--隧道养护等级

rtrim(K3909),rtrim(HK3909),--变更原因
rtrim(K6127),rtrim(HK6127),--隧道所在位置
rtrim(K6124),rtrim(HK6124),--是否跨省隧道
rtrim(K6355),rtrim(HK6355),--是否在长大隧道目录中
rtrim(K6336),rtrim(hK6336),--评定等级(总体)
rtrim(K6344),--评定日期(总体)
rtrim(K6345),--评定单位(总体)
rtrim(K6346),rtrim(hK6346),--评定等级(土建结构)
rtrim(K6347),--评定日期(土建结构)
rtrim(K6348),--评定单位(土建结构)
rtrim(K6349),rtrim(hK6349),--评定等级(机电设施)
rtrim(K6350),--评定日期(机电设施)
rtrim(K6351),--评定单位(机电设施)
rtrim(K6352),rtrim(hK6352),--评定等级(其他工程设施)
rtrim(K6353),--评定日期(其他工程设施)
rtrim(K6354), --评定单位(其他工程设施)
rtrim(K6023),rtrim(hK6023),--抗震等级
rtrim(K0149),rtrim(HK0149)--防洪标准(年)
FROM 	[HRP-DBMS2015]..K063 left join D020 on rtrim(left(A0103,9))=rtrim(objname)
select GETDATE(),'K63完成'
--------------K65--------------------
truncate table K65
INSERT K65
(A0101,hA0101,--时间
A0102,hA0102,--管理单位名称
A0103,hA0103,--行政区划
A0130,--管养单位名称
A9902,hA9902,--原管理单位
A9903,--原路线代码
A9904,hA9904,--操作顺序
A9905,--平移值
A9906,hA9906,--是否桩号反向重排
A9907,hA9907,--是否删除
A9908,--反排路线里程
K0101,--路线代码
K0112,--路线简称
K0199,--备注
K2010,hK2010,--管养单位行业类别
K3904,hK3904,--路网调整类型
K6501,--渡口代码
K6502,--渡口名称
A0204,--起点桩号
K6504,hK6504,--渡口分类
K6521,--河流名称
K6522,--河流宽度(公里)
K6523,--渡口宽度(公里)
K6531,--渡口职工人数(人)
K6532,--职工_管理人员(人)
K6533,--职工_渡工(人)
K6551,--全年渡运车辆(辆)
K6552,--年均日渡运辆(辆)
K6553,--最多一天渡运车辆(辆)
K6554,--全年渡运航行量_时间(小时)
K6555,--全年渡运般行量_数量(次)
K6556,--全年油料消耗_柴油(千克)
K6557,--全年油料消耗_机油(千克)
K6561,--过渡费收入(万元)
K6581,--机动渡船_数量(艘)
K6582,--机动渡船_净载重量(吨位)
K6583,--机动渡船_总功率(千瓦)
K6584,--拖轮_数量(艘)
K6585,--拖轮_净载重量(吨位)
K6586,--拖轮_功率(千瓦)
K6587,--非机动渡船_数量(艘)
K6588,--非机动渡船_净载重量(吨位)
K6589,--非机动渡船_功率(千瓦)
KWYID,--唯一ID
V0310,--计划项目唯一编码
V0311,--计划项目路线编码
V0312,--计划项目路线名称
V0317,--计划项目渡口桩号
K6540,--渡轮_数量(艘)
K6541,--渡轮_总功率(千瓦)
K6542,--渡轮_载车数(辆)
K6543,--渡驳_数量(艘)
K6544,--渡驳_载车数(辆)
K6545,--渡班房(平米)
K6546,--渡班房(栋)
K6547,--全年渡运总功率(千瓦)
K6548,--渡运_免费车(辆)
K6549,--渡运_客车(辆)
K6550,hK6550,--渡口管理性质

K0180,--修建年度
K3909,HK3909,--变更原因
A3219,hA3219 --建设性质
)
SELECT
'2023','2023'+'年',  --时间
A0102,hA0102,--管理单位名称
--A0103,hA0103,--行政区划
rtrim(left(A0103,9)),rtrim(objjc) hA0103,--行政区划
A0130,--管养单位名称
A9902,hA9902,--原管理单位
A9903,--原路线代码
A9904,hA9904,--操作顺序
A9905,--平移值
A9906,hA9906,--是否桩号反向重排
A9907,hA9907,--是否删除
A9908,--反排路线里程
K0101,--路线代码
K0112,--路线简称
K0199,--备注
K2010,hK2010,--管养单位所属行业类别
K3904,hK3904,--路网调整类型
(case when len(rtrim(k0101))<=9 and charindex('D',rtrim(k0101))=0 then rtrim(k0101)+left(rtrim(a0103),6)+'D'+rtrim(K6501)
  when len(rtrim(k0101))<=9 and charindex('D',rtrim(k0101))<>0 then left(rtrim(k0101),charindex('D',rtrim(k0101))-1)+left(rtrim(a0103),6)+'D'+rtrim(K6501)
  when len(rtrim(k0101))>9 and left(rtrim(k0101),1) in ('G','H','S','T') then left(rtrim(k0101),4)+left(rtrim(a0103),6)+'D'+rtrim(K6501)
  when len(rtrim(k0101))>9 and left(rtrim(k0101),1) in ('X','J','Y','N','C','Z') then left(rtrim(k0101),10)+'D'+rtrim(K6501)
  else null end),--渡口编号
K6502,--渡口名称
K6503,--渡口桩号
K6504,hK6504,--渡口分类
K6521,--河流名称
K6522,--河流宽度(米)
K6523,--渡口宽度(米)
K6531,--渡口职工人数(人)
K6532,--职工_管理人员(人)
K6533,--职工_渡工(人)
K6551,--全年渡运车辆(辆)
K6552,--年均日渡运辆(辆)
K6553,--最多一天渡运车辆(辆)
K6554,--全年渡运航行量_时间(小时)
K6555,--全年渡运航行量_数量(次)
K6556,--全年油料消耗_柴油(千克)
K6557,--全年油料消耗_机油(千克)
K6561,--过渡费收入(万元)
K6581,--机动渡船_数量(艘)
K6582,--机动渡船_净载重量(吨位)
K6583,--机动渡船_总功率(千瓦)
K6584,--拖轮_数量(艘)
K6585,--拖轮_净载重量(吨位)
K6586,--拖轮_功率(千瓦)
K6587,--非机动渡船_数量(艘)
K6588,--非机动渡船_净载重量(吨位)
K6589,--非机动渡船_功率(千瓦)
KWYID,--唯一ID
V0310,--计划项目唯一编码
V0311,--计划项目路线编码
V0312,--计划项目路线名称
V0317,--计划项目渡口桩号
K6540,--渡轮_数量(艘)
K6541,--渡轮_总功率(千瓦)
K6542,--渡轮_载车数(辆)
K6543,--渡驳_数量(艘)
K6544,--渡驳_载车数(辆)
K6545,--渡班房(平米)
K6546,--渡班房(栋)
K6547,--全年渡运总功率(千瓦)
K6548,--渡运_免费车(辆)
K6549,--渡运_客车(辆)
K6550,hK6550,--渡口管理性质

left(rtrim(K0190),4),--修建年度
rtrim(K3909),rtrim(HK3909),--变更原因
(case when left(rtrim(K0190),4)='2023' then '1'
    when left(rtrim(K0191),4)='2023' then '2' else '9' end),--建设性质
(case when left(rtrim(K0190),4)='2023' then '新建'
    when left(rtrim(K0191),4)='2023' then '改建' else '其他' end) --建设性质
FROM [HRP-DBMS2015]..K065 left join D020 on rtrim(left(A0103,9))=rtrim(objname)
select GETDATE(),'K65完成'
----------------A61高速公路服务信息--------------------
truncate table A61

INSERT A61(
A0101,hA0101,--时间
A0102,hA0102,--管理单位名称
A0103,hA0103,--行政区划
K0101,--路线代码
K0112,--路线简称
A7005,hA7005,--服务设施类型
A7006a,--桩号
A7007,--服务区位置

A7013,--服务设施名称
A7003,--管理、经营单位名称
A7008,--服务区服务内容

A0129,--备注

A7004,--联系电话
A7002, --路线地方名称
A7006 --编号
)
SELECT
'2023','2023'+'年',  --时间
rtrim(A0102),rtrim(HA0102),--管理单位名称
--rtrim(A0103),rtrim(HA0103),--行政区划
rtrim(left(A0103,9)),rtrim(objjc) hA0103,--行政区划
rtrim(K0101),--路线代码
rtrim(K0112), --路线简称
--K7502,hK7502,--公路服务设施种类
'04','服务区',
K7001,--位置桩号
(case when rtrim(K7511)='1' then '上行'
  when rtrim(K7511)='2' then '下行'
  when rtrim(K7511)='3' then '双向' else '双向' end),--服务区位置

rtrim(K7509),--服务设施名称
rtrim(K7508),--管理、经营单位名称
rtrim(K7512),--服务区服务内容

K0199,--备注

rtrim(K7510),--联系电话
rtrim(K0140),--路线地方名称
K7501 --服务设施编号
FROM [HRP-DBMS2015]..K078 left join D020 on rtrim(left(A0103,9))=rtrim(objname)
WHERE K7502 in ('1','2')  --服务区


INSERT A61(
A0101,hA0101,--时间
A0102,hA0102,--管理单位名称
A0103,hA0103,--行政区划
K0101,--路线代码
K0112,--路线简称
A7005,hA7005,--服务设施类型
A7006a,--桩号
A7006, --编号
a7015,--出入口编号
A7016,--出入口名称
A7011A,--出入口连接路线编号
A7011,--出入口连接路线名称
A7014,--出入口连接路线桩号
A7010,--出口连接旅游景点
A0129,--备注
A7003,--管理、经营单位名称
A7004,--联系电话
A7009,--出口连接地名
A7012 --出口连接其他重要信息
)
SELECT
'2023','2023'+'年',  --时间
rtrim(A0102),rtrim(HA0102),--管理单位名称
--rtrim(A0103),rtrim(HA0103),--行政区划
rtrim(left(A0103,9)),rtrim(objjc) hA0103,--行政区划
rtrim(K0101),--路线代码
rtrim(K0112), --路线简称
rtrim(K7504),rtrim(hK7504),--出入口类型
K7513,--出入口桩号
--K7513,
rtrim(K7503),--出入口编号
rtrim(K7503),--出入口编号
rtrim(K7506),--出入口名称
rtrim(K7516),--出入口连接路线编号
rtrim(K7517),--出入口连接路线名称
rtrim(K7518),--出入口连接路线桩号
rtrim(K7515),--出口连接旅游景点
A0129,--备注
rtrim(K7508),--管理、经营单位名称
rtrim(K7510),--联系电话
rtrim(K7514),--出口连接地名
rtrim(K7519) --出口连接其他重要信息
FROM [HRP-DBMS2015]..K084 left join D020 on rtrim(left(A0103,9))=rtrim(objname)
select GETDATE(),'A61完成'
-------------------------------------向K01导数据-----------------------
truncate table K01
insert K01(
A0101,hA0101,--时间
A0102,hA0102,--管理单位名称
A0103,hA0103,--行政区划
A0130,--管养单位名称
A0322,--已实施GBM里程
A0323,--已实施文明样板路的里程
A0522,--涵洞(道)
A0523,--涵洞(米)
A0534,--漫水工程(处)
A0535,--漫水工程名称
A1001,--养护里程
A1001A,--补助养护里程
A1101,--列养总里程
A1101A,--列养里程_可绿化里程
A1101B,--列养里程_已绿化里程
A1401,--水泥路_上年底里程(公里)
A1402,--水泥路_上年底投资(万元)
A1403,--水泥路_本年里程(公里)
A1404,--水泥路_本年投资(万元)
A3021,--GBM工程_完成里程
A3022,--GBM工程_完成投资
A3031,--GBM工程_计划里程
A3032,--GBM工程_计划投资
A3101,--可绿化里程
A3102,--已绿化里程
A3305,--年均日交通量
A9902,hA9902,--原管理单位
A9903,--原路线代码
A9904,hA9904,--操作顺序
A9905,--平移值
A9906,hA9906,--是否桩号反向重排
A9907,hA9907,--是否删除
A9908,--反排路线里程
K0101,--路线代码
K0108,--路段起点桩号
K0109,--路段止点桩号
K0110,--路段起点名称
K0111,--路段止点名称
K0112,--路线简称
K0114,--里程
K0115,--路段编号
K0116,--通车日期
K0121,hK0121,--是否城管路段
K0123,hK0123,--是否断头路路段
K0124,--重复路线代码
K0126,hK0126,--是否一幅高速
K0128,hK0128,--路段收费性质
K0133,hK0133,--匝道方向
K0134,--连接主线编码
K0135,--连接主线桩号
K0138,hk0138,--是否按干线公路管理接养
K0153,hK0153,--起点是否为分界点
K0154,hK0154,--起点分界点类别
K0155,--最近一次大中修年度
K0156,hK0156,--省际出入口标识
K0157,hK0157,--止点是否为分界点
K0158,hK0158,--止点分界点类别
K0161,hK0161,--重复路段管理单位名称
K0162,--重复路段起点桩号
K0163,--重复路段止点桩号
K0180,--修建年度
K0181,--改建年度
K0182,hK0182,--断链类型
K0199,--备注
K0304,hK0304,--技术等级
K0306,--设计车速
K0404,hK0404,--车道分类
K1015,--圆曲线最小半径（米）
K1116,--最大纵坡
K2010,hK2010,--管养单位行业类别
K2011,--列养路段起点桩号
K2012,--列养路段止点桩号
A7002,--路线地方名称
K3904,hK3904,--路网调整类型
K3921,--亚洲公路网编号
K3922,--省内顺序号
K4002,--路基宽度
K5104,hK5104,--面层类型
K5222,--面层厚度(厘米)
K5404,--路面宽度
K9103,--乡镇名称
K9508,hK9508,--地貌
K0140,hK0140,--是否收费路段
K3989,HK3989,--路网调整前管理单位名称
K3990,--路网调整前路线代码
K3991,--路网调整前路段起点桩号
K3992,--国省道桩号传递预留里程
K3993,--路网调整说明
K1302,--上年路线编码
K1303,--上年起点桩号
K1304,--上年止点桩号
KWYID,--唯一ID
V0301,hV0301,--是否国有农、林场专用通达路线
V0302,--国有农、林场专用通达路线编码
V0303,--国有农、林场专用通达路线名称
J0103,HJ0103,--项目类型
V0310,--计划项目唯一编码
V0311,--计划项目路线编码
V0312,--计划项目路线名称
A0320,--晴雨通车里程
K0117, --变更日期
K3102,hK3102,--GBM建设性质
K3108,--已实施GBM起点桩号
K3109,--已实施GBM止点桩号
K3208,--文明样板路起点桩号
K3209,--文明样板路止点桩号
A1002,--燃油税养护里程
A1003,--通行费养护里程
A1004,--其他费养护里程
A1005,--经常性养护里程
A1006,--季节性养护里程

K3909,HK3909,--变更原因
A3219,hA3219, --建设性质
K6023,HK6023,--抗震等级
K0149,HK0149 --防洪标准(年)
)
select
'2023','2023'+'年',--时间
A0102,hA0102,--管理单位名称
rtrim(left(A0103,9)),rtrim(objjc) hA0103,--行政区划
A0130,--管养单位名称
A0322,--已实施GBM里程(公里)
A0323,--已实施文明样板路的里程(公里)
A0522,--涵洞(道)
A0523,--涵洞(米)
A0534,--漫水工程(处)
A0535,--漫水工程名称
A1001,--养护里程(公里)
A1001A,--补助养护里程
A1101,--列养总里程
A1101A,--列养里程_可绿化里程
A1101B,--列养里程_已绿化里程
A1401,--水泥路_上年底里程(公里)
A1402,--水泥路_上年底投资(万元)
A1403,--水泥路_本年里程(公里)
A1404,--水泥路_本年投资(万元)
A3021,--GBM工程_完成里程
A3022,--GBM工程_完成投资
A3031,--GBM工程_计划里程
A3032,--GBM工程_计划投资
A3101,--可绿化里程(公里)
A3102,--已绿化里程(公里)
A3305,--年均日交通量
A9902,hA9902,--原管理单位
A9903,--原路线代码
A9904,hA9904,--操作顺序
A9905,--平移值
A9906,hA9906,--是否桩号反向重排
A9907,hA9907,--是否删除
A9908,--反排路线里程
K0101,--路线代码
K0108,--路段起点桩号
K0109,--路段止点桩号
K0110,--路段起点名称
K0111,--路段止点名称
K0112,--路线简称
K0114,--里程(公里)
--K0115,--路段编号
(case when len(rtrim(k0101))<=9 and charindex('D',rtrim(k0101))=0 then rtrim(k0101)+left(rtrim(a0103),6)+right(rtrim(K0115),3)
  when len(rtrim(k0101))<=9 and charindex('D',rtrim(k0101))<>0 then left(rtrim(k0101),charindex('D',rtrim(k0101))-1)+left(rtrim(a0103),6)+right(rtrim(K0115),3)
  when len(rtrim(k0101))>9 and left(rtrim(k0101),1) in ('G','H','S','T') then left(rtrim(k0101),4)+left(rtrim(a0103),6)+right(rtrim(K0115),3)
  when len(rtrim(k0101))>9 and left(rtrim(k0101),1) in ('X','J','Y','N','C','Z') then left(rtrim(k0101),10)+right(rtrim(K0115),3)
  else null end),--路段编号

rtrim(K0116),--通车日期
K0121,hK0121,--是否城管路段
K0123,hK0123,--是否断头路路段
K0124,--重复路线代码
K0126,hK0126,--是否一幅高速
K0128,hK0128,--路段收费性质
K0133,hK0133,--匝道方向
K0134,--连接主线编码
K0135,--连接主线桩号
K0138,hk0138,--是否按干线公路管理接养
K0153,hK0153,--起点是否为分界点
K0154,hK0154,--起点分界点类别
K0155,--最近一次大中修年度
K0156,hK0156,--省际出入口标识
K0157,hK0157,--止点是否为分界点
K0158,hK0158,--止点分界点类别
K0161,hK0161,--重复路段管理单位名称
K0162,--重复路段起点桩号
K0163,--重复路段止点桩号
rtrim(K0190) K0180,--修建年度
rtrim(K0193) K0181,--改建年度
rtrim(K0192),rtrim(hK0192),--断链类型
K0199,--备注
K0304,hK0304,--技术等级
K0306,--设计车速
K0404,hK0404,--车道分类
K1015,--圆曲线最小半径（米）
K1116,--最大纵坡
K2010,hK2010,--管养单位行业类别
K2011,--列养路段起点桩号
K2012,--列养路段止点桩号
rtrim(K0140),--路线地方名称
K3904,rtrim(hK3904),--路网调整类型
K3921,--亚洲公路网编号
K3922,--省内顺序号
K4002,--路基宽度
K5104,hK5104,--面层类型
K5222,--面层厚度(厘米)
K5404,--路面宽度
rtrim(V9103),--乡镇名称
K9508,hK9508,--地貌
(case when isnull(K0128,'01') in ('02','03') then '1' else '2' end),
(case when isnull(K0128,'01') in ('02','03') then '是' else '否' end),--路段收费性质(是否收费路段)
rtrim(K3989),rtrim(HK3989),--路网调整前管理单位名称
rtrim(K3990),--路网调整前路线代码
K3991,--路网调整前路段起点桩号
K3992,--国省道桩号传递预留里程
rtrim(K3993),--路网调整说明
rtrim(K1302),--上年路线编码
K1303,--上年起点桩号
K1304,--上年止点桩号
KWYID,--唯一ID
V0301,rtrim(hV0301),--是否国有农、林场专用通达路线
V0302,--国有农、林场专用通达路线编码
V0303,--国有农、林场专用通达路线名称
J0103,rtrim(HJ0103),--项目类型
V0310,--计划项目唯一编码
V0311,--计划项目路线编码
V0312,--计划项目路线名称
--A0320,--晴雨通车里程
(case when isnull(k0174,'2')='1' then isnull(k0114,0) else null end),--晴雨通车里程
(case when K0193='2023' and rtrim(K0191) is null then rtrim(K0193) else rtrim(K0191) end) K0117, --变更日期
K3102,hK3102,--GBM建设性质
K3108,--已实施GBM起点桩号
K3109,--已实施GBM止点桩号
K3208,--文明样板路起点桩号
K3209, --文明样板路止点桩号
(case when K0131='1' then isnull(k0114,0) else null end),--养护类型(按资金来源分)
(case when K0131='2' then isnull(k0114,0) else null end),--养护类型(按资金来源分)
(case when K0131='3' then isnull(k0114,0) else null end),--养护类型(按资金来源分)
(case when K0130='1' then isnull(k0114,0) else null end),--养护类型(按时间分)
(case when K0130='2' then isnull(k0114,0) else null end),--养护类型(按时间分)

rtrim(K3909),rtrim(HK3909),--变更原因
(case when K0190='2023' then '1' when K0193='2023' then '2' else '9' end),--建设性质
(case when K0190='2023' then '新建' when K0193='2023' then '改建' else '其他' end), --建设性质
rtrim(K6023),rtrim(HK6023),--抗震等级
rtrim(K0149),rtrim(HK0149) --防洪标准(年)
from [HRP-DBMS2015]..K001 left join D020 on rtrim(left(A0103,9))=rtrim(objname)
            where isnull(v0301,'2')='2' and left(k0101,1) in ('G','H','S','T','X','J','Y','N','Z','C')
select GETDATE(),'向K01导数据完成'
*/




------------------------汇总A11、A51、A52、A12、A13-----------------------------
------------------------------------------A51表
if not exists(select top 1 * from A51 where left(A0101,4)<'2023')
begin
delete a51 where left(A0101,4)='2023'
if object_id('tempdb..#本年到达里程') is not null	drop table #本年到达里程
select
A0102,
Max(HA0102) ha0102,
K0101,
[高速四车道里程]			= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and  K0304='10' and K0404='4' then K0114 else 0 end),
[高速六车道里程]			= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and  K0304='10' and K0404='6' then K0114 else 0 end),
[高速八车道及以上里程]	= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and  K0304='10' and K0404>='8' then K0114 else 0 end),
[一级里程]			= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and  K0304='11'  then K0114 else 0 end),
[二级里程]			= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and  K0304='22'  then K0114 else 0 end),
[三级里程]			= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and  K0304='23'  then K0114 else 0 end),
[四级里程]			= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and  K0304='24'  then K0114 else 0 end),
[等外里程]			= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and  K0304='30'  then K0114 else 0 end),
[晴雨通车里程]			= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A0320,0) else 0 end),
[养护里程]			= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A1001,0) else 0 end),
[可绿化里程]			= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A3101,0) else 0 end),
[已绿化里程]			= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A3102,0) else 0 end),
[已实施GBM里程]			= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A0322,0) else 0 end),
[已实施文明样板路的里程]	= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A0323,0) else 0 end),
[漫水工程]	        = sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A0534,0) else 0 end),
[涵洞(道)]			= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A0522,0) else 0 end),
[涵洞(米)]			= sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' then isnull(A0523,0) else 0 end),
[有铺装路面里程_水泥混凝土]     = sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and  k5104='12' then k0114 else 0 end),
[有铺装路面里程_沥青混凝土]     = sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and  k5104='11' then k0114 else 0 end),
[简易铺装路面里程]              = sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and  k5104 like '2%' then k0114 else 0 end),
[未铺装路面里程]                = sum(case when (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2' and  (k5104 like '3%' or k5104 like '4%' or k5104 like '5%') then k0114 else 0 end),
            [城管里程]		= sum(case when (K0124 is null or K0124 = '') and k0121 = '1' then K0114 else 0 end),
[断头路里程]		= sum(case when k0123 = '1' then K0114 else 0 end), --如果既是断头又是重复，则算为断头路里程，这样“路线长度＝路线里程＋断头路里程＋重复里程”
[重复里程]		= sum(case when isnull(K0123,'2') = '2' and k0124 is not null then K0114 else 0 end)
into #本年到达里程
from K01
where left(k0101,1) in ('G','S','X','Y','Z','C') and left(A0101,4)='2023'
group by A0102,K0101
------------------------------------------
--以下计算桥梁
if object_id('tempdb..#本年到达桥梁') is not null	drop table #本年到达桥梁
select
A0102,
K0101,
[危桥座数]		= sum(case when left(K6028,1) in('4','5') then 1 else 0 end),
[危桥延米]		= sum(case when left(K6028,1) in('4','5') then K6008 else 0 end),
[永久性桥梁座数]		= sum(case when K6004='1' then 1 else 0 end),
[永久性桥梁延米]		= sum(case when K6004='1' then K6008 else 0 end),
[半永久性桥梁座数]   	= sum(case when K6004='2' then 1 else 0 end),
[半永久性桥梁延米]   	= sum(case when K6004='2' then K6008 else 0 end),
[临时性桥梁座数]		= sum(case when K6004='3' then 1 else 0 end),
[临时性桥梁延米]		= sum(case when K6004='3' then K6008 else 0 end),
[互通式立交桥座数]	= sum(case when K6062='1' then 1 else 0 end),
[互通式立交桥延米]	= sum(case when K6062='1' then K6008 else 0 end),
[匝道(平米)]		= isnull(sum(A0521),0),
[特大桥座数]		= sum(case when K6007='1' then 1 else 0 end),
[特大桥延米]		= sum(case when K6007='1' then K6008 else 0 end),
[大桥座数]		= sum(case when K6007='2' then 1 else 0 end),
[大桥延米]		= sum(case when K6007='2' then K6008 else 0 end),
[中桥座数]		= sum(case when K6007='3' then 1 else 0 end),
[中桥延米]		= sum(case when K6007='3' then K6008 else 0 end),
[小桥座数]		= sum(case when K6007='4' then 1 else 0 end),
[小桥延米]		= sum(case when K6007='4' then K6008 else 0 end)
into #本年到达桥梁
from k60
where left(A0101,4)='2023' and isnull(K6008,0)<>0 --桥梁全长为0,则不计数
group by a0102,k0101
------------------------------------------
--以下计算隧道
if object_id('tempdb..#本年到达隧道') is not null	drop table #本年到达隧道
select
A0102,
Max(HA0102) ha0102,
K0101,
[四五类隧道数]	= sum(case when left(K6336,1) in('4','5') then 1 else 0 end),
[四五类隧道延米]	= sum(case when left(K6336,1) in('4','5') then K6305 else 0 end),
[特长隧道数]	=sum(case when K6304='1' then 1 else 0 end),
[特长隧道延米]	=sum(case when K6304='1' then K6305 else 0 end),
[长隧道数]	=sum(case when K6304='2' then 1 else 0 end),
[长隧道延米 ]	=sum(case when K6304='2' then K6305 else 0 end),
[中隧道数]	=sum(case when K6304='3' then 1 else 0 end),
[中隧道延米]	=sum(case when K6304='3' then K6305 else 0 end),
[短隧道数]	=sum(case when K6304='4' then 1 else 0 end),
[短隧道延米]	=sum(case when K6304='4' then K6305 else 0 end)
into #本年到达隧道
from k63
where left(A0101,4)='2023' and isnull(K6305,0)<>0 --20011217修改 隧道长度为0,则不计数
group by a0102,k0101
------------------------------------------
--以下计算渡口
if object_id('tempdb..#本年到达渡口') is not null	drop table #本年到达渡口
select
A0102,
K0101,
[机动渡口数]	=sum(case when K6504='1' then 1 else 0 end),
[渡口数]			=count(K6501)
into #本年到达渡口
from k65
where left(A0101,4)='2023' and isnull(K6523,0)<>0 --20011217修改 渡口宽度为0,则不计数
group by a0102,k0101
------------------------------------------
--下面(^@^):由于所有里程为0的不计算，所以路线名称、通车日期等字段不能填写到A51表中.
insert a51 (a0102,ha0102,k0101,a3219,ha3219,a0101,ha0101,K0105,K0106,A0203,k0116,k0103,k0104)
select a0102,ha0102,k0101,'9','其他','2023','2023'+'年',11111,22222,'aa','2005','请输入','请输入' from A50
------------------------------------------
-----------到达数直接填写到A51表中.
update a51 set
A0304=[高速四车道里程],
A0305=[高速六车道里程],
A0306=[高速八车道及以上里程],
A0307=[一级里程],
A0308=[二级里程],
A0310=[三级里程],
A0311=[四级里程],
A0312=[等外里程],
A0320=[晴雨通车里程],
A1001=[养护里程],
A3101=[可绿化里程],
A3102=[已绿化里程],
A0322=[已实施GBM里程],
A0323=[已实施文明样板路的里程],
A0534=[漫水工程],
A0522=[涵洞(道)],
A0523=[涵洞(米)],
a0314a=[有铺装路面里程_水泥混凝土],
a0315a=[有铺装路面里程_沥青混凝土],
a0316a=[简易铺装路面里程],
a0317a=[未铺装路面里程],
a0324=[城管里程],
            k1707=[重复里程],
a0321=[断头路里程]
from #本年到达里程
where
a51.a0101='2023' and a51.a3219='9' and
#本年到达里程.a0102=a51.a0102 and #本年到达里程.k0101=a51.k0101

update a51 set
A0503=[危桥座数],
A0504=[危桥延米],
A0505=[永久性桥梁座数],
A0506=[永久性桥梁延米],
A0507=[半永久性桥梁座数],
A0508=[半永久性桥梁延米],
A0509=[临时性桥梁座数],
A0510=[临时性桥梁延米],
A0519=[互通式立交桥座数],
A0520=[互通式立交桥延米],
A0521=[匝道(平米)],
A0511=[特大桥座数],
A0512=[特大桥延米],
A0513=[大桥座数],
A0514=[大桥延米],
A0515=[中桥座数],
A0516=[中桥延米],
A0517=[小桥座数],
A0518=[小桥延米]
from #本年到达桥梁
where
A51.A0101='2023' AND A51.A3219='9' AND
#本年到达桥梁.A0102=A51.A0102 AND #本年到达桥梁.K0101=A51.K0101

update a51 set
A0601=[四五类隧道数],
A0602=[四五类隧道延米],
A0605=[特长隧道数],
A0606=[特长隧道延米],
A0607=[长隧道数],
A0608=[长隧道延米],
A0609=[中隧道数],
A0610=[中隧道延米],
A0611=[短隧道数],
A0612=[短隧道延米],
A0698=[特长隧道数]+[长隧道数]+[中隧道数]+[短隧道数] ,
A0699=[特长隧道延米]+[长隧道延米]+[中隧道延米]+[短隧道延米]
from #本年到达隧道
where
A51.A0101='2023' AND A51.A3219='9' AND
#本年到达隧道.A0102=A51.A0102 AND #本年到达隧道.K0101=A51.K0101

update a51 set
A0701=[渡口数],
A0702=[机动渡口数]
from #本年到达渡口
where
A51.A0101='2023' AND A51.A3219='9' AND
#本年到达渡口.A0102=A51.A0102 AND #本年到达渡口.K0101=A51.K0101

end
else
begin
------------------------------------------
delete A51 where left(a0101,4)= '2023' --只删除本年新加入的数据
if object_id('tempdb..#本年新建里程') is not null	drop table #本年新建里程
select
A0102,
Max(HA0102) ha0102,
K0101,
[高速四车道里程]		= sum(case when K0304='10' and (K0124 is null OR K0124='') and K0404='4'  and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[高速六车道里程]		= sum(case when K0304='10' and (K0124 is null OR K0124='') and K0404='6'  and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[高速八车道及以上里程]	= sum(case when K0304='10' and (K0124 is null OR K0124='') and K0404>='8'  and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[一级里程]		= sum(case when K0304='11' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[二级里程]		= sum(case when K0304='22' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[一幅高速]		= sum(case when K0304='22' and (K0124 is null OR K0124='') and K0126='1'  and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[三级里程]		= sum(case when K0304='23' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[四级里程]		= sum(case when K0304='24' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[等外里程]		= sum(case when K0304='30' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[有铺装沥青路面里程]	= sum(case when K5104='11' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[有铺装水泥路面里程]	= sum(case when K5104='12' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[简易铺装路面里程]	= sum(case when K5104 like '2%' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[未铺装路面里程]		= sum(case when left(K5104,1) in ('3','4','5') and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
--[弹石路面里程]		= sum(case when K5104 ='312' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),

[沥青贯入式]		= sum(case when K5104='21' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[沥青碎石]		= sum(case when K5104='22' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[沥青表面处治]		= sum(case when K5104='23' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),

[砂石路面]		= sum(case when K5104='31' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[石质路面]		= sum(case when K5104='32' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[渣石路面]		= sum(case when K5104='33' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[砖铺路面]		= sum(case when K5104='34' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[砼预制块]		= sum(case when K5104='35' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[无路面里程]		= sum(case when K5104='36' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),

--[中级路面里程]		= sum(case when left(K5104,1) ='3' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
--[低级路面里程]		= sum(case when left(K5104,1) ='4' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
--[无路面里程]		= sum(case when left(K5104,1) ='5' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),

[晴雨通车里程]		= sum(case when (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then isnull(A0320,0) else 0 end),
[养护里程]		= sum(case when (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then isnull(A1001,0) else 0 end),
[交通部门养护里程]	= sum(case when K2010='10' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then isnull(A1001,0) else 0 end),
[城管里程]		= sum(case when k0121='1' and (K0124 is null OR K0124='') then isnull(K0114,0) else 0 end),
[重复里程]		= sum(case when K0124 is not null and k0124<>'' and ISNULL(K0123,'2')='2' then isnull(K0114,0) else 0 end),
[断头里程]		= sum(case when ISNULL(K0123,'2')='1' then isnull(K0114,0) else 0 end), --如果既是断头又是重复，则算为断头路里程，这样“路线长度＝路线里程＋断头路里程＋重复里程”
[可绿化里程]		= sum(case when (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then isnull(A3101,0) else 0 end),
[已绿化里程]		= sum(case when (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then isnull(A3102,0) else 0 end),
[已实施GBM里程]		= sum(case when (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then isnull(A0322,0) else 0 end),
[已实施文明样板路里程]	= sum(case when (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then isnull(A0323,0) else 0 end),
[涵洞（道）]		= sum(case when (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then isnull(A0522,0) else 0 end),
[涵洞（米）]		= sum(case when (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then isnull(A0523,0) else 0 end),
[漫水工程]		= sum(case when (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then isnull(A0534,0) else 0 end)
into #本年新建里程
from K01
where left(k0101,1) in ('G','S','X','Y','Z','C') and a0101='2023' and a3219='1' --and isnull(v0301,'2')='2'
group by A0102,K0101
--------------------------------------
if object_id('tempdb..#非本年新建里程数') is not null	drop table #非本年新建里程数
select
A50.A0102,
Max(A50.HA0102) ha0102,
A50.K0101,
[高速四车道里程]		= sum(case when K0304='10' and (K0124 is null OR K0124='') and K0404='4'  and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[高速六车道里程]		= sum(case when K0304='10' and (K0124 is null OR K0124='') and K0404='6'  and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[高速八车道及以上里程]	= sum(case when K0304='10' and (K0124 is null OR K0124='') and K0404>='8'  and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[一级里程]		= sum(case when K0304='11' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[二级里程]		= sum(case when K0304='22' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[一幅高速]		= sum(case when K0304='22' and (K0124 is null OR K0124='') and K0126='1'  and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[三级里程]		= sum(case when K0304='23' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[四级里程]		= sum(case when K0304='24' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[等外里程]		= sum(case when K0304='30' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[有铺装沥青路面里程]	= sum(case when K5104='11' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[有铺装水泥路面里程]	= sum(case when K5104='12' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[简易铺装路面里程]	= sum(case when K5104 like '2%' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[未铺装路面里程]		= sum(case when left(K5104,1) in ('3','4','5') and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
--[弹石路面里程]		= sum(case when K5104 ='312' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),

[沥青贯入式]		= sum(case when K5104='21' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[沥青碎石]		= sum(case when K5104='22' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[沥青表面处治]		= sum(case when K5104='23' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),

[砂石路面]		= sum(case when K5104='31' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[石质路面]		= sum(case when K5104='32' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[渣石路面]		= sum(case when K5104='33' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[砖铺路面]		= sum(case when K5104='34' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[砼预制块]		= sum(case when K5104='35' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
[无路面里程]		= sum(case when K5104='36' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),

--[中级路面里程]		= sum(case when left(K5104,1) ='3' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
--[低级路面里程]		= sum(case when left(K5104,1) ='4' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),
--[无路面里程]		= sum(case when left(K5104,1) ='5' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then K0114 else 0 end),

[晴雨通车里程]		= sum(case when (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then isnull(A0320,0) else 0 end),
[养护里程]		= sum(case when (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then isnull(A1001,0) else 0 end),
[交通部门养护里程]	= sum(case when K2010='10' and (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then isnull(A1001,0) else 0 end),
[城管里程]		= sum(case when k0121='1' and (K0124 is null OR K0124='') then isnull(K0114,0) else 0 end),
[重复里程]		= sum(case when K0124 is not null and k0124<>'' and ISNULL(K0123,'2')='2' then isnull(K0114,0) else 0 end),
[断头里程]		= sum(case when ISNULL(K0123,'2')='1' then isnull(K0114,0) else 0 end), --如果既是断头又是重复，则算为断头路里程，这样“路线长度＝路线里程＋断头路里程＋重复里程”
[可绿化里程]		= sum(case when (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then isnull(A3101,0) else 0 end),
[已绿化里程]		= sum(case when (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then isnull(A3102,0) else 0 end),
[已实施GBM里程]		= sum(case when (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then isnull(A0322,0) else 0 end),
[已实施文明样板路里程]	= sum(case when (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then isnull(A0323,0) else 0 end),
[涵洞（道）]		= sum(case when (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then isnull(A0522,0) else 0 end),
[涵洞（米）]		= sum(case when (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then isnull(A0523,0) else 0 end),
[漫水工程]		= sum(case when (K0124 is null OR K0124='') and ISNULL(K0123,'2')='2' then isnull(A0534,0) else 0 end)
into #非本年新建里程数
from A50
left join K01 on K01.A0102=A50.A0102 and K01.K0101=A50.K0101
where left(k01.k0101,1) in ('G','S','X','Y','Z','C') and a0101='2023' and a3219<>'1'
            --and isnull(v0301,'2')='2'
group by A50.A0102,A50.K0101
order by A50.A0102,A50.K0101
----------------------------------------
--以下计算桥梁
if object_id('tempdb..#本年新建桥梁') is not null	drop table #本年新建桥梁
select
A0102,
Max(HA0102) ha0102,
K0101,
[危桥座数]		= sum(case when left(K6028,1) in ('4','5') then 1 else 0 end),
[危桥延米]		= sum(case when left(K6028,1) in ('4','5') then K6008 else 0 end),
[永久性桥梁座数]		= sum(case when K6004='1' then 1 else 0 end),
[永久性桥梁延米]		= sum(case when K6004='1' then K6008 else 0 end),
[半永久性桥梁座数]   	= sum(case when K6004='2' then 1 else 0 end),
[半永久性桥梁延米]   	= sum(case when K6004='2' then K6008 else 0 end),
[临时性桥梁座数]		= sum(case when K6004='3' then 1 else 0 end),
[临时性桥梁延米]		= sum(case when K6004='3' then K6008 else 0 end),
[互通式立交桥座数]	= sum(case when K6062='1' then 1 else 0 end),
[互通式立交桥延米]	= sum(case when K6062='1' then K6008 else 0 end),
--[公铁立交桥座数]	= sum(case when K6080='1' then 1 else 0 end),
--[公铁立交桥延米]	= sum(case when K6080='1' then K6008 else 0 end),
[匝道（平米）]		= isnull(sum(A0521),0),
[特大桥座数]		= sum(case when K6007='1' then 1 else 0 end),
[特大桥延米]		= sum(case when K6007='1' then K6008 else 0 end),
[大桥座数]		= sum(case when K6007='2' then 1 else 0 end),
[大桥延米]		= sum(case when K6007='2' then K6008 else 0 end),
[中桥座数]		= sum(case when K6007='3' then 1 else 0 end),
[中桥延米]		= sum(case when K6007='3' then K6008 else 0 end),
[小桥座数]		= sum(case when K6007='4' then 1 else 0 end),
[小桥延米]		= sum(case when K6007='4' then K6008 else 0 end)
into #本年新建桥梁
from k60
where a0101='2023' and a3219='1' and isnull(K6008,0)<>0 --20011217修改 桥梁全长为0,则不计数
group by a0102,k0101
----------------------------------------
if object_id('tempdb..#非本年新建桥梁数') is not null	drop table #非本年新建桥梁数
select
A50.A0102,
Max(A50.HA0102) ha0102,
A50.K0101,
[危桥座数]		= sum(case when left(K6028,1) in ('4','5') then 1 else 0 end),
[危桥延米]		= sum(case when left(K6028,1) in ('4','5') then K6008 else 0 end),
[永久性桥梁座数]		= sum(case when K6004='1' then 1 else 0 end),
[永久性桥梁延米]		= sum(case when K6004='1' then K6008 else 0 end),
[半永久性桥梁座数]   	= sum(case when K6004='2' then 1 else 0 end),
[半永久性桥梁延米]   	= sum(case when K6004='2' then K6008 else 0 end),
[临时性桥梁座数]		= sum(case when K6004='3' then 1 else 0 end),
[临时性桥梁延米]		= sum(case when K6004='3' then K6008 else 0 end),
[互通式立交桥座数]	= sum(case when K6062='1' then 1 else 0 end),
[互通式立交桥延米]	= sum(case when K6062='1' then K6008 else 0 end),
--[公铁立交桥座数]	= sum(case when K6080='1' then 1 else 0 end),
--[公铁立交桥延米]	= sum(case when K6080='1' then K6008 else 0 end),
[匝道（平米）]		= isnull(sum(A0521),0),
[特大桥座数]		= sum(case when K6007='1' then 1 else 0 end),
[特大桥延米]		= sum(case when K6007='1' then K6008 else 0 end),
[大桥座数]		= sum(case when K6007='2' then 1 else 0 end),
[大桥延米]		= sum(case when K6007='2' then K6008 else 0 end),
[中桥座数]		= sum(case when K6007='3' then 1 else 0 end),
[中桥延米]		= sum(case when K6007='3' then K6008 else 0 end),
[小桥座数]		= sum(case when K6007='4' then 1 else 0 end),
[小桥延米]		= sum(case when K6007='4' then K6008 else 0 end)
into #非本年新建桥梁数
from A50
left join K60 on K60.A0102=A50.A0102 and K60.K0101=A50.K0101
where a0101='2023' and a3219<>'1' and isnull(K6008,0)<>0
group by A50.A0102,A50.K0101
order by A50.A0102,A50.K0101
------------------------------------------
--以下计算隧道
if object_id('tempdb..#本年新建隧道') is not null	drop table #本年新建隧道
select
A0102,
Max(HA0102) ha0102,
K0101,
[四五类隧道数]	= sum(case when left(K6336,1) in('4','5') then 1 else 0 end),
[四五类隧道延米]	= sum(case when left(K6336,1) in('4','5') then K6305 else 0 end),
[水下隧道数]	=sum(case when K6335='1' then 1 else 0 end),
[水下隧道延米]	=sum(case when K6335='1' then K6305 else 0 end),
[特长隧道数]	=sum(case when K6304='1' then 1 else 0 end),
[特长隧道延米]	=sum(case when K6304='1' then K6305 else 0 end),
[长隧道数]	=sum(case when K6304='2' then 1 else 0 end),
[长隧道延米 ]	=sum(case when K6304='2' then K6305 else 0 end),
[中隧道数]	=sum(case when K6304='3' then 1 else 0 end),
[中隧道延米]	=sum(case when K6304='3' then K6305 else 0 end),
[短隧道数]	=sum(case when K6304='4' then 1 else 0 end),
[短隧道延米]	=sum(case when K6304='4' then K6305 else 0 end)
into #本年新建隧道
from k63
where a0101='2023' and a3219='1' and isnull(K6305,0)<>0 --20011217修改 隧道长度为0,则不计数
group by a0102,k0101
----------------------------------------
if object_id('tempdb..#非本年新建隧道数') is not null	drop table #非本年新建隧道数
select
A50.A0102,
Max(A50.HA0102) ha0102,
A50.K0101,
[四五类隧道数]	= sum(case when left(K6336,1) in('4','5') then 1 else 0 end),
[四五类隧道延米]	= sum(case when left(K6336,1) in('4','5') then K6305 else 0 end),
[水下隧道数]	=sum(case when K6335='1' then 1 else 0 end),
[水下隧道延米]	=sum(case when K6335='1' then K6305 else 0 end),
[特长隧道数]	=sum(case when K6304='1' then 1 else 0 end),
[特长隧道延米]	=sum(case when K6304='1' then K6305 else 0 end),
[长隧道数]	=sum(case when K6304='2' then 1 else 0 end),
[长隧道延米 ]	=sum(case when K6304='2' then K6305 else 0 end),
[中隧道数]	=sum(case when K6304='3' then 1 else 0 end),
[中隧道延米]	=sum(case when K6304='3' then K6305 else 0 end),
[短隧道数]	=sum(case when K6304='4' then 1 else 0 end),
[短隧道延米]	=sum(case when K6304='4' then K6305 else 0 end)
into #非本年新建隧道数
from A50
left join K63 on K63.A0102=A50.A0102 and K63.K0101=A50.K0101
where a0101='2023' and a3219<>'1' and isnull(K6305,0)<>0
group by A50.A0102,A50.K0101
order by A50.A0102,A50.K0101
-------------------------------------------
--以下计算渡口
if object_id('tempdb..#本年新建渡口') is not null	drop table #本年新建渡口
select
A0102,
Max(HA0102) ha0102,
K0101,
[机动渡口数]	=sum(case when K6504='1' then 1 else 0 end),
[渡口数]		=count(K6501)
into #本年新建渡口
from k65
where left(A0101,4)='2023' and a3219='1' and isnull(K6523,0)<>0 --20011217修改 渡口宽度为0,则不计数
group by a0102,k0101
-------------------------------------------
if object_id('tempdb..#非本年新建渡口数') is not null	drop table #非本年新建渡口数
select
A50.A0102,
Max(A50.HA0102) ha0102,
A50.K0101,
[机动渡口数]	=sum(case when K6504='1' then 1 else 0 end),
[渡口数]		=count(K6501)
into #非本年新建渡口数
from A50
left join K65 on K65.A0102=A50.A0102 and K65.K0101=A50.K0101
where left(A0101,4)='2023' and a3219<>'1' and isnull(K6523,0)<>0
group by A50.A0102,A50.K0101
order by A50.A0102,A50.K0101
-------------------------------------------
--下面计算上年底到达,#上年底到达
if object_id('tempdb..#上年底到达') is not null		drop table #上年底到达
select a0102,k0101,
A0304=sum(isnull(A0304,0)), --高速四车道里程
A0305=sum(isnull(A0305,0)), --高速六车道里程
A0306=sum(isnull(A0306,0)), --高速八车道及以上里程
A0307=sum(isnull(A0307,0)), --一级里程
A0308=sum(isnull(A0308,0)), --二级里程
A0309=sum(isnull(A0309,0)), --一幅高速里程
A0310=sum(isnull(A0310,0)), --三级里程
A0311=sum(isnull(A0311,0)), --四级里程
A0312=sum(isnull(A0312,0)), --等外里程
A0314A=sum(isnull(A0314A,0)), --有铺装路面里程_水泥混凝土
A0315A=sum(isnull(A0315A,0)), --有铺装路面里程_沥青混凝土
A0316A=sum(isnull(A0316A,0)), --简易铺装路面里程
A0317A=sum(isnull(A0317A,0)), --未铺装路面里程
A0320=sum(isnull(A0320,0)), --晴雨通车里程
A0321=sum(isnull(A0321,0)), --断头路里程
A0322=sum(isnull(A0322,0)), --已实施GBM里程
A0323=sum(isnull(A0323,0)), --已实施文明样板路的里程
A0324=sum(isnull(A0324,0)), --城管里程
A0503=sum(isnull(A0503,0)), --危桥座数
A0504=sum(isnull(A0504,0)), --危桥延米
A0505=sum(isnull(A0505,0)), --永久性桥梁座数
A0506=sum(isnull(A0506,0)), --永久性桥梁延米
A0507=sum(isnull(A0507,0)), --半永久性桥梁座数
A0508=sum(isnull(A0508,0)), --半永久性桥梁延米
A0509=sum(isnull(A0509,0)), --临时性桥梁座数
A0510=sum(isnull(A0510,0)), --临时性桥梁延米
A0511=sum(isnull(A0511,0)), --特大桥座数
A0512=sum(isnull(A0512,0)), --特大桥延米
A0513=sum(isnull(A0513,0)), --大桥座数
A0514=sum(isnull(A0514,0)), --大桥延米
A0515=sum(isnull(A0515,0)), --中桥座数
A0516=sum(isnull(A0516,0)), --中桥延米
A0517=sum(isnull(A0517,0)), --小桥座数
A0518=sum(isnull(A0518,0)), --小桥延米
A0519=sum(isnull(A0519,0)), --互通式立交桥座数
A0520=sum(isnull(A0520,0)), --互通式立交桥延米
A0521=sum(isnull(A0521,0)), --匝道(平米)
A0522=sum(isnull(A0522,0)), --涵洞(道)
A0523=sum(isnull(A0523,0)), --涵洞(米)
A0534=sum(isnull(A0534,0)), --漫水工程(处)

A0601=sum(isnull(A0601,0)), --四五类隧道数
A0602=sum(isnull(A0602,0)), --四五类隧道延米
A0603=sum(isnull(A0603,0)), --水下隧道数
A0604=sum(isnull(A0604,0)), --水下隧道延米
A0605=sum(isnull(A0605,0)), --特长隧道数
A0606=sum(isnull(A0606,0)), --特长隧道延米
A0607=sum(isnull(A0607,0)), --长隧道数
A0608=sum(isnull(A0608,0)), --长隧道延米
A0609=sum(isnull(A0609,0)), --中隧道数
A0610=sum(isnull(A0610,0)), --中隧道延米
A0611=sum(isnull(A0611,0)), --短隧道数
A0612=sum(isnull(A0612,0)), --短隧道延米
A0698=sum(isnull(A0698,0)), --隧道总道数
A0699=sum(isnull(A0699,0)), --隧道总延米
A0701=sum(isnull(A0701,0)), --渡口数
A0702=sum(isnull(A0702,0)), --机动渡口数
A1001=sum(isnull(A1001,0)), --养护里程
A3101=sum(isnull(A3101,0)), --可绿化里程
A3102=sum(isnull(A3102,0)), --已绿化里程
K1707=sum(isnull(K1707,0))  --重复里程
into #上年底到达
from a51 where a0101<'2023' group by a0102,k0101
------------------------------------------
--下面(^@^):由于所有里程为0的不计算，所以路线名称、通车日期等字段不能填写到A51表中.
insert a51 (a0102,ha0102,k0101,a3219,ha3219,a0101,ha0101,K0105,K0106,A0203,k0116,k0103,k0104)
select a0102,ha0102,k0101,'1','新建','2023','2023'+'年',11111,22222,'aa','2005','请输入','请输入' from A50

insert a51 (a0102,ha0102,k0101,a3219,ha3219,a0101,ha0101,K0105,K0106,A0203,k0116,k0103,k0104)
select a0102,ha0102,k0101,'2','改建','2023','2023'+'年',11111,22222,'aa','2005','请输入','请输入' from A50
------------------------------------------
--新建数直接填写到A51表中.
update a51 set
A0304=[高速四车道里程],
A0305=[高速六车道里程],
A0306=[高速八车道及以上里程],
A0307=[一级里程],
A0308=[二级里程],
A0309=[一幅高速],
A0310=[三级里程],
A0311=[四级里程],
A0312=[等外里程],

A0314A=[有铺装水泥路面里程],
A0315A=[有铺装沥青路面里程],
A0316A=[简易铺装路面里程],
A0317A=[未铺装路面里程],

A0320=[晴雨通车里程],
A0321=[断头里程],
A0322=[已实施GBM里程],
A0323=[已实施文明样板路里程],
A0324=[城管里程],

A1001=[养护里程],
A3101=[可绿化里程],
A3102=[已绿化里程],
K1707=[重复里程],

A0522=[涵洞（道）],
A0523=[涵洞（米）],
A0534=[漫水工程]
from #本年新建里程
where
a51.a0101='2023' and a51.a3219='1' and
#本年新建里程.a0102=a51.a0102 and #本年新建里程.k0101=a51.k0101

update a51 set
A0503=[危桥座数],
A0504=[危桥延米],
A0505=[永久性桥梁座数],
A0506=[永久性桥梁延米],
A0507=[半永久性桥梁座数],
A0508=[半永久性桥梁延米],
A0509=[临时性桥梁座数],
A0510=[临时性桥梁延米],
A0519=[互通式立交桥座数],
A0520=[互通式立交桥延米],
A0521=[匝道（平米）],
A0511=[特大桥座数],
A0512=[特大桥延米],
A0513=[大桥座数],
A0514=[大桥延米],
A0515=[中桥座数],
A0516=[中桥延米],
A0517=[小桥座数],
A0518=[小桥延米]
from #本年新建桥梁
where
A51.A0101='2023' AND A51.A3219='1' AND
#本年新建桥梁.A0102=A51.A0102 AND #本年新建桥梁.K0101=A51.K0101

update a51 set
A0601=[四五类隧道数],
A0602=[四五类隧道延米],
A0603=[水下隧道数],
A0604=[水下隧道延米],
A0605=[特长隧道数],
A0606=[特长隧道延米],
A0607=[长隧道数],
A0608=[长隧道延米],
A0609=[中隧道数],
A0610=[中隧道延米],
A0611=[短隧道数],
A0612=[短隧道延米],
A0698=[特长隧道数]+[长隧道数]+[中隧道数]+[短隧道数],
A0699=[特长隧道延米]+[长隧道延米]+[中隧道延米]+[短隧道延米]
from #本年新建隧道
where
A51.A0101='2023' AND A51.A3219='1' AND
#本年新建隧道.A0102=A51.A0102 AND #本年新建隧道.K0101=A51.K0101

update a51 set
A0701=[渡口数],
A0702=[机动渡口数]
from #本年新建渡口
where
A51.A0101='2023' AND A51.A3219='1' AND
#本年新建渡口.A0102=A51.A0102 AND #本年新建渡口.K0101=A51.K0101

---------------------------------------------------------------------------------
if object_id('tempdb..#本年改建里程') is not null	drop table #本年改建里程
select
a50.a0102,
a50.k0101,
A0304=isnull(a.[高速四车道里程],0)	-isnull(b.A0304,0),
A0305=isnull(a.[高速六车道里程],0)	-isnull(b.A0305,0),
A0306=isnull(a.[高速八车道及以上里程],0)	-isnull(b.A0306,0),
A0307=isnull(a.[一级里程],0)		-isnull(b.A0307,0),
A0308=isnull(a.[二级里程],0)		-isnull(b.A0308,0),
A0309=isnull(a.[一幅高速],0)		-isnull(b.A0309,0),
A0310=isnull(a.[三级里程],0)		-isnull(b.A0310,0),
A0311=isnull(a.[四级里程],0)		-isnull(b.A0311,0),
A0312=isnull(a.[等外里程],0)		-isnull(b.A0312,0),
A0314A=isnull(a.[有铺装水泥路面里程],0)	-isnull(b.A0314A,0),
A0315A=isnull(a.[有铺装沥青路面里程],0)	-isnull(b.A0315A,0),
A0316A=isnull(a.[简易铺装路面里程],0)	-isnull(b.A0316A,0),
A0317A=isnull(a.[未铺装路面里程],0)	-isnull(b.A0317A,0),

A0320=isnull(a.[晴雨通车里程],0)		-isnull(b.A0320,0),
A0321=isnull(a.[断头里程],0)		-isnull(b.A0321,0),
A0322=isnull(a.[已实施GBM里程],0)	-isnull(b.A0322,0),
A0323=isnull(a.[已实施文明样板路里程],0)	-isnull(b.A0323,0),
A0324=isnull(a.[城管里程],0)		-isnull(b.A0324,0),

A1001=isnull(a.[养护里程],0)		-isnull(b.A1001,0),
A3101=isnull(a.[可绿化里程],0)		-isnull(b.A3101,0),
A3102=isnull(a.[已绿化里程],0)		-isnull(b.A3102,0),
K1707=isnull(a.[重复里程],0)		-isnull(b.K1707,0),

A0522=isnull(a.[涵洞（道）],0)		-isnull(b.A0522,0),
A0523=isnull(a.[涵洞（米）],0)		-isnull(b.A0523,0),
A0534=isnull(a.[漫水工程],0)		-isnull(b.A0534,0)
into #本年改建里程
from a50
left join #非本年新建里程数 a on a50.a0102=a.a0102 and a50.k0101=a.k0101
left join #上年底到达 b on a50.a0102=b.a0102 and a50.k0101=b.k0101
-----------------------------桥梁
if object_id('tempdb..#本年改建桥梁') is not null	drop table #本年改建桥梁
select
a50.a0102,
a50.k0101,
A0503=isnull(a.[危桥座数],0)		-isnull(b.A0503,0),
A0504=isnull(a.[危桥延米],0)		-isnull(b.A0504,0),
A0505=isnull(a.[永久性桥梁座数],0)	-isnull(b.A0505,0),
A0506=isnull(a.[永久性桥梁延米],0)	-isnull(b.A0506,0),
A0507=isnull(a.[半永久性桥梁座数],0)	-isnull(b.A0507,0),
A0508=isnull(a.[半永久性桥梁延米],0)	-isnull(b.A0508,0),
A0509=isnull(a.[临时性桥梁座数],0)	-isnull(b.A0509,0),
A0510=isnull(a.[临时性桥梁延米],0)	-isnull(b.A0510,0),
A0519=isnull(a.[互通式立交桥座数],0)	-isnull(b.A0519,0),
A0520=isnull(a.[互通式立交桥延米],0)	-isnull(b.A0520,0),
A0521=isnull(a.[匝道（平米）],0)		-isnull(b.A0521,0),
A0511=isnull(a.[特大桥座数],0)		-isnull(b.A0511,0),
A0512=isnull(a.[特大桥延米],0)		-isnull(b.A0512,0),
A0513=isnull(a.[大桥座数],0)		-isnull(b.A0513,0),
A0514=isnull(a.[大桥延米],0)		-isnull(b.A0514,0),
A0515=isnull(a.[中桥座数],0)		-isnull(b.A0515,0),
A0516=isnull(a.[中桥延米],0)		-isnull(b.A0516,0),
A0517=isnull(a.[小桥座数],0)		-isnull(b.A0517,0),
A0518=isnull(a.[小桥延米],0)		-isnull(b.A0518,0)
into #本年改建桥梁
from a50
left join #非本年新建桥梁数 a on a50.a0102=a.a0102 and a50.k0101=a.k0101
left join #上年底到达 b on a50.a0102=b.a0102 and a50.k0101=b.k0101
-----------------隧道
if object_id('tempdb..#本年改建隧道') is not null	drop table #本年改建隧道
select
a50.a0102,
a50.k0101,
A0601=isnull(a.[四五类隧道数],0)		-isnull(b.A0601,0),
A0602=isnull(a.[四五类隧道延米],0)	-isnull(b.A0602,0),
A0603=isnull(a.[水下隧道数],0)		-isnull(b.A0603,0),
A0604=isnull(a.[水下隧道延米],0)		-isnull(b.A0604,0),
A0605=isnull(a.[特长隧道数],0)		-isnull(b.A0605,0),
A0606=isnull(a.[特长隧道延米],0)		-isnull(b.A0606,0),
A0607=isnull(a.[长隧道数],0)		-isnull(b.A0607,0),
A0608=isnull(a.[长隧道延米],0)		-isnull(b.A0608,0),
A0609=isnull(a.[中隧道数],0)		-isnull(b.A0609,0),
A0610=isnull(a.[中隧道延米],0)		-isnull(b.A0610,0),
A0611=isnull(a.[短隧道数],0)		-isnull(b.A0611,0),
A0612=isnull(a.[短隧道延米],0)		-isnull(b.A0612,0),
A0698=isnull(a.[特长隧道数],0)+isnull(a.[长隧道数],0)+isnull(a.[中隧道数],0)+isnull(a.[短隧道数],0)-isnull(b.A0698,0),
A0699=isnull(a.[特长隧道延米],0)+isnull(a.[长隧道延米],0)+isnull(a.[中隧道延米],0)+isnull(a.[短隧道延米],0)-isnull(b.A0699,0)
into #本年改建隧道
from a50
left join #非本年新建隧道数 a on a50.a0102=a.a0102 and a50.k0101=a.k0101
left join #上年底到达 b on a50.a0102=b.a0102 and a50.k0101=b.k0101
-----------------渡口
if object_id('tempdb..#本年改建渡口') is not null	drop table #本年改建渡口
select
a50.a0102,
a50.k0101,
A0701=isnull(a.[渡口数],0)		-isnull(b.A0701,0),
A0702=isnull(a.[机动渡口数],0)		-isnull(b.A0702,0)
into #本年改建渡口
from a50
left join #非本年新建渡口数 a on a50.a0102=a.a0102 and a50.k0101=a.k0101
left join #上年底到达 b on a50.a0102=b.a0102 and a50.k0101=b.k0101
-----------------
/*计算A51表中本年改建的数据：路段表中非本新建-上年底到达数*/
update a51
set
A0304=a.A0304,
A0305=a.A0305,
A0306=a.A0306,
A0307=a.A0307,
A0308=a.A0308,
A0309=a.A0309,
A0310=a.A0310,
A0311=a.A0311,
A0312=a.A0312,
A0314A=a.A0314A,
A0315A=a.A0315A,
A0316A=a.A0316A,
A0317A=a.A0317A,

A0320=a.A0320,
A0321=a.A0321,
A0322=a.A0322,
A0323=a.A0323,
A0324=a.A0324,

A1001=a.A1001,
A3101=a.A3101,
A3102=a.A3102,
K1707=a.K1707,

A0522=a.A0522,
A0523=a.A0523,
A0534=a.A0534
from #本年改建里程 a
where a51.a3219='2' and a51.a0101='2023' and a51.a0102=a.a0102 and a51.k0101=a.k0101
---------------------
update a51
set
A0503=a.A0503,
A0504=a.A0504,
A0505=a.A0505,
A0506=a.A0506,
A0507=a.A0507,
A0508=a.A0508,
A0509=a.A0509,
A0510=a.A0510,
A0519=a.A0519,
A0520=a.A0520,
A0521=a.A0521,
A0511=a.A0511,
A0512=a.A0512,
A0513=a.A0513,
A0514=a.A0514,
A0515=a.A0515,
A0516=a.A0516,
A0517=a.A0517,
A0518=a.A0518
from #本年改建桥梁 a
where a51.a3219='2' and a51.a0101='2023' and a51.a0102=a.a0102 and a51.k0101=a.k0101
---------------------
update a51
set
A0601=a.A0601,
A0602=a.A0602,
A0603=a.A0603,
A0604=a.A0604,
A0605=a.A0605,
A0606=a.A0606,
A0607=a.A0607,
A0608=a.A0608,
A0609=a.A0609,
A0610=a.A0610,
A0611=a.A0611,
A0612=a.A0612,
A0698=a.A0698,
A0699=a.A0699
from #本年改建隧道 a
where a51.a3219='2' and a51.a0101='2023' and a51.a0102=a.a0102 and a51.k0101=a.k0101
---------------------
update a51
set
A0701=a.A0701,
A0702=a.A0702
from #本年改建渡口 a
where a51.a3219='2' and a51.a0101='2023' and a51.a0102=a.a0102 and a51.k0101=a.k0101

end
select GETDATE(),'汇总A51表完成'

----------------------------------------------------------------------------

if not exists(select top 1 * from A52 where left(A0101,4)<'2023')
begin
delete a52 where left(A0101,4)='2023'
if object_id('tempdb..#本年到达里程A52') is not null	drop table #本年到达里程A52
select
A0102,
Max(HA0102) ha0102,
K0101,
[高速四车道里程]		= sum(case when K0304='10' and K0404='4' then K0114 else 0 end),
[高速六车道里程]		= sum(case when K0304='10' and K0404='6' then K0114 else 0 end),
[高速八车道及以上里程]	= sum(case when K0304='10' and K0404>='8' then K0114 else 0 end),
[一级里程]		= sum(case when K0304='11'  then K0114 else 0 end)
into #本年到达里程A52
from K01
where
  (K0124 is null OR K0124='') AND ISNULL(K0123,'2')='2' and
  left(A0101,4)='2023' and (K0304='10' or K0304='11')
  and left(k0101,1) in ('G','S','X','Y','Z','C')
group by A0102,K0101
------------------------------------------
--由于所有里程为0的不计算，所以路线名称、通车日期等字段不能填写到A52表中.

insert a52 (a0102,ha0102,k0101,a3219,ha3219,a0101,ha0101,K0105,K0106,K0103,k0104,a0410,k0116,a0131,a0130)
select a0102,ha0102,k0101,'9','其他','2023','2023'+'年',0,1,'a','b','2008','2008','9','请输入' from A50
------------------------------------------
-----------新建数直接填写到A52表中.
update a52 set
A0304=[高速四车道里程],
A0305=[高速六车道里程],
A0306=[高速八车道及以上里程],
A0307=[一级里程]
from #本年到达里程A52
where
a52.a0101='2023' and a52.a3219='9' and
#本年到达里程A52.a0102=a52.a0102 and #本年到达里程A52.k0101=a52.k0101

end
else
begin
------------------------------------------
delete A52 where left(a0101,4)= '2023' --只删除本年新加入的数据
--本年新建里程数据
if object_id('tempdb..#本年新建里程A52') is not null	drop table #本年新建里程A52
select
A0102,
Max(HA0102) ha0102,
K0101,
[高速四车道里程]		= sum(case when K0304='10' and K0404='4' then K0114 else 0 end),
[高速六车道里程]		= sum(case when K0304='10' and K0404='6' then K0114 else 0 end),
[高速八车道及以上里程]	= sum(case when K0304='10' and K0404>='8' then K0114 else 0 end),
[一级里程]		= sum(case when K0304='11'  then K0114 else 0 end)
into #本年新建里程A52
from K01
where
  (K0124 is null OR K0124='') AND ISNULL(K0123,'2')='2' and
  left(A0101,4)='2023' and a3219='1' and (K0304='10' or K0304 = '11')
  and left(k0101,1) in ('G','S','X','Y','Z','C')
group by A0102,K0101
---------------------------------
--本年非新建里程数据
if object_id('tempdb..#本年非新建里程A52') is not null	drop table #本年非新建里程A52
select
A0102,
K0101,
[高速四车道里程]		= sum(case when K0304='10' and K0404='4' then K0114 else 0 end),
[高速六车道里程]		= sum(case when K0304='10' and K0404='6' then K0114 else 0 end),
[高速八车道及以上里程]	= sum(case when K0304='10' and K0404>='8' then K0114 else 0 end),
[一级里程]		= sum(case when K0304='11'  then K0114 else 0 end)
into #本年非新建里程A52
from K01
where 	(K0124 is null OR K0124='') AND ISNULL(K0123,'2')='2'
  and left(A0101,4)='2023' and a3219<>'1' and (K0304='10' or K0304='11')
  and left(k0101,1) in ('G','S','X','Y','Z','C')
group by A0102,K0101
---------------------------------
--上年底到达里程数据


if object_id('tempdb..#上年到达里程A52') is not null	drop table #上年到达里程A52
select
A0102,
K0101,
[高速四车道里程]		= sum(isnull(a0304,0)),
[高速六车道里程]		= sum(isnull(a0305,0)),
[高速八车道及以上里程]	= sum(isnull(a0306,0)),
[一级里程]		= sum(isnull(a0307,0))
into #上年到达里程A52
from A51
where  left(A0101,4)<='2022'
  and left(k0101,1) in ('G','S','X','Y','Z','C')
group by A0102,K0101
----------------------------------------
--本年改建里程
if object_id('tempdb..#本年改建里程A52') is not null	drop table #本年改建里程A52
select
A.A0102,
A.K0101,
[高速四车道里程]		=ISNULL(N.[高速四车道里程],0)	-ISNULL(O.[高速四车道里程],0),
[高速六车道里程]		=ISNULL(N.[高速六车道里程],0)	-ISNULL(O.[高速六车道里程],0),
[高速八车道及以上里程]	=ISNULL(N.[高速八车道及以上里程],0)	-ISNULL(O.[高速八车道及以上里程],0),
[一级里程]		= ISNULL(N.[一级里程],0)	-ISNULL(O.[一级里程],0)
into #本年改建里程A52
from A50 A
  left join #本年非新建里程A52 N on (A.A0102=N.A0102 AND A.K0101=N.K0101)
  left join #上年到达里程A52   O on (A.A0102=O.A0102 AND A.K0101=O.K0101)
----------------------------------------
--下面(^@^):由于所有里程为0的不计算，所以路线名称、通车日期等字段不能填写到A52表中.
insert a52 (a0102,ha0102,k0101,a3219,ha3219,a0101,ha0101,K0105,K0106,K0103,K0104,a0410,k0116,a0131,a0130)
select a0102,ha0102,k0101,'1','新建','2023','2023'+'年',0,1,'a','a','2003','2003','9','请输入' from A50

insert a52 (a0102,ha0102,k0101,a3219,ha3219,a0101,ha0101,K0105,K0106,K0103,K0104,a0410,k0116,a0131,a0130)
select a0102,ha0102,k0101,'2','改建','2023','2023'+'年',0,1,'a','a','2003','2003','9','请输入' from A50
------------------------------------------
-----------新建数直接填写到A52表中.
update a52 set
A0304=[高速四车道里程],
A0305=[高速六车道里程],
A0306=[高速八车道及以上里程],
A0307=[一级里程]
from #本年新建里程A52
where
a52.a0101='2023' and a52.a3219='1' and
#本年新建里程A52.a0102=a52.a0102 and #本年新建里程A52.k0101=a52.k0101
------------------------------------------
-----------改建数直接填写到A52表中.
update a52 set
A0304=[高速四车道里程],
A0305=[高速六车道里程],
A0306=[高速八车道及以上里程],
A0307=[一级里程]
from #本年改建里程A52
where
a52.a0101='2023' and a52.a3219='2' and
#本年改建里程A52.a0102=a52.a0102 and #本年改建里程A52.k0101=a52.k0101

end
----------------------------------------------------------------------------
---将所有为空的数据删除
delete a51
where left(a0101,4)='2023' and
isnull(A0304,0)=0 and --高速四车道里程
isnull(A0305,0)=0 and --高速六车道里程
isnull(A0306,0)=0 and --高速八车道及以上里程
isnull(A0307,0)=0 and --一级里程
isnull(A0308,0)=0 and --二级里程
isnull(A0309,0)=0 and --一幅高速里程
isnull(A0310,0)=0 and --三级里程
isnull(A0311,0)=0 and --四级里程
isnull(A0312,0)=0 and --等外里程
isnull(A0314A,0)=0 and --有铺装路面里程_水泥混凝土
isnull(A0315A,0)=0 and --有铺装路面里程_沥青混凝土
isnull(A0316A,0)=0 and --简易铺装路面里程
isnull(A0317A,0)=0 and --未铺装路面里程
isnull(A0320,0)=0 and --晴雨通车里程
isnull(A0321,0)=0 and --断头路里程
isnull(A0322,0)=0 and --已实施GBM里程
isnull(A0323,0)=0 and --已实施文明样板路的里程
isnull(A0324,0)=0 and --城管里程
isnull(A0503,0)=0 and --危桥座数
isnull(A0504,0)=0 and --危桥延米
isnull(A0505,0)=0 and --永久性桥梁座数
isnull(A0506,0)=0 and --永久性桥梁延米
isnull(A0507,0)=0 and --半永久性桥梁座数
isnull(A0508,0)=0 and --半永久性桥梁延米
isnull(A0509,0)=0 and --临时性桥梁座数
isnull(A0510,0)=0 and --临时性桥梁延米
isnull(A0511,0)=0 and --特大桥座数
isnull(A0512,0)=0 and --特大桥延米
isnull(A0513,0)=0 and --大桥座数
isnull(A0514,0)=0 and --大桥延米
isnull(A0515,0)=0 and --中桥座数
isnull(A0516,0)=0 and --中桥延米
isnull(A0517,0)=0 and --小桥座数
isnull(A0518,0)=0 and --小桥延米
isnull(A0519,0)=0 and --互通式立交桥座数
isnull(A0520,0)=0 and --互通式立交桥延米
isnull(A0521,0)=0 and --匝道(平米)
isnull(A0522,0)=0 and --涵洞(道)
isnull(A0523,0)=0 and --涵洞(米)
isnull(A0534,0)=0 and --漫水工程(处)

isnull(A0601,0)=0 and --四五类隧道数
isnull(A0602,0)=0 and --四五类隧道延米
isnull(A0603,0)=0 and --水下隧道数
isnull(A0604,0)=0 and --水下隧道延米
isnull(A0605,0)=0 and --特长隧道数
isnull(A0606,0)=0 and --特长隧道延米
isnull(A0607,0)=0 and --长隧道数
isnull(A0608,0)=0 and --长隧道延米
isnull(A0609,0)=0 and --中隧道数
isnull(A0610,0)=0 and --中隧道延米
isnull(A0611,0)=0 and --短隧道数
isnull(A0612,0)=0 and --短隧道延米
isnull(A0698,0)=0 and --隧道总道数
isnull(A0699,0)=0 and --隧道总延米
isnull(A0701,0)=0 and --渡口数
isnull(A0702,0)=0 and --机动渡口数
isnull(A1001,0)=0 and --养护里程
isnull(A3101,0)=0 and --可绿化里程
isnull(A3102,0)=0 and --已绿化里程
isnull(K1707,0)=0  --重复里程

--下面填写行政等级
update A51 set A0203= case when left(replace(replace(replace(replace(K0101,'H','G'),'T','S'),'J','X'),'N','Y'),1)='G' then
            case when left(replace(replace(replace(replace(K0101,'H','G'),'T','S'),'J','X'),'N','Y'),1)='G' and len(ltrim(rtrim(k0101)))<=9  then 'GA' else 'G9' end
            else upper(left(replace(replace(replace(replace(K0101,'H','G'),'T','S'),'J','X'),'N','Y'),1))
            end
where a51.a0101='2023'

update A51 set HA0203=objjc from D001 where A0203=objname and left(A0101,4)='2023'
update a set a.K0112=b.K0112 from A51 a,A50 b where a.K0101=b.K0101 and a.a0102=b.A0102 and a.a0101='2023'
update a set a.K0106=b.K0106 from A51 a,A50 b where a.K0101=b.K0101 and a.a0102=b.A0102 and a.a0101='2023'
update a set a.K0105=b.K0105 from A51 a,A50 b where a.K0101=b.K0101 and a.a0102=b.A0102 and a.a0101='2023'
update a set a.k0103=b.k0103 from A51 a,A50 b where a.K0101=b.K0101 and a.a0102=b.A0102 and a.a0101='2023'
update a set a.k0104=b.k0104 from A51 a,A50 b where a.K0101=b.K0101 and a.a0102=b.A0102 and a.a0101='2023'
update a set a.K0116=b.K0116 from A51 a,A50 b where a.K0101=b.K0101 and a.a0102=b.A0102 and a.a0101='2023'
      update a set a.A0130=b.A0130 from A51 a,A50 b where a.A0130 is null and a.K0101=b.K0101 and a.a0102=b.A0102 and a.a0101='2023'
      update a set a.A0131=b.A0131 from A51 a,A50 b where a.A0131 is null and a.K0101=b.K0101 and a.a0102=b.A0102 and a.a0101='2023'
            update a set a.HA0131=b.HA0131 from A51 a,A50 b where a.HA0131 is null and a.K0101=b.K0101 and a.a0102=b.A0102 and a.a0101='2023'
      update a set a.K0116=b.K0116 from A51 a,A50 b where a.K0116 is null and a.K0101=b.K0101 and a.a0102=b.A0102 and a.a0101='2023' --and a.a3219=b.a3219 and a.K0105=b.K0105 and a.a0101=b.a0101

--将实际改建的起止点桩号和名称赋值到A51表中----20051028
if object_id('tempdb..#改建路段起止点信息') is not null drop table #改建路段起止点信息
select
  a0102, --管理单位代码
  k0101, --路线代码
  k0105 = min(k0108),	--改建路段最小起点桩号
  k0106 = max(k0109),	--改建路段最大终点桩号
  k0103 = space(50),	--改建路段最小起点桩号对应的起点名称
  k0104 = space(50) 	--改建路段最大终点桩号对应的终点名称
into #改建路段起止点信息
from k01
where left(a0101,4) = '2023' and a3219 = '2' and left(k0101,1) in ('G','S','X','Y','Z','C')
group by a0102,k0101

update #改建路段起止点信息 set k0103 = k0110 from k01 where #改建路段起止点信息.a0102 = k01.a0102 and #改建路段起止点信息.k0101 = k01.k0101 and #改建路段起止点信息.k0105 = k01.k0108
update #改建路段起止点信息 set k0104 = k0111 from k01 where #改建路段起止点信息.a0102 = k01.a0102 and #改建路段起止点信息.k0101 = k01.k0101 and #改建路段起止点信息.k0106 = k01.k0109

update a51 set k0106 = gj.k0106 from #改建路段起止点信息 gj where a51.a0102 = gj.a0102 and a51.k0101 = gj.k0101 and left(a51.a0101,4) = '2023' and a51.a3219 = '2'
update a51 set k0105 = gj.k0105 from #改建路段起止点信息 gj where a51.a0102 = gj.a0102 and a51.k0101 = gj.k0101 and left(a51.a0101,4) = '2023' and a51.a3219 = '2'
update a51 set k0103 = gj.k0103 from #改建路段起止点信息 gj where a51.a0102 = gj.a0102 and a51.k0101 = gj.k0101 and left(a51.a0101,4) = '2023' and a51.a3219 = '2'
update a51 set k0104 = gj.k0104 from #改建路段起止点信息 gj where a51.a0102 = gj.a0102 and a51.k0101 = gj.k0101 and left(a51.a0101,4) = '2023' and a51.a3219 = '2'
---更新路线起点或止点不正确的桩号
update a set a.K0105=b.K0105, a.K0106=b.K0106 from A51 a,A50 b where a.K0101=b.K0101 and a.a0102=b.A0102 and (a.k0105=11111 or a.k0106=22222)
----------------------------------------------------------------------------------

---将所有为空的数据删除
delete a52
where left(a0101,4)='2023' and
ISNULL(A0304,0) = 0 AND  --高速四车道里程
ISNULL(A0305,0) = 0 AND  --高速六车道里程
ISNULL(A0306,0) = 0 AND  --高速八车道及以上里程
ISNULL(A0307,0) = 0      --一级里程

--A52是A50的子表，同一条路线以下字段值相同
update a set a.K0112=b.K0112 from A52 a,A50 b where a.K0101=b.K0101 and a.a0102=b.A0102 and a.a0101='2023'
update a set a.K0106=b.K0106 from A52 a,A50 b where a.K0101=b.K0101 and a.a0102=b.A0102 and a.a0101='2023'
update a set a.K0105=b.K0105 from A52 a,A50 b where a.K0101=b.K0101 and a.a0102=b.A0102 and a.a0101='2023'
update a set a.k0103=b.k0103 from A52 a,A50 b where a.K0101=b.K0101 and a.a0102=b.A0102 and a.a0101='2023'
update a set a.k0104=b.k0104 from A52 a,A50 b where a.K0101=b.K0101 and a.a0102=b.A0102 and a.a0101='2023'
update a set a.K0116=b.K0116 from A52 a,A50 b where a.K0101=b.K0101 and a.a0102=b.A0102 and a.a0101='2023'
      update a set a.A0130=b.A0130 from A52 a,A50 b where a.K0101=b.K0101 and a.a0102=b.A0102 and a.a0101='2023'
      update a set a.A0131=b.A0131 from A52 a,A50 b where a.K0101=b.K0101 and a.a0102=b.A0102 and a.a0101='2023'
      update a set a.HA0131=b.HA0131 from A52 a,A50 b where a.K0101=b.K0101 and a.a0102=b.A0102 and a.a0101='2023'
      update a set a.K0116=rtrim(b.K0116) from A52 a,#backupA52 b where a.K0116 is null and a.K0101=b.K0101 and a.a0102=b.A0102 and a.a0101='2023' and a.a3219=b.a3219 and a.K0105=b.K0105 and a.a0101=b.a0101
      update a set a.A0410=rtrim(b.A0410) from A52 a,#backupA52 b where a.A0410 is null and a.K0101=b.K0101 and a.a0102=b.A0102 and a.a0101='2023' and a.a3219=b.a3219 and a.K0105=b.K0105 and a.a0101=b.a0101

--将实际改建的起止点桩号和名称赋值到A52表中----20051028
if object_id('tempdb..#改建路段起止点信息A52') is not null drop table #改建路段起止点信息A52
select
  a0102, --管理单位代码
  k0101, --路线代码
  k0105 = min(k0108),	--改建路段最小起点桩号
  k0106 = max(k0109),	--改建路段最大终点桩号
  k0103 = space(50),	--改建路段最小起点桩号对应的起点名称
  k0104 = space(50) 	--改建路段最大终点桩号对应的终点名称
into #改建路段起止点信息A52
from k01
where left(a0101,4) = '2023' and a3219 = '2' and left(k0101,1) in ('G','S','X','Y','Z','C') and k0304 in ('10','11')
group by a0102,k0101

update #改建路段起止点信息A52 set k0103 = k0110 from k01 where #改建路段起止点信息A52.a0102 = k01.a0102 and #改建路段起止点信息A52.k0101 = k01.k0101 and #改建路段起止点信息A52.k0105 = k01.k0108
update #改建路段起止点信息A52 set k0104 = k0111 from k01 where #改建路段起止点信息A52.a0102 = k01.a0102 and #改建路段起止点信息A52.k0101 = k01.k0101 and #改建路段起止点信息A52.k0106 = k01.k0109

update a52 set k0106 = gj.k0106 from #改建路段起止点信息A52 gj where a52.a0102 = gj.a0102 and a52.k0101 = gj.k0101 and left(a52.a0101,4) = '2023' and a52.a3219 = '2'
update a52 set k0105 = gj.k0105 from #改建路段起止点信息A52 gj where a52.a0102 = gj.a0102 and a52.k0101 = gj.k0101 and left(a52.a0101,4) = '2023' and a52.a3219 = '2'
update a52 set k0103 = gj.k0103 from #改建路段起止点信息A52 gj where a52.a0102 = gj.a0102 and a52.k0101 = gj.k0101 and left(a52.a0101,4) = '2023' and a52.a3219 = '2'
update a52 set k0104 = gj.k0104 from #改建路段起止点信息A52 gj where a52.a0102 = gj.a0102 and a52.k0101 = gj.k0101 and left(a52.a0101,4) = '2023' and a52.a3219 = '2'

--将实际其他的起止点桩号和名称赋值到A52表中
            if object_id('tempdb..#改建路段起止点信息A52_qt') is not null drop table #改建路段起止点信息A52_qt
select
  a0102, --管理单位代码
  k0101, --路线代码
  k0105 = min(k0108),	--改建路段最小起点桩号
  k0106 = max(k0109),	--改建路段最大终点桩号
  k0103 = space(50),	--改建路段最小起点桩号对应的起点名称
  k0104 = space(50) 	--改建路段最大终点桩号对应的终点名称
into #改建路段起止点信息A52_qt
from k01
where left(a0101,4) = '2023' and a3219 = '9' and left(k0101,1) in ('G','S','X','Y','Z','C') and k0304 in ('10','11')
group by a0102,k0101

update #改建路段起止点信息A52_qt set k0103 = k0110 from k01 where #改建路段起止点信息A52_qt.a0102 = k01.a0102 and #改建路段起止点信息A52_qt.k0101 = k01.k0101 and #改建路段起止点信息A52_qt.k0105 = k01.k0108
update #改建路段起止点信息A52_qt set k0104 = k0111 from k01 where #改建路段起止点信息A52_qt.a0102 = k01.a0102 and #改建路段起止点信息A52_qt.k0101 = k01.k0101 and #改建路段起止点信息A52_qt.k0106 = k01.k0109

update a52 set k0106 = gj.k0106 from #改建路段起止点信息A52_qt gj where a52.a0102 = gj.a0102 and a52.k0101 = gj.k0101 and a52.a3219 = '9'
update a52 set k0105 = gj.k0105 from #改建路段起止点信息A52_qt gj where a52.a0102 = gj.a0102 and a52.k0101 = gj.k0101 and a52.a3219 = '9'
update a52 set k0103 = gj.k0103 from #改建路段起止点信息A52_qt gj where a52.a0102 = gj.a0102 and a52.k0101 = gj.k0101 and a52.a3219 = '9'
update a52 set k0104 = gj.k0104 from #改建路段起止点信息A52_qt gj where a52.a0102 = gj.a0102 and a52.k0101 = gj.k0101 and a52.a3219 = '9'
----------------------------------------------------------------------------------
--A51以前国主行政等级改为一般国道
UPDATE  A51 SET A0203='G9',HA0203='一般国道'
            WHERE  A0203='G0'
----------------------------------------------------------------------------------
--导数据到A11
delete a11 where a0101='2023'

insert A11(A0102,HA0102,A0101,HA0101,A0203,HA0203,A3219,HA3219,A0304,A0305,A0306,A0307,A0308,A0309,A0310,A0311,A0312,A0320,A0503,A0504,A0505,A0506,A0507,A0508,A0509,A0510,A0511,A0512,A0513,A0514,A0515,A0516,A0517,A0518,A0519,A0520,A0522,
    A0601,A0602,A0603,A0604,A0605,A0606,A0607,A0608,A0609,A0610,A0611,A0612,A0701,A0702,A1001,A3102,A0521,A0523,A3101,A0322,A0323,A0534,A0698,A0699,A0314A,A0315A,A0316A,A0317A,A0324,K1707,A0321)
select A0102,max(HA0102),'2023','2023'+'年',A0203,max(HA0203),A3219,max(HA3219),sum(A0304),sum(A0305),sum(A0306),sum(A0307),sum(A0308),sum(A0309),sum(A0310),sum(A0311),sum(A0312),sum(A0320),
    sum(A0503),sum(A0504),sum(A0505),sum(A0506),sum(A0507),sum(A0508),sum(A0509),sum(A0510),sum(A0511),sum(A0512),sum(A0513),sum(A0514),sum(A0515),sum(A0516),sum(A0517),sum(A0518),sum(A0519),sum(A0520),sum(A0522),
    sum(A0601),sum(A0602),sum(A0603),sum(A0604),sum(A0605),sum(A0606),sum(A0607),sum(A0608),sum(A0609),sum(A0610),sum(A0611),sum(A0612),sum(A0701),sum(A0702),sum(A1001),sum(A3102),sum(A0521),sum(A0523),sum(A3101),sum(A0322),sum(A0323),sum(A0534),sum(A0605+A0607+A0609+A0611),sum(A0606+A0608+A0610+A0612),sum(a0314a),sum(a0315a),sum(a0316a),sum(a0317a),sum(a0324),sum(k1707),sum(a0321)
from A51
where left(A0101,4)='2023'
group by A0102,A0203,A3219

--A11更新以前国主行政区划改为一般国道
      UPDATE  A11 SET A0203='G9',HA0203='一般国道'
            WHERE  A0203='G0'
----------------------------------------------------------------------------------
update A51 set
A0304=NULLIF(A0304,0),  --高速四车道里程
A0305=NULLIF(A0305,0),  --高速六车道里程
A0306=NULLIF(A0306,0),  --高速八车道及以上里程
A0307=NULLIF(A0307,0),  --一级里程
A0308=NULLIF(A0308,0),  --二级里程
A0309=NULLIF(A0309,0),  --一幅高速里程
A0310=NULLIF(A0310,0),  --三级里程
A0311=NULLIF(A0311,0),  --四级里程
A0312=NULLIF(A0312,0),  --等外里程
A0320=NULLIF(A0320,0),  --晴雨通车里程
A3101=NULLIF(A3101,0),  --可绿化里程
A3102=NULLIF(A3102,0),  --已绿化里程
A0322=NULLIF(A0322,0),  --已实施GBM里程
A1001=NULLIF(A1001,0),  --养护里程
A0323=NULLIF(A0323,0),  --已实施文明样板路的里程
A0534=NULLIF(A0534,0),  --漫水工程
A0503=NULLIF(A0503,0),  --危桥座数
A0504=NULLIF(A0504,0),  --危桥延米
A0505=NULLIF(A0505,0),  --永久性桥梁座数
A0506=NULLIF(A0506,0),  --永久性桥梁延米
A0507=NULLIF(A0507,0),  --半永久性桥梁座数
A0508=NULLIF(A0508,0),  --半永久性桥梁延米
A0509=NULLIF(A0509,0),  --临时性桥梁座数
A0510=NULLIF(A0510,0),  --临时性桥梁延米
A0519=NULLIF(A0519,0),  --互通式立交桥座数
A0520=NULLIF(A0520,0),  --互通式立交桥延米
A0521=NULLIF(A0521,0),  --匝道(平米)
A0511=NULLIF(A0511,0),  --特大桥座数
A0512=NULLIF(A0512,0),  --特大桥延米
A0513=NULLIF(A0513,0),  --大桥座数
A0514=NULLIF(A0514,0),  --大桥延米
A0515=NULLIF(A0515,0),  --中桥座数
A0516=NULLIF(A0516,0),  --中桥延米
A0517=NULLIF(A0517,0),  --小桥座数
A0518=NULLIF(A0518,0),  --小桥延米
A0522=NULLIF(A0522,0),  --涵洞(道)
A0523=NULLIF(A0523,0),  --涵洞(米)

A0601=NULLIF(A0601,0),  --四五类隧道数
A0602=NULLIF(A0602,0),  --四五类隧道延米
A0603=NULLIF(A0603,0),  --水下隧道数
A0604=NULLIF(A0604,0),  --水下隧道延米
A0605=NULLIF(A0605,0),  --特长隧道数
A0606=NULLIF(A0606,0),  --特长隧道延米
A0607=NULLIF(A0607,0),  --长隧道数
A0608=NULLIF(A0608,0),  --长隧道延米
A0609=NULLIF(A0609,0),  --中隧道数
A0610=NULLIF(A0610,0),  --中隧道延米
A0611=NULLIF(A0611,0),  --短隧道数
A0612=NULLIF(A0612,0),  --短隧道延米
A0698=NULLIF(A0698,0),  --隧道总数
A0699=NULLIF(A0699,0),  --隧道总延米
A0702=NULLIF(A0702,0),  --机动渡口数
A0701=NULLIF(A0701,0),  --渡口数
A0314A=NULLIF(A0314A,0),--水泥混凝土
A0315A=NULLIF(A0315A,0),--沥青混凝土
A0316A=NULLIF(A0316A,0),--简易铺装
A0317A=NULLIF(A0317A,0), --无铺装
            A0324=NULLIF(A0324,0),
K1707=NULLIF(K1707,0),
            A0321=NULLIF(A0321,0)

update A52 set
A0304=nullif(A0304,0),--高速四车道里程
A0305=nullif(A0305,0),--高速六车道里程
A0306=nullif(A0306,0),--高速八车道及以上里程
A0307=nullif(A0307,0)--一级里程

update A11 set
A0304=NULLIF(A0304,0),  --高速四车道里程
A0305=NULLIF(A0305,0),  --高速六车道里程
A0306=NULLIF(A0306,0),  --高速八车道及以上里程
A0307=NULLIF(A0307,0),  --一级里程
A0308=NULLIF(A0308,0),  --二级里程
A0309=NULLIF(A0309,0),  --一幅高速里程
A0310=NULLIF(A0310,0),  --三级里程
A0311=NULLIF(A0311,0),  --四级里程
A0312=NULLIF(A0312,0),  --等外里程
A0320=NULLIF(A0320,0),  --晴雨通车里程
A3101=NULLIF(A3101,0),  --可绿化里程
A3102=NULLIF(A3102,0),  --已绿化里程
A0322=NULLIF(A0322,0),  --已实施GBM里程
A1001=NULLIF(A1001,0),  --养护里程
A0323=NULLIF(A0323,0),  --已实施文明样板路的里程
A0534=NULLIF(A0534,0),  --漫水工程
A0503=NULLIF(A0503,0),  --危桥座数
A0504=NULLIF(A0504,0),  --危桥延米
A0505=NULLIF(A0505,0),  --永久性桥梁座数
A0506=NULLIF(A0506,0),  --永久性桥梁延米
A0507=NULLIF(A0507,0),  --半永久性桥梁座数
A0508=NULLIF(A0508,0),  --半永久性桥梁延米
A0509=NULLIF(A0509,0),  --临时性桥梁座数
A0510=NULLIF(A0510,0),  --临时性桥梁延米
A0519=NULLIF(A0519,0),  --互通式立交桥座数
A0520=NULLIF(A0520,0),  --互通式立交桥延米
A0521=NULLIF(A0521,0),  --匝道(平米)
A0511=NULLIF(A0511,0),  --特大桥座数
A0512=NULLIF(A0512,0),  --特大桥延米
A0513=NULLIF(A0513,0),  --大桥座数
A0514=NULLIF(A0514,0),  --大桥延米
A0515=NULLIF(A0515,0),  --中桥座数
A0516=NULLIF(A0516,0),  --中桥延米
A0517=NULLIF(A0517,0),  --小桥座数
A0518=NULLIF(A0518,0),  --小桥延米
A0522=NULLIF(A0522,0),  --涵洞(道)
A0523=NULLIF(A0523,0),  --涵洞(米)

A0601=NULLIF(A0601,0),  --四五类隧道数
A0602=NULLIF(A0602,0),  --四五类隧道延米
A0603=NULLIF(A0603,0),  --水下隧道数
A0604=NULLIF(A0604,0),  --水下隧道延米
A0605=NULLIF(A0605,0),  --特长隧道数
A0606=NULLIF(A0606,0),  --特长隧道延米
A0607=NULLIF(A0607,0),  --长隧道数
A0608=NULLIF(A0608,0),  --长隧道延米
A0609=NULLIF(A0609,0),  --中隧道数
A0610=NULLIF(A0610,0),  --中隧道延米
A0611=NULLIF(A0611,0),  --短隧道数
A0612=NULLIF(A0612,0),  --短隧道延米
A0698=NULLIF(A0698,0),  --隧道总数
A0699=NULLIF(A0699,0),  --隧道总延米
A0702=NULLIF(A0702,0),  --机动渡口数
A0701=NULLIF(A0701,0),  --渡口数
A0314A=NULLIF(A0314A,0),--水泥混凝土
A0315A=NULLIF(A0315A,0),--沥青混凝土
A0316A=NULLIF(A0316A,0),--简易铺装
A0317A=NULLIF(A0317A,0), --无铺装
            A0324=NULLIF(A0324,0),
K1707=NULLIF(K1707,0),
            A0321=NULLIF(A0321,0)
----------------------------------------------------------------------------------
------------更新明细表中变更信息页签内容------------------------
update k01 set BG0101=LD01,BG0102=LD02,HBG0102=LD03,BG0103=LD04,BG0104=LD05,BG0105=LD06,BG0131=LD07,HBG0131=LD08,
    BG0132=LD09,HBG0132=LD10,BG0133=LD11,HBG0133=LD12,BG0109=LD13,BG0110=LD14,BG0111=LD15,BG0199=LD16
from k01 left join #backupK01 a on k01.a0102=a.a0102 and k01.k0101=a.k0101 and k01.a0101=a.a0101 and k01.k0108=a.k0108
where left(k01.A0101,4)='2023' and a.a0102 is not null

update k60 set BG0101=QL01,BG0202=QL02,HBG0202=QL03,BG0231=QL04,HBG0231=QL05,BG0232=QL06,HBG0232=QL07,
    BG0233=QL08,HBG0233=QL09,BG0103=QL10,BG0203=QL11,BG0109=QL12,BG0110=QL13,BG0111=QL14,BG0299=QL15
from k60 left join #backupK60 a on k60.a0102=a.a0102 and k60.k0101=a.k0101 and k60.a0101=a.a0101 and k60.k6001=a.k6001
where left(k60.A0101,4)='2023' and a.a0102 is not null

update k63 set BG0101=SD01,BG0302=SD02,HBG0302=SD03,BG0331=SD04,HBG0331=SD05,BG0332=SD06,HBG0332=SD07,
    BG0333=SD08,HBG0333=SD09,BG0103=SD10,BG0303=SD11,BG0109=SD12,BG0110=SD13,BG0111=SD14,BG0399=SD15
from k63 left join #backupK63 a on k63.a0102=a.a0102 and k63.k0101=a.k0101 and k63.a0101=a.a0101 and k63.k6301=a.k6301
where left(k63.A0101,4)='2023' and a.a0102 is not null

----------------------------------------------------------------------------------
------------汇总A12养护里程------------------------------------
delete A12 where a0101='2023'
insert A12(a0102,ha0102,a0101,ha0101,a0203,A0321,A0322,A0323,A1002,A1003,A1004,A1005,A1006)
select
  a0102,
  max(ha0102),
  '2023',
  '2023'+'年',
  case when left(replace(replace(replace(replace(K0101,'H','G'),'T','S'),'J','X'),'N','Y'),1)='G' then
    case when left(replace(replace(replace(replace(K0101,'H','G'),'T','S'),'J','X'),'N','Y'),1)='G' and len(ltrim(rtrim(k0101)))<=9  then 'GA' else 'G9' end
    else upper(left(replace(replace(replace(replace(K0101,'H','G'),'T','S'),'J','X'),'N','Y'),1))
    end  as a0203,--行政等级
  sum(case when k0123 = '1' then isnull(k0114,0) else 0 end ) as a0321,--断头路里程
  sum(case when (K0124 is null OR K0124='')  and ISNULL(K0123,'2')='2' then isnull(a0322,0) else 0 end) as a0322,--已实施GBM里程
  sum(case when (K0124 is null OR K0124='')  and ISNULL(K0123,'2')='2' then isnull(a0323,0) else 0 end) as a0323,--已实施文明样板路的里程
  sum(case when (K0124 is null OR K0124='')  and ISNULL(K0123,'2')='2' then isnull(a1002,0) else 0 end) as a1002,--养路费养护里程
  sum(case when (K0124 is null OR K0124='')  and ISNULL(K0123,'2')='2' then isnull(a1003,0) else 0 end) as a1003,--通行费养护里程
  sum(case when (K0124 is null OR K0124='')  and ISNULL(K0123,'2')='2' then isnull(a1004,0) else 0 end) as a1004,--其他费养护里程
  sum(case when (K0124 is null OR K0124='')  and ISNULL(K0123,'2')='2' then isnull(a1005,0) else 0 end) as a1005,--经常性固定养护
  sum(case when (K0124 is null OR K0124='')  and ISNULL(K0123,'2')='2' then isnull(a1006,0) else 0 end) as a1006 --季节性固定养护
from K01
where left(A0101,4)='2023' and left(k0101,1) in ('G','S','X','Y','Z','C')
group by A0102,case when left(replace(replace(replace(replace(K0101,'H','G'),'T','S'),'J','X'),'N','Y'),1)='G' then
            case when left(replace(replace(replace(replace(K0101,'H','G'),'T','S'),'J','X'),'N','Y'),1)='G' and len(ltrim(rtrim(k0101)))<=9  then 'GA' else 'G9' end
      else upper(left(replace(replace(replace(replace(K0101,'H','G'),'T','S'),'J','X'),'N','Y'),1))
      end
------------------------------------------
delete A12 where
isnull(A1002,0) =0 and  --养路费养护里程
isnull(A1003,0) =0 and  --通行费养护里程
isnull(A1004,0) =0 and  --其他费养护里程
isnull(A1005,0) =0 and  --经常性固定养护
isnull(A1006,0) =0 and  --季节性固定养护
isnull(A0322,0) =0 and  --已实施GBM里程
isnull(A0323,0) =0 and  --已实施文明样板路的里程
isnull(A0321,0) =0      --断头路里程

update a12 set ha0203=objjc from a12 join d001 on(objname=a0203) where left(a0101,4) = '2023'

            update a12
            set 	A1002=nullif(A1002,0),--养路费养护里程
  A1003=nullif(A1003,0),--通行费养护里程
  A1004=nullif(A1004,0),--其他费养护里程
  A1005=nullif(A1005,0),--经常性固定养护
  A1006=nullif(A1006,0),--季节性固定养护
  A0322=nullif(A0322,0),--已实施GBM里程
  A0323=nullif(A0323,0),--已实施文明样板路的里程
  A0321=nullif(A0321,0)--断头路里程
select GETDATE(),'汇总A12养护里程完成'


------------汇总A13绿化里程------------------------------------
--delete A13 where left(a0101,4)= '2023'
--汇总绿化表
if NOT EXISTS(select top 1 a0101 from a13 where a0101=(select objname from d031 where objexplain = '2023'))
begin
  insert a13 (
    HA0102,--管理单位代码
    A0102,--管理单位名称
    Ha0101,--时间名称
    a0101,--时间代码
    A3199, --行政等级代码
    a3101,a3102
    )
  select
    max(ha0102) ha0102,
    a0102 a0102,
    '2023'+'年' ha0101,
    '2023' a0101,
    case when left(replace(replace(replace(replace(K0101,'H','G'),'T','S'),'J','X'),'N','Y'),1)='G' then
      case when left(replace(replace(replace(replace(K0101,'H','G'),'T','S'),'J','X'),'N','Y'),1)='G' and len(ltrim(rtrim(k0101)))<=9  then 'GA' else 'G9' end
      else upper(left(replace(replace(replace(replace(K0101,'H','G'),'T','S'),'J','X'),'N','Y'),1))
    end  a3199,
    sum(isnull(a3101,0)) a3101,sum(isnull(a3102,0)) a3102
  from k01
  where
  ISNULL(K0123,'2')='2' and (K0124 is null OR K0124='')
  and a0101 = '2023' and left(k0101,1) in ('G','S','X','Y','Z','C')
  group by a0102,case when left(replace(replace(replace(replace(K0101,'H','G'),'T','S'),'J','X'),'N','Y'),1)='G' then
              (case when left(replace(replace(replace(replace(K0101,'H','G'),'T','S'),'J','X'),'N','Y'),1)='G' and len(ltrim(rtrim(k0101)))<=9  then 'GA' else 'G9' end)
              else upper(left(replace(replace(replace(replace(K0101,'H','G'),'T','S'),'J','X'),'N','Y'),1))
            end
end
else
begin
  if object_id('tempdb..#a13') is not null
  drop table #a13
  select
    max(ha0102) ha0102,
    a0102 a0102,
  '2023'+'年' ha0101,
  '2023' a0101,
  case when left(replace(replace(replace(replace(K0101,'H','G'),'T','S'),'J','X'),'N','Y'),1)='G' then
    case when left(replace(replace(replace(replace(K0101,'H','G'),'T','S'),'J','X'),'N','Y'),1)='G' and len(ltrim(rtrim(k0101)))<=9  then 'GA' else 'G9' end
    else upper(left(replace(replace(replace(replace(K0101,'H','G'),'T','S'),'J','X'),'N','Y'),1))
    end  a3199,
    sum(isnull(a3101,0)) a3101,sum(isnull(a3102,0)) a3102
  into #a13
  from k01
  where
  ISNULL(K0123,'2')='2' and (K0124 is null OR K0124='')
  and a0101 = '2023' and left(k0101,1) in ('G','S','X','Y','Z','C')
  group by a0102,case when left(replace(replace(replace(replace(K0101,'H','G'),'T','S'),'J','X'),'N','Y'),1)='G' then
              case when left(replace(replace(replace(replace(K0101,'H','G'),'T','S'),'J','X'),'N','Y'),1)='G' and len(ltrim(rtrim(k0101)))<=9  then 'GA' else 'G9' end
              else upper(left(replace(replace(replace(replace(K0101,'H','G'),'T','S'),'J','X'),'N','Y'),1))
              end

  update a13 set 	a13.a3101=#a13.a3101,
      a13.a3102=#a13.a3102
  from a13 join #a13 on (a13.a0102=#a13.a0102 and a13.a3199=#a13.a3199)
  where a13.a0101 = '2023'

  drop table #a13
end
------------------------------------------
update a13 set ha3199 = objjc from a13 join d104 on (a3199=objname)

delete A13 where left(a0101,4)= '2023' and isnull(a3101,0)=0 and isnull(a3102,0)=0

            update a13
            set
                A3101=nullif(A3101,0),
                  A3102=nullif(A3102,0),
                A3103A=nullif(A3103A,0),
                A3104A=nullif(A3104A,0),
    A3106A=nullif(A3106A,0)

----------------------------------------------------------------------------------
update K01 set HA0102=objjc from D028 where A0102=objname and left(A0101,4)='2023'
update A12 set HA0102=objjc from D028 where A0102=objname and left(A0101,4)='2023'
update A13 set HA0102=objjc from D028 where A0102=objname and left(A0101,4)='2023'
----------------------------------------------------------------------------------
----更新路线简称
EXEC PR_EXECSQL2
  'SELECT ''UPDATE ''+ TABLENAME+'' SET K0112=A50.K0112''+'' FROM A50 ,''+ TABLENAME +'' WHERE A50.A0102=''+ TABLENAME+''.A0102  AND A50.K0101=''+ TABLENAME+''.K0101
    AND A0101=(SELECT MAX(A0101) FROM ''+TABLENAME+'')''
    FROM OYDST_FIELDCONT1 WHERE OBJID IN (SELECT PARENTID   FROM OYDST_FIELDCONT1 WHERE FIELDNAME=''K0112'' )
    AND TABLENAME IN( ''K01'',''K60'',''K63'',''K65'')'

EXEC PR_EXECSQL2
  'SELECT ''UPDATE ''+ TABLENAME+'' SET K0112=A50.K0112''+'' FROM A50 ,''+ TABLENAME +'' WHERE A50.A0102=''+ TABLENAME+''.A0102  AND A50.K0101=''+ TABLENAME+''.K0101 ''
  FROM OYDST_FIELDCONT1 WHERE OBJID IN (SELECT PARENTID   FROM OYDST_FIELDCONT1 WHERE FIELDNAME=''K0112'' )
  AND TABLENAME IN(''A51'',''A52'',''A53'',''A61'')'
select GETDATE(),'汇总A13绿化里程完成'

--汇总数据>
select GETDATE(),'完成'

