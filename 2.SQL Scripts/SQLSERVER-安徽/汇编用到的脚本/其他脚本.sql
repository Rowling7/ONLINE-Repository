INSERT INTO [dbo].[DA0102] ([objid], [parentid], [objtype], [objexplain], [objpy], [objjc], [objname]) VALUES (3000, 4, 3, '3401                                                                                                                                                                                                                                                           ', 'XXC ', '���ش�                                            ', '34301    ');


INSERT INTO [dbo].[DA0102] ([objid], [parentid], [objtype], [objexplain], [objpy], [objjc], [objname]) VALUES (6090, 4, 3, NULL, 'LJGS', '®����˾                                          ', '34316    ');




INSERT INTO [dbo].[DA0102] ([objid], [parentid], [objtype], [objexplain], [objpy], [objjc], [objname]) VALUES (3006, 4, 3, '3414                                                                                                                                                                                                                                                           ', 'TCC ', '�쳤��                                            ', '34307    ');


update da0102 set objjc='�����ع�·��������������(ũ�幫·)' 
from da0102
where objname='3421122'


INSERT INTO [dbo].[DA0102] ([objid], [parentid], [objtype], [objexplain], [objpy], [objjc], [objname]) VALUES (6148, 1, 2, NULL, 'AHMC', '�����������ٹ�·�������޹�˾                      ', '349F     ');
INSERT INTO [dbo].[DA0102] ([objid], [parentid], [objtype], [objexplain], [objpy], [objjc], [objname]) VALUES (6149, 1, 2, NULL, 'AHLL', '�����������ٹ�·�������޹�˾                      ', '349G     ');

update dz0101 set objjc=REPLACE(RTRIM(OBJJC), CHAR(10), '') 
--ȥ�����з�
update dz0101 set objjc=REPLACE(RTRIM(OBJJC), CHAR(13), '') 