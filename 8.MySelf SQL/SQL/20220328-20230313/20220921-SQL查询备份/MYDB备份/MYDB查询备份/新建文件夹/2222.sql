B.K0101 =( CASE WHEN LEN( RTRIM(A.K0101 ) ) > 5 THEN LEFT ( RTRIM(A.K0101 ), 3 ) ELSE RTRIM(A.K0101 )  END)  
OR   
B.K0101 =CASE WHEN LEFT (( CASE WHEN LEN( RTRIM(A.K0101 ) ) > 5 THEN LEFT ( RTRIM(A.K0101 ), 3 ) ELSE RTRIM(A.K0101 )  END),1) ='H'THEN STUFF(( CASE WHEN LEN( RTRIM(A.K0101 ) ) > 5 THEN LEFT ( RTRIM(A.K0101 ), 3 ) ELSE RTRIM(A.K0101 )  END), 1, 1, 'G')
OR  
B.K0101 =CASE WHEN LEFT (( CASE WHEN LEN( RTRIM(A.K0101 ) ) > 5 THEN LEFT ( RTRIM(A.K0101 ), 3 ) ELSE RTRIM(A.K0101 )  END),1) ='T'THEN STUFF(( CASE WHEN LEN( RTRIM(A.K0101 ) ) > 5 THEN LEFT ( RTRIM(A.K0101 ), 3 ) ELSE RTRIM(A.K0101 )  END), 1, 1, 'S')


B.K0101= 
CASE WHEN
		LEFT (( CASE WHEN LEN( RTRIM(A.K0101 ) ) > 5 THEN LEFT ( RTRIM(A.K0101 ), 3 ) ELSE RTRIM(A.K0101 )  END),1) ='H'
	THEN 
		STUFF(( CASE WHEN LEN( RTRIM(A.K0101 ) ) > 5 THEN LEFT ( RTRIM(A.K0101 ), 3 ) ELSE RTRIM(A.K0101 )  END), 1, 1, 'G')
	ELSE
		CASE WHEN 
			LEFT (( CASE WHEN LEN( RTRIM(A.K0101 ) ) > 5 THEN LEFT ( RTRIM(A.K0101 ), 3 ) ELSE RTRIM(A.K0101 )  END),1) ='T'
			THEN 
			STUFF(( CASE WHEN LEN( RTRIM(A.K0101 ) ) > 5 THEN LEFT ( RTRIM(A.K0101 ), 3 ) ELSE RTRIM(A.K0101 )  END), 1, 1, 'S')
			END	ELSE 
					 CASE WHEN LEN( RTRIM(A.K0101 ) ) > 5 THEN LEFT ( RTRIM(A.K0101 ), 3 ) ELSE RTRIM(A.K0101 )  END
			 END
				