SELECT
	buyers.id AS '买家编号',
	buyers.NAME AS '买家姓名',
	buyers.address AS '买家地址',
	buyers.phone AS '买家电话',
	goods.id AS '商品编号',
	goods.NAME AS '商品名称',
	goods.price AS '商品价格',
	goods.stock AS '商品库存',
	sellers.id AS '卖家编号',
	sellers.NAME AS '卖家姓名',
	sellers.address AS '卖家地址',
	sellers.phone AS '卖家电话',
	shipments.quantity AS '出货数量',
	shipments.date AS '出货日期',
	shipments.price AS '出货价格'
FROM
	buyers
	INNER JOIN shipments ON buyers.id = shipments.buyer_id
	INNER JOIN goods ON shipments.goods_id = goods.id
	INNER JOIN sellers ON shipments.seller_id = sellers.id
WHERE
	sellers.id = 844;
SELECT
	buyers.id AS '买家编号',
	buyers.NAME AS '买家姓名',
	buyers.address AS '买家地址',
	buyers.phone AS '买家电话',
	goods.id AS '商品编号',
	goods.NAME AS '商品名称',
	goods.price AS '商品价格',
	goods.stock AS '商品库存',
	sellers.id AS '卖家编号',
	sellers.NAME AS '卖家姓名',
	sellers.address AS '卖家地址',
	sellers.phone AS '卖家电话',
	shipments.quantity AS '出货数量',
	shipments.date AS '出货日期',
	shipments.price AS '出货价格'
FROM
	buyers
	INNER JOIN shipments ON buyers.id = shipments.buyer_id
	INNER JOIN goods ON shipments.goods_id = goods.id
	INNER JOIN sellers ON shipments.seller_id = sellers.id
WHERE
	buyers.id = 968;


