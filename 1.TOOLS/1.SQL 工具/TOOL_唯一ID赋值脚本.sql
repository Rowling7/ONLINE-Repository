//Î¨Ò»ID¸³Öµ½Å±¾
UPDATE K01 SET KWYID=NEWID() where KWYID is null
UPDATE K60 SET KWYID=NEWID() where KWYID is null
UPDATE K63 SET KWYID=NEWID() where KWYID is null
update K01 set k0101=upper(rtrim(K0101))