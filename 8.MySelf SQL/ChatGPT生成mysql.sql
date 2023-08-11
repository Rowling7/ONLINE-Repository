/*
DROP TABLE class;
DROP TABLE course;
DROP TABLE teacher;
DROP TABLE student;
DROP TABLE score;
*/
CREATE TABLE IF NOT EXISTS student (
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  gender ENUM('male', 'female'),
  age INT(11),
  class_id INT(11)
);

CREATE TABLE IF NOT EXISTS teacher (
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  gender ENUM('male', 'female'),
  age INT(11),
  department VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS course (
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  teacher_id INT(11),
  credit FLOAT(3,1)
);

CREATE TABLE IF NOT EXISTS score (
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  student_id INT(11),
  course_id INT(11),
  score FLOAT(4,1)
);

CREATE TABLE IF NOT EXISTS class (
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  grade ENUM('one', 'two', 'three'),
  teacher_id INT(11)
);







-- 向学生表（student）中插入10条数据
INSERT INTO student (name, gender, age, class_id)
VALUES
  ('张三', 'male', 18, 1),
  ('李四', 'female', 17, 2),
  ('王五', 'male', 16, 3),
  ('赵六', 'female', 18, 1),
  ('钱七', 'male', 17, 2),
  ('孙八', 'female', 16, 3),
  ('周九', 'male', 18, 1),
  ('吴十', 'female', 17, 2),
  ('郑一', 'male', 16, 3),
  ('冯二', 'female', 18, 1);

-- 向教师表（teacher）中插入10条数据
INSERT INTO teacher (name, gender, age, department)
VALUES
  ('张老师', 'male', 35, '数学系'),
  ('李老师', 'female', 40, '英语系'),
  ('王老师', 'male', 30, '物理系'),
  ('赵老师', 'female', 38, '化学系'),
  ('钱老师', 'male', 45, '地理系'),
  ('孙老师', 'female', 33, '政治系'),
  ('周老师', 'male', 42, '历史系'),
  ('吴老师', 'female', 31, '计算机系'),
  ('郑老师', 'male', 46, '体育系'),
  ('冯老师', 'female', 34, '艺术系');

-- 向课程表（course）中插入10条数据
INSERT INTO course (name, teacher_id, credit)
VALUES
  ('数学', 1, 3.0),
  ('英语', 2, 2.5),
  ('物理', 3, 4.0),
  ('化学', 4, 3.5),
  ('地理', 5, 2.0),
  ('政治', 6, 1.5),
  ('历史', 7, 2.0),
  ('计算机', 8, 3.0),
  ('体育', 9, 1.0),
  ('艺术', 10, 2.5);

-- 向分数表（score）中插入10条数据
INSERT INTO score (student_id, course_id, score)
VALUES
  (1, 1, 90.5),
  (1, 2, 85.0),
  (2, 1, 88.0),
  (2, 2, 92.5),
  (3, 1, 78.0),
  (3, 3, 91.0),
  (4, 1, 82.5),
  (4, 2, 87.5),
  (5, 1, 95.0),
  (5, 3, 93.0);

-- 向班级表（class）中插入10条数据
INSERT INTO class (name, grade, teacher_id)
VALUES
  ('高一(1)班', 'one', 1),
  ('高一(2)班', 'one', 2),
  ('高一(3)班', 'one', 3),
  ('高二(1)班', 'two', 4),
  ('高二(2)班', 'two', 5),
  ('高二(3)班', 'two', 6),
  ('高三(1)班', 'three', 7),
  ('高三(2)班', 'three', 8),
  ('高三(3)班', 'three', 9),
  ('高三(4)班', 'three', 10);

UPDATE class SET name = CASE
  WHEN id = 1 THEN '计算机科学与技术1班'
  WHEN id = 2 THEN '英语专业2班'
  WHEN id = 3 THEN '物理实验班3班'
  WHEN id = 4 THEN '化学合成班1班'
  WHEN id = 5 THEN '地理信息工程2班'
  WHEN id = 6 THEN '政治理论3班'
  WHEN id = 7 THEN '中国古代史1班'
  WHEN id = 8 THEN '软件工程2班'
  WHEN id = 9 THEN '体育教育与训练3班'
  WHEN id = 10 THEN '美术设计1班'
END;

UPDATE student SET age = FLOOR(RAND() * 5) + 18 WHERE age BETWEEN 18 AND 22;



SELECT s.id AS 学生ID, s.name AS 学生姓名, s.gender AS 学生性别, s.age AS 学生年龄,
       c.name AS 班级名称,
       t.id AS 教师ID, t.name AS 教师姓名, t.gender AS 教师性别, t.age AS 教师年龄, t.department AS 所属部门,
       co.id AS 课程ID, co.name AS 课程名称, co.credit AS 学分,
       sc.score AS 成绩
FROM student s
LEFT JOIN class c ON s.class_id = c.id
LEFT JOIN score sc ON s.id = sc.student_id
LEFT JOIN course co ON sc.course_id = co.id
LEFT JOIN teacher t ON co.teacher_id = t.id
WHERE s.name = '张三';


