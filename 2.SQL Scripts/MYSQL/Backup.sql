mysqldump -u root -p --databases  oydhrp_hb >f:\oydhrp_hb.sql

mysql -u root -p test < f:\oydhrp_hb.sql