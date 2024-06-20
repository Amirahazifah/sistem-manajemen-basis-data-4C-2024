-- Menghitung Selisih Hari antara Tanggal Transaksi Terakhir dan Tanggal Sekarang --
DELIMITER //
CREATE PROCEDURE HitungDetailTransaksiTerakhir(
    IN idPasien INT, 
    OUT namaPasien VARCHAR(255),
    OUT tglTransaksiTerakhir DATE,
    OUT selisihHari INT
)
BEGIN
    -- Mengambil nama pasien
    SELECT nama INTO namaPasien
    FROM pasien
    WHERE id_pasien = idPasien;
    -- Mengambil tanggal transaksi terakhir
    SELECT MAX(tgl_masuk) INTO tglTransaksiTerakhir
    FROM rawat_inap
    WHERE id_pasien = idPasien;
    -- Menghitung selisih hari
    SET selisihHari = DATEDIFF(CURDATE(), tglTransaksiTerakhir);
END //
DELIMITER ;
-- Memanggil prosedur dan menampilkan hasil
SET @idPasien = 4;
CALL HitungDetailTransaksiTerakhir(@idPasien, @namaPasien, @tglTransaksiTerakhir, @selisihHari);
SELECT @namaPasien AS NamaPasien, @tglTransaksiTerakhir AS TanggalTransaksiTerakhir, @selisihHari AS HariSejakTransaksiTerakhir;
DROP PROCEDURE HitungDetailTransaksiTerakhir;

-- Menghitung Jumlah Transaksi pada Bulan Tertentu --
DELIMITER //\\
CREATE PROCEDURE HitungTransaksiObatBulanan(
    IN idObat INT, 
    IN tahun INT, 
    IN bulan INT, 
    OUT namaObat VARCHAR(255),
    OUT jumlahTransaksi INT
)
BEGIN
    -- Mengambil nama obat
    SELECT nama_obat INTO namaObat
    FROM obat
    WHERE id_obat = idObat;
    -- Menghitung jumlah transaksi
    SELECT COUNT(*) INTO jumlahTransaksi
    FROM rawat_inap
    WHERE id_obat = idObat
      AND YEAR(tgl_masuk) = tahun
      AND MONTH(tgl_masuk) = bulan;
END //
DELIMITER ;
SET @idObat = 1;
SET @tahun = 2024;
SET @bulan = 5;
CALL HitungTransaksiObatBulanan(@idObat, @tahun, @bulan, @namaObat, @jumlahTransaksi);
SELECT @idObat AS idObat, @namaObat AS NamaObat, @jumlahTransaksi AS JumlahTransaksi;
DROP PROCEDURE HitungTransaksiObatBulanan;

-- Menambahkan Data Baru ke Tabel Rawat_Inap dengan Tanggal_Masuk Diisi Otomatis --
DELIMITER //
CREATE PROCEDURE TambahDataRawatInap (
    IN id_rawat_inap INT,
    IN id_pasien INT,
    IN id_dokter INT,
    IN id_ruangan INT,
    IN id_obat INT,
    IN diagnosis TEXT,
    IN statusrawat VARCHAR(20)
)
BEGIN
    INSERT INTO rawat_inap (id_rawat_inap, id_pasien, id_dokter, id_ruangan, id_obat, tgl_masuk, tgl_keluar, diagnosis, statusrawat)
    VALUES (id_rawat_inap, id_pasien, id_dokter, id_ruangan, id_obat, CURDATE(), CURDATE(), diagnosis, statusrawat);
END //
DELIMITER ;
-- Menggunakan stored procedure
SET @id_rawat_inap = 32;
SET @id_pasien = 6;
SET @id_dokter = 5;
SET @id_ruangan = 4;
SET @id_obat = 7;
SET @diagnosis = 'Mata Kering';
SET @statusrawat = 'Dalam perawatan';
CALL TambahDataRawatInap(@id_rawat_inap, @id_pasien, @id_dokter, @id_ruangan, @id_obat, @diagnosis, @statusrawat);
SELECT * FROM rawat_inap WHERE id_rawat_inap = @id_rawat_inap AND id_pasien = @id_pasien AND id_dokter = @id_dokter 
AND id_ruangan = @id_ruangan AND id_obat = @id_obat AND diagnosis = @diagnosis AND statusrawat = @statusrawat;
DROP PROCEDURE TambahDataRawatInap;