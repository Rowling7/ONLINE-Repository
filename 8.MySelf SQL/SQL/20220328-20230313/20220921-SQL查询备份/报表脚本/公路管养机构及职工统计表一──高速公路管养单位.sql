
--��·����������ְ��ͳ�Ʊ�һ�������ٹ�·������λ--

select HA0102 '������Ӫ��λ',A0102 '������Ӫ��λ����',A0108b '��������',A0118b '������ҵ',A0119b '�շѹ�·��Ӫ��ҵ',
isnull(A0831B,0)+isnull(A0823B,0)+isnull(A0833B,0)+isnull(A0834B,0)+isnull(A0835B,0)+isnull(A0821b,0)+isnull(A0822b,0)+isnull(A0823b,0)+isnull(A0836B,0)+isnull(A0824B,0) '�ϼ�',
isnull(A0831B,0)+isnull(A0823B,0)+isnull(A0833B,0)+isnull(A0834B,0)+isnull(A0835B,0) 'С��',
isnull(A0831B,0)+isnull(A0823B,0)+isnull(A0833B,0) '�ڸ�ְ��',isnull(A0803b,0) '���̼�����Ա',isnull(A0831B,0) '��ҵ�����Ա',isnull(A0823B,0) '��ͬ����Ա',
isnull(A0833B,0) '��ʱƸ����Ա',isnull(A0834B,0) '������ǲ��Ա',isnull(A0835B,0) '������Ա',
isnull(A0821b,0)+isnull(A0822b,0)+isnull(A0823b,0)+isnull(A0836B,0)+isnull(A0824B,0) 'С��',
isnull(A0821b,0)+isnull(A0822b,0)+isnull(A0823b,0) '�ڸ�ְ��',isnull(A0821b,0) '��ҵ�����Ա',isnull(A0822b,0) '��ͬ����Ա',isnull(A0823b,0) '��ʱƸ����Ա',
isnull(A0836B,0) '������ǲ��Ա',isnull(A0824B,0) '������Ա'

from A21

where A0101 = '2020' and A0108b is not NULL


	
