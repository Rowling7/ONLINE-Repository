/*
ũ�幫·�ϱ����ݲ��輰����������
1.2000�⸽��NCGL��׼��
2.����ũ�幫·����
3.2000����NCGL���ݿ�
4.2005���ӵ�������������ݿ�
5.2005�������ݿ�
6.�����ϱ�Ҫ���޸����� ѹ�� ���ϱ�
*/

-----2000��ʼ
--��2000�����ݿ��н���
--1.2000�⸽��NCGL��׼��
EXEC sp_attach_db @dbname = N'NCGL342023',
@filename1 = N'F:\6078������\1.�����ļ�\2.�����ļ�\1.����2022��ũ�幫·��׼��\20230315\NCGL422022-15\NCGL422022.MDF'

--2.����ũ�幫·����
	--2.1���NCGL
truncate table dbo.T_NCGLAFSS
truncate table dbo.T_NCGLJCSS
truncate table dbo.T_xz
truncate table dbo.T_jzc
truncate table dbo.T_ZRC
truncate table dbo.T_ZRCTYXTDLX
truncate table dbo.T_ld
truncate table dbo.T_ql
truncate table dbo.T_sd
truncate table dbo.T_dk
	--2.2����ũ�幫·����

INSERT INTO [T_NCGLJCSS]
(	
	[GLXZDJ],		--��·�����ȼ�
	[SSX],			--�����أ��С������죩
	[XJXZQHDM],		--�ؼ�������������
	[GLZLC],		--��·���
	[DJGLLC],		--�ȼ���·���
	[GSGLLC],		--���ٹ�·���
	[GSGLSCD],		--���ٹ�·�ĳ������
	[GSGLLCD],		--���ٹ�·���������
	[GSGLBCD],		--���ٹ�·�˳������������
	[YJGLLC],		--һ����·���
	[EJGLLC],		--������·���
	[SJGLLC],		--������·���
	[SIJGLLC],		--�ļ���·���
	[DWGLLC],		--���⹫·���
	[YPZLMHJLC],		--����װ·�����
	[LQLMHZLC],		--������������
	[SNLMHZLC],		--ˮ����������
	[JYPZLMLC],		--������װ·�����
	[WPZLMLC],		--δ��װ·�����
	[KLHLC],		--���̻����
	[YLHLC],		--���̻����
	[YHLC],			--�������
	[QLZSZ],		--��������
	[QLZSM],		--��������
	[SWLQLZ],		--��������������
	[SWLQLM],		--��������������
	[YJXQLZ],		--��������������
	[YJXQLM],		--��������������
	[BYJXQLZ],		--����������������
	[BYJXQLM],		--����������������
	[LSXQLZ],		--��ʱ����������
	[LSXQLM],		--��ʱ����������
	[HTSQLZ],		--��ͨʽ��������
	[HTSQLM],		--��ͨʽ��������
	[TDQLZ],		--�ش�����������
	[TDQLM],		--�ش�����������
	[DQLZ],			--������������
	[DQLM],			--������������
	[ZQLZ],			--������������
	[ZQLM],			--������������
	[XQLZ],			--С����������
	[XQLM],			--С����������
	[DKHJ],			--�ɿ�����
	[JDDK],			--�����ɿ�����
	[SDSLD],		--�������
	[SDSLY],		--�������
	[TCSDD],		--�س��������
	[TCSDY],		--�س��������
	[CSDD],			--���������
	[CSDY],			--���������
	[ZSDD],			--���������
	[ZSDY],			--���������
	[DSDD],			--���������
	[DSDY],			--���������
	[BZ],			--��ע
	[FMDM_TBFZR],		--��λ������
	[FMDM_TJFZR],		--ͳ�Ƹ�����
	[FMDM_TBR],		--�����
	[FMDM_LXDH],		--��ϵ�绰
	[FMDM_TBDW]		--���λ
)
SELECT
	A.[GLXZDJ],		--��·�����ȼ�
	[SSX],			--�����أ��С������죩
	A.[XJXZQHDM],		--�ؼ�������������
	[GLZLC],		--��·���
	[DJGLLC],		--�ȼ���·���
	[GSGLLC],		--���ٹ�·���
	[GSGLSCD],		--���ٹ�·�ĳ������
	[GSGLLCD],		--���ٹ�·���������
	[GSGLBCD],		--���ٹ�·�˳������������
	[YJGLLC],		--һ����·���
	[EJGLLC],		--������·���
	[SJGLLC],		--������·���
	[SIJGLLC],		--�ļ���·���
	[DWGLLC],		--���⹫·���
	[YPZLMHJLC],		--����װ·�����
	[LQLMHZLC],		--������������
	[SNLMHZLC],		--ˮ����������
	[JYPZLMLC],		--������װ·�����
	[WPZLMLC],		--δ��װ·�����
	[KLHLC],		--���̻����
	[YLHLC],		--���̻����
	[YHLC],			--�������
	[QLZSZ],		--��������
	[QLZSM],		--��������
	[SWLQLZ],		--��������������
	[SWLQLM],		--��������������
	[YJXQLZ],		--��������������
	[YJXQLM],		--��������������
	[BYJXQLZ],		--����������������
	[BYJXQLM],		--����������������
	[LSXQLZ],		--��ʱ����������
	[LSXQLM],		--��ʱ����������
	[HTSQLZ],		--��ͨʽ��������
	[HTSQLM],		--��ͨʽ��������
	[TDQLZ],		--�ش�����������
	[TDQLM],		--�ش�����������
	[DQLZ],			--������������
	[DQLM],			--������������
	[ZQLZ],			--������������
	[ZQLM],			--������������
	[XQLZ],			--С����������
	[XQLM],			--С����������
	[DKHJ],			--�ɿ�����
	[JDDK],			--�����ɿ�����
	[SDSLD],		--�������
	[SDSLY],		--�������
	[TCSDD],		--�س��������
	[TCSDY],		--�س��������
	[CSDD],			--���������
	[CSDY],			--���������
	[ZSDD],			--���������
	[ZSDY],			--���������
	[DSDD],			--���������
	[DSDY],			--���������
	[BZ],			--��ע
	[FMDM_TBFZR],		--��λ������
	[FMDM_TJFZR],		--ͳ�Ƹ�����
	[FMDM_TBR],		--�����
	[FMDM_LXDH],		--��ϵ�绰
	[FMDM_TBDW]		--���λ
FROM
(
	SELECT
		CASE WHEN LEFT(A.K0101,1)='X' THEN '3' WHEN LEFT(A.K0101,1)='Y' THEN '4' WHEN LEFT(A.K0101,1)='C' THEN '5' WHEN LEFT(A.K0101,1)='Z' THEN '6' ELSE NULL END	[GLXZDJ],		--��·�����ȼ�
		MAX(RTRIM(G.OBJJC))	[SSX],			--�����أ��С������죩
		LEFT(A.A0103,6)	[XJXZQHDM],			--�ؼ�������������
		SUM(K0114)	[GLZLC],			--��·���
		sum(case when K0304 in ('10','11','22','23','24') then K0114 else 0 end)	[DJGLLC],	--�ȼ���·���
		sum(case when K0304 in ('10') then K0114 else 0 end)	[GSGLLC],				--���ٹ�·���
		sum(case when K0304 in ('10') and K0404='4' then K0114 else 0 end)	[GSGLSCD],		--���ٹ�·�ĳ������
		sum(case when K0304 in ('10') and K0404='6' then K0114 else 0 end)	[GSGLLCD],		--���ٹ�·���������
		sum(case when K0304 in ('10') and K0404>='8' then K0114 else 0 end)	[GSGLBCD],		--���ٹ�·�˳������������
		sum(case when K0304 in ('11') then K0114 else 0 end)	[YJGLLC],			--һ����·���
		sum(case when K0304 in ('22') then K0114 else 0 end)	[EJGLLC],			--������·���
		sum(case when K0304 in ('23') then K0114 else 0 end)	[SJGLLC],			--������·���
		sum(case when K0304 in ('24') then K0114 else 0 end)	[SIJGLLC],			--�ļ���·���
		sum(case when K0304 in ('30') then K0114 else 0 end)	[DWGLLC],			--���⹫·���
		sum(case when K5104 in ('11','12') then K0114 else 0 end)	[YPZLMHJLC],		--����װ·�����
		sum(case when K5104 in ('11') then K0114 else 0 end)	[LQLMHZLC],			--������������
		sum(case when K5104 in ('12') then K0114 else 0 end)	[SNLMHZLC],			--ˮ����������
		sum(case when K5104  like '2%' then K0114 else 0 end)	[JYPZLMLC],			--������װ·�����
		sum(case when left(K5104,1) not in ('1','2') then K0114 else 0 end)	[WPZLMLC],	--δ��װ·�����
		sum(isnull(A3101,0))	[KLHLC],		--���̻����
		sum(isnull(A3102,0))	[YLHLC],		--���̻����
		sum(isnull(A1001,0))	[YHLC],		--�������
		NULL	[BZ], 				--��עM
		CASE WHEN MAX(RTRIM(E.A0121)) IS NOT NULL THEN MAX(RTRIM(E.A0121)) ELSE MAX(RTRIM(F.A0121)) END		[FMDM_TBFZR],			--��λ������
		CASE WHEN MAX(RTRIM(E.A0122)) IS NOT NULL THEN MAX(RTRIM(E.A0122)) ELSE MAX(RTRIM(F.A0122)) END		[FMDM_TJFZR],			--ͳ�Ƹ�����
		CASE WHEN MAX(RTRIM(E.A0133)) IS NOT NULL THEN MAX(RTRIM(E.A0133)) ELSE MAX(RTRIM(F.A0133)) END		[FMDM_TBR],			--�����
		CASE WHEN MAX(RTRIM(E.A0123)) IS NOT NULL THEN MAX(RTRIM(E.A0123)) ELSE MAX(RTRIM(F.A0123)) END		[FMDM_LXDH],			--��ϵ�绰
		CASE WHEN MAX(RTRIM(REPLACE(E.HA0102,' ',''))) IS NOT NULL THEN MAX(RTRIM(REPLACE(E.HA0102,' ',''))) ELSE MAX(RTRIM(REPLACE(F.HA0102,' ',''))) END	[FMDM_TBDW]	--���λ
	FROM [HRP-DBMS2014]..K001 A 	LEFT JOIN [HRP-DBMS2014]..A01 E ON CASE WHEN LEFT(A.A0102,3)='342' THEN A.A0102 ELSE NULL END=E.A0102
					LEFT JOIN [HRP-DBMS2014]..A01 F ON CASE WHEN LEFT(A.A0102,3)='341' THEN A.A0102 ELSE NULL END=F.A0102
					INNER JOIN [HRP-DBMS2014]..DZ0101 G ON LEFT(A.A0103,6)=G.OBJNAME
	WHERE LEFT(A.K0101,1) IN ('X','Y','Z','C') AND (A.K0124 is null or A.K0124 = '') and isnull(A.K0123,'2') = '2'
	GROUP BY LEFT(A.A0103,6),LEFT(A.K0101,1)
) A 
LEFT JOIN
(
	SELECT
		CASE WHEN LEFT(K0101,1)='X' THEN '3' WHEN LEFT(K0101,1)='Y' THEN '4' WHEN LEFT(K0101,1)='C' THEN '5' WHEN LEFT(K0101,1)='Z' THEN '6' ELSE NULL END	[GLXZDJ],		--��·�����ȼ�
		LEFT(A0103,6)	[XJXZQHDM],		--�ؼ�������������
		COUNT(*)	[QLZSZ],		--��������
		SUM(K6008)	[QLZSM],		--��������
		SUM(CASE WHEN ISNULL(K6028,'') IN ('4','5') THEN 1 ELSE 0 END)	[SWLQLZ],			--��������������
		SUM(CASE WHEN ISNULL(K6028,'') IN ('4','5') THEN K6008 ELSE 0.00 END)	[SWLQLM],		--��������������
		SUM(CASE WHEN ISNULL(K6004,'') IN ('1') THEN 1 ELSE 0 END)	[YJXQLZ],			--��������������
		SUM(CASE WHEN ISNULL(K6004,'') IN ('1') THEN K6008 ELSE 0.00 END)	[YJXQLM],		--��������������
		SUM(CASE WHEN ISNULL(K6004,'') IN ('2') THEN 1 ELSE 0 END)	[BYJXQLZ],			--����������������
		SUM(CASE WHEN ISNULL(K6004,'') IN ('2') THEN K6008 ELSE 0.00 END)	[BYJXQLM],		--����������������
		SUM(CASE WHEN ISNULL(K6004,'') IN ('3') THEN 1 ELSE 0 END)	[LSXQLZ],			--��ʱ����������
		SUM(CASE WHEN ISNULL(K6004,'') IN ('3') THEN K6008 ELSE 0.00 END)	[LSXQLM],		--��ʱ����������
		SUM(CASE WHEN ISNULL(K6062,'') IN ('1') THEN 1 ELSE 0 END)	[HTSQLZ],			--��ͨʽ��������
		SUM(CASE WHEN ISNULL(K6062,'') IN ('1') THEN K6008 ELSE 0.00 END)	[HTSQLM],		--��ͨʽ��������
		SUM(CASE WHEN ISNULL(K6007,'') IN ('1') THEN 1 ELSE 0 END)	[TDQLZ],			--�ش�����������
		SUM(CASE WHEN ISNULL(K6007,'') IN ('1') THEN K6008 ELSE 0.00 END)	[TDQLM],		--�ش�����������
		SUM(CASE WHEN ISNULL(K6007,'') IN ('2') THEN 1 ELSE 0 END)	[DQLZ],				--������������
		SUM(CASE WHEN ISNULL(K6007,'') IN ('2') THEN K6008 ELSE 0.00 END)	[DQLM],			--������������
		SUM(CASE WHEN ISNULL(K6007,'') IN ('3') THEN 1 ELSE 0 END)	[ZQLZ],				--������������
		SUM(CASE WHEN ISNULL(K6007,'') IN ('3') THEN K6008 ELSE 0.00 END)	[ZQLM],			--������������
		SUM(CASE WHEN ISNULL(K6007,'') IN ('4') THEN 1 ELSE 0 END)	[XQLZ],				--С����������
		SUM(CASE WHEN ISNULL(K6007,'') IN ('4') THEN K6008 ELSE 0.00 END)	[XQLM]			--С����������
	FROM [HRP-DBMS2014]..K060
	WHERE LEFT(K0101,1) IN ('X','Y','Z','C')
	GROUP BY LEFT(A0103,6),LEFT(K0101,1)
) B ON A.[GLXZDJ]=B.[GLXZDJ] AND A.[XJXZQHDM]=B.[XJXZQHDM]
LEFT JOIN 
(
	SELECT
		CASE WHEN LEFT(K0101,1)='X' THEN '3' WHEN LEFT(K0101,1)='Y' THEN '4' WHEN LEFT(K0101,1)='C' THEN '5' WHEN LEFT(K0101,1)='Z' THEN '6' ELSE NULL END	[GLXZDJ],		--��·�����ȼ�
		LEFT(A0103,6)	[XJXZQHDM],		--�ؼ�������������
		COUNT(*)	[DKHJ],			--�ɿ�����
		SUM(CASE WHEN ISNULL(K6504,'') IN ('1') THEN 1 ELSE 0 END)	[JDDK]			--�����ɿ�����
	FROM [HRP-DBMS2014]..K065
	WHERE LEFT(K0101,1) IN ('X','Y','Z','C')
		AND K0101 IN
			(
				 SELECT DISTINCT K0101
				 FROM [HRP-DBMS2014]..K001
				 WHERE K0101 IN (SELECT DISTINCT K0101 FROM [HRP-DBMS2014]..K065)
				 	AND ISNULL(K0123,'2')='2' AND RTRIM(ISNULL(K0124,''))=''
			)
	GROUP BY LEFT(A0103,6),LEFT(K0101,1)
) C ON A.[GLXZDJ]=C.[GLXZDJ] AND A.[XJXZQHDM]=C.[XJXZQHDM]
LEFT JOIN
(
	SELECT
		CASE WHEN LEFT(K0101,1)='X' THEN '3' WHEN LEFT(K0101,1)='Y' THEN '4' WHEN LEFT(K0101,1)='C' THEN '5' WHEN LEFT(K0101,1)='Z' THEN '6' ELSE NULL END	[GLXZDJ],		--��·�����ȼ�
		LEFT(A0103,6)	[XJXZQHDM],		--�ؼ�������������
		COUNT(*)	[SDSLD],		--�������
		SUM(K6305)	[SDSLY],		--�������
		SUM(CASE WHEN ISNULL(K6304,'') IN ('1') THEN 1 ELSE 0 END)	[TCSDD],		--�س��������
		SUM(CASE WHEN ISNULL(K6304,'') IN ('1') THEN K6305 ELSE 0.00 END)	[TCSDY],	--�س��������
		SUM(CASE WHEN ISNULL(K6304,'') IN ('2') THEN 1 ELSE 0 END)	[CSDD],			--���������
		SUM(CASE WHEN ISNULL(K6304,'') IN ('2') THEN K6305 ELSE 0.00 END)	[CSDY],		--���������
		SUM(CASE WHEN ISNULL(K6304,'') IN ('3') THEN 1 ELSE 0 END)	[ZSDD],			--���������
		SUM(CASE WHEN ISNULL(K6304,'') IN ('3') THEN K6305 ELSE 0.00 END)	[ZSDY],		--���������
		SUM(CASE WHEN ISNULL(K6304,'') IN ('4') THEN 1 ELSE 0 END)	[DSDD],			--���������
		SUM(CASE WHEN ISNULL(K6304,'') IN ('4') THEN K6305 ELSE 0.00 END)	[DSDY]		--���������
	FROM [HRP-DBMS2014]..K063
	WHERE LEFT(K0101,1) IN ('X','Y','Z','C')
	GROUP BY LEFT(A0103,6),LEFT(K0101,1)
) D ON A.[GLXZDJ]=D.[GLXZDJ] AND A.[XJXZQHDM]=D.[XJXZQHDM]

--2-----------------------------------------------------------------------------------------------------------------
--3---------------------------------------------------------------------------------------------------------------

-- TRUNCATE TABLE T_LD

-- SELECT * FROM T_LD

INSERT INTO [T_LD]
(
	[LDBM],		--·�δ���
	[LXMC],		--·������
	[SZXZQHDM],	--����������������
	[QDMC],		--�������
	[QDZH],		--���׮��
	[QDSFWFJD],	--����Ƿ�Ϊ�ֽ��
	[QDFJDLB],	--���ֽ�����
	[ZDMC],		--��������
	[ZDZH],		--����׮��
	[ZDSFWFJD],	--�����Ƿ�Ϊ�ֽ��
	[ZDFJDLB],	--����ֽ�����
	[LDJSDJ],	--·�μ����ȼ�
	[LDLMLX],	--·��·������
	[LJKD],		--·�����
	[LMKD],		--·����
	[LDLC],		--·�����
	[SFWGYLD],	--�Ƿ�Ϊ����·��
	[SGYLDBM],	--������·�δ���
	[SGYLDQDZH],	--������·�����׮��
	[SGYLDZDZH],	--������·������׮��
	[SFWCSDLLD],	--�Ƿ�Ϊ���е�··��
	[SFWDGTLD],	--�Ƿ�Ϊ����ͨ·��
	[JCSJ],		--����ʱ��
	[ZXGJSJ],	--���¸Ľ�ʱ��
	[HDSL],		--��������
	[BGYY],		--���ԭ��
	[CDSL],		--�������� 
	[YHLC],		--�������
	[KLHLC],	--���̻����
	[YLHLC],	--���̻����
	[SJSS],		--���ʱ��
	[GYDWMC],	--������λ����
	[LDSFXZ],	--·���շ�����
	[ZJYCXFYHSJ],	--���һ���޸��������
	[YLXBM],	--ԭ·�߱���
	[YQDZH],	--ԭ���׮��
	[YZDZH],	--ԭ����׮��
	[BZ],		--��ע
	[FMDM_TBFZR],	--��λ������
	[FMDM_TJFZR],	--ͳ�Ƹ�����
	[FMDM_TBR],	--�����
	[FMDM_LXDH],	--��ϵ�绰
	[FMDM_TBDW]	--���λ
)
SELECT 
	UPPER(RTRIM(K0101))+RTRIM(K0115), 	--·�α��C
	RTRIM(K0112), 				--·�߼��C
	RTRIM(A.A0103)+'000', 			--��������DY
	LEFT(RTRIM(K0110),25), 			--·���������CY
	K0108, 					--·�����׮��NP
	ISNULL(NULLIF(K0153,''),'2'), 		--����Ƿ�Ϊ�ֽ��D
	NULLIF(K0154,''), 			--���ֽ�����D
	LEFT(RTRIM(K0111),25), 			--·��ֹ������CY
	K0109, 					--·��ֹ��׮��NY
	ISNULL(NULLIF(K0157,''),'2'), 		--ֹ���Ƿ�Ϊ�ֽ��D
	NULLIF(K0158,''), 			--ֹ��ֽ�����D
	CASE WHEN K0304='10' THEN '1' WHEN K0304='11' THEN '2' 
		WHEN K0304='22' THEN '3' WHEN K0304='23' THEN '4' WHEN K0304='24' THEN '5' WHEN K0304='30' THEN '6' ELSE NULL END, 	--�����ȼ�D
	CASE WHEN K5104='11' THEN '1' WHEN K5104='12' THEN '2' 
		WHEN LEFT(K5104,1)='2' THEN '3' WHEN K5104='31' THEN '4' WHEN K5104='32' THEN '5' WHEN K5104='33' THEN '6'
			WHEN K5104='34' THEN '7' WHEN K5104='35' THEN '9' WHEN K5104='36' THEN '8' ELSE NULL END, 			--�������D
	K4002, 		--·�����(��)N
	K5404, 		--·����(��)N
	K0114, 		--���(����)NY
	CASE WHEN K0124 IS NULL OR ISNULL(K0124,'')='' THEN '2' ELSE '1' END,	--�Ƿ��ظ�·��
	UPPER(RTRIM(LEFT(K0124,10))), 						--�ظ�·�α��C
	CASE WHEN LEFT(K0124,1) IN ('X','Y','Z','C') THEN NULL ELSE K0162 END,	--�ظ�·�����׮��
	CASE WHEN LEFT(K0124,1) IN ('X','Y','Z','C') THEN NULL ELSE K0163 END,	--�ظ�·��ֹ��׮��
	ISNULL(K0121,'2'), 							--�Ƿ�ǹ�·��D
	CASE WHEN K0123='1' THEN '1' ELSE '2' END, 				--�Ƿ��ͷ··��D
	LEFT(K0180,4), 			--�޽����C
	NULLIF(LEFT(K0181,4),''), 	--�Ľ����C
	ISNULL(A0522,0), 		--��������N
	CASE WHEN LEFT(ISNULL(K0180,''),4)=CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END THEN '11'
		WHEN LEFT(ISNULL(K0181,''),4)=CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END AND ISNULL(K3912,'')='' THEN '21'
	ELSE 
		CASE WHEN ISNULL(K3912,'')<>'' THEN K3912 ELSE '10' END 
	END,  			--���ԭ��D
	replace(replace(replace(replace(rtrim(ISNULL(k0404,'0')),'A','10'),'C','12'),'E','14'),'G','16'),	--��������
	ISNULL(A1001,0.000),		--�������
	ISNULL(a3101,0.000),		--���̻����
	ISNULL(a3102,0.000),		--���̻����
	k0306,		--���ʱ��
	ltrim(rtrim(replace(a0130,' ',''))),	--������λ����
	case when rtrim(ISNULL(k0136,'01'))='01' then '1' 
		when rtrim(ISNULL(k0136,'01'))='02' then '2' 
		when rtrim(ISNULL(k0136,'01'))='03' then '3' 
	else '' 
	end,		--·���շ�����
	rtrim(K0155),	--���һ���޸��������
	CASE WHEN LEFT(ISNULL(K1302,''),1) IN ('G','S') THEN RTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K1302,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')))
	ELSE K1302
	END,		--����·�߱���
	K1303,		--�������׮��
	K1304,		--����ֹ��׮��
	K0199, 		--��עM
	RTRIM(A0121),		--��λ������
	RTRIM(A0122),		--ͳ�Ƹ�����
	RTRIM(A0133),		--�����
	RTRIM(A0123),		--��ϵ�绰
	RTRIM(REPLACE(A.HA0102,' ',''))		--���λ
FROM [HRP-DBMS2014]..K001 A LEFT JOIN [HRP-DBMS2014]..A01 B ON A.A0102=B.A0102
WHERE LEFT(K0101,1) NOT IN ('G','S','H','T','W')



--��ͷ·
UPDATE T_LD
SET LMKD=NULL,LDJSDJ=NULL,LDLMLX=NULL,LJKD=NULL,JCSJ=NULL,ZXGJSJ=NULL,HDSL=NULL,CDSL=0,YHLC=0,KLHLC=0,YLHLC=0,SJSS=NULL,GYDWMC=NULL,LDSFXZ=NULL,ZJYCXFYHSJ=NULL
WHERE SFWDGTLD ='1'



SELECT A0102,K0101,RTRIM(K0115) K0115,K0108,K0109,K0161,K0124,K0162,K0163 
INTO #CFLD 
FROM [HRP-DBMS2014]..K001
WHERE K0124 IS NOT NULL 
ORDER BY K0101

UPDATE B 
SET B.K0115=A.K0115 
FROM #CFLD B,[HRP-DBMS2014]..K001 A 
WHERE RTRIM(A.K0101)=RTRIM(B.K0124) AND A.K0108<=B.K0162 AND A.K0109>B.K0162


UPDATE A 
SET SGYLDBM=RTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')))+RTRIM(K0115) 
FROM T_LD A JOIN #CFLD B ON LEFT(RTRIM(LDBM),10)=RTRIM(K0101) AND QDZH=K0108 AND ZDZH=K0109
-----------------------------------------------------

UPDATE A
SET 
	A.SZXZQHDM	=B.SZXZQHDM, 
	A.LDJSDJ	=B.LDJSDJ, 
	A.LDLMLX	=B.LDLMLX,
	A.LMKD		=B.LMKD, 
	A.LJKD		=B.LJKD, 
	A.SFWDGTLD	=B.SFWDGTLD, 
	A.JCSJ		=B.JCSJ, 
	A.ZXGJSJ	=B.ZXGJSJ, 
	A.HDSL		=B.HDSL, 
	A.SFWCSDLLD	=B.SFWCSDLLD, 
	A.BZ		=B.BZ, 
	A.CDSL		=B.CDSL, 
	A.SJSS		=B.SJSS, 
	A.LDSFXZ	=B.LDSFXZ, 
	A.ZJYCXFYHSJ	=B.ZJYCXFYHSJ
--SELECT *
FROM T_LD A INNER JOIN T_LD B ON RTRIM(A.SGYLDBM)=B.LDBM
WHERE LEFT(A.SGYLDBM,1) IN ('X','Y','Z','C')


-------------------------------------------------
UPDATE T_LD
SET BZ='δ�޽�'
WHERE SFWDGTLD ='1'
DELETE T_LD
FROM T_LD
WHERE LEFT(LDBM,10) NOT IN (SELECT LEFT(LDBM,10) FROM T_LD WHERE SFWDGTLD='2' GROUP BY LEFT(LDBM,10))


--4---------------------------------------------------------------------------------------------------------------

INSERT INTO [T_QL]
(
	[QLBM],		--��������
	[LXMC],		--·������
	[QLMC],		--��������
	[JCSJ],		--����ʱ��
	[ZXGJSJ],	--���¸Ľ�ʱ��
	[QLZXZH],	--�����е�׮��
	[QLQC],		--����ȫ��
	[SJHZDJ],	--��ƺ��صȼ�
	[AKJFL],	--���羶����
	[ASYNXFL],	--��ʹ�����޷���
	[QLSBJGLX],	--�����ϲ��ṹ����
	[SFHTLJ],	--�Ƿ�ͨ����
	[JSZKPDDJ],	--����״�������ȼ�
	[KJZC],		--�羶�ܳ�
	[DKZDKJ],	--�������羶
	[QLQK],		--����ȫ��
	[QMJK],		--���澻��
	[GYDWMC],	--������λ����
	[BGYY],		--���ԭ��
	[YQLBM],	--ԭ��������
	[KJZH],		--�羶���
	[QDLX],		--�Ŷ�����
	[KZDJ],		--����ȼ�
	[KYDWLX],	--��Խ��������
	[KYDWMC],	--��Խ��������
	[THDJ],		--ͨ���ȼ�
	[DTFZSSLX],	--��̨��ײ��ʩ����
	[JSDW],		--���赥λ
	[SJDW],		--��Ƶ�λ
	[SGDW],		--ʩ����λ
	[JLDW],		--����λ
	[JCTCRQ],	--����ͨ������
	[GYDWXZ],	--������λ����
	[JGDWMC],	--��ܵ�λ����
	[SFXZ],		--�շ�����
	[PDRQ],		--��������
	[PDDW],		--������λ
	[PDWSWLQLYY],	--����Ϊ����������ԭ��
	[ZXGZWGRQ],	--���¸����깤����
	[ZXGZSFSYWQGZXM],	--���¸����Ƿ�����Σ�Ÿ�����Ŀ
	[ZXGZBW],	--���¸��첿λ
	[ZXGZGCXZ],	--���¸��칤������
	[ZXGZSGDW],	--���¸���ʩ����λ
	[ZXGZSFBBZXM],	--���¸����Ƿ񲿲�����Ŀ
	[QLDQZYBHBW],	--��ǰ��Ҫ������λ
	[QLDQZYBHMS],	--��ǰ��Ҫ��������
	[JTGZCS],	--��ͨ���ƴ�ʩ
	[QLSBGZJGCL],	--�����ϲ�����ṹ����
	[QLSZWZ],	--��������λ��
	[SFKLZQ],	--�Ƿ��·խ��
	[SFKSQL],	--�Ƿ��ʡ����
	[BZ],		--��ע
	[FMDM_TBFZR],	--��λ������
	[FMDM_TJFZR],	--ͳ�Ƹ�����
	[FMDM_TBR],	--�����
	[FMDM_LXDH],	--��ϵ�绰
	[FMDM_TBDW]	--���λ
)
SELECT 
	UPPER(RTRIM(A.K0101))+'L'+LTRIM(RTRIM(A.K6001)), 	--��������NP
	RTRIM(A.K0112), 					--·�߼��C
	RTRIM(A.K6002), 					--��������CY
	LEFT(A.K0180,4), 					--�޽����C
	CASE WHEN ISNULL(A.K0181,'')='' OR ISNULL(A.A1317,'')='' OR ISNULL(A.K6051,'')='' OR ISNULL(A.A1318,'')=''
		THEN NULL
	ELSE LEFT(A.K0181,4)
	END,		 					--�Ľ����C
	A.K6003, 						--��������׮��NY
	A.K6008, 						--����ȫ��(��)NY
	A.K6022, 						--��ƺ��صȼ�DY
	A.K6007,						--���羶����
	A.K6004, 						--��ʹ�����޷�DY
	A.K6016,						--�����ϲ��ṹ����
	CASE WHEN A.K6062='1' THEN '1' ELSE '2' END,		--�Ƿ�ͨ����
	A.K6028,						--����״�������ȼ�
	RTRIM(A.K6065), 					--�羶�ܳ�(��)NY
	A.K6063, 						--�������羶(��)NY
	A.K6066, 						--����ȫ��(��)NY
	A.K6009, 						--���澻��(��)NY
	LTRIM(RTRIM(REPLACE(A.A1314,' ',''))),			--������λ����
	CASE WHEN LEFT(ISNULL(A.K0180,''),4)=CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END THEN '11'
		WHEN LEFT(ISNULL(A.K0181,''),4)=CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END AND C.KWYID IS NOT NULL  THEN '21'
		WHEN C.KWYID IS NULL THEN '14'
	ELSE 
		CASE WHEN ISNULL(A.K3912,'')<>'' THEN A.K3912 ELSE '10' END 
	END,  							--���ԭ��D
	CASE WHEN LEFT(ISNULL(A.K0180,''),4)=CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END THEN NULL ELSE
	CASE WHEN LEFT(C.K0101,1) IN ('G','S','H','T') THEN RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(C.K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+LEFT(RTRIM(C.A0103),6) 
	ELSE RTRIM(C.K0101) END+'L'+RTRIM(C.K6001)
	END,							--ԭ��������
	rtrim(replace(A.k6064,' ','')),				--�羶���
	A.k6017,    						--�Ŷ�����
	A.k6023,						--����ȼ�
	A.k6005,						--��Խ����
	rtrim(ltrim(replace(replace(replace(replace(A.k6006,char(13),''),char(10),''),char(9),''),char(32),''))),	--��Խ��������
	A.k6024,						--ͨ���ȼ�
	A.a1328,						--��̨��ײ����
	A.k6079,						--���赥λ
	replace(A.k6030,' ',''),				--��Ƶ�λ
	A.k6031,						--ʩ����λ
	replace(A.k6032,' ',''),				--����λ
	A.K0116,			--ͨ������
	A.a1313,						--������λ���ʴ���
	rtrim(replace(replace(A.k6111,' ',''),char(127),'')),	--��ܵ�λ����
	A.a1302,						--�շ�����
	A.a1305,						--��������
	rtrim(replace(A.K6050,' ','')),				--����״��������λ
	A.K6122,						--����Ϊ����������ԭ��
	CASE WHEN ISNULL(A.K0181,'')=''
		THEN NULL
	ELSE A.a1316
	END,							--�����깤����
	CASE WHEN ISNULL(A.K0181,'')=''
		THEN NULL
	ELSE ISNULL(A.a1331,'2')
	END,							--���¸����Ƿ�����Σ�Ÿ�����Ŀ
	CASE WHEN ISNULL(A.K0181,'')=''
		THEN NULL
	ELSE LEFT(A.a1317,1)+'0'
	END,							--���첿λ
	CASE WHEN ISNULL(A.K0181,'')=''
		THEN NULL
	ELSE REPLACE(REPLACE(REPLACE(A.a1318,'A','6'),'B','7'),'C','8')
	END,							--�������ʴ���
	CASE WHEN ISNULL(A.K0181,'')=''
		THEN NULL
	ELSE rtrim(replace(A.K6051,' ',''))
	END,							--����ʩ����λ
	CASE WHEN ISNULL(A.K0181,'')=''
		THEN NULL
	ELSE ISNULL(A.a1319,'2')
	END,							--�Ƿ񲿲�����Ŀ
	CASE WHEN ISNULL(A.K6028,'') IN ('4','5') THEN 
		CASE WHEN ISNULL(A.A1306,'')<>'' THEN LEFT(A.A1306,1)+'0' ELSE NULL END
	ELSE NULL
	END,							--��Ҫ����λ��
	CASE WHEN ISNULL(A.K6028,'') IN ('4','5') THEN rtrim(A.K6102)
	ELSE NULL
	END,							--��Ҫ��������
	ISNULL(REPLACE(A.a1307,'',NULL),'1'),			--��ȡ��ͨ���ƴ�ʩ
	A.K6110,						--�����ϲ��ṹ����
	RTRIM(isnull(A.K6117,'3')),				--��������λ��
	RTRIM(isnull(A.K6118,'2')),				--�Ƿ��·խ��
	RTRIM(isnull(A.K6120,'2')),				--�Ƿ��ʡ����
	A.K0199, 						--��עM
	RTRIM(B.A0121),						--��λ������
	RTRIM(B.A0122),						--ͳ�Ƹ�����
	RTRIM(B.A0133),						--�����
	RTRIM(B.A0123),						--��ϵ�绰
	RTRIM(REPLACE(A.HA0102,' ',''))				--���λ
FROM [HRP-DBMS2014]..K060 A LEFT JOIN [HRP-DBMS2014]..A01 B ON A.A0102=B.A0102
	LEFT JOIN [HRP-DBMS2014]..QIAOLIANG C ON A.KWYID=C.KWYID
WHERE LEN(A.K0101)=10 AND LEFT(A.K0101,1) NOT IN ('G','S','H','T','W') 

--5---------------------------------------------------------------------------------------------------------------

INSERT INTO [T_SD]
(
	[SDBM],		--�������
	[LXMC],		--·������
	[SDMC],		--�������
	[JCSJ],		--����ʱ��
	[ZXGJSJ],	--���¸Ľ�ʱ��
	[SDRKZH],	--������׮��
	[ZTJSZKPD],	--���弼��״������
	[ZTPDRQ],	--������������
	[ZTPDDW],	--����������λ
	[TJJSZKPD],	--�����ṹ����״������
	[TJJGPDRQ],	--�����ṹ��������
	[TJJGPDDW],	--�����ṹ������λ
	[JDJSZKPD],	--������ʩ����״������
	[JDSSPDRQ],	--������ʩ��������
	[JDSSPDDW],	--������ʩ������λ
	[QTJSZKPD],	--����������ʩ����״������
	[QTGCSSPDRQ],	--����������ʩ��������
	[QTGCSSPDDW],	--����������ʩ������λ
	[SDCD],		--�������
	[SDJG],		--�������
	[SDJK],		--�������
	[GYDWMC],	--������λ����
	[BGYY],		--���ԭ��
	[YSDBM],	--ԭ�������
	[ASDCDFL],	--��������ȷ���
	[SFSXSD],	--�Ƿ�ˮ�����
	[JSDWMC],	--���赥λ����
	[SJDWMC],	--��Ƶ�λ����
	[SGDWMC],	--ʩ����λ����
	[JLDWMC],	--����λ����
	[JCTCSJ],	--����ͨ��ʱ��
	[SDYHDJ],	--��������ȼ�
	[GYDWXZ],	--������λ����
	[JGDWMC],	--��ܵ�λ����
	[ZXGZWGRQ],	--���¸����깤����
	[SDZXGZBW],	--���¸��첿λ
	[ZXGZGCXZ],	--���¸��칤������
	[SDDQZYBHBW],	--��ǰ��Ҫ������λ
	[SDDQZYBHMS],	--��ǰ��Ҫ��������
	[SDSZWZ],	--�������λ��
	[SFKSSD],	--�Ƿ��ʡ���
	[BZ],		--��ע
	[FMDM_TBFZR],	--��λ������
	[FMDM_TJFZR],	--ͳ�Ƹ�����
	[FMDM_TBR],	--�����
	[FMDM_LXDH],	--��ϵ�绰
	[FMDM_TBDW]	--���λ
)
SELECT 
	UPPER(RTRIM(A.K0101))+'U'+RTRIM(A.K6301),	--�������CY
	A.K0112, 					--·�߼��C
	A.K6302, 					--�������CY
	LEFT(A.K0180,4), 				--�޽����
	LEFT(A.K0181,4), 				--�Ľ����
	A.K6303, 					--������׮��NY
	RTRIM(A.K6336), 				--�����ȼ�(����)	
	RTRIM(A.K6344),  				--��������(����)
	RTRIM(A.K6345),  				--������λ(����)
	RTRIM(A.K6346), 				--�����ȼ�(����)
	RTRIM(A.K6347),  				--��������(�����ṹ)
	RTRIM(A.K6348),  				--������λ(�����ṹ)
	RTRIM(A.K6349), 				--�����ȼ�(����)
	RTRIM(A.K6350),  				--��������(������ʩ)
	RTRIM(A.K6351),  				--������λ(������ʩ)
	RTRIM(A.K6352), 				--�����ȼ�(����)
	RTRIM(A.K6353),  				--��������(����������ʩ)
	RTRIM(A.K6354),  				--������λ(����������ʩ)
	A.K6305, 					--�������(��)NY
	A.K6307, 					--�������(��)NY
	A.K6306, 					--�������(��)N
	RTRIM(REPLACE(A.A0130,' ','')),  		--������λ����DP
	CASE WHEN LEFT(ISNULL(A.K0180,''),4)=CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END THEN '11'
		WHEN LEFT(ISNULL(A.K0181,''),4)=CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END THEN '21'
		WHEN C.KWYID IS NULL THEN '14'
	ELSE 
		CASE WHEN ISNULL(A.K3912,'')<>'' THEN A.K3912 ELSE '10' END 
	END,  						--���ԭ��D
	CASE WHEN LEFT(ISNULL(A.K0180,''),4)=CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END THEN NULL ELSE
	CASE WHEN LEFT(C.K0101,1) IN ('G','S','H','T') THEN RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(C.K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+LEFT(RTRIM(C.A0103),6) 
	ELSE RTRIM(C.K0101) END+'U'+RTRIM(C.K6301)
	END,						--ԭ�������
	RTRIM(A.K6304),  				--��������ȷ���
	ISNULL(A.K6335,'2'),				--�Ƿ�ˮ�����
	RTRIM(A.K6079),  				--���赥λ����
	RTRIM(REPLACE(A.K6030,CHAR(127),'')),  		--��Ƶ�λ����
	RTRIM(REPLACE(A.K6031,CHAR(127),'')),  		--ʩ����λ����
	RTRIM(A.K6032),  				--����λ����
	RTRIM(A.K0116),    				--ͨ��ʱ��
	RTRIM(ISNULL(A.K6343,'')),			--��������ȼ�
	RTRIM(A.A1313),    				--������λ���ʴ���
	RTRIM(A.K6111),  				--��ܵ�λ����
	RTRIM(A.A1316),  				--�����깤����
	CASE WHEN ISNULL(A.K6337,'')<>'' THEN REPLACE(LEFT(A.K6337,1),'3','9')+'0' ELSE NULL END,			--���첿λ
	REPLACE(REPLACE(REPLACE(A.a1318,'A','6'),'B','7'),'C','8'),							--�������ʴ���
	CASE WHEN ISNULL(A.K6338,'')<>'' THEN REPLACE(LEFT(A.K6338,1),'3','9')+'0' ELSE NULL END,  			--������λ
	REPLACE(RTRIM(A.K6339),' ',''),  		--��������
	RTRIM(ISNULL(A.K6370,'')),			--�������λ��
	RTRIM(ISNULL(A.K6371,'2')),			--�Ƿ��ʡ���
	A.K0199, 					--��עM
	RTRIM(B.A0121),					--��λ������
	RTRIM(B.A0122),					--ͳ�Ƹ�����
	RTRIM(B.A0133),					--�����
	RTRIM(B.A0123),					--��ϵ�绰
	RTRIM(REPLACE(A.HA0102,' ',''))			--���λ
FROM [HRP-DBMS2014]..K063 A LEFT JOIN [HRP-DBMS2014]..A01 B ON A.A0102=B.A0102
	LEFT JOIN [HRP-DBMS2014]..SUIDAO C ON A.KWYID=C.KWYID
WHERE LEFT(A.K0101,1) NOT IN ('G','S','H','T','W')


--6---------------------------------------------------------------------------------------------------------------

INSERT INTO [T_DK]
(
	[DKBM],			--�ɿڴ���
	[LXMC],			--·������
	[DKMC],			--�ɿ�����
	[JCSJ],			--����ʱ��
	[ZXGJSJ],		--���¸Ľ�ʱ��
	[QDZH],			--���׮��
	[DKKD],			--�ɿڿ��
	[SFJD],			--�Ƿ�����ɿ�
	[DKLX],			--�ɿ�����
	[BGYY],			--���ԭ��
	[YDKBM],		--ԭ�ɿڴ���
	[BZ],			--��ע
	[FMDM_TBFZR],		--��λ������
	[FMDM_TJFZR],		--ͳ�Ƹ�����
	[FMDM_TBR],		--�����
	[FMDM_LXDH],		--��ϵ�绰
	[FMDM_TBDW]		--���λ
)
SELECT 
	UPPER(RTRIM(A.K0101))+'D'+RTRIM(A.K6501), 	--�ɿڱ���CY
	RTRIM(A.K0112), 				--·�߼��C
	RTRIM(A.K6502), 				--�ɿ�����CY
	LEFT(A.K6328,4), 				--�޽�����CY
	NULL, 						--�Ľ����CY
	A.K6503, 					--�ɿ�׮��NY
	A.K6523*1000, 					--�ɿڿ��(��)N
	CASE WHEN A.K6504='1' THEN '1' 
	ELSE '2' 
	END, 						--�Ƿ�����ɿ�DY
	CASE WHEN A.K6504='1' THEN '1' 
	ELSE '2' 
	END, 						--�ɿڷ���DY
	CASE WHEN LEFT(ISNULL(A.K6328,''),4)=CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END THEN '11'
		WHEN C.KWYID IS NULL THEN '14'
	ELSE '10' 
	END,  						--���ԭ��D
	CASE WHEN LEFT(ISNULL(A.K6328,''),4)=CASE WHEN MONTH(GETDATE())<6 THEN YEAR(GETDATE())-1 ELSE YEAR(GETDATE()) END THEN NULL ELSE 
	CASE WHEN LEFT(C.K0101,1) IN ('G','S','H','T') THEN RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(C.K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))+LEFT(RTRIM(C.A0103),6) 
	ELSE RTRIM(C.K0101) END+'D'+RTRIM(C.K6501)
	END,						--ԭ�ɿڴ���
	A.K0199, 					--��עM
	RTRIM(B.A0121),					--��λ������
	RTRIM(B.A0122),					--ͳ�Ƹ�����
	RTRIM(B.A0133),					--�����
	RTRIM(B.A0123),					--��ϵ�绰
	RTRIM(REPLACE(A.HA0102,' ',''))			--���λ
FROM [HRP-DBMS2014]..K065 A LEFT JOIN [HRP-DBMS2014]..A01 B ON A.A0102=B.A0102
	LEFT JOIN [HRP-DBMS2014]..DUKOU C ON A.KWYID=C.KWYID
WHERE LEFT(A.K0101,1) NOT IN ('G','S','H','T','W')
	AND A.K0101 IN
		(
		 SELECT DISTINCT K0101
		 FROM [HRP-DBMS2014]..K001
		 WHERE K0101 IN (SELECT DISTINCT K0101 FROM [HRP-DBMS2014]..K065)
		 	AND ISNULL(K0123,'2')='2' AND RTRIM(ISNULL(K0124,''))=''
		)

--7---------------------------------------------------------------------------------------------------------------

INSERT INTO [T_NCGLAFSS]
(
	[AFSSID],		--��¼Ψһ��ʶ
	[LXBM],			--·�ߴ���
	[LXMC],			--·������
	[XJXZQHDM],		--�ؼ�������������
	[QDZH],			--���׮��
	[ZDZH],			--����׮��
	[LDLX],			--·������
	[SFXYSSAFSS],		--�Ƿ���Ҫʵʩ��������
	[SFYSSAFSS],		--�Ƿ���ʵʩ��������
	[SSAFGCSJ],		--ʵʩʱ��
	[BZAFSSSFQQ],		--��־��ȫ��ʩ�Ƿ���ȫ
	[BXAFSSSFQQ],		--���߰�ȫ��ʩ�Ƿ���ȫ
	[HLAFSSSFQQ],		--������ȫ��ʩ�Ƿ���ȫ
	[JSDAFSSSFQQ],		--���ٴ���ȫ��ʩ�Ƿ���ȫ
	[SJDAFSSSFQQ],		--ʾ����/׮��ȫ��ʩ�Ƿ���ȫ
	[XGSSAFSSSFQQ],		--�޸߰�ȫ��ʩ�Ƿ���ȫ
	[XKSSAFSSSFQQ],		--�޿�ȫ��ʩ�Ƿ���ȫ
	[SJSSSFQQ],		--�Ӿ���ʩ�Ƿ���ȫ
	[CCDSFQQ],		--�����Ƿ���ȫ
	[QTAFSSSFQQ],		--������ȫ��ʩ�Ƿ���ȫ
	[LDPJLKSL],		--·��ƽ��·����(��)
	[LDPJLKJSDSL],		--ƽ��·�ڹ��м��ٴ�����(��)
	[BZ],			--��ע
	[FMDM_TBFZR],		--��λ������
	[FMDM_TJFZR],		--ͳ�Ƹ�����
	[FMDM_TBR],		--�����
	[FMDM_LXDH],		--��ϵ�绰
	[FMDM_TBDW]		--���λ
)
SELECT 
	NEWID(),				--��¼Ψһ��ʶ
	RTRIM(K0101),				--·�ߴ���
	RTRIM(K0112),				--·������
	LEFT(A.A0103,6),			--�ؼ�������������
	K0108,					--���׮��
	K0109,					--����׮��
	K0816,					--·������
	ISNULL(K0801,'2'),			--�Ƿ���Ҫʵʩ��������
	ISNULL(K0802,'2'),			--�Ƿ���ʵʩ��������
	K0803,					--ʵʩʱ��
	ISNULL(K0804,'1'),			--��־��ȫ��ʩ�Ƿ���ȫ
	ISNULL(K0805,'1'),			--���߰�ȫ��ʩ�Ƿ���ȫ
	ISNULL(K0806,'1'),			--������ȫ��ʩ�Ƿ���ȫ
	ISNULL(K0807,'1'),			--���ٴ���ȫ��ʩ�Ƿ���ȫ
	ISNULL(K0808,'1'),			--ʾ����/׮��ȫ��ʩ�Ƿ���ȫ
	ISNULL(K0809,'1'),			--�޸߰�ȫ��ʩ�Ƿ���ȫ
	ISNULL(K0810,'1'),			--�޿�ȫ��ʩ�Ƿ���ȫ
	ISNULL(K0814,'1'),			--�Ӿ���ʩ�Ƿ���ȫ
	ISNULL(K0815,'1'),			--�����Ƿ���ȫ
	ISNULL(K0811,'1'),			--������ȫ��ʩ�Ƿ���ȫ
	K0812,					--·��ƽ��·����(��)
	K0813,					--ƽ��·�ڹ��м��ٴ�����(��)
	A.A0129, 				--��עM
	RTRIM(B.A0121),				--��λ������
	RTRIM(B.A0122),				--ͳ�Ƹ�����
	RTRIM(B.A0133),				--�����
	RTRIM(B.A0123),				--��ϵ�绰
	RTRIM(REPLACE(A.HA0102,' ',''))		--���λ
FROM [HRP-GHSS2014]..K08 A LEFT JOIN [HRP-DBMS2014]..A01 B ON A.A0102=B.A0102
WHERE LEFT(A.K0101,1) NOT IN ('G','S','H','T','W')

--8-----------------------------------------------------------------------------------------------------------------

INSERT INTO [T_XZ]
(
	[XZBM],		--�磨�򣩴���
	[XZMC],		--�磨������
	[XJXZQHDM],	--�ؼ�������������
	[SSSF],		--����ʡ��
	[SSS],		--�����У��ء��ݡ��ˣ�
	[SSX],		--�����أ��С������죩
	[CXFL],		--�������
	[SSDX],		--��������
	[DYSFJYMT],	--�����Ƿ���½����ͨ��ͷ
	[MTYLDJL],	--��ͷ��½�ؾ���
	[DNSFJYGL],	--�����Ƿ��й�·
	[TDXZ],		--ͨ����״
	[YXTDLXDJ],	--��ѡͨ��·�������ȼ�
	[YXTDLXBM],	--��ѡͨ��·�ߴ���
	[YXTDLXMC],	--��ѡͨ��·������
	[SFTSJJYSGL],	--�Ƿ���ͨ���������Ϲ�·
	[BGYY_XC],	--���ԭ��
	[YXZBM],	--ԭ�磨�򣩴���
	[BZ],		--��ע
	[FMDM_TBFZR],	--��λ������
	[FMDM_TJFZR],	--ͳ�Ƹ�����
	[FMDM_TBR],	--�����
	[FMDM_LXDH],	--��ϵ�绰
	[FMDM_TBDW]	--���λ
)
SELECT
	RTRIM(A.V0501)+'000',
	RTRIM(A.HV0501), 		--����DP
	LEFT(A.V0501,6),		--�ؼ���������
	RTRIM(B.OBJJC),			--ʡ��
	RTRIM(C.OBJJC),			--�м�
	RTRIM(D.OBJJC),			--�ؼ�
	RTRIM(A.V0504),			--�������
	A.V0506, 			--��������DY
	A.V0507, 			--�����Ƿ���½����ͨ��ͷD
	A.V0508, 			--��ͷ��½�ؾ���(����)N
	A.V0509, 			--�����Ƿ��й�·D
	A.V8101, 			--ͨ����״DY
	A.V8103, 			--��ѡͨ��·�������ȼ�D
	UPPER(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(A.V8104,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))), 	--·�ߴ���CP
	A.V8105,  			--·��ȫ��C
	CASE WHEN ISNULL(A.V0504,'') IN ('12','13') THEN RTRIM(ISNULL(A.V0502,'2')) ELSE NULL END,					--�Ƿ�ͨ���������Ϲ�·
	CASE WHEN RTRIM(A.V0501)=RTRIM(F.V0501) AND RTRIM(A.HV0501)=RTRIM(F.HV0501) THEN '10'
		WHEN F.V0501 IS NULL THEN '11'
	ELSE '21'
	END,				--���ԭ��
	RTRIM(F.V0501)+'000',		--ԭ�磨�򣩴���
	A.K0199, 			--��עM
	RTRIM(E.A0121),			--��λ������
	RTRIM(E.A0122),			--ͳ�Ƹ�����
	RTRIM(E.A0133),			--�����
	RTRIM(E.A0123),			--��ϵ�绰
	RTRIM(REPLACE(E.HA0102,' ',''))	--���λ
FROM [HRP-DBMS2014]..V51  A LEFT JOIN [HRP-DBMS2014]..DZ0101 B ON LEFT(A.V0501,2)=B.OBJNAME
			LEFT JOIN [HRP-DBMS2014]..DZ0101 C ON LEFT(A.V0501,4)=C.OBJNAME
			LEFT JOIN [HRP-DBMS2014]..DZ0101 D ON LEFT(A.V0501,6)=D.OBJNAME
			LEFT JOIN [HRP-DBMS2014]..A01 E ON A.A0102=E.A0102
			LEFT JOIN [HRP-DBMS2014-2022�걨]..V51 F ON A.KWYID=F.KWYID

UPDATE T_XZ SET YXTDLXBM=NULL,
			YXTDLXMC=NULL WHERE YXTDLXDJ='7'

UPDATE T_XZ SET YXTDLXDJ='G' WHERE YXTDLXDJ='1'
UPDATE T_XZ SET YXTDLXDJ='S' WHERE YXTDLXDJ='2'
UPDATE T_XZ SET YXTDLXDJ='X' WHERE YXTDLXDJ='3'
UPDATE T_XZ SET YXTDLXDJ='Y' WHERE YXTDLXDJ='4'
UPDATE T_XZ SET YXTDLXDJ='Z' WHERE YXTDLXDJ='5'
UPDATE T_XZ SET YXTDLXDJ='C' WHERE YXTDLXDJ='6'
UPDATE T_XZ SET YXTDLXDJ='D' WHERE YXTDLXDJ='7'


UPDATE T_XZ
SET 
	
	[SSDX]			=NULL,	--��������
	[DYSFJYMT]		=NULL,	--�����Ƿ���½����ͨ��ͷ
	[MTYLDJL]		=NULL,	--��ͷ��½�ؾ���
	[DNSFJYGL]		=NULL,	--�����Ƿ��й�·
	[TDXZ]			=NULL,	--ͨ����״
	[YXTDLXDJ]		=NULL,	--��ѡͨ��·�������ȼ�
	[YXTDLXBM]		=NULL,	--��ѡͨ��·�ߴ���
	[YXTDLXMC]		=NULL,	--��ѡͨ��·������
	[SFTSJJYSGL]		=NULL,	--�Ƿ���ͨ���������Ϲ�·
	[BGYY_XC]		='10'	--���ԭ��
--SELECT *
FROM T_XZ
WHERE [CXFL]='11'


--9-----------------------------------------------------------------------------------------------------------------

INSERT INTO [T_JZC]
(
	[JZCBM],		--���ƴ����
	[JZCMC],		--���ƴ�����
	[XJXZQHDM],		--�ؼ�������������
	[SSSF],			--����ʡ��
	[SSS],			--�����У��ء��ݡ��ˣ�
	[SSX],			--�����أ��С������죩
	[CXFL],			--�������
	[SSDX],			--��������
	[DYSFJYMT],		--�����Ƿ���½����ͨ��ͷ
	[MTYLDJL],		--��ͷ��½�ؾ���
	[DNSFJYGL],		--�����Ƿ��й�·
	[TDXZ],			--ͨ����״
	[YXTDLXDJ],		--��ѡͨ��·�������ȼ�
	[YXTDLXBM],		--��ѡͨ��·�ߴ���
	[YXTDLXMC],		--��ѡͨ��·������
	[SFYTSCDJYSGL],		--�Ƿ���ͨ˫���������Ϲ�·
	[BGYY_XC],		--���ԭ��
	[YJZCBM],		--ԭ���ƴ����
	[BZ],			--��ע
	[FMDM_TBFZR],		--��λ������
	[FMDM_TJFZR],		--ͳ�Ƹ�����
	[FMDM_TBR],		--�����
	[FMDM_LXDH],		--��ϵ�绰
	[FMDM_TBDW]		--���λ
)
SELECT
	RTRIM(A.V0514),
	RTRIM(A.HV0514), 		--���ƴ�DP
	LEFT(A.V0514,6),		--�ؼ���������
	RTRIM(B.OBJJC),			--ʡ��
	RTRIM(C.OBJJC),			--�м�
	RTRIM(D.OBJJC),			--�ؼ�
	RTRIM(A.V0505),			--�������
	A.V0506, 			--��������DY
	A.V0507, 			--�����Ƿ���½����ͨ��ͷD
	A.V0508, 			--��ͷ��½�ؾ���(����)N
	A.V0509, 			--�����Ƿ��й�·D
	A.V8101, 			--ͨ����״DY
	A.V8103, 			--��ѡͨ��·�������ȼ�D
	UPPER(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(A.V8104,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))), 	--·�ߴ���CP
	A.V8105,  			--·��ȫ��C
	A.V0513,
	CASE WHEN RTRIM(A.V0514)=RTRIM(F.V0514) AND RTRIM(A.HV0514)=RTRIM(F.HV0514) THEN '10'
		WHEN F.V0514 IS NULL THEN '11'
	ELSE '21'
	END,				--���ԭ��
	RTRIM(F.V0514)	,		--ԭ���ƴ����
	A.K0199, 			--��עM
	RTRIM(E.A0121),			--��λ������
	RTRIM(E.A0122),			--ͳ�Ƹ�����
	RTRIM(E.A0133),			--�����
	RTRIM(E.A0123),			--��ϵ�绰
	RTRIM(REPLACE(E.HA0102,' ',''))	--���λ
FROM [HRP-DBMS2014]..V52  A LEFT JOIN [HRP-DBMS2014]..DZ0101 B ON LEFT(A.V0514,2)=B.OBJNAME
			LEFT JOIN [HRP-DBMS2014]..DZ0101 C ON LEFT(A.V0514,4)=C.OBJNAME
			LEFT JOIN [HRP-DBMS2014]..DZ0101 D ON LEFT(A.V0514,6)=D.OBJNAME
			LEFT JOIN [HRP-DBMS2014]..A01 E ON A.A0102=E.A0102
			LEFT JOIN [HRP-DBMS2014-2022�걨]..V52 F ON A.KWYID=F.KWYID


UPDATE T_JZC SET YXTDLXBM=NULL,
			YXTDLXMC=NULL WHERE YXTDLXDJ='7'


UPDATE T_JZC SET YXTDLXDJ='G' WHERE YXTDLXDJ='1'
UPDATE T_JZC SET YXTDLXDJ='S' WHERE YXTDLXDJ='2'
UPDATE T_JZC SET YXTDLXDJ='X' WHERE YXTDLXDJ='3'
UPDATE T_JZC SET YXTDLXDJ='Y' WHERE YXTDLXDJ='4'
UPDATE T_JZC SET YXTDLXDJ='Z' WHERE YXTDLXDJ='5'
UPDATE T_JZC SET YXTDLXDJ='C' WHERE YXTDLXDJ='6'
UPDATE T_JZC SET YXTDLXDJ='D' WHERE YXTDLXDJ='7'


UPDATE T_JZC
SET 
	
	[SSDX]			=NULL,	--��������
	[DYSFJYMT]		=NULL,	--�����Ƿ���½����ͨ��ͷ
	[MTYLDJL]		=NULL,	--��ͷ��½�ؾ���
	[DNSFJYGL]		=NULL,	--�����Ƿ��й�·
	[TDXZ]			=NULL,	--ͨ����״
	[YXTDLXDJ]		=NULL,	--��ѡͨ��·�������ȼ�
	[YXTDLXBM]		=NULL,	--��ѡͨ��·�ߴ���
	[YXTDLXMC]		=NULL,	--��ѡͨ��·������
	[SFYTSCDJYSGL]		=NULL,	--�Ƿ���ͨ˫���������Ϲ�·
	[BGYY_XC]		='10'	--���ԭ��
--SELECT *
FROM T_JZC
WHERE [CXFL]='21'


--10-----------------------------------------------------------------------------------------------------------------

INSERT INTO [T_ZRC]
(
	[ZRCZDM],		--��Ȼ�壨�飩����
	[ZRCZMC],		--��Ȼ�壨�飩����
	[SSSF],			--����ʡ��
	[SSS],			--�����У��ء��ݡ��ˣ�
	[SSX],			--�����أ��С������죩
	[XJXZQHDM],		--�ؼ�������������
	[CZHS],			--��Ȼ�壨�飩����
	[TDXZ_ZRC],		--ͨ����״
	[YXTDLXDJ_ZRC],		--��ѡͨ��·�������ȼ�
	[YXTDLXBM],		--��ѡͨ��·�ߴ���
	[YXTDLXMC],		--��ѡͨ��·������
	[BGYY_XC],		--���ԭ��
	[YZRCZDM],		--ԭ��Ȼ�壨�飩����
	[BZ],			--��ע
	[FMDM_TBFZR],		--��λ������
	[FMDM_TJFZR],		--ͳ�Ƹ�����
	[FMDM_TBR],		--�����
	[FMDM_LXDH],		--��ϵ�绰
	[FMDM_TBDW]		--���λ
)
SELECT
	RTRIM(A.V5701),
	RTRIM(A.HV5701), 			--��Ȼ�壨�飩DP
	RTRIM(B.OBJJC),				--ʡ��
	RTRIM(C.OBJJC),				--�м�
	RTRIM(D.OBJJC),				--�ؼ�
	LEFT(A.V5701,6),			--�ؼ���������
	A.V5703, 				--��Ȼ�壨�飩����NY
	REPLACE(ISNULL(A.V5708,'4'),'2','4'), 	--ͨ����״DY
	CASE WHEN ISNULL(A.V5708,'')='1' THEN UPPER(LEFT(REPLACE(A.V8104,'���е�·','D'),1))
	ELSE NULL
	END, 					--��ѡͨ��·�������ȼ�D
	CASE WHEN ISNULL(A.V5708,'')='1' THEN UPPER(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(A.V8104,'���е�·','D'),'340000',''),'000000',''),'D001',''),'D002',''),'D003','')))
	ELSE NULL
	END, 					--·�ߴ���CP
	CASE WHEN ISNULL(A.V5708,'')='1' THEN 	CASE WHEN G.K0101 IS NULL THEN RTRIM(A.V8105) ELSE G.K0112 END
	ELSE NULL
	END,					--·��ȫ��C
	CASE WHEN RTRIM(A.V5701)=RTRIM(F.V5701) AND RTRIM(A.HV5701)=RTRIM(F.HV5701) THEN '10'
		WHEN F.V5701 IS NULL THEN '11'
	ELSE '21'
	END,					--���ԭ��
	RTRIM(F.V5701),				--ԭ��Ȼ�壨�飩����
	A.A0129, 				--��עM
	RTRIM(E.A0121),				--��λ������
	RTRIM(E.A0122),				--ͳ�Ƹ�����
	RTRIM(E.A0133),				--�����
	RTRIM(E.A0123),				--��ϵ�绰
	RTRIM(REPLACE(E.HA0102,' ',''))		--���λ
FROM [HRP-DBMS2014]..V53  A LEFT JOIN [HRP-DBMS2014]..DZ0101 B ON LEFT(A.V5701,2)=B.OBJNAME
			LEFT JOIN [HRP-DBMS2014]..DZ0101 C ON LEFT(A.V5701,4)=C.OBJNAME
			LEFT JOIN [HRP-DBMS2014]..DZ0101 D ON LEFT(A.V5701,6)=D.OBJNAME
			LEFT JOIN [HRP-DBMS2014]..A01 E ON A.A0102=E.A0102
			LEFT JOIN [HRP-DBMS2014-2022�걨]..V53 F ON A.KWYID=F.KWYID
			LEFT JOIN 
				(
					SELECT RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) K0101,MAX(RTRIM(K0112))K0112 
					FROM [HRP-DBMS2014]..A50 
					GROUP BY RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))
				) G ON RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(A.V8104,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))=G.K0101




--11-----------------------------------------------------------------------------------------------------------------

INSERT INTO [T_ZRCTYXTDLX]
(
	[LDBM],			--·�δ���
	[LXMC],			--·������
	[SZXZQHDM],		--����������������
	[QDMC],			--�������
	[QDZH],			--���׮��
	[ZDMC],			--��������
	[ZDZH],			--����׮��
	[LDJSDJ],		--·�μ����ȼ�
	[LDLMLX],		--·��·������
	[LJKD],			--·�����
	[LMKD],			--·����
	[LDLC],			--·�����
	[SFWGYLD],		--�Ƿ�Ϊ����·��
	[SGYLDBM],		--������·�δ���
	[BZ],			--��ע
	[FMDM_TBFZR],		--��λ������
	[FMDM_TJFZR],		--ͳ�Ƹ�����
	[FMDM_TBR],		--�����
	[FMDM_LXDH],		--��ϵ�绰
	[FMDM_TBDW]		--���λ
)
SELECT
	UPPER(RTRIM(K0101))+RTRIM(K0115), 	--·�α��C
	RTRIM(K0112), 				--·�߼��C
	RTRIM(A.A0103)+'000', 			--��������DY
	LEFT(RTRIM(K0110),25), 			--·���������CY
	K0108, 					--·�����׮��NP
	LEFT(RTRIM(K0111),25), 			--·��ֹ������CY
	K0109, 					--·��ֹ��׮��NY
	CASE WHEN K0304='10' THEN '1' WHEN K0304='11' THEN '2' 
		WHEN K0304='22' THEN '3' WHEN K0304='23' THEN '4' WHEN K0304='24' THEN '5' WHEN K0304='30' THEN '6' ELSE NULL END, 			--�����ȼ�D
	CASE WHEN K5104='11' THEN '1' WHEN K5104='12' THEN '2' 
		WHEN LEFT(K5104,1)='2' THEN '3' WHEN K5104='31' THEN '4' WHEN K5104='32' THEN '5' WHEN K5104='33' THEN '6'
			WHEN K5104='34' THEN '7' WHEN K5104='35' THEN '9' WHEN K5104='36' THEN '8' ELSE NULL END, 					--�������D
	K4002, 			--·�����(��)N
	K5404, 			--·����(��)N
	K0114, 			--���(����)NY
	CASE WHEN K0124 IS NULL OR ISNULL(K0124,'')='' THEN '2' ELSE '1' END,	--�Ƿ��ظ�·��
	UPPER(RTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')))+RTRIM(K0115)),	--�ظ�·�α��C
	K0199, 			--��עM
	RTRIM(A0121),		--��λ������
	RTRIM(A0122),		--ͳ�Ƹ�����
	RTRIM(A0133),		--�����
	RTRIM(A0123),		--��ϵ�绰
	RTRIM(REPLACE(A.HA0102,' ',''))		--���λ
FROM [HRP-DBMS2014]..K001 A LEFT JOIN [HRP-DBMS2014]..A01 B ON A.A0102=B.A0102
WHERE K0101 IN (SELECT V8104 FROM [HRP-DBMS2014]..V53 WHERE ISNULL(V5708,'')='1' AND LEFT(V8104,1)='W') AND ISNULL(K5104,'') IN ('11','12','21','22','23','32','34','35')


--3.2000����NCGL���ݿ�
EXEC sp_detach_db 'NCGL342023', 'true'
-----2000����




-----2005��ʼ
--��2005�����ݿ��н���
--4.2005���ӵ�������������ݿ�
CREATE DATABASE NCGL422022
    ON (FILENAME = 'F:\6078������\1.�����ļ�\2.�����ļ�\1.����2022��ũ�幫·��׼��\20230315\NCGL422022-15\NCGL422022.MDF')
    FOR ATTACH;
		
--5.2005�������ݿ�
EXEC sp_detach_db 'NCGL342023', 'true'
-----2005����

--6.�����ϱ�Ҫ���޸����� ѹ�� ���ϱ�