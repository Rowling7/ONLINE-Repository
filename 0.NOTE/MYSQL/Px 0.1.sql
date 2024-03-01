-- ���� employees ��
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- ���� salary_log ��
CREATE TABLE salary_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    old_salary DECIMAL(10, 2),
    new_salary DECIMAL(10, 2),
    log_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);

-- �����������
INSERT INTO employees (employee_id, first_name, last_name, salary)
VALUES (1001, 'John', 'Doe', 5000),
       (1002, 'Jane', 'Smith', 5500),
       (1003, 'David', 'Johnson', 6000);



-- �����洢����
DELIMITER //

CREATE PROCEDURE update_salary(IN emp_id INT, IN new_salary DECIMAL(10, 2))
BEGIN
    DECLARE emp_count INT;
    DECLARE old_salary DECIMAL(10, 2);

    -- ���Ա���Ƿ����
    SELECT COUNT(*) INTO emp_count FROM employees WHERE employee_id = emp_id;
    IF emp_count = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ա��������';
    END IF;

    -- ��ȡ��ǰнˮ
    SELECT salary INTO old_salary FROM employees WHERE employee_id = emp_id;

    -- ����нˮ
    UPDATE employees SET salary = new_salary WHERE employee_id = emp_id;

    -- ��¼нˮ�����־
    INSERT INTO salary_log (employee_id, old_salary, new_salary) VALUES (emp_id, old_salary, new_salary);
END

DELIMITER ;

-- ����
CALL UPDATE_SALARY ( 1002,7000);