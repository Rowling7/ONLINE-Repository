
--公路管养机构及职工统计表一──高速公路管养单位--

select HA0102 '管理、经营单位',A0102 '管理、经营单位代码',A0108b '养护工区',A0118b '养护企业',A0119b '收费公路经营企业',
isnull(A0831B,0)+isnull(A0823B,0)+isnull(A0833B,0)+isnull(A0834B,0)+isnull(A0835B,0)+isnull(A0821b,0)+isnull(A0822b,0)+isnull(A0823b,0)+isnull(A0836B,0)+isnull(A0824B,0) '合计',
isnull(A0831B,0)+isnull(A0823B,0)+isnull(A0833B,0)+isnull(A0834B,0)+isnull(A0835B,0) '小计',
isnull(A0831B,0)+isnull(A0823B,0)+isnull(A0833B,0) '在岗职工',isnull(A0803b,0) '工程技术人员',isnull(A0831B,0) '事业身份人员',isnull(A0823B,0) '合同制人员',
isnull(A0833B,0) '临时聘用人员',isnull(A0834B,0) '劳务派遣人员',isnull(A0835B,0) '其他人员',
isnull(A0821b,0)+isnull(A0822b,0)+isnull(A0823b,0)+isnull(A0836B,0)+isnull(A0824B,0) '小计',
isnull(A0821b,0)+isnull(A0822b,0)+isnull(A0823b,0) '在岗职工',isnull(A0821b,0) '事业身份人员',isnull(A0822b,0) '合同制人员',isnull(A0823b,0) '临时聘用人员',
isnull(A0836B,0) '劳务派遣人员',isnull(A0824B,0) '其他人员'

from A21

where A0101 = '2020' and A0108b is not NULL


	
