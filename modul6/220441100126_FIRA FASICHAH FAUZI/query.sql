-- Mengecek apakah tiket tersebut yang paling sering dibeli --
DELIMITER //

CREATE PROCEDURE CekProdukTerlaris (
    IN tiketID INT
)
BEGIN
    DECLARE terlaris INT;
    DECLARE nm_kereta VARCHAR(100);

    -- Ambil nama produk berdasarkan ID
    SELECT nama_kereta INTO nm_kereta FROM kereta WHERE id_kereta = tiketID;

    -- Hitung jumlah transaksi untuk produk tertentu
    SELECT COUNT(*) INTO terlaris
    FROM transaksi_penumpang
    WHERE id_tiket = tiketID;

    -- Periksa apakah produk tersebut adalah produk terlaris
    IF terlaris > 1 THEN
        SELECT CONCAT(nm_kereta, ' adalah tiket terlaris') AS STATUS;
    ELSE
        SELECT CONCAT(nm_kereta, ' bukan tiket terlaris') AS STATUS;
    END IF;
END //

DELIMITER ;

CALL CekProdukTerlaris(2);

-- Menampilkan data dari tabel penumpang dengan id yang berurutan dari 1-10 --
DELIMITER//
CREATE PROCEDURE DataPenumpang()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE FOUND INT DEFAULT 0;
    
    WHILE i <= 10 DO	
        SELECT COUNT(*) INTO FOUND 
        FROM penumpang 
        WHERE id_penumpang = i;
        
        IF FOUND > 0 THEN 
           SELECT * FROM penumpang WHERE id_penumpang = i;
        END IF;
        
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

CALL DataPenumpang();
