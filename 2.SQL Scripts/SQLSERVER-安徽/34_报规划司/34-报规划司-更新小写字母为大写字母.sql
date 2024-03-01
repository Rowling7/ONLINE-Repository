
--更新小写字母为大写字母
select k0101
from k001 where k0101 collate Chinese_PRC_CS_AI like '%[abcdefghijklmnopqrstuvwxyz]%'

update k001
set k0101=upper(k0101)
from k001 where k0101 collate Chinese_PRC_CS_AI like '%[abcdefghijklmnopqrstuvwxyz]%'


select k0101
from k060 where k0101 collate Chinese_PRC_CS_AI like '%[abcdefghijklmnopqrstuvwxyz]%'

update k060
set k0101=upper(k0101)
from k060 where k0101 collate Chinese_PRC_CS_AI like '%[abcdefghijklmnopqrstuvwxyz]%'
