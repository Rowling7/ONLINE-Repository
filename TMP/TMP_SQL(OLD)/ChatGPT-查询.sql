SELECT
	buyers.id AS '��ұ��',
	buyers.NAME AS '�������',
	buyers.address AS '��ҵ�ַ',
	buyers.phone AS '��ҵ绰',
	goods.id AS '��Ʒ���',
	goods.NAME AS '��Ʒ����',
	goods.price AS '��Ʒ�۸�',
	goods.stock AS '��Ʒ���',
	sellers.id AS '���ұ��',
	sellers.NAME AS '��������',
	sellers.address AS '���ҵ�ַ',
	sellers.phone AS '���ҵ绰',
	shipments.quantity AS '��������',
	shipments.date AS '��������',
	shipments.price AS '�����۸�'
FROM
	buyers
	INNER JOIN shipments ON buyers.id = shipments.buyer_id
	INNER JOIN goods ON shipments.goods_id = goods.id
	INNER JOIN sellers ON shipments.seller_id = sellers.id
WHERE
	sellers.id = 844;
SELECT
	buyers.id AS '��ұ��',
	buyers.NAME AS '�������',
	buyers.address AS '��ҵ�ַ',
	buyers.phone AS '��ҵ绰',
	goods.id AS '��Ʒ���',
	goods.NAME AS '��Ʒ����',
	goods.price AS '��Ʒ�۸�',
	goods.stock AS '��Ʒ���',
	sellers.id AS '���ұ��',
	sellers.NAME AS '��������',
	sellers.address AS '���ҵ�ַ',
	sellers.phone AS '���ҵ绰',
	shipments.quantity AS '��������',
	shipments.date AS '��������',
	shipments.price AS '�����۸�'
FROM
	buyers
	INNER JOIN shipments ON buyers.id = shipments.buyer_id
	INNER JOIN goods ON shipments.goods_id = goods.id
	INNER JOIN sellers ON shipments.seller_id = sellers.id
WHERE
	buyers.id = 968;


