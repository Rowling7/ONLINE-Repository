create trigger update_a0102 after  UPDATE
on B01 for each row
begin
	update k04b
	left join  b01 on b01.b01_id = k04b.B01_ID
	set  k04b.a0102=b01.b0111 ;
end


create trigger update_k0101 after  UPDATE
on a50 for each row
begin
	update k001
	left join  a50 on a50.a50_id = k001.a50_ID
	set  k001.k0101=a50.k0101
	where k001.k0101<>a50.k0101 ;
end