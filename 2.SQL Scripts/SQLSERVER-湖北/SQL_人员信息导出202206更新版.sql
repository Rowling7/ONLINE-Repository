USE  YMJGZ
SELECT
RTRIM(A01.HB0111) AS HB0111, RTRIM(A01.HB3411) AS HB3411, RTRIM(A01.A0101) AS A0101, RTRIM(A01.A0177) AS A0177, RTRIM(A01.HA0107) AS HA0107, RTRIM(A01.A0111) AS A0111, RTRIM(A01.HA0121) AS HA0121, RTRIM(A01.HA8103) AS HA8103, RTRIM(A01.A0141) AS A0141, RTRIM(A01.A3105) AS A3105, RTRIM(A01.HA3113) AS HA3113, RTRIM(A01.HA0131) AS HA0131,RTRIM( A01.a0137 ) AS A0137,RTRIM( A01.a0135 ) AS A0135,RTRIM( A01.a0139 ) AS A0139,A01.Z0095

---当前警衔信息
,a47_1.HA4701,a47_1.A4704
---上次警衔信息
,a47_2.HA4701,a47_2.A4704
---上上次警衔信息
,a47_3.HA4701,a47_3.A4704

---第一次学习经历
,a61_1.a6101,a61_1.a6102,a61_1.HA6103,a61_1.HA6153

---第二次学习经历
,a61_2.a6101,a61_2.a6102,a61_2.HA6103,a61_2.HA6153

---第三次学习经历
,a61_3.a6101,a61_3.a6102,a61_3.HA6103,a61_3.HA6153

---第一次任职经历
,a42_1.A4185,a42_1.HA4195,a42_1.HA4292,A42_1.HA4191

---第二次任职经历
,a42_2.A4185,a42_2.HA4195,a42_2.HA4292,A42_2.HA4191

---第三次任职经历
,a42_3.A4185,a42_3.HA4195,a42_3.HA4292,A42_3.HA4191

---第四次任职经历
,a42_4.A4185,a42_4.HA4195,a42_4.HA4292,A42_4.HA4191

---第五次任职经历
,a42_5.A4185,a42_5.HA4195,a42_5.HA4292,A42_5.HA4191

---第六次任职经历
,a42_6.A4185,a42_6.HA4195,a42_6.HA4292,A42_6.HA4191

---第七次任职经历
,a42_7.A4185,a42_7.HA4195,a42_7.HA4292,A42_7.HA4191

---第八次任职经历
,a42_8.A4185,a42_8.HA4195,a42_8.HA4292,A42_8.HA4191

---第九次任职经历
,a42_9.A4185,a42_9.HA4195,a42_9.HA4292,A42_9.HA4191

---第十次任职经历
,A42_10.A4185,A42_10.HA4195,A42_10.HA4292,A42_10.HA4191
---高低定信息
--第一次
,A07_1.A0701,A07_1.HA0706,A07_1.HA0707,replace(A07_1.HA0708 ,'（薪级）','')
,A07_2.A0701,A07_2.HA0706,A07_2.HA0707,replace(A07_2.HA0708 ,'（薪级）','')
,A07_3.A0701,A07_3.HA0706,A07_3.HA0707,replace(A07_3.HA0708 ,'（薪级）','')

,A01.Z0001  --人员编号

FROM
A01 a01

left join a47 a47_1 on a01.z0001=a47_1.z0001 and a01.b0111=a47_1.b0111 and a47_1.a4704=(select min(a.a4704) from a47 A where A.z0001=a47_1.z0001 and A.b0111=a47_1.b0111)
left join a47 a47_2 on a01.z0001=a47_2.z0001 and a01.b0111=a47_2.b0111 and a47_2.a4704=(select min(a.a4704) from a47 A where A.z0001=a47_2.z0001 and A.b0111=a47_2.b0111 and a4704>a47_1.A4704)
left join a47 a47_3 on a01.z0001=a47_3.z0001 and a01.b0111=a47_3.b0111 and a47_3.a4704=(select min(a.a4704) from a47 A where A.z0001=a47_3.z0001 and A.b0111=a47_3.b0111 and A4704>a47_2.A4704)

left join  a61 a61_1  on a01.z0001=a61_1.z0001 and a01.b0111=a61_1.b0111 and a61_1.a6101=(select min(a6101) from a61 where z0001=a61_1.z0001 and b0111=a61_1.b0111)
left join  a61 a61_2  on a01.z0001=a61_2.z0001 and a01.b0111=a61_2.b0111 and a61_2.a6101=(select min(a6101) from a61 where z0001=a61_2.z0001 and b0111=a61_2.b0111 and a6101>a61_1.a6101)
left join  a61 a61_3  on a01.z0001=a61_3.z0001 and a01.b0111=a61_3.b0111 and a61_3.a6101=(select min(a6101) from a61 where z0001=a61_3.z0001 and b0111=a61_3.b0111 and a6101>a61_2.a6101)

left join  a42 a42_1  on a01.z0001=a42_1.z0001 and a01.b0111=a42_1.b0111 and a42_1.a4185=(select min(a4185) from a42 where z0001=a42_1.z0001 and b0111=a42_1.b0111)
left join  a42 a42_2  on a01.z0001=a42_2.z0001 and a01.b0111=a42_2.b0111 and a42_2.a4185=(select min(a4185) from a42 where z0001=a42_2.z0001 and b0111=a42_2.b0111 and a4185>a42_1.a4185)
left join  a42 a42_3  on a01.z0001=a42_3.z0001 and a01.b0111=a42_3.b0111 and a42_3.a4185=(select min(a4185) from a42 where z0001=a42_3.z0001 and b0111=a42_3.b0111 and a4185>a42_2.a4185)
left join  a42 a42_4  on a01.z0001=a42_4.z0001 and a01.b0111=a42_4.b0111 and a42_4.a4185=(select min(a4185) from a42 where z0001=a42_4.z0001 and b0111=a42_4.b0111 and a4185>a42_3.a4185)
left join  a42 a42_5  on a01.z0001=a42_5.z0001 and a01.b0111=a42_5.b0111 and a42_5.a4185=(select min(a4185) from a42 where z0001=a42_5.z0001 and b0111=a42_5.b0111 and a4185>a42_4.a4185)
left join  a42 a42_6  on a01.z0001=a42_6.z0001 and a01.b0111=a42_6.b0111 and a42_6.a4185=(select min(a4185) from a42 where z0001=a42_6.z0001 and b0111=a42_6.b0111 and a4185>a42_5.a4185)
left join  a42 a42_7  on a01.z0001=a42_7.z0001 and a01.b0111=a42_7.b0111 and a42_7.a4185=(select min(a4185) from a42 where z0001=a42_7.z0001 and b0111=a42_7.b0111 and a4185>a42_6.a4185)
left join  a42 a42_8  on a01.z0001=a42_8.z0001 and a01.b0111=a42_8.b0111 and a42_8.a4185=(select min(a4185) from a42 where z0001=a42_8.z0001 and b0111=a42_8.b0111 and a4185>a42_7.a4185)
left join  a42 a42_9  on a01.z0001=a42_9.z0001 and a01.b0111=a42_9.b0111 and a42_9.a4185=(select min(a4185) from a42 where z0001=a42_9.z0001 and b0111=a42_9.b0111 and a4185>a42_8.a4185)
left join  a42 a42_10  on a01.z0001=a42_10.z0001 and a01.b0111=a42_10.b0111 and a42_10.a4185=(select min(a4185) from a42 where z0001=a42_10.z0001 and b0111=a42_10.b0111 and a4185>a42_9.a4185)

left join a07 a07_1 on a01.z0001=a07_1.z0001 and a01.b0111=a07_1.b0111 and a07_1.a0701=(select min(b.a0701) from a07 b where b.z0001=a07_1.z0001 and b.b0111=a07_1.b0111)
left join a07 a07_2 on a01.z0001=a07_2.z0001 and a01.b0111=a07_2.b0111 and a07_2.a0701=(select min(b2.a0701) from a07 b2 where b2.z0001=a07_1.z0001 and b2.b0111=a07_2.b0111 AND B2.A0701>A07_1.A0701)
left join a07 a07_3 on a01.z0001=a07_3.z0001 and a01.b0111=a07_3.b0111 and a07_3.a0701=(select min(b3.a0701) from a07 b3 where b3.z0001=a07_1.z0001 and b3.b0111=a07_3.b0111 AND B3.A0701>A07_2.A0701)
order by a01.b0111,a01.z0001