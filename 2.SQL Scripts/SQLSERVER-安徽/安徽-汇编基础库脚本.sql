drop TRIGGER TR_LOCK_v51_V0502
--创建触发器
CREATE TRIGGER TR_LOCK_v51_V0502
ON V51
FOR UPDATE
AS
BEGIN
    IF UPDATE(V0502)  -- 检查是否正在更新 V0502 字段
    BEGIN
        ROLLBACK;
    END
END;

drop TRIGGER TR_LOCK_v52_V0513
--创建触发器
CREATE TRIGGER TR_LOCK_v52_V0513
ON V52
FOR UPDATE
AS
BEGIN
    IF UPDATE(V0513)  -- 检查是否正在更新 V0513 字段
    BEGIN
        ROLLBACK;
    END
END;

-- 删除索引
DROP INDEX k060._WA_Sys_HK6005_31C11CDA;
ALTER TABLE K060
ALTER COLUMN HK6005 VARCHAR(100);
-- 创建非聚集索引
CREATE INDEX _WA_Sys_HK6005_31C11CDA
ON k060 (HK6005);

--执行级联更新脚本

--补充缺少得外键
ALTER TABLE [dbo].[K063] ADD CONSTRAINT [FK_K063_A50] FOREIGN KEY ([A0102], [K0101]) REFERENCES [dbo].[A50] ([A0102], [K0101]) ON DELETE NO ACTION ON UPDATE NO ACTION

ALTER TABLE [dbo].[K065] ADD CONSTRAINT [FK_K065_A50] FOREIGN KEY ([A0102], [K0101]) REFERENCES [dbo].[A50] ([A0102], [K0101]) ON DELETE NO ACTION ON UPDATE NO ACTION

ALTER TABLE [dbo].[K060] ADD CONSTRAINT [FK_K060_A50] FOREIGN KEY ([A0102], [K0101]) REFERENCES [dbo].[A50] ([A0102], [K0101]) ON DELETE NO ACTION ON UPDATE NO ACTION

ALTER TABLE [dbo].[K001] ADD CONSTRAINT [FK_K001_A50] FOREIGN KEY ([A0102], [K0101]) REFERENCES [dbo].[A50] ([A0102], [K0101]) ON DELETE NO ACTION ON UPDATE NO ACTION




--插入新单位
INSERT INTO [dbo].[DA0102] ([objid], [parentid], [objtype], [objexplain], [objpy], [objjc], [objname]) VALUES (6145, 106, 4, NULL, 'TLBS', '铜陵保盛交通建设管理有限公司                      ', '34107C1  ');

--INSERT INTO [dbo].[DA0102] ([objid], [parentid], [objtype], [objexplain], [objpy], [objjc], [objname]) VALUES (6143, 1, 2, NULL, 'ANTY', '安徽天扬高速公路开发有限公司                      ', '349E  ');
--INSERT INTO [dbo].[DA0102] ([objid], [parentid], [objtype], [objexplain], [objpy], [objjc], [objname]) VALUES (6144, 106, 4, NULL, 'TLBS', '铜陵保盛交通建设管理有限公司                      ', '34107C1  ');


backup database [HRP-DBMS汇编库] to disk = 'E:\HRP-DBMS2014'
backup database [HRP-GHSS汇编库] to disk = 'E:\HRP-GHSS2014'





update ZRC set v5708='1',hv5708='是' 
from V53 
right join OPENROWSET
('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\自然村(1).xls',sheet1$) on A=v5701
where v5701 is not null
update V53 set v5708='2',hv5708='否' 
from V53 
right join OPENROWSET
('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\自然村(1).xls',sheet2$) on A=v5701
where v5701 is not null


update ZRC set v5708='1',hv5708='是' 
from ZRC 
right join OPENROWSET
('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\自然村(1).xls',sheet1$) on A=v5701
where v5701 is not null

update ZRC set v5708='2',hv5708='否' 
from ZRC 
right join OPENROWSET
('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\自然村(1).xls',sheet2$) on A=v5701
where v5701 is not null



update b set b.v0513='1',b.hv0513='是'
from V52 b right join OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\建制村（是）.xls',sheet1$) a on b.v0514=a.a

update b set b.v0513='2',b.hv0513='否'
from V52 b right join OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\建制村（否）.xls',sheet1$) a on b.v0514=a.a

update b set b.v0513='2',b.hv0513='否'
from v52 b right join OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\129个仍不同建制村.xls',sheet1$) a on b.v0514=a.a


update b set b.v0513='1',b.hv0513='是'
from JZC b right join OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\建制村（是）.xls',sheet1$) a on b.v0514=a.a

update b set b.v0513='2',b.hv0513='否'
from JZC b right join OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\建制村（否）.xls',sheet1$) a on b.v0514=a.a

update b set b.v0513='2',b.hv0513='否'
from JZC b right join OPENROWSET('Microsoft.jet.OLEDB.4.0','Excel 5.0;HDR=YES;DATABASE=E:\129个仍不同建制村.xls',sheet1$) a on b.v0514=a.a



UPDATE zcpt_k001
SET zcpt_k001.a0102=rtrim(k001.a0102),zcpt_k001.ha0102=rtrim(k001.ha0102)
FROM zcpt_k001
left JOIN [HRP-DBMS2014汇编基数]..K001 k001
ON rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) +CAST(k001.K0108 as VARCHAR(20)) +CAST(k001.K0109 as VARCHAR(20))=rtrim(zcpt_k001.k0101) +CAST(zcpt_k001.K0108 as VARCHAR(20)) +CAST(zcpt_k001.K0109 as VARCHAR(20))


--更新管理单位字段A0102,HA0102
UPDATE zcpt_k060
SET zcpt_k060.a0102=rtrim(k060.a0102),zcpt_k060.ha0102=rtrim(k060.ha0102)
FROM zcpt_k060
left JOIN [HRP-DBMS2014汇编基数]..k060 k060
ON (case when left(k060.k0101,1)in ('H','G','T','S') then rtrim(replace(replace(replace(replace(replace(replace(replace(k060.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+left(k060.a0103,6)+'L'+rtrim(k060.k6001)
else left(k060.k0101,4)+left(k060.a0103,6)+'L'+rtrim(k060.k6001) end)= rtrim(zcpt_k060.k6001)
--更新管理单位字段A0102,HA0102
UPDATE zcpt_k060
SET zcpt_k060.a0102=rtrim(k001.a0102),zcpt_k060.ha0102=rtrim(k001.ha0102)
FROM zcpt_k060
left JOIN [HRP-DBMS2014汇编基数]..k001 k001
ON rtrim(replace(replace(replace(replace(replace(replace(replace(zcpt_k060.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=rtrim(replace(replace(replace(replace(replace(replace(replace(k001.k0101,'H','G'),'T','S'),'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) and zcpt_k060.k6003>=k001.k0108 and zcpt_k060.k6003<=k001.k0109
WHERE zcpt_k060.A0102 IS NULL


--更新管理单位字段A0102,HA0102
UPDATE zcpt_k063
SET zcpt_k063.a0102=rtrim(k001.a0102),zcpt_k063.ha0102=rtrim(k001.ha0102)
--SELECT zcpt_k063.a0102,rtrim(k001.a0102),zcpt_k063.ha0102,rtrim(k001.ha0102)
FROM zcpt_k063
left JOIN [HRP-DBMS2014汇编基数]..k001 k001
on rtrim(zcpt_k063.k0101)=rtrim(replace(replace(replace(replace(replace(k001.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) and ISNULL(zcpt_k063.k6303,0)>=ISNULL(k001.k0108,0) and ISNULL(zcpt_k063.k6303,0)<=ISNULL(k001.k0109,0)



















