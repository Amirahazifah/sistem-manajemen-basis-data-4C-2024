-- Updatable view
CREATE VIEW SewaView AS
SELECT * FROM Sewa;
SELECT * FROM SewaView

CREATE VIEW UnitPenyewaView AS
SELECT U.id_Unit, U.nomor, U.tipe, U.harga, 
       P.id_penyewa, P.nama_penyewa, P.alamat, P.no_telepon,
       S.tgl_masuk, S.tgl_keluar
FROM Unit AS U
JOIN Sewa AS S ON U.id_unit = S.id_unit
JOIN Penyewa AS P ON S.id_penyewa = P.id_penyewa;
SELECT * FROM UnitPenyewaView

-- Update pada view SewaView
UPDATE SewaView
SET tgl_keluar = '2024-03-12'
WHERE id_Sewa = 1;

-- Update nomor telepon pada view UnitPenyewaView
UPDATE UnitPenyewaView
SET no_telepon = '081234567890'
WHERE id_penyewa = 1;


-- Read-only view
CREATE VIEW FasilitasView AS
SELECT * FROM Fasilitas;
SELECT * FROM FasilitasView

CREATE VIEW GedungView AS
SELECT * FROM Gedung;
SELECT * FROM GedungView