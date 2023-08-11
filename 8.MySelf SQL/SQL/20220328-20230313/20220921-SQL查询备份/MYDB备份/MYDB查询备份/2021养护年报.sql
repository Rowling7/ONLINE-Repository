SELECT DISTINCT
	RTRIM(K1.HA0102 ) HA0102 --管理单位
	,RTRIM( K1.A0102 ) A0102 --管理单位代码
	,CASE WHEN len( rtrim(K1.k0101 ) ) > 9 THEN LEFT ( rtrim(K1.k0101 ), 4 ) ELSE rtrim(K1.k0101 )  END  k0101 --路线编号
	,SUM ( ISNULL(K1.K0114, 0 ) ) 总里程 --7378.063
FROM
	K001 K1
	--L001 
WHERE
	LEFT ( K1.K0101, 1 ) IN ( 'G', 'S', 'Z' ) AND 
	(CASE WHEN len( rtrim( K1.k0101 ) ) > 9 THEN LEFT ( rtrim(K1.k0101 ), 4 ) ELSE rtrim(K1.k0101 )  END) = 'G0422'
GROUP BY
	RTRIM(K1.A0102 )
	,RTRIM(K1.HA0102 )
	,CASE WHEN len( rtrim( K1.k0101 ) ) > 9 THEN LEFT ( rtrim(K1.k0101 ), 4 ) ELSE rtrim(K1.k0101 )  END 
	--WITH ROLLUP	

