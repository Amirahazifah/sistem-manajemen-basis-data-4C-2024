-- Updatable view
CREATE VIEW pasienView AS
SELECT * FROM pasien;
SELECT * FROM pasienView

CREATE VIEW obatView AS
SELECT id_obat , jenis, harga, stok
FROM obat; 
SELECT * FROM obatView

-- Update pada view 
UPDATE pasienView
SET tgl_lahir = '2000-01-09'
WHERE id_pasien = 1;

UPDATE obatView
SET stok = '100'
WHERE id_obat = 1;

-- Read-only view
CREATE VIEW ReadOnly_dokter AS
SELECT id_dokter, nama, spesialisasi
FROM dokter;
SELECT * FROM ReadOnly_dokter

CREATE VIEW ReadOnly_obat AS
SELECT id_obat, nama_obat, stok
FROM obat;
SELECT * FROM ReadOnly_obat