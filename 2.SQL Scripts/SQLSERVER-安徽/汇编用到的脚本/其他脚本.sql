INSERT INTO [dbo].[DA0102] ([objid], [parentid], [objtype], [objexplain], [objpy], [objjc], [objname]) VALUES (3000, 4, 3, '3401                                                                                                                                                                                                                                                           ', 'XXC ', '萧县处                                            ', '34301    ');


INSERT INTO [dbo].[DA0102] ([objid], [parentid], [objtype], [objexplain], [objpy], [objjc], [objname]) VALUES (6090, 4, 3, NULL, 'LJGS', '庐江公司                                          ', '34316    ');




INSERT INTO [dbo].[DA0102] ([objid], [parentid], [objtype], [objexplain], [objpy], [objjc], [objname]) VALUES (3006, 4, 3, '3414                                                                                                                                                                                                                                                           ', 'TCC ', '天长处                                            ', '34307    ');


update da0102 set objjc='来安县公路运输管理服务中心(农村公路)' 
from da0102
where objname='3421122'


INSERT INTO [dbo].[DA0102] ([objid], [parentid], [objtype], [objexplain], [objpy], [objjc], [objname]) VALUES (6148, 1, 2, NULL, 'AHMC', '安徽明巢高速公路开发有限公司                      ', '349F     ');
INSERT INTO [dbo].[DA0102] ([objid], [parentid], [objtype], [objexplain], [objpy], [objjc], [objname]) VALUES (6149, 1, 2, NULL, 'AHLL', '安徽来六高速公路开发有限公司                      ', '349G     ');

update dz0101 set objjc=REPLACE(RTRIM(OBJJC), CHAR(10), '') 
--去除换行符
update dz0101 set objjc=REPLACE(RTRIM(OBJJC), CHAR(13), '') 