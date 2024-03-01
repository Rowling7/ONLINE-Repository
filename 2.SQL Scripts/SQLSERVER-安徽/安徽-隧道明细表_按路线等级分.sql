IF OBJECT_ID('TEMPDB..#K01') IS NOT NULL DROP TABLE #K01
SELECT
rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')) k0101
INTO #K01
FROM K01
WHERE left(k01.K0101,1) in ('G','S','X','Y','Z','C','h','t') 
      and (K0124 is null or K0124 = '') and isnull(K0123,'2') = '2'  and K0304='10'
GROUP BY rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))
ORDER BY rtrim(replace(replace(replace(replace(replace(k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''))

select
	[col01] = rtrim(k63.k6302),   	--�������
	[col02] = rtrim(k63.k6301),  	--�������
 	[col03] = k63.k6303,		--������׮��
  [col04] = rtrim(replace(replace(replace(replace(replace(k63.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003','')),  	--·�߱���
	[col05] = rtrim(a50.k0112),   	--·�߼��
	[col06] = rtrim(d.objjc),	--�����ȼ�
	[col07] = k63.k6305,		--�������
	[col08] = k63.k6306,		--�������
	[col09] = k63.k6307,		--�������
	[col10] = rtrim(k63.k6304),  	--����������
	[col11] = rtrim(k63.hk6304),  	--�����������
	[col12] = ISNULL(HK6335,'��'),  --�Ƿ�ˮ�����
	[col13] = RTRIM(HK6023),  	--����ȼ�
	[col14] = RTRIM(REPLACE(HK0149,'��','')),  	--�����׼
	[col15] = rtrim(k63.k0180),  	--�޽����
	[col16] = rtrim(k63.k6079),  	--���赥λ����
	[col17] = rtrim(replace(k63.k6320,char(127),'')),  	--��Ƶ�λ����
	[col18] = rtrim(replace(k63.k6321,char(127),'')),  	--ʩ����λ����
	[col19] = rtrim(k63.k6322),  	--����λ����
	[col20] = rtrim(k63.k0116),    	--ͨ��ʱ��
	[col21] = RTRIM(isnull(k63.HK6343,'')),    	--��������ȼ�
	[col22] = rtrim(k63.A1313),    	--������λ���ʴ���
	[col23] = rtrim(replace(k63.a0130,' ','')),    	--������λ����
	[col24] = rtrim(k63.k6111),  	--��ܵ�λ����
	[col25] = rtrim(k63.HK6336), 	--�����ȼ�(����)
	[col26] = rtrim(k63.K6344),  	--��������(����)
	[col27] = rtrim(k63.K6345),  	--������λ(����)
	[col28] = rtrim(k63.HK6346), 	--�����ȼ�(�����ṹ)
	[col29] = rtrim(k63.K6347),  	--��������(�����ṹ)
	[col30] = rtrim(k63.K6348),  	--������λ(�����ṹ)
	[col31] = rtrim(k63.HK6349), 	--�����ȼ�(������ʩ)
	[col32] = rtrim(k63.K6350),  	--��������(������ʩ)
	[col33] = rtrim(k63.K6351),  	--������λ(������ʩ)
	[col34] = rtrim(k63.HK6352), 	--�����ȼ�(����������ʩ)
	[col35] = rtrim(k63.K6353),  	--��������(����������ʩ)
	[col36] = rtrim(k63.K6354),  	--������λ(����������ʩ)
	[col37] = rtrim(k63.k0181),  	--�Ľ����
	[col38] = rtrim(k63.A1316),  	--�����깤����
	[col39] = rtrim(k63.HK6337),  	--���첿λ
	[col40] = rtrim(k63.HA1318),  	--��������
	[col41] = rtrim(k63.HK6338),  	--������λ
	[col42] = replace(rtrim(k63.K6339),' ',''),  	--��������
	[col43] = left(k63.a0103,6),	--�ؼ���������
	[col44] = RTRIM(isnull(k63.HK6370,'')),		--�������λ��
	[col45] = RTRIM(isnull(k63.HK6355,'��')),	--�Ƿ��ڳ������Ŀ¼��
	[col46] = RTRIM(isnull(k63.HK6371,'��')),	--�Ƿ��ʡ���
	[col47] = k63.k0199	  	--��ע
from k63
	left join a50 on k63.a0102 = a50.a0102 and k63.k0101 = a50.k0101
	left join da0102 on k63.a0102=da0102.objname
	left join 
		(select a.a0102,a.k0101,a.k6301,max(b.k0304) k0304
		from K63 a left join K01 b on a.a0102=b.a0102 and a.k0101=b.k0101 and a.k6324>=b.k0108 and a.k6324<=b.k0109
		where LEFT(A.K0101,1) IN ('G','S','H','T') AND a.A0102 like '34%' and a.a0101 <= '2024'
		group by a.a0102,a.k0101,a.k6301) c
	     on k63.a0102=c.a0102 and k63.k0101=c.k0101 and k63.k6301=c.k6301
	left join D002 d  on  d.objname=c.k0304
where	k63.a0102 like '34%' and k63.a0101 <= '2024' and
	LEFT(K63.K0101,1) IN ('G','S','X','Y','Z','C','h','t') AND  rtrim(K63.K0101) in (select rtrim(k0101) from #k01) --����
	-- LEFT(K63.K0101,1) IN ('G','h') AND  rtrim(K63.K0101) not in (select rtrim(k0101) from #k01) --��ͨ����
	-- LEFT(K63.K0101,1) IN ('S','t') AND  rtrim(K63.K0101) not in (select rtrim(k0101) from #k01) --��ͨʡ��
order by  replace(replace(replace(replace(replace(k63.k0101,'340000',''),'000000',''),'D001',''),'D002',''),'D003',''),k63.k6303
