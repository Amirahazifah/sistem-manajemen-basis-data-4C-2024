USE manage_gudang;

-- no 1
DELIMITER //
CREATE PROCEDURE CekJumlahTerimaTerbanyak(
    IN idPenerimaan INT
)
BEGIN
    DECLARE namaBarang VARCHAR(255);
    DECLARE jumlahTerima INT;
    DECLARE jumlahTerimaTerbanyak INT;

    SELECT
        b.Nama_Barang,
        p.Jumlah_Terima
    INTO namaBarang, jumlahTerima
    FROM Barang b
    JOIN Penerimaan p ON b.ID_Barang = p.ID_Barang
    WHERE p.ID_Penerimaan = idPenerimaan;

    SELECT MAX(Jumlah_Terima)
    INTO jumlahTerimaTerbanyak
    FROM Penerimaan;

    IF jumlahTerima = jumlahTerimaTerbanyak THEN
        SELECT CONCAT(namaBarang, ' adalah barang dengan jumlah terima terbanyak') AS hasil;
    ELSE
        SELECT CONCAT(namaBarang, ' bukan barang dengan jumlah terima terbanyak') AS hasil;
    END IF;
END //
DELIMITER ;

CALL CekJumlahTerimaTerbanyak(4);


-- No 2
DELIMITER //
CREATE PROCEDURE TampilkanDataGudang()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE selesai INT DEFAULT 0;

    DROP TEMPORARY TABLE IF EXISTS temp_data_gudang;
    CREATE TEMPORARY TABLE temp_data_gudang (
        ID_Gudang INT,
        Nama_Gudang VARCHAR(255),
        Alamat VARCHAR(255)
    );

    WHILE i <= 10 AND selesai = 0 DO
        INSERT INTO temp_data_gudang
        SELECT ID_Gudang, Nama_Gudang, Alamat
        FROM Gudang
        WHERE ID_Gudang = i;

        IF ROW_COUNT() = 0 THEN
            SET selesai = 1;
        END IF;

        SET i = i + 1;
    END WHILE;

    SELECT * FROM temp_data_gudang;
END//
DELIMITER ;

CALL TampilkanDataGudang();

DROP PROCEDURE TampilkanDataGudang;