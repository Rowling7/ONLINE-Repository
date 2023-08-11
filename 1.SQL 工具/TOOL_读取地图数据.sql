select distinct rtrim(DWDM)
from
openrowset('Microsoft.Jet.OLEDB.4.0',  'D:\东方永德软件OYDSOFT\HRP-GIS2015\MAPDATA\42\mapdata.sdd';'admin';'',QL)
order by  rtrim(DWDM)