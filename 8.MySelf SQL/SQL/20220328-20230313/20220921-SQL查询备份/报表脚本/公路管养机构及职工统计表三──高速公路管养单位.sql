
--��·����������ְ��ͳ�Ʊ����������ٹ�·������λ--

select HA0102 '������Ӫ��λ',A0102 '������Ӫ��λ����',isnull(A0108A,0) '��������',isnull(A0118A,0) '������ҵ',isnull(A0119A,0) '�շѹ�·��Ӫ��ҵ',
isnull(A0831A,0)+isnull(A0823A,0)+isnull(A0833A,0)+isnull(A0834A,0)+isnull(A0835A,0)+isnull(A0821A,0)+isnull(A0822A,0)+isnull(A0823A,0)+isnull(A0836A,0)+isnull(A0824A,0) '�ϼ�',
isnull(A0831A,0)+isnull(A0823A,0)+isnull(A0833A,0)+isnull(A0834A,0)+isnull(A0835A,0) 'С��',
isnull(A0831A,0)+isnull(A0823A,0)+isnull(A0833A,0) '�ڸ�ְ��',isnull(A0803A,0) '���̼�����Ա',isnull(A0831A,0) '��ҵ�����Ա',isnull(A0823A,0) '��ͬ����Ա',
isnull(A0833A,0) '��ʱƸ����Ա',isnull(A0834A,0) '������ǲ��Ա',isnull(A0835A,0) '������Ա',
isnull(A0821A,0)+isnull(A0822A,0)+isnull(A0823A,0)+isnull(A0836A,0)+isnull(A0824A,0) 'С��',
isnull(A0821A,0)+isnull(A0822A,0)+isnull(A0823A,0) '�ڸ�ְ��',isnull(A0821A,0) '��ҵ�����Ա',isnull(A0822A,0) '��ͬ����Ա',isnull(A0823A,0) '��ʱƸ����Ա',
isnull(A0836A,0) '������ǲ��Ա',isnull(A0824A,0) '������Ա',isnull(A0837,0) '���ù�·���������λ����',isnull(A0838,0)'����ƶ����ͥ�Ͷ�������',isnull(A0103,0)'����������������'

from A21

where A0101 = '2020' and A0108A is not  NULL