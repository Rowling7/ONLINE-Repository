select 
	c1.fieldname zdcode1,
	case when c2.ftype = 'd' then 'h'+c1.fieldname else null end zdcode2,
	c2.objjc,
	c2.ftype,
	c2.flen,
	c2.fdec,
	C2.FCODE
from oydst_fieldcont1 as p
join oydst_fieldcont1 as c1 	on p.objid = c1.parentid
join oydst_fields 		as c2		on c1.fieldname = c2.objname
where c1.fieldname is not null 
			and p.tablename = 'K063'
order by p.tablename,c1.fieldname