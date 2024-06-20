-- modul 6
-- no 1
DELIMITER //

CREATE PROCEDURE CekProdukTerlaris(
    IN p_id_buku INT
)
BEGIN
    DECLARE namaProduk VARCHAR(255);
    DECLARE jumlahTransaksiProduk INT;
    DECLARE jumlahTransaksiTerbanyak INT;
    
    -- Ambil nama produk berdasarkan id_buku
    SELECT judul_buku INTO namaProduk
    FROM Buku
    WHERE id_buku = p_id_buku;
    
    -- Hitung jumlah transaksi untuk produk yang diminta
    SELECT COUNT(*) INTO jumlahTransaksiProduk
    FROM Peminjaman
    WHERE id_buku = p_id_buku;
    
    -- Hitung jumlah transaksi terbanyak untuk semua produk
    SELECT MAX(jumlahTransaksi) INTO jumlahTransaksiTerbanyak
    FROM (
        SELECT id_buku, COUNT(*) AS jumlahTransaksi
        FROM Peminjaman
        GROUP BY id_buku
    ) AS subquery;
    
    -- Cek dan tampilkan hasil
    IF jumlahTransaksiProduk = jumlahTransaksiTerbanyak THEN
        SELECT CONCAT(namaProduk, ' adalah produk/jasa terlaris') AS Pesan;
    ELSE
        SELECT CONCAT(namaProduk, ' bukan produk/jasa terlaris') AS Pesan;
    END IF;
END//

DELIMITER ;

CALL CekProdukTerlaris(1);


-- no 2
DELIMITER //

CREATE PROCEDURE TampilkanDataPenulis()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE selesai INT DEFAULT 0;

    -- Buat tabel sementara untuk menyimpan data penulis
    DROP TEMPORARY TABLE IF EXISTS temp_data_penulis;
    CREATE TEMPORARY TABLE temp_data_penulis (
        id_penulis INT,
        nama_penulis VARCHAR(255),
        negara_asal VARCHAR(255)
    );

    -- Loop untuk iterasi dari 1 hingga 10
    WHILE i <= 10 AND selesai = 0 DO
        -- Insert data ke tabel sementara
        INSERT INTO temp_data_penulis
        SELECT id_penulis, nama_penulis, negara_asal
        FROM Penulis
        WHERE id_penulis = i;

        -- Cek apakah ada data yang dimasukkan
        IF ROW_COUNT() = 0 THEN
            SET selesai = 1;
        END IF;

        -- Increment counter
        SET i = i + 1;
    END WHILE;

    -- Tampilkan data dari tabel sementara
    SELECT * FROM temp_data_penulis;
END//

DELIMITER ;

CALL TampilkanDataPenulis();

