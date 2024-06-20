-- Menghitung selisih hari sejak transaksi terakhir --
DELIMITER //
CREATE PROCEDURE HitungTransaksiTerakhir(
    IN penumpangID INT, 
    OUT nama_penumpang VARCHAR(255),
    OUT tgl_transaksi_terakhir DATE,
    OUT selisih_hari INT
)
BEGIN
    -- Mengambil nama penumpang
    SELECT nama INTO nama_penumpang
    FROM penumpang
    WHERE id_penumpang = penumpangID;

    -- Mengambil tanggal transaksi terakhir
    SELECT MAX(tgl_transaksi) INTO tgl_transaksi_terakhir
    FROM transaksi_penumpang
    WHERE id_penumpang = penumpangID;

    -- Menghitung selisih hari
    SET selisih_hari = DATEDIFF(CURDATE(), tgl_transaksi_terakhir);
END //
DELIMITER ;

SET @penumpangID = 1;
CALL HitungTransaksiTerakhir(@penumpangID, @nama_penumpang, @tgl_transaksi_terakhir, @selisih_hari);
SELECT @nama_penumpang AS NamaPenumpang, @tgl_transaksi_terakhir AS TransaksiTerakhir, @selisih_hari AS HariSejakTransaksiTerakhir;

-- Menghitung jumlah transaksi pada bulan tertentu --
DELIMITER //
CREATE PROCEDURE TransaksiPerBulan (
    IN tiketID INT,
    IN bulan INT,
    IN tahun INT,
    OUT jumlah_transaksi INT
)
BEGIN
    SELECT COUNT(*) INTO jumlah_transaksi
    FROM transaksi_penumpang
    WHERE id_tiket = tiketID
    AND MONTH(tgl_transaksi) = bulan
    AND YEAR(tgl_transaksi) = tahun;
END //
DELIMITER ;

CALL TransaksiPerBulan(1, 3, 2024, @jumlah_transaksi);
SELECT @jumlah_transaksi AS JumlahTransaksi;

-- Menambahkan data pada tabel dengan catatan tanggal diisi secara otomatis --
DELIMITER //
CREATE PROCEDURE TambahTransaksi (
    IN transaksiID INT,
    IN penumpangID INT,
    IN tiketID INT
)
BEGIN
    INSERT INTO transaksi_penumpang (id_transaksi, id_penumpang, id_tiket, tgl_transaksi)
    VALUES (transaksiID, penumpangID, tiketID, CURDATE());
END //
DELIMITER ;

CALL TambahTransaksi(21, 6, 2);
SELECT * FROM transaksi_penumpang;

