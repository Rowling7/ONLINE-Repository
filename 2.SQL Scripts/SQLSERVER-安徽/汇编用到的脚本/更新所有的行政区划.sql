--------更新所有的行政区划汉字部分--------------------
exec Pr_ExecSQL2 
'select
''update ''+tablename+
'' set ha0103=objjc
from ''+tablename+'',DZ0101 
where a0103=objname''
from dbo.oydst_FieldCont1
where objid in 
(
select parentid
from dbo.oydst_FieldCont1
where fieldname=''A0103''
)'

--------更新所有的管理单位汉字部分--------------------
exec Pr_ExecSQL2 
'select
''update ''+tablename+
'' set ha0102=objjc
from ''+tablename+'',DA0102 
where a0102=objname''
from dbo.oydst_FieldCont1
where objid in 
(
select parentid
from dbo.oydst_FieldCont1
where fieldname=''a0102''
)'