USE manage_gudang;

-- no 1
DELIMITER //
CREATE PROCEDURE HariTerakhir(
    IN p_id_pegawai INT,
    OUT NamaPegawai VARCHAR(255),
    OUT TransaksiTerakhir INT
)
BEGIN
    DECLARE tanggal_terakhir DATE;

    SELECT MAX(Tanggal_Penerimaan)
    INTO tanggal_terakhir
    FROM Penerimaan
    WHERE ID_Pegawai = p_id_pegawai;

    SELECT Nama_Pegawai
    INTO NamaPegawai
    FROM Pegawai 
    WHERE ID_Pegawai = p_id_pegawai;
    
    IF tanggal_terakhir IS NOT NULL THEN
        SET TransaksiTerakhir = DATEDIFF(CURDATE(), tanggal_terakhir);
    ELSE
        SET TransaksiTerakhir = NULL;
    END IF;
END //
DELIMITER ;

CALL HariTerakhir(4, @NamaPegawai, @TransaksiTerakhir);
SELECT @NamaPegawai AS NamaPegawai, @TransaksiTerakhir AS TransaksiTerakhir;



DROP PROCEDURE HitungHariSejakTransaksiTerakhir;

SELECT * FROM penerimaan;

-- no 2
DELIMITER //
CREATE PROCEDURE TransaksiBulanan(
  IN id_produk INT,
  IN bulan INT,
  IN tahun INT
)
BEGIN
  SELECT COUNT(*) AS JumlahTransaksi
  FROM penerimaan p
  WHERE p.ID_Gudang = id_produk
    AND MONTH(p.Tanggal_Penerimaan) = bulan
    AND YEAR(p.Tanggal_Penerimaan) = tahun;
END //
DELIMITER ;

CALL TransaksiBulanan(1, 5, 2024);
DROP PROCEDURE TransaksiBulanan;


-- no 3
DROP PROCEDURE TambahTransaksi;
DELIMITER //
CREATE PROCEDURE TambahTransaksi(
  IN ID_Pen INT,
  IN ID_Supp INT,
  IN N_Barang INT,
  IN Jml_Terima INT,
  IN ID_Gud INT,
  IN ID_Peg INT
)
BEGIN
  INSERT INTO penerimaan (ID_Penerimaan, Tanggal_Penerimaan, ID_Supplier, ID_Barang, Jumlah_Terima, ID_Gudang, ID_Pegawai)
  VALUES (ID_Pen, CURRENT_DATE, ID_Supp, N_Barang, Jml_Terima, ID_Gud, ID_Peg);
END //
DELIMITER ;

CALL TambahTransaksi(23, 3, 23, 204, 1, 3);
SELECT * FROM penerimaan;