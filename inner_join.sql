USE shop_feb13;

SELECT models.model_name, items.price
FROM models
INNER JOIN items
ON models.model_id = items.model;

SELECT items.type, item_types.item_type, SUM(items.quantity)
FROM items
INNER JOIN item_types
ON items.type = item_types.type_id
GROUP BY items.type;