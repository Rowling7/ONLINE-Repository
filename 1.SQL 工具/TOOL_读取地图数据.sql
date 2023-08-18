--Microsoft.Jet.OLEDB.4.0
select distinct rtrim(DWDM)
from
openrowset('Microsoft.Jet.OLEDB.4.0',  'E:\42\mapdata.sdd';'admin';'',QL)
order by  rtrim(DWDM)


--Microsoft.ACE.OLEDB.12.0
select distinct rtrim(DWDM)
from
openrowset('Microsoft.ACE.OLEDB.12.0', 'E:\42\mapdata.sdd';'admin';'',QL)
order by  rtrim(DWDM)