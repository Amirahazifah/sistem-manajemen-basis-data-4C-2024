-- Stored Procedure untuk mengecek apakah produk tersebut merupakan produk yang paling sering sewa --
DELIMITER //
CREATE PROCEDURE CekProdukTerlaris(
    IN produkID INT
)
BEGIN
    DECLARE unitID INT;
    DECLARE namaProduk VARCHAR(255);

    SELECT id_unit INTO unitID
    FROM sewa
    GROUP BY id_unit
    ORDER BY COUNT(*) DESC
    LIMIT 1;

    SELECT tipe INTO namaProduk
    FROM unit
    WHERE id_unit = produkID;

    IF produkID = unitID THEN
        SELECT CONCAT(namaProduk, ' adalah tipe unit terlaris') AS Hasil;
    ELSE
        SELECT CONCAT(namaProduk, ' bukan tipe unit terlaris') AS Hasil;
    END IF;
END //
DELIMITER ;

CALL CekProdukTerlaris(10);


--  Menampilkan data dari tabel master masing masing dengan ID yang berurutan dari 1 hingga 10 --
DELIMITER//
create procedure TampilkanData(
	in idP int
)
BEGIN
    DECLARE i INT DEFAULT 1;
    
    WHILE i < idP DO	
        SET i = i + 1;
    END WHILE;
        SELECT *
        FROM penyewa
        limit i;
END //
DELIMITER ;

call TampilkanData(10);
