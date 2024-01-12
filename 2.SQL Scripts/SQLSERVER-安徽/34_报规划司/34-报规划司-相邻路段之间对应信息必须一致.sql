select 
a.a0102,
a.ha0102,--单位
a.k0101,--路线编码
rtrim(a.k0112) k0112,
a.k0108,--起点桩号
a.k0109,--止点桩号
[下一路段k0108]=b.k0108,
rtrim(a.k0111) k0111,--止点名称
[下一路段k0110]=rtrim(b.k0110),--起点名称
a.k0183,--止点经度
[下一路段k0283]=b.k0283,--起点经度
a.k0184,--止点纬度
[下一路段k0284]=b.k0284,--起点纬度
a.k0157,
rtrim(a.hk0157) hk0157,--止点是否分界点
[下一路段k0153]=b.k0153,
[下一路段hk0153]=rtrim(b.hk0153),--起点是否分界点
a.k0158,
rtrim(a.hk0158) hk0158,--止点分界点类别
[下一路段k0154]=b.k0154,
[下一路段b.hk0154]=rtrim(b.hk0154)--起点分界点类别

from k001 a left join k001 b 
on rtrim(a.k0101) = rtrim(b.k0101)  and a.k0109=b.k0108 
where ( nullif(ltrim(rtrim(a.k0111)),'')< > nullif(ltrim(rtrim(b.k0110)),'') or a.k0183< > b.k0283 or a.k0184< > b.k0284
or nullif(a.k0157,'')< > nullif(b.k0153,'') or nullif(a.k0158,'')< > nullif(b.k0154,'') ) 
and left(a.k0101,1)in('x','y','c','z')
-- and b.k0108 is not null  
--and a.k0283 is null and b.k0284 is null
