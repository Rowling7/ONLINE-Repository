select [管理单位代码],a.a0102,[管理单位名称],a.ha0102,[路线代码],[路段起点],[路段止点],a.hk0192,[出入点类别],[起点分界点类别],a.hk0154,[止点分界点类别],a.hk0158,[重复路段代码],a.k0124
from OPENROWSET('Microsoft.ACE.OLEDB.12.0','Excel 8.0;HDR=YES;DATABASE=E:\6078曹勇嵩\1.工作文件\1.工作文件（日期分类）\20230830 共线核查\xycz 出省界路线\xycz 出省界路线0.1.xlsx',sheet1$)
left join  k001 a on [路线代码]=rtrim(k0101) and [路段起点]=k0108




select a0102,rtrim(ha0102),rtrim(k0101) k0101,k0108,k0109,rtrim(hk0192),rtrim(hk0154),rtrim(hk0158),
case when k0154='1' and isnull(k0158,'0')<>'1' then '入点' when isnull(k0154,'0')<>'1' and k0158 ='1' then '出点' else '既是入点也是出点' end,
k0124 from k001 where left(a0102,3)<>'42A' and left(k0101,1) in ('C','Y','X','Z') and (k0154='1' or k0158='1')
order by k0101,k0108
