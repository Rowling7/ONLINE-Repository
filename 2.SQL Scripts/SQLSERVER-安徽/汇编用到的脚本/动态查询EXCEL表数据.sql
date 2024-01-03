DECLARE @SoftPath VARCHAR(255);
DECLARE @FilePath VARCHAR(255);
exec master..xp_regread	'HKEY_LOCAL_MACHINE'
	,'Software\　东方永德\HRP-GHSS\标准版\单机版\2014'
	,'Path' , @SoftPath OUTPUT
set @FilePath=@SoftPath+'SXZB20231217.xls'
	
DECLARE @query NVARCHAR(1000);
SET @query = 
    'SELECT 
        convert(varchar(255), cast(convert(float,XZDM) as decimal)), XZMC, TDQK, HTDQK, NBTABLE, nbnf
    FROM OPENROWSET(''Microsoft.jet.OLEDB.4.0'', ''Excel 5.0;Database=' + @FilePath + ';HDR=YES'', ''SELECT * FROM [sheet1$]'')';

EXEC(@query);

