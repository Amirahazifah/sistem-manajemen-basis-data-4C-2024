DELIMITER//
CREATE PROCEDURE IntegerInProcedure(
IN bilangan_positif INT(4) UNSIGNED/ZEROFILL
)
BEGIN
SELECT bilangan_positif AS Output;
END//
DELIMITER;
DROP PROCEDURE IntegerInprocedure;

CALL IntegerInProcedure(3);

DELIMITER//
CREATE PROCEDURE InsertPesanan(
IN id_pelanggan INT,
IN jumlah_total INT
)
BEGIN
INSERT INTO Pesanan VALUES('', id_pelanggan, NOW(), jumlah_total);
END//
DELIMITER;

CALL InsertPesanan(2,100);
SELECT*FROM Pesanan;