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
--SELECT * from #K01



/*����ʾ��*/
SELECT 
	[COL01] = RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(k01.K0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')),	--·�ߴ���
	[COL02] = LEFT(RTRIM(A0103),6), --������������
	[COL03] = RTRIM(K0112), 	--·�߱�׼����
	[COL04] = RTRIM(K0110),		--·���������
	[COL05] = RTRIM(K0111),		--·��ֹ������
	[COL06] = K0108,		--·�����׮��
	[COL07] = K0109,		--·��ֹ��׮��   
	[COL08] = K0114 ,		--���
	[COL09] = CASE WHEN RTRIM(K0304)='22' THEN '12' WHEN RTRIM(K0304)='23' THEN '13' WHEN RTRIM(K0304)='24' THEN '14' ELSE RTRIM(K0304) END,		--�����ȼ�����
	[COL10] = RTRIM(HK0304),	--�����ȼ�
	[COL11] = CASE WHEN RTRIM(HK0126)='��' THEN '��' ELSE '��' END,	--�Ƿ�һ������
	[COL12] = REPLACE(REPLACE(REPLACE(REPLACE(RTRIM(K0404),'A','10'),'C','12'),'E','14'),'G','16'),		--�����������
	[COL13] = RTRIM(K5104),		--������ʹ���
	[COL14] = RTRIM(HK5104),	--�������
	[COL15] = K4002,		--·�����
	[COL16] = K5404,		--·����
	[COL17] = K5222,		--�����(����)
	[COL18] = K0306,		--���ʱ��
	[COL19] = RTRIM(HK6023),	--����ȼ�
	[COL20] = CASE WHEN ISNULL(K0304,'') IN ('24','30') AND ISNULL(K0149,'')<4 THEN '-' ELSE RTRIM(REPLACE(HK0149,'��','')) END,	--�����׼
	[COL21] = RTRIM(K0180),		--�޽����
	[COL22] = RTRIM(K0181),		--�Ľ����
	[COL23] = RTRIM(K0155),	--���һ���޸��������
	[COL24] = CASE WHEN ISNULL(K0182,0)=0 THEN 0 ELSE K0182 END,		--��������
	[COL25] = CASE WHEN RTRIM(HK0121)='��' THEN '��' ELSE '��' END,		--�Ƿ�ǹ�·��
	[COL26] = CASE WHEN RTRIM(HK0123)='��' THEN '��' ELSE '��' END,		--�Ƿ��ͷ·��
	[COL27] = CASE WHEN RTRIM(ISNULL(K0136,'01'))='01' THEN '���շ�' 
			WHEN RTRIM(ISNULL(K0136,'01'))='02' THEN '����' 
			WHEN RTRIM(ISNULL(K0136,'01'))='03' THEN '��Ӫ' 
			ELSE '' 
		END,			--·���շ�����
	[COL28] = RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K0124,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')),	--�ظ�·�ߴ���
	[COL29] = CASE WHEN ISNULL(K0176,'')='1' THEN K0163 ELSE K0162 END,		--�ظ�·�����׮��
	[COL30] = CASE WHEN ISNULL(K0176,'')='1' THEN K0162 ELSE K0163 END,		--�ظ�·���յ�׮��
	[COL31] = CASE WHEN CHARINDEX('D',ISNULL(K0124,''))<>0 THEN '��' ELSE NULL END,	--�ظ�·���յ�׮��
	[COL32] = A1001,		--����
	[COL33] = A3101,		--���̻�
	[COL34] = A3102,		--���̻�
	[COL35] = RTRIM(HK9508),--��ò
	[COL36] = A0522,		--��������
	[COL37] = LTRIM(RTRIM(REPLACE(A0130,' ',''))),		--������λ����
	[COL38] = ISNULL(K0156,''),	--ʡ�ʳ���ڱ�ʶ
	[COL39] = CASE WHEN LEFT(k01.K0101,1) IN ('G','H') THEN LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(K3990,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))) ELSE '' END,		--��������ǰ·�߱��
	[COL40] = HK0138,		--�Ƿ񰴸��߹�·�������
	[COL41] = CASE WHEN CHARINDEX('D',ISNULL(K0124,'')) <> 0 THEN '�ظ�����Ϊ����' ELSE CASE WHEN LEFT(k01.K0101,1) IN ('G','S','H','T','X') THEN LTRIM(RTRIM(CAST(K0199 AS VARCHAR(1000)))) ELSE '' END END	--��ע
from k01 
WHERE	A0102 LIKE '34%' AND
	left(k01.K0101,1) in ('G','S','X','Y','Z','C','h','t')  and K0304='10' and rtrim(K01.K0101)  in (select rtrim(k0101) from #k01) --����
	-- left(k01.K0101,1) in ('G','h') and rtrim(K01.K0101) not in (select rtrim(k0101) from #k01) --��ͨ����
	-- left(k01.K0101,1) in ('S','t') and rtrim(K01.K0101) not in (select rtrim(k0101) from #k01) --��ͨʡ��
ORDER BY k01.K0101,K0108
