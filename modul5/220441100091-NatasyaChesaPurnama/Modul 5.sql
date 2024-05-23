DELIMITER //
CREATE PROCEDURE transaksiterakhir(IN pelanggan_id INT)
BEGIN
    DECLARE tanggal_terakhir DATE;
    DECLARE hari_selisih INT;
    
    SELECT MAX(Tgl_Penjualan)
    INTO tanggal_terakhir
    FROM penjualan
    WHERE Id_Pelanggan = pelanggan_id;
    
    SET hari_selisih = DATEDIFF(CURDATE(), tanggal_terakhir);
    
    SELECT pelanggan_id AS Id_Pelanggan, tanggal_terakhir AS TanggalTerakhirTransaksi, hari_selisih AS HariSejakTransaksiTerakhir;
END //

DELIMITER ;

CALL transaksiterakhir(1);

DELIMITER //
CREATE PROCEDURE JumlahTransaksiPerObatPerBulan(IN nama_obat VARCHAR(70), IN tahun INT, IN bulan INT)
BEGIN
    SELECT 
        COUNT(*) AS JumlahTransaksi,
        SUM(lp.Jumlah) AS JumlahProdukTerjual,
        SUM(lp.Total_penjualan) AS TotalPenjualan
    FROM 
        penjualan pj
    JOIN 
        laporan_penjualan lp ON pj.Id_Penjualan = lp.Id_Penjualan
    JOIN 
        obat ob ON lp.Id_Obat = ob.Id_Obat
    WHERE 
        ob.Nama_Obat = nama_obat
        AND YEAR(pj.Tgl_Penjualan) = tahun
        AND MONTH(pj.Tgl_Penjualan) = bulan;
END //

DELIMITER ;

CALL JumlahTransaksiPerObatPerBulan('Paracetamol', 2024, 3);

DELIMITER //
CREATE PROCEDURE TambahDataPenjualan(
IN id_penjualan INT,
    IN id_pelanggan INT,
    IN total_harga INT,
    IN nominal_pembayaran INT,
    IN kembalian INT
)
BEGIN
    INSERT INTO penjualan (Id_Penjualan, Id_Pelanggan, Tgl_Penjualan, Total_Harga, Nominal_Pembayaran, Kembalian)
    VALUES (id_penjualan, id_pelanggan, CURDATE(), total_harga, nominal_pembayaran, kembalian);
END //

DELIMITER ;

CALL TambahDataPenjualan(24, 2, 7000, 10000, 3000);
SELECT * FROM penjualan;