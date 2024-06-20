# blok 1
USE sewa_mobil;

# NOMOR 1
# A. IN
# blok 1
SELECT * FROM mobil;

# blok 2
DELIMITER //
CREATE PROCEDURE model_mobil(
    IN merk_mobil VARCHAR(20)
)
BEGIN
    SELECT merk, model, warna
    FROM mobil
    WHERE merk = merk_mobil;
END//
DELIMITER ;

# blok 3
CALL model_mobil('honda');


# B. OUT
# blok 1
SELECT * FROM pembayaran;

# blok 2
DELIMITER //
CREATE PROCEDURE omset_sewa(
    OUT total_pembayaran BIGINT
)
BEGIN
    SELECT SUM(jumlah_pembayaran) INTO total_pembayaran
    FROM pembayaran;
END//
DELIMITER ;

# blok 3
CALL omset_sewa(@total_pembayaran);	
# blok 4
SELECT @total_pembayaran;


# C. INOUT
# blok 1
DELIMITER //
CREATE PROCEDURE hitung_warna_mobil(
    IN warna_mobil VARCHAR(20),
    OUT jumlah_mobil BIGINT
)
BEGIN
    SELECT COUNT(warna) INTO jumlah_mobil
    FROM mobil
    WHERE warna = warna_mobil;
END//
DELIMITER ;

# blok 2
CALL hitung_warna_mobil('biru', @jumlah_mobil);	
# blok 3
SELECT @jumlah_mobil;


#NOMOR 2
# blok 1
SELECT * FROM mobil;

# blok 2
DELIMITER //
CREATE PROCEDURE insert_mobil(
    IN merk_mobil VARCHAR(20),
    IN model_mobil VARCHAR(20),
    IN tahun_mobil INT,
    IN warna_mobil VARCHAR(20),
    IN harga_sewa_mobil BIGINT
)
BEGIN
    INSERT INTO mobil (merk, model, tahun, warna, harga_sewa)
    VALUES (merk_mobil, model_mobil, tahun_mobil, warna_mobil, harga_sewa_mobil);
END//
DELIMITER ;

# blok 3
CALL insert_mobil('suzuki', 'Ayla', 2024, 'putih', 200000);
# blok 4
SELECT * FROM mobil;


# NOMOR 3
# blok 1
SELECT * FROM pelanggan;

# blok 2
DELIMITER //
CREATE PROCEDURE update_alamat_pelanggan(
    IN id_pelanggan_ubah INT,
    IN alamat_pelanggan VARCHAR(50)
)
BEGIN
    UPDATE pelanggan
    SET alamat = alamat_pelanggan
    WHERE id_pelanggan = id_pelanggan_ubah;
END//
DELIMITER ;

# blok 3
CALL update_alamat_pelanggan(3, 'Surabaya');
# blok 4
SELECT * FROM pelanggan;


# NOMOR 4
# blok 1
SELECT * FROM mobil;

# blok 2
DELIMITER //
CREATE PROCEDURE delete_mobil(
    IN id_mobil_hapus INT
)
BEGIN
    DELETE FROM mobil WHERE id_mobil = id_mobil_hapus;
END//
DELIMITER ;

# blok 3
CALL delete_mobil(22);
# blok 4
SELECT * FROM mobil;
