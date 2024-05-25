-- Parameter IN --
DELIMITER //
CREATE PROCEDURE NamaKereta(
 IN id INT,
 IN nk VARCHAR (50)
 )
BEGIN
 SELECT * FROM kereta
 WHERE id = id_kereta;
END//

CALL NamaKereta(1,'Argo Bromo Anggrek'); 

-- Parameter OUT --
DELIMITER //
CREATE PROCEDURE GetStokTiket(
  IN id INT,
  OUT total_tiket INT
)
BEGIN
  SELECT SUM(jumlah_tiket) INTO total_tiket FROM tiket
  WHERE id = id_tiket;
END//

CALL GetStokTiket(1, @total);
SELECT @total AS total_tiket;


-- Parameter INOUT --
DELIMITER //
CREATE PROCEDURE KapasitasKeretaBaru (
 INOUT kereta_id INT, 
 INOUT KapasitasBaru INT
 )
BEGIN
    DECLARE KapasitasLama INT;

    SELECT kapasitas INTO KapasitasLama
    FROM kereta
    WHERE id_kereta = kereta_id;

    UPDATE kereta
    SET kapasitas = KapasitasBaru
    WHERE id_kereta = kereta_id;
    
    SET KapasitasBaru = KapasitasLama;
END //

SET @kereta_id = 1; 
SET @KapasitasBaru = 230; 
CALL KapasitasKeretaBaru(@kereta_id, @KapasitasBaru);
SELECT @kereta_id, @KapasitasBaru;
SELECT * FROM kereta;
 

-- Tambah Data --
DELIMITER //
CREATE PROCEDURE tambah_stasiun(
  IN id_stasiun INT,
  IN ns VARCHAR(60),
  IN lt VARCHAR(60)
)
BEGIN 
  INSERT INTO stasiun
  VALUES (id_stasiun, ns, lt);
END //

CALL tambah_stasiun(21,"Stasiun Bogor","Bogor");
SELECT * FROM stasiun;


-- Update Data --
DELIMITER //
CREATE PROCEDURE Update_Tiket(
    IN id INT,
    IN harga_baru DECIMAL(10,2),
    IN jumlah INT
)
BEGIN
    UPDATE tiket
    SET harga = harga_baru, jumlah_tiket = jumlah
    WHERE id_tiket = id;
END//

CALL Update_Tiket(3,330000.00, 50);
SELECT * FROM tiket;


-- hapus Data --
DELIMITER //
CREATE PROCEDURE Hapus_Stasiun (
  IN id INT
)
BEGIN
    DELETE FROM stasiun WHERE id_stasiun = id;
END//
CALL Hapus_Stasiun(21);
SELECT * FROM stasiun;
