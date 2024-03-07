SHOW INDEX FROM A50;
SHOW INDEX FROM B01;
SHOW INDEX FROM k001;
SHOW INDEX FROM k04B;


--  A50
ALTER TABLE A50 ADD INDEX index_B01 (B01_ID);
ALTER TABLE A50 ADD INDEX index_K0101 (K0101);
ALTER TABLE A50 ADD INDEX index_K0105 (K0105);
ALTER TABLE A50 ADD INDEX index_K0106 (K0106);
ALTER TABLE A50 ADD INDEX index_K0112 (K0112);
ALTER TABLE A50 ADD INDEX index_K0102 (K0102);
ALTER TABLE A50 ADD INDEX index_K0103 (K0103);
ALTER TABLE A50 ADD INDEX index_K0104 (K0104);
ALTER TABLE A50 ADD INDEX index_K1301 (K1301);
ALTER TABLE A50 ADD INDEX index_KF0180 (KF0180);
ALTER TABLE A50 ADD INDEX index_A0203 (A0203);


-- B01
ALTER TABLE B01 ADD INDEX index_B0111 (B0111);
ALTER TABLE B01 ADD INDEX index_B0101 (B0101);
ALTER TABLE B01 ADD INDEX index_B0102 (B0102);



-- K001
ALTER TABLE k001 ADD INDEX index_A0103 (A0103);
ALTER TABLE k001 ADD INDEX index_A0130 (A0130);
ALTER TABLE k001 ADD INDEX index_A0322 (A0322);
ALTER TABLE k001 ADD INDEX index_A0323 (A0323);
ALTER TABLE k001 ADD INDEX index_A0522 (A0522);
ALTER TABLE k001 ADD INDEX index_A0523 (A0523);
ALTER TABLE k001 ADD INDEX index_A1001 (A1001);
ALTER TABLE k001 ADD INDEX index_A1101 (A1101);
ALTER TABLE k001 ADD INDEX index_B01 (B01_ID);
ALTER TABLE k001 ADD INDEX index_A50 (A50_ID);
ALTER TABLE k001 ADD INDEX index_A3101 (A3101);
ALTER TABLE k001 ADD INDEX index_A3102 (A3102);
ALTER TABLE k001 ADD INDEX index_A3305 (A3305);
ALTER TABLE k001 ADD INDEX index_A9904 (A9904);
ALTER TABLE k001 ADD INDEX index_A9905 (A9905);
ALTER TABLE k001 ADD INDEX index_J0103 (J0103);
ALTER TABLE k001 ADD INDEX index_K0101 (K0101);
ALTER TABLE k001 ADD INDEX index_K0108 (K0108);
ALTER TABLE k001 ADD INDEX index_K0109 (K0109);
ALTER TABLE k001 ADD INDEX index_K0110 (K0110);
ALTER TABLE k001 ADD INDEX index_K0111 (K0111);
ALTER TABLE k001 ADD INDEX index_K0112 (K0112);
ALTER TABLE k001 ADD INDEX index_K0114 (K0114);
ALTER TABLE k001 ADD INDEX index_K0115 (K0115);
ALTER TABLE k001 ADD INDEX index_K0116 (K0116);
ALTER TABLE k001 ADD INDEX index_K0121 (K0121);
ALTER TABLE k001 ADD INDEX index_K0123 (K0123);
ALTER TABLE k001 ADD INDEX index_K0124 (K0124);
ALTER TABLE k001 ADD INDEX index_K0126 (K0126);
ALTER TABLE k001 ADD INDEX index_K0128 (K0128);
ALTER TABLE k001 ADD INDEX index_K0130 (K0130);
ALTER TABLE k001 ADD INDEX index_K0131 (K0131);
ALTER TABLE k001 ADD INDEX index_K0133 (K0133);
ALTER TABLE k001 ADD INDEX index_K0134 (K0134);
ALTER TABLE k001 ADD INDEX index_K0135 (K0135);
ALTER TABLE k001 ADD INDEX index_K0138 (K0138);
ALTER TABLE k001 ADD INDEX index_K0149 (K0149);
ALTER TABLE k001 ADD INDEX index_K0153 (K0153);
ALTER TABLE k001 ADD INDEX index_K0154 (K0154);
ALTER TABLE k001 ADD INDEX index_K0155 (K0155);
ALTER TABLE k001 ADD INDEX index_K0156 (K0156);
ALTER TABLE k001 ADD INDEX index_K0157 (K0157);
ALTER TABLE k001 ADD INDEX index_K0158 (K0158);
ALTER TABLE k001 ADD INDEX index_K0161 (K0161);
ALTER TABLE k001 ADD INDEX index_K0162 (K0162);
ALTER TABLE k001 ADD INDEX index_K0163 (K0163);
ALTER TABLE k001 ADD INDEX index_K0174 (K0174);
ALTER TABLE k001 ADD INDEX index_K0181 (K0181);
ALTER TABLE k001 ADD INDEX index_K0182 (K0182);
ALTER TABLE k001 ADD INDEX index_K0183 (K0183);
ALTER TABLE k001 ADD INDEX index_K0184 (K0184);
ALTER TABLE k001 ADD INDEX index_K0190 (K0190);
ALTER TABLE k001 ADD INDEX index_K0191 (K0191);
ALTER TABLE k001 ADD INDEX index_K0192 (K0192);
ALTER TABLE k001 ADD INDEX index_K0193 (K0193);
ALTER TABLE k001 ADD INDEX index_K0304 (K0304);
ALTER TABLE k001 ADD INDEX index_K0306 (K0306);
ALTER TABLE k001 ADD INDEX index_K0404 (K0404);
ALTER TABLE k001 ADD INDEX index_K1302 (K1302);
ALTER TABLE k001 ADD INDEX index_K1303 (K1303);
ALTER TABLE k001 ADD INDEX index_K1304 (K1304);
ALTER TABLE k001 ADD INDEX index_K2010 (K2010);
ALTER TABLE k001 ADD INDEX index_KWYID (KWYID);
-- 64
ALTER TABLE k001 ADD INDEX index_K2012 (K2012);
ALTER TABLE k001 ADD INDEX index_K3102 (K3102);
ALTER TABLE k001 ADD INDEX index_K3901 (K3901);
ALTER TABLE k001 ADD INDEX index_K3902 (K3902);
ALTER TABLE k001 ADD INDEX index_K3905 (K3905);
ALTER TABLE k001 ADD INDEX index_K3909 (K3909);
ALTER TABLE k001 ADD INDEX index_K3990 (K3990);
ALTER TABLE k001 ADD INDEX index_K3992 (K3992);
ALTER TABLE k001 ADD INDEX index_K3993 (K3993);
ALTER TABLE k001 ADD INDEX index_K4002 (K4002);
ALTER TABLE k001 ADD INDEX index_K5104 (K5104);
ALTER TABLE k001 ADD INDEX index_K5222 (K5222);
ALTER TABLE k001 ADD INDEX index_K5404 (K5404);
ALTER TABLE k001 ADD INDEX index_K6023 (K6023);
ALTER TABLE k001 ADD INDEX index_K9508 (K9508);
ALTER TABLE k001 ADD INDEX index_V0116 (V0116);
ALTER TABLE k001 ADD INDEX index_V0301 (V0301);



-- K04B
ALTER TABLE k04B ADD INDEX index_K0101(K0101);
ALTER TABLE k04B ADD INDEX index_K0108(K0108);
ALTER TABLE k04B ADD INDEX index_K0109(K0109);
ALTER TABLE k04B ADD INDEX index_A5009(A5009);
ALTER TABLE k04B ADD INDEX index_K0112(K0112);
ALTER TABLE k04B ADD INDEX index_A5011(A5011);
ALTER TABLE k04B ADD INDEX index_A5010(A5010);
ALTER TABLE k04B ADD INDEX index_B01(B01_ID);
ALTER TABLE k04B ADD INDEX index_A50(A50_ID);