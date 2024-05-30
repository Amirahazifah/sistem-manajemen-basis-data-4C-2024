-- =====soal no 1===========
DELIMITER //

CREATE PROCEDURE CekProdukTerlaris(
    IN p_ProdukID INT
)
BEGIN
    DECLARE produk_terlaris INT;
    DECLARE produk_nama VARCHAR(255);
    DECLARE max_transaksi INT;

    -- Mengambil nama produk dari tabel produk
    SELECT NamaProduk INTO produk_nama
    FROM produk
    WHERE ProdukID = p_ProdukID;

    -- Hitung jumlah total transaksi untuk produk yang diberikan
    SELECT COUNT(*) INTO produk_terlaris
    FROM pengiriman
    WHERE ProdukID = p_ProdukID;

    -- Mengambil jumlah transaksi maksimal dari semua produk
    SELECT MAX(jumlah_transaksi) INTO max_transaksi
    FROM (
        SELECT ProdukID, COUNT(*) AS jumlah_transaksi
        FROM pengiriman
        GROUP BY ProdukID
    ) AS subquery;

    -- Cek apakah produk tersebut adalah produk terlaris
    IF produk_terlaris = max_transaksi THEN
        SELECT CONCAT(produk_nama, ' adalah produk terlaris') AS STATUS;
    ELSE
        SELECT CONCAT(produk_nama, ' bukan produk terlaris') AS STATUS;
    END IF;
END //
DELIMITER ;

CALL CekProdukTerlaris(19);

SELECT produk.produkid, namaproduk, COUNT(pengiriman.produkid) FROM produk 
JOIN pengiriman ON produk.produkid=pengiriman.produkid GROUP BY namaproduk;

-- ========soal no 2==========
DELIMITER //
CREATE PROCEDURE TampilkanDataCustomer()
BEGIN
    DECLARE currentCustomerID INT;
    SET currentCustomerID = 1;

    -- Loop untuk menampilkan data customer dari ID 1 hingga 10
    WHILE currentCustomerID <= 10 DO
        -- Tampilkan data customer dengan ID saat ini
        SELECT * FROM customer WHERE CustomerID = currentCustomerID;
        
        -- Increment currentCustomerID untuk melanjutkan ke customer berikutnya
        SET currentCustomerID = currentCustomerID + 1;
    END WHILE;
END //
DELIMITER ;

CALL TampilkanDataCustomer();


DROP PROCEDURE IF EXISTS TampilkanDataCustomer;