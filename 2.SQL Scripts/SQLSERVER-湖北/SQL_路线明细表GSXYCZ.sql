/*����ʾ��*/
--��������ʵ��·����Ϣ������ʱ��
if object_id('tempdb..#tempk01') is not null drop table #tempk01
create table #tempk01(col01 varchar(16),col02 varchar(100),col03 varchar(100),col04 varchar(100),col05 varchar(100),col06 varchar(100),col07 numeric(18,3),col08 numeric(18,3),col09 numeric(18,3),col10 varchar(100),col11 varchar(100),col12 varchar(100),col13 varchar(100),col14 varchar(100),col15 varchar(100),col16 varchar(100),col17 numeric(18,2),col18 numeric(18,2),col19 numeric(18,0),col20 varchar(100),col21 varchar(100),col22 varchar(100),col23 varchar(100),col24 varchar(100),col25 varchar(100),col26 numeric(18,3),col27 numeric(18,3),col28 numeric(18,3),col29 numeric(18,3),col30 numeric(18,3),col31 numeric(18,3),col32 numeric(18,3),col33 numeric(18,3),col34 numeric(2,0),col35 varchar(100),col36 numeric(18,0),col38 varchar(100),col39 varchar(100),col41 numeric(18,1),col42 varchar(1000),col43 varchar(1000),col44 numeric(18,3),col45 varchar(16),col46 numeric(18,3),col47 varchar(10),col48 varchar(20),col49 varchar(10),col50 varchar(2),col37 varchar(1000),PX int IDENTITY(1,1))
insert #tempk01( col01,col02,col03,col04,col05,col06,col07,col08,col09,col10,col11,col12,col13,col14,col15,col16,col17,col18,col19,col20,col21,col22,col23,col24,col25,col26,col27,col28,col29,col30,col31,col32,col33,col34,col35,col36,col38,col39,col41,col42,col43,col44,col45,col46,col47,col48,col49,col50,col37  )
select
	[col01] = (case when charindex('D',k0101)=11 then  left(k0101,4) else replace(replace(rtrim(k0101),'000000',''),'420000','') end),	--��Ŀ
	[col02] = left(rtrim(a0103),9), --������������
	[col03] = rtrim(k0112), 	--·�߱�׼����
	[col04] = rtrim(a7002),  	--·�ߵط�����	��������
	[col05] = rtrim(k0110),		--·���������
	[col06] = rtrim(k0111),		--·��ֹ������
	[col07] = k0108, --·�����׮��
	[col08] = k0109, --·��ֹ��׮��
	[col09] = k0114,
	[col10] = (case when rtrim(k0304)='22' then '12'
			when rtrim(k0304)='23' then '13'
			when rtrim(k0304)='24' then '14' else rtrim(k0304) end),	--�����ȼ�����
	[col11] = rtrim(hk0304),	--�����ȼ�
	[col12] = isnull(rtrim(hk0126),'��'),	--�Ƿ�һ������
	[col13] = rtrim(k0404),		--�����������
	[col14] = rtrim(hk0404),	--��������
	[col15] = rtrim(k5104),		--������ʹ���
	[col16] = rtrim(hk5104),	--�������
	[col17] = k4002,		--·�����
	[col18] = k5404,		--·����
	[col19] = k0306,		--���ʱ��
	[col20] = rtrim(k0180),--�޽����
	[col21] = rtrim(k0181),--�Ľ����
	[col22] = rtrim(k0182),--��������
	[col23] = isnull(rtrim(hk0121),'��'),	--�Ƿ�ǹ�·��
	[col24] = isnull(rtrim(hk0123),'��'),	--�Ƿ��ͷ·��
	[col25] = (case when (charindex('D',k0124) = 0 and len(k0124)>9 and left(k0124,1)<>'Z') then left(rtrim(k0124),4) else (case when charindex('D',rtrim(k0124))=11 then left(k0124,4) else rtrim(k0124) end) end), --�ظ�·�ߴ���
	[col26] = k0162,		--�ظ�·�����׮��
	[col27] = k0163,		--�ظ�·���յ�׮��
	[col28] = a1001,		--����
	[col29] = a0320,		--����ͨ��	��������
	[col30] = a3101,		--���̻�
	[col31] = a3102,		--���̻�
	[col32] = a0322,		--GBM		��������
	[col33] = a0323,		--��������·	��������
	[col34] = k9508,		--��ò����
	[col35] = rtrim(hk9508),	--��ò
	[col36] = a0522,		--��������
	[col38] = rtrim(hk0128),	--·���շ�����
	[col39] = rtrim(A0130),		--������λ����
	[col41] = k5222,		--�����
	[col42] = rtrim(k0155),		--���һ�δ��������
	[col43] = rtrim(k0156),		--ʡ�ʳ���ڱ�ʶ
	[col44] = A3305,		--����ս�ͨ��
	[col45] = rtrim(K3990),		--��������ǰ·�߱��
	[col46] = K3992,		--����׮�Ŵ���Ԥ�����
	[col47] = (case when isnull(k0138,'2')='1' then '��' else '��' end),	--�Ƿ񰴸��߹�·�������
	[col48] = rtrim(HK6023),		--����ȼ�
	[col49] = replace(rtrim(HK0149),'��',''),		--�����׼
	[col50] = (case when (charindex('D',k0124) = 0 and rtrim(k0124) is not null) then '��'
			when (charindex('D',k0124) <> 0 and rtrim(k0124) is not null) then '��' else null end),		--�ظ�·���Ƿ���
    [col37] = ltrim(rtrim(cast(k0199 as varchar(1000))))	--��ע

from k01
where   a0102 like '#oyds_��λ����#%' and a0101 = '#oyds_��������#'
	and (#oyds_filter#)
/*where   a0102 like '421202%' and a0101 = '2022'
	and (1=1)*/
order by a0102,k0101,k0108

--��·����ϸ
select
col01,
col02,col03,col05,col06,col07,col08,col09,col10,col11,col12,
(case when col13='A' then '10' else rtrim(col13) end),col15,col16,col17,col18,col41,
col19,col48,col49,col20,col21,col42,col22,col23,col24,col38,col25,col26,col27,col50,
col28,col30,col31,col35,col36,col39,col43,
replace(replace(rtrim(col45),'000000',''),'420000',''),col47,col37
from #tempk01
--where left(col01,1) in ('G','H','S','T','X','Y','C','Z','J')
order by col01,col07
