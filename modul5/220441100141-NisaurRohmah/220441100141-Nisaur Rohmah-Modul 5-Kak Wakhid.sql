#1. Menghitung hari sejak aktivitas terakhir
DELIMITER //

CREATE PROCEDURE HitungHari(
	IN id_log_input INT
)
BEGIN
    DECLARE jumlah_hari INT;
    DECLARE tanggal DATE;
    
    SELECT tanggal_log INTO tanggal
    FROM log_aktivitas
    WHERE id_log = id_log_input;
    
    SET jumlah_hari = DATEDIFF(CURDATE(), tanggal);
    
    SELECT jumlah_hari AS 'Hari Sejak Aktivitas Terakhir';

END //
DELIMITER;


CALL HitungHari('2');

#2. Menampilkan jumlah aktivitas pengguna tertentu dalam suatu bulan
DELIMITER //

CREATE PROCEDURE HitungJumlahAktivitas(
    IN nim VARCHAR(15),
    IN bulan INT
)
BEGIN
    DECLARE jumlah_aktivitas INT;
    
    SELECT COUNT(*) INTO jumlah_aktivitas
    FROM log_aktivitas
    WHERE pengguna = nim
      AND MONTH(tanggal_log) = bulan;
    
    SELECT jumlah_aktivitas AS 'Jumlah Aktivitas';
END //

DELIMITER ;

CALL HitungJumlahAktivitas(230441100142,5);

DROP PROCEDURE HitungJumlahAktivitas;

#3. Menambahkan data pada tabel yang mempunyai kolom tanggal secara otomatis menggunakan fungsi yang tersedia pada tipe data temporal yang sesuai
DELIMITER //

CREATE PROCEDURE TambahLogAktivitas(
    IN pengguna_input VARCHAR(15),
    IN aktivitas_input TEXT
)
BEGIN
    INSERT INTO log_aktivitas (pengguna, tanggal_log, jenis_aktivitas)
    VALUES (pengguna_input, CURRENT_DATE, aktivitas_input);
END //

DELIMITER ;

CALL TambahLogAktivitas('230441100142', 'Mengikuti rapat bulanan');
CALL TambahLogAktivitas('2310000654', 'Mengikuti rapat bulanan');
CALL TambahLogAktivitas('230441100142', 'Mengikuti rapat bulanan');

SELECT * FROM log_aktivitas;
DROP PROCEDURE TambahLogAktivitas;

