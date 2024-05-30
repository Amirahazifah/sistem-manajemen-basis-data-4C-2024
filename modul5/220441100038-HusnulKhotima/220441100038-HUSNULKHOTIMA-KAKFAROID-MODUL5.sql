-- ======soal no 1==========
DELIMITER //

CREATE PROCEDURE HitungHariSejakTransaksiTerakhir (
    IN p_CustomerID INT,
    OUT p_HariSejakTransaksi INT,
    OUT p_NamaProduk VARCHAR(255)
)
BEGIN
    DECLARE v_TanggalTerakhir DATE;

    -- Mengambil tanggal transaksi terakhir dan nama produk dari tabel pengiriman
    SELECT MAX(TanggalPengiriman), NamaProduk
    INTO v_TanggalTerakhir, p_NamaProduk
    FROM pengiriman
    JOIN produk ON pengiriman.ProdukID = produk.ProdukID
    WHERE CustomerID = p_CustomerID;

    -- Menghitung selisih hari antara tanggal hari ini dan tanggal transaksi terakhir
    SET p_HariSejakTransaksi = DATEDIFF(CURDATE(), v_TanggalTerakhir);
END //

DELIMITER ;

SET @CustomerID = 1;
SET @HariSejakTransaksi = 0;
SET @NamaProduk = '';

CALL HitungHariSejakTransaksiTerakhir(@CustomerID, @HariSejakTransaksi, @NamaProduk);

SELECT @NamaProduk AS NamaProduk, @HariSejakTransaksi AS HariSejakTransaksi;

-- ======soal no 2=============
DELIMITER //

CREATE PROCEDURE JumlahTransaksiPerProdukPerBulan (
    IN p_ProdukID INT,
    IN p_Bulan INT,
    OUT p_JumlahTransaksi INT
)
BEGIN
    -- Mengambil jumlah transaksi untuk produk tertentu dalam bulan dan tahun yang diberikan
    SELECT COUNT(*)
    INTO p_JumlahTransaksi
    FROM pengiriman
    WHERE ProdukID = p_ProdukID
      AND MONTH(TanggalPengiriman) = p_Bulan;
END //

DELIMITER ;
SET @ProdukID = 3; 
SET @Bulan = 03; 
CALL JumlahTransaksiPerProdukPerBulan(@ProdukID, @Bulan, @JumlahTransaksi);
SELECT @JumlahTransaksi AS JumlahTransaksi;

-- ======soal no 3=================
DELIMITER//

CREATE PROCEDURE TambahPengiriman(
    IN P_PengirimanID INT,
    IN p_CustomerID INT,
    IN p_ProdukID INT,
    IN p_KaryawanID INT,
    IN p_TotalBerat DECIMAL(10,2),
    IN p_TotalBiaya DECIMAL(10,2)
)
BEGIN
    INSERT INTO pengiriman (PengirimanID, CustomerID, ProdukID, KaryawanID, TanggalPengiriman, TotalBerat, TotalBiaya)
    VALUES (P_PengirimanID, p_CustomerID, p_ProdukID, p_KaryawanID, NOW(), p_TotalBerat, p_TotalBiaya);
END //
DELIMITER ;
CALL TambahPengiriman(1022, 7, 21, 108, 250.5, 10000);