exec('
Create Function get_earth_distance
(
 @lon1 numeric(18,8),
 @lat1 numeric(18,8),
 @lon2 numeric(18,8),
 @lat2 numeric(18,8)
) Returns numeric(18,2) 
As
Begin
declare
@rad_lon1     numeric(18, 8),
@rad_lat1     numeric(18, 8),
@rad_lon2     numeric(18, 8),
@rad_lat2     numeric(18, 8),
@a            numeric(18, 8),
@b            numeric(18, 8),
@s            numeric(20, 8)
  set @rad_lat1 = @lat1 * pi() / 180.0
  set @rad_lat2 = @lat2 * pi() / 180.0
  set @rad_lon1 = @lon1 * pi() / 180.0
  set @rad_lon2 = @lon2 * pi() / 180.0
  set @a        = @rad_lat1 - @rad_lat2
  set @b        = @rad_lon1 - @rad_lon2
  set @s        = 2 * asin(sqrt(power(sin(@a / 2), 2) +
                            cos(@rad_lat1) * cos(@rad_lat2) *
                            power(sin(@b / 2), 2)))
  set @s        = @s * 6378.137
  set @s        = round(@s * 100000,6) / 100000
  set @s        = @s*1000
  Return @s
End 
')

select a.bm,a.mc,b.bm,b.mc,
dbo.get_earth_distance(isnull(a.jd,0.000),isnull(a.wd,0.000),isnull(b.jd,0.000),isnull(b.wd,0.000))
from
openrowset('Microsoft.Jet.OLEDB.4.0','C:\东方永德软件OYDSOFT 安徽\HRP-GIS2014\MAPDATA\341882\mapdata.sdd';'admin';'',ZRC) a 
inner join 
openrowset('Microsoft.Jet.OLEDB.4.0','C:\东方永德软件OYDSOFT 安徽\HRP-GIS2014\BGDATA\34\mapdata.sdd';'admin';'',ZRC) b on a.BM=b.BM
where dbo.get_earth_distance(isnull(a.jd,0.000),isnull(a.wd,0.000),isnull(b.jd,0.000),isnull(b.wd,0.000))>=200

drop Function get_earth_distance