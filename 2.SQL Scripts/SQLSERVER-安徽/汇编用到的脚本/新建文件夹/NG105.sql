/*����ʾ��*/
SELECT
	[COL01] = '��ʵʩ��̣�'+CAST(SUM(CASE WHEN ISNULL(K0802,'')='1' THEN K0109-K0108 ELSE 0.000 END) AS VARCHAR)+'����',
	[COL02] = 'δʵʩ��̣�'+CAST(SUM(CASE WHEN ISNULL(K0802,'')='2' THEN K0109-K0108 ELSE 0.000 END) AS VARCHAR)+'����',
	[COL03] = '����ʵʩ��̣�'+CAST(SUM(CASE WHEN ISNULL(K0802,'')='3' THEN K0109-K0108 ELSE 0.000 END) AS VARCHAR)+'����'
FROM K08
WHERE A0102 LIKE '34%' and a0101 = '2023'



SELECT
	[COL01] = RTRIM(K0101),		--·�ߴ���
	[COL02] = RTRIM(K0112),   	--·�߼��
	[COL03] = LEFT(A0103,6),   	--�ؼ���������
	[COL04] = RTRIM(K0108),  		--���׮��
	[COL05] = RTRIM(K0109),  		--����׮��
	[COL06] = RTRIM(HK0816),  		--·������
 	[COL07] = RTRIM(HK0801),		--�Ƿ���Ҫʵʩ��������
	[COL08] = RTRIM(HK0802), 		--�Ƿ���ʵʩ��������
	[COL09] = RTRIM(K0803), 		--ʵʩʱ��
	[COL10] = RTRIM(HK0804), 		--��־
	[COL11] = RTRIM(HK0805), 		--����
	[COL12] = RTRIM(HK0806),		--����
	[COL13] = RTRIM(HK0807),		--���ٴ�
	[COL14] = RTRIM(HK0808),		--ʾ����/׮
	[COL15] = RTRIM(HK0809),		--�޸���ʩ
	[COL16] = RTRIM(HK0810),		--�޿���ʩ
	[COL17] = RTRIM(HK0814),		--�Ӿ���ʩ
	[COL18] = RTRIM(HK0815),		--����
	[COL19] = RTRIM(HK0811),		--����
	[COL20] = RTRIM(K0812),		--��·����·����
	[COL21] = RTRIM(K0813),  		--·�ڹ��м��ٴ�����
	[COL22] = CAST(A0129 AS VARCHAR(200))		--��ע
FROM K08
WHERE A0102 LIKE '34%' and a0101 = '2023'
ORDER BY REPLACE(K0101,'C','ZZ'),K0108

