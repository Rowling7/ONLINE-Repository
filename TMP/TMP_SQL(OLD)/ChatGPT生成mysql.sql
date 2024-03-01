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







-- ��ѧ����student���в���10������
INSERT INTO student (name, gender, age, class_id)
VALUES
  ('����', 'male', 18, 1),
  ('����', 'female', 17, 2),
  ('����', 'male', 16, 3),
  ('����', 'female', 18, 1),
  ('Ǯ��', 'male', 17, 2),
  ('���', 'female', 16, 3),
  ('�ܾ�', 'male', 18, 1),
  ('��ʮ', 'female', 17, 2),
  ('֣һ', 'male', 16, 3),
  ('���', 'female', 18, 1);

-- ���ʦ��teacher���в���10������
INSERT INTO teacher (name, gender, age, department)
VALUES
  ('����ʦ', 'male', 35, '��ѧϵ'),
  ('����ʦ', 'female', 40, 'Ӣ��ϵ'),
  ('����ʦ', 'male', 30, '����ϵ'),
  ('����ʦ', 'female', 38, '��ѧϵ'),
  ('Ǯ��ʦ', 'male', 45, '����ϵ'),
  ('����ʦ', 'female', 33, '����ϵ'),
  ('����ʦ', 'male', 42, '��ʷϵ'),
  ('����ʦ', 'female', 31, '�����ϵ'),
  ('֣��ʦ', 'male', 46, '����ϵ'),
  ('����ʦ', 'female', 34, '����ϵ');

-- ��γ̱�course���в���10������
INSERT INTO course (name, teacher_id, credit)
VALUES
  ('��ѧ', 1, 3.0),
  ('Ӣ��', 2, 2.5),
  ('����', 3, 4.0),
  ('��ѧ', 4, 3.5),
  ('����', 5, 2.0),
  ('����', 6, 1.5),
  ('��ʷ', 7, 2.0),
  ('�����', 8, 3.0),
  ('����', 9, 1.0),
  ('����', 10, 2.5);

-- �������score���в���10������
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

-- ��༶��class���в���10������
INSERT INTO class (name, grade, teacher_id)
VALUES
  ('��һ(1)��', 'one', 1),
  ('��һ(2)��', 'one', 2),
  ('��һ(3)��', 'one', 3),
  ('�߶�(1)��', 'two', 4),
  ('�߶�(2)��', 'two', 5),
  ('�߶�(3)��', 'two', 6),
  ('����(1)��', 'three', 7),
  ('����(2)��', 'three', 8),
  ('����(3)��', 'three', 9),
  ('����(4)��', 'three', 10);

UPDATE class SET name = CASE
  WHEN id = 1 THEN '�������ѧ�뼼��1��'
  WHEN id = 2 THEN 'Ӣ��רҵ2��'
  WHEN id = 3 THEN '����ʵ���3��'
  WHEN id = 4 THEN '��ѧ�ϳɰ�1��'
  WHEN id = 5 THEN '������Ϣ����2��'
  WHEN id = 6 THEN '��������3��'
  WHEN id = 7 THEN '�й��Ŵ�ʷ1��'
  WHEN id = 8 THEN '�������2��'
  WHEN id = 9 THEN '����������ѵ��3��'
  WHEN id = 10 THEN '�������1��'
END;

UPDATE student SET age = FLOOR(RAND() * 5) + 18 WHERE age BETWEEN 18 AND 22;



SELECT s.id AS ѧ��ID, s.name AS ѧ������, s.gender AS ѧ���Ա�, s.age AS ѧ������,
       c.name AS �༶����,
       t.id AS ��ʦID, t.name AS ��ʦ����, t.gender AS ��ʦ�Ա�, t.age AS ��ʦ����, t.department AS ��������,
       co.id AS �γ�ID, co.name AS �γ�����, co.credit AS ѧ��,
       sc.score AS �ɼ�
FROM student s
LEFT JOIN class c ON s.class_id = c.id
LEFT JOIN score sc ON s.id = sc.student_id
LEFT JOIN course co ON sc.course_id = co.id
LEFT JOIN teacher t ON co.teacher_id = t.id
WHERE s.name = '����';


