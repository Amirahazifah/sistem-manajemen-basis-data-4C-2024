
DELIMITER //
CREATE PROCEDURE cekmobil( 
IN kode_mobil INT
)
BEGIN
DECLARE terlaris INT;
DECLARE ceklaris INT;
DECLARE pesan VARCHAR(50);
DECLARE nama VARCHAR(50);
SELECT model,COUNT(id_mobil) AS jml INTO nama, terlaris FROM mobil NATURAL JOIN transaksi_sewa GROUP BY model ORDER BY jml DESC LIMIT 1;
SELECT model,COUNT(id_mobil) AS jml INTO nama, ceklaris FROM mobil NATURAL JOIN transaksi_sewa WHERE id_mobil=kode_mobil GROUP BY model ORDER BY jml DESC;
IF ceklaris=terlaris THEN
SET pesan=CONCAT(nama," adalah mobil terlaris");
ELSE 
SET pesan=CONCAT(nama," bukan mobil terlaris");
END IF;
SELECT pesan;
END//
DELIMITER ;
DROP PROCEDURE cekmobil;
CALL cekmobil(15);

DELIMITER//
CREATE PROCEDURE tampilwhile (
IN jumlah INT
)
BEGIN
DECLARE n INT DEFAULT 0 ;
WHILE n < jumlah DO
SET n=n+1;
END WHILE;
SELECT model FROM mobil LIMIT n;
END//
DELIMITER;
DROP PROCEDURE tampilwhile;
CALL tampilwhile(10);
