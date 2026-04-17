CREATE TABLE CART_ITEMS(
	CartItemID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    ProductID INT,
    Quantity INT,
    AddedDate DATETIME DEFAULT CURRENT_TIMESTAMP 
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- Thiết kế luồng xử lý : 
-- Nếu khách hàng cố tình nhập vào số lượng là 1 số âm thì sẽ có thể phá logic giỏi hàng vì k có tổng tiền âm

-- Cách xử lý nếu trường hợp có xảy ra 
UPDATE CART_ITEMS
SET Quantity = 5
WHERE UserID = 1 
  AND ProductID = 101
  AND 5 > 0;

DELETE FROM CART_ITEMS
WHERE UserID = 1 
  AND ProductID = 101;

-- add trùng sản phẩm 
-- Nếu bấm add nhiều lần cùng với productid thì sẽ bị tạo nhiều dòng trùng và khó tính tổng số lượng nên chỉ mỗi User , ProductID chỉ tồn tại 1 dòng duy nhất và cộng dồn số lượng không insert mới
ALTER TABLE CART_ITEMS 
ADD CONSTRAINT unique_user_product UNIQUE (UserID, ProductID); -- Đảm bảo mỗi user chỉ có 1 dòng cho mỗi sản phẩm

-- B1: Kiểm tra sản phẩm đã tồn tại chưa
SELECT 1
FROM CART_ITEMS
WHERE UserID = 1 AND ProductID = 101;

-- B2:
-- Nếu có → UPDATE
UPDATE CART_ITEMS
SET Quantity = Quantity + 1
WHERE UserID = 1 AND ProductID = 101;

-- Nếu chưa có → INSERT
INSERT INTO CART_ITEMS (UserID, ProductID, Quantity)
VALUES (1, 101, 1);