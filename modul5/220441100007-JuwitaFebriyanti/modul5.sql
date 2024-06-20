-- Menghitung selisih hari antara tanggal transaksi terakhir dan tanggal sekarang --
DELIMITER //
CREATE PROCEDURE HitungDetailTransaksiTerakhir(
    IN idPenyewa INT, 
    OUT namaPenyewa VARCHAR(255),
    OUT tglTransaksiTerakhir DATE,
    OUT selisihHari INT
)
BEGIN
    SELECT nama_penyewa INTO namaPenyewa
    FROM penyewa
    WHERE id_penyewa = idPenyewa;
    SELECT MAX(tgl_keluar) INTO tglTransaksiTerakhir
    FROM sewa
    WHERE id_penyewa = idPenyewa;

    SET selisihHari = DATEDIFF(CURDATE(), tglTransaksiTerakhir);
END //
DELIMITER ;

SET @idPenyewa = 5;
CALL HitungDetailTransaksiTerakhir(@idPenyewa, @namaPenyewa, @tglTransaksiTerakhir, @selisihHari);
SELECT @namaPenyewa AS NamaPenyewa, @tglTransaksiTerakhir AS TanggalTransaksiTerakhir, @selisihHari AS HariSejakTransaksiTerakhir;

-- Menghitung jumlah transaksi pada bulan tertentu --
DELIMITER//
create procedure TransaksiPerbulan(
    IN tahun INT, 
    IN bulan INT, 
    OUT jumlahTransaksi INT
)
BEGIN
    SELECT COUNT(*) INTO jumlahTransaksi
    FROM sewa
    WHERE YEAR(tgl_masuk) = tahun
      AND MONTH(tgl_masuk) = bulan;
END //
DELIMITER ;

SET @tahun = 2023;
SET @bulan = 8;
CALL TransaksiPerbulan(@tahun, @bulan, @jumlahTransaksi);
SELECT @jumlahTransaksi;
select * from sewa order by tgl_masuk;

-- Menambahkan data baru ke tabel Sewa dengan Tanggal_Masuk diisi otomatis
DELIMITER //
CREATE PROCEDURE TambahSewa (
    IN idSewa INT,
    IN idUnit INT, 
    IN idPenyewa INT, 
    IN tanggalKeluar DATE
)
BEGIN
    INSERT INTO sewa (id_sewa, id_unit, id_penyewa, tgl_masuk, tgl_keluar)
    VALUES (idSewa, idUnit, idPenyewa, CURDATE(), tanggalKeluar);
END //
DELIMITER ;

set @idSewa = 29;
SET @idUnit = 3;
SET @idPenyewa = 1;
SET @tanggalKeluar = '2024-12-31';
CALL TambahSewa(@idSewa, @idUnit, @idPenyewa, @tanggalKeluar);

SELECT * FROM sewa WHERE id_sewa = @idSewa and id_unit = @idUnit AND id_penyewa = @idPenyewa AND tgl_keluar = @tanggalKeluar;