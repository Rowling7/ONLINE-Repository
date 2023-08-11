
--公路管养机构及职工统计表三──高速公路管养单位--

select HA0102 '管理、经营单位',A0102 '管理、经营单位代码',isnull(A0108A,0) '养护工区',isnull(A0118A,0) '养护企业',isnull(A0119A,0) '收费公路经营企业',
isnull(A0831A,0)+isnull(A0823A,0)+isnull(A0833A,0)+isnull(A0834A,0)+isnull(A0835A,0)+isnull(A0821A,0)+isnull(A0822A,0)+isnull(A0823A,0)+isnull(A0836A,0)+isnull(A0824A,0) '合计',
isnull(A0831A,0)+isnull(A0823A,0)+isnull(A0833A,0)+isnull(A0834A,0)+isnull(A0835A,0) '小计',
isnull(A0831A,0)+isnull(A0823A,0)+isnull(A0833A,0) '在岗职工',isnull(A0803A,0) '工程技术人员',isnull(A0831A,0) '事业身份人员',isnull(A0823A,0) '合同制人员',
isnull(A0833A,0) '临时聘用人员',isnull(A0834A,0) '劳务派遣人员',isnull(A0835A,0) '其他人员',
isnull(A0821A,0)+isnull(A0822A,0)+isnull(A0823A,0)+isnull(A0836A,0)+isnull(A0824A,0) '小计',
isnull(A0821A,0)+isnull(A0822A,0)+isnull(A0823A,0) '在岗职工',isnull(A0821A,0) '事业身份人员',isnull(A0822A,0) '合同制人员',isnull(A0823A,0) '临时聘用人员',
isnull(A0836A,0) '劳务派遣人员',isnull(A0824A,0) '其他人员',isnull(A0837,0) '设置公路养护公益岗位数量',isnull(A0838,0)'吸纳贫困家庭劳动力数量',isnull(A0103,0)'所在行政区划代码'

from A21

where A0101 = '2020' and A0108A is not  NULL