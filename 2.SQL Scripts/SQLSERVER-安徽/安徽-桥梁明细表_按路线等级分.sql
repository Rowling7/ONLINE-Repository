/*����ʾ��*/
IF OBJECT_ID('TEMPDB..#K01') IS NOT NULL DROP TABLE #K01
SELECT
rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) k0101
INTO #K01
FROM K01
WHERE left(k01.K0101,1) in ('G','S','X','Y','Z','C','h','t') 
      and (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2'  and K0304='10'
GROUP BY rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))
ORDER BY rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))
-- SELECT * from #K01
--select rtrim(k0101) from #k01

SELECT
RTRIM(REPLACE(K6002,' ','')),		--��������
RTRIM(K60.K6001),			--��������
K6003,					--��������׮��
RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K60.K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')),			--·�߱��
RTRIM(A50.K0112),			--·������
RTRIM(D.OBJJC) HK0304,			--�����ȼ�
-- CASE WHEN ISNULL(K6117,'') IN ('4','5') AND ISNULL(K6121,'')<>'' THEN RTRIM(HK6121)
-- 	ELSE
-- 		CASE WHEN RTRIM(D.OBJJC) IS NULL THEN '����' ELSE RTRIM(D.OBJJC) END 
-- END	HK0304,				--�����ȼ�
K6008,					--����ȫ��
K6065,					--�羶�ܳ�
K6063,					--�������羶
RTRIM(REPLACE(K6064,' ','')),		--�羶���
A6066,					--����ȫ��
K6009,					--���澻��
K6007,HK6007,				--�羶��
K6004,HK6004,				--ʹ�����޷�
K6016,HK6016,				--�����ϲ��ṹ
K6110,RTRIM(HK6110),			--�����ϲ��ṹ����
K6017,    				--�Ŷ�����
CASE WHEN RTRIM(HK6017)='X�ζ�' THEN 'X �ζ�' WHEN RTRIM(HK6017)='Y�ζ�' THEN 'Y �ζ�' WHEN RTRIM(HK6017)='V�ζ�' THEN 'V �ζ�' WHEN RTRIM(HK6017)='H�ζ�' THEN 'H �ζ�' ELSE RTRIM(HK6017) END,	--�Ŷ�����
K6022,HK6022,				--��ƺ��صȼ�
K6023,HK6023,				--����ȼ�
K6005,
CASE WHEN HK6005='��������' THEN '����' ELSE HK6005 END HK6005,				--��Խ����
RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(K6006,CHAR(13),''),CHAR(10),''),CHAR(9),''),CHAR(32),''))),					--��Խ��������
RTRIM(REPLACE(HK0149,'��','')),		--�����׼
HK6024,					--ͨ���ȼ�
HA1328,					--��̨��ײ����
(CASE WHEN K6062='1' THEN '��' ELSE '��' END),						--�Ƿ�ͨ����
K6079,					--���赥λ
REPLACE(K6030,' ',''),			--��Ƶ�λ
K6031,					--ʩ����λ
REPLACE(K6032,' ',''),			--����λ
K0180,					--�޽����
K60.K0116,				--ͨ������
A1313,					--������λ���ʴ���
LTRIM(RTRIM(REPLACE(A1314,' ',''))),	--������λ����
RTRIM(REPLACE(REPLACE(K6111,' ',''),CHAR(127),'')),					--��ܵ�λ����
A1302,
CASE WHEN ISNULL(A1302,'1')='1' THEN '���շ�' WHEN ISNULL(A1302,'1')='2' THEN '����' WHEN ISNULL(A1302,'1')='3' THEN '��Ӫ' END,	--�շ�����
K6028,HK6028,				--�����ȼ�
A1305,					--��������
RTRIM(REPLACE(K6050,' ','')),		--����״��������λ
K0181,					--�������
A1316,					--�����깤����
HA1317,					--���첿λ
HA1318,					--�������ʴ���
RTRIM(REPLACE(K6051,' ','')),		--����ʩ����λ
NULLIF(HA1319,''),		--�Ƿ񲿲�����Ŀ
CASE WHEN ISNULL(K6028,'') IN ('4','5') THEN RTRIM(HA1306) ELSE NULL END,		--��Ҫ����λ��
CASE WHEN ISNULL(K6028,'') IN ('4','5') THEN RTRIM(K6102) ELSE NULL END,		--��Ҫ��������
CASE WHEN ISNULL(K6028,'') IN ('4','5') THEN A1307 ELSE '' END,
CASE WHEN ISNULL(K6028,'') IN ('4','5') THEN HA1307 ELSE '' END,			--��ȡ��ͨ���ƴ�ʩ
LEFT(A0103,6),				--������������
RTRIM(ISNULL(HK6117,'˫��')),		--��������λ��
RTRIM(ISNULL(HK6118,'��')),		--�Ƿ��·խ��
RTRIM(ISNULL(HK6119,'��')),		--�Ƿ��ڳ�������Ŀ¼��
RTRIM(ISNULL(HK6120,'��')),		--�Ƿ��ʡ����
RTRIM(ISNULL(HK6041,'��')),		--�Ƿ�����������
K60.K0199, 				--��ע
CASE WHEN LEFT(K60.K0101,1) IN ('G','H') THEN RTRIM(ISNULL(K6040,'')) ELSE '' END		--�������������
FROM K60 
	LEFT JOIN 
		(SELECT A.A0102,A.K0101,A.K6001,MAX(B.K0304) K0304
		FROM K60 A LEFT JOIN K01 B ON A.A0102=B.A0102 AND A.K0101=B.K0101 AND A.K6003>=B.K0108 AND A.K6003<=B.K0109
		WHERE LEFT(A.K0101,1) IN ('G','H','S','T') AND A.A0102 LIKE '34%' AND A.A0101 <= '2024'
		GROUP BY A.A0102,A.K0101,A.K6001) C
	     ON K60.A0102=C.A0102 AND K60.K0101=C.K0101 AND K60.K6001=C.K6001
	LEFT JOIN D002 D  ON  D.OBJNAME=C.K0304
	LEFT JOIN A50  ON K60.A0102=A50.A0102 AND K60.K0101=A50.K0101
      LEFT JOIN DA0102 ON K60.A0102=DA0102.OBJNAME
WHERE K60.A0102 LIKE '34%' AND A0101 <= '2024'and
	LEFT(K60.K0101,1) IN ('G','S','X','Y','Z','C','h','t') and K0304='10' AND rtrim(K60.K0101) in (select rtrim(k0101) from #k01) --����
	-- LEFT(K60.K0101,1) IN ('G','H') AND rtrim(K60.K0101) not  in (select rtrim(k0101) from #k01) --��ͨ����
	-- LEFT(K60.K0101,1) IN ('s','t') AND rtrim(K60.K0101) not  in (select rtrim(k0101) from #k01) --��ͨʡ��

ORDER BY REPLACE(REPLACE(REPLACE(K60.K0101,'340000',''),'000000',''),'C','ZZ'),K60.K6003












