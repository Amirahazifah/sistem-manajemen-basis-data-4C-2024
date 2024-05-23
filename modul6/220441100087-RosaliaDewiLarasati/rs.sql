-- Memeriksa Produk/Jasa Terlaris --
DELIMITER //
CREATE PROCEDURE CekProdukTerlaris(
    IN id_produk INT
)
BEGIN
    DECLARE jumlah_transaksi INT;

    -- Menghitung jumlah transaksi untuk produk tertentu
    SELECT COUNT(*) INTO jumlah_transaksi
    FROM rawat_inap
    WHERE id_obat = id_produk;

    -- Memeriksa apakah produk adalah yang terlaris dan memilih pesan yang sesuai beserta ID dan nama produk
    IF jumlah_transaksi > 0 THEN
        SELECT id_obat, nama_obat, 'adalah produk terlaris' AS STATUS
        FROM obat
        WHERE id_obat = id_produk;
    ELSE
        SELECT id_obat, nama_obat, 'bukan produk terlaris' AS STATUS
        FROM obat
        WHERE id_obat = id_produk;
    END IF;
END //
DELIMITER ;
CALL CekProdukTerlaris(19);
DROP PROCEDURE CekProdukTerlaris;

--  Menampilkan data dari tabel master masing masing dengan ID yang berurutan dari 1 hingga 10 --
DELIMITER//
CREATE PROCEDURE TampilkanDataPasien(
	IN id_pasien INT
)
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i < idP DO	
        SET i = i + 1;
    END WHILE;
        SELECT *
        FROM pasien
        LIMIT i;
END //
DELIMITER ;
CALL TampilkanDataPasien(15);