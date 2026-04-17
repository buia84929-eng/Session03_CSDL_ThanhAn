CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    size VARCHAR(5),
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0)
);

INSERT INTO products (product_id, product_name, size, price)
VALUES 
('P01', 'Áo sơ mi trắng', 'L', 250000),
('P02', 'Quần Jean xanh', 'M', 450000),
('P03', 'Áo thun Basic', 'XL', 150000),
('P04', 'Áo hoodie', NULL, 200000);

INSERT INTO products VALUES ('P04', 'Áo hoodie', NULL, 200000);

UPDATE products
SET price = 400000
WHERE product_id = 'P02';

UPDATE products
SET price = price * 1.10
WHERE product_id IN ('P01','P02','P03','P04');

DELETE FROM products
WHERE product_id = 'P03';

SELECT p.product_id, p.product_name, p.size, p.price
FROM products p;

SELECT p.product_name, p.size
FROM products p;

SELECT p.product_id,p.product_name,p.size,price
FROM products p
WHERE price > 300000;

