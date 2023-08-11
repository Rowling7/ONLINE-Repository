-- 创建存储过程 用来代替CHECK
DELIMITER $$
CREATE PROCEDURE `check_A50`(IN A0203 BIGINT(20), IN K0105 double,IN K0106 double,IN K0116 varchar(8))
BEGIN
    IF A0203 = 1000001816547608 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'A50.A0203 不能填写''G'',改用"GA"或"G9" ';
    END IF;
    IF K0105 > K0106 THEN
        SIGNAL SQLSTATE '45001'
            SET MESSAGE_TEXT = '起点桩号(K0105)必须大于终点桩号(K0106)';
    END IF;
    IF STR_TO_DATE(K0116,'%Y%m%d')IS  NULL OR LENGTH(K0116) < 4  THEN
        SIGNAL SQLSTATE '45002'
            SET MESSAGE_TEXT = 'K0116 填写不规范';
    END IF;

END$$

DELIMITER ;

-- 创建触发器,和存储过程一起检查字段填写是否规范
-- before insert
DELIMITER $$
CREATE TRIGGER `A50_before_insert` BEFORE INSERT ON A50
FOR EACH ROW
BEGIN
    CALL check_A50(new.A0203,new.k0105,new.k0106,new.k0116);
END$$
DELIMITER ;

-- before update
DELIMITER $$
CREATE TRIGGER `A50_before_update` BEFORE UPDATE ON A50
FOR EACH ROW
BEGIN
    CALL check_A50(new.A0203,new.k0105,new.k0106,new.k0116);
END$$
DELIMITER ;

