CREATE TABLE SHIPPERS (
    ShipperID INT AUTO_INCREMENT PRIMARY KEY,
    ShipperName VARCHAR(225),
    Phone VARCHAR(20)
);

INSERT INTO SHIPPERS (ShipperName, Phone)
VALUES ('Giao Hàng Nhanh', '0901234567'),
       ('Viettel Post', '0987654321');