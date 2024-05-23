-- modul 5
-- no 1
DELIMITER //

CREATE PROCEDURE HitungLamaTransaksiTerakhir(
    IN idAnggota INT
)
BEGIN
    DECLARE lastTransactionDate DATE;
    DECLARE daysSinceLastTransaction INT;
    DECLARE NamaAnggota VARCHAR(50);

    -- Ambil tanggal transaksi terakhir
    SELECT MAX(tanggal_pinjam) INTO lastTransactionDate
    FROM Peminjaman
    WHERE id_anggota = idAnggota;

    -- Ambil nama anggota
    SELECT nama_anggota INTO NamaAnggota
    FROM anggota
    WHERE id_anggota = idAnggota;

    -- Hitung selisih hari
    SET daysSinceLastTransaction = DATEDIFF(CURRENT_DATE(), lastTransactionDate);

    -- Tampilkan hasil
    SELECT NamaAnggota AS 'Nama Anggota', 
           daysSinceLastTransaction AS 'Hari Sejak Transaksi Terakhir';
END //

DELIMITER ;

-- Pemanggilan prosedur
CALL HitungLamaTransaksiTerakhir(39);
DROP PROCEDURE HitungLamaTransaksiTerakhir;

-- no 2
DELIMITER //

CREATE PROCEDURE HitungTransaksiPerBulan(
    IN namaProduk VARCHAR(255),
    IN bulan INT,
    IN tahun INT
)
BEGIN
    DECLARE jumlahTransaksi INT;

    -- Hitung jumlah transaksi
    SELECT COUNT(*) INTO jumlahTransaksi
    FROM Peminjaman p
    INNER JOIN Buku b ON p.id_buku = b.id_buku
    WHERE b.judul_buku = namaProduk
    AND MONTH(p.tanggal_pinjam) = bulan
    AND YEAR(p.tanggal_pinjam) = tahun;

    -- Tampilkan hasil
    SELECT CONCAT(jumlahTransaksi) AS 'Informasi Transaksi';
END//

DELIMITER ;

CALL HitungTransaksiPerBulan('Pride and Prejudice', 4, 2024);
DROP PROCEDURE HitungTransaksiPerBulan;

-- no 3
DELIMITER //

CREATE PROCEDURE TambahPeminjaman(
    IN p_id_peminjaman INT,
    IN p_id_anggota INT,
    IN p_id_buku INT,
    IN p_tanggal_kembali DATE
)
BEGIN
    -- Insert data baru ke dalam tabel Peminjaman dengan tanggal pinjam otomatis
    INSERT INTO Peminjaman (id_peminjaman, id_anggota, id_buku, tanggal_pinjam, tanggal_kembali)
    VALUES (p_id_peminjaman, p_id_anggota, p_id_buku, CURRENT_TIMESTAMP, p_tanggal_kembali);
    
END//

DELIMITER ;

CALL TambahPeminjaman(71, 23, 4, '2022-06-01');
SELECT * FROM peminjaman;
DROP PROCEDURE TambahPeminjaman;
