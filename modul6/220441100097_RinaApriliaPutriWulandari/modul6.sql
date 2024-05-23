#1
DELIMITER $$

CREATE PROCEDURE CekProdukTerlaris(IN kode_produk INT)
BEGIN
    DECLARE nama_produk VARCHAR(50);
    DECLARE maks_peminjaman INT;
    DECLARE produk_terlaris INT;

    SELECT nama_barang INTO nama_produk 
    FROM barang 
    WHERE id_barang = kode_produk;

    SELECT id_barang, COUNT(*) AS jumlah_peminjaman 
    INTO produk_terlaris, maks_peminjaman
    FROM transaksi 
    GROUP BY id_barang 
    ORDER BY jumlah_peminjaman DESC 
    LIMIT 1;

    IF kode_produk = produk_terlaris THEN
        SELECT CONCAT(nama_produk, ' adalah produk/jasa terlaris') AS hasil;
    ELSE
        SELECT CONCAT(nama_produk, ' bukan produk/jasa terlaris') AS hasil;
    END IF;
END $$

DELIMITER ;
CALL CekProdukTerlaris(10);


#2
DELIMITER $$
CREATE PROCEDURE TampilkanPeminjam()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE maks_id INT;
    
    SELECT MAX(id_peminjam) INTO maks_id FROM peminjam;

    WHILE i <= 10 AND i <= maks_id DO
        SELECT * FROM peminjam WHERE id_peminjam = i;
        SET i = i + 1;
    END WHILE;
    
END$$

DELIMITER ;
CALL TampilkanPeminjam();