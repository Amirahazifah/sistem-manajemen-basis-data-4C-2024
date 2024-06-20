#parameter in
DELIMITER//
CREATE PROCEDURE tambah_departemen(
    IN dept_id INT,
    IN dept_name VARCHAR(100),
    IN dept_desc TEXT
)
BEGIN
     INSERT INTO departemen (id_departemen, nama_departemen, deskripsi) VALUES (dept_id, dept_name, dept_desc);
END//

CALL insert_departemen(123, 'Departemen Masyarakat', 'Deskripsi Departemen 123');

SELECT * FROM departemen;

#parameter out

DELIMITER//
CREATE PROCEDURE get_total_departemen(
    OUT total_departemen INT
)
BEGIN
    SELECT COUNT(id_departemen) INTO total_departemen FROM departemen;
END//

CALL get_total_departemen(@total_departemen);
SELECT @total_departemen;

#parameter inout

DELIMITER//
CREATE PROCEDURE CountByID (
	IN id VARCHAR(15),
	OUT total INT(10))
BEGIN
	SELECT COUNT(id_departemen) INTO total FROM anggota WHERE id_departemen = id;
END//

CALL CountByID(101,@total);
SELECT @total;

SELECT * FROM anggota;

#stored procedure untuk memasukkan data baru kedalam tabel

DELIMITER//
CREATE PROCEDURE insert_new_anggota(
    IN anggota_nim VARCHAR(15),
    IN anggota_nama VARCHAR(45),
    IN anggota_ttl DATE,
    IN anggota_jabatan VARCHAR(45),
    IN anggota_dept_id INT
)
BEGIN
    INSERT INTO anggota (nim, nama, ttl, jabatan, id_departemen) 
    VALUES (anggota_nim, anggota_nama, anggota_ttl, anggota_jabatan, anggota_dept_id);
END//

CALL insert_new_anggota('23144987', 'Kak Wakhid', '2000-01-01', 'Staff', 121);
SELECT * FROM anggota;

#stored procedure untuk memperbarui data pada tabel

DELIMITER//
CREATE PROCEDURE update_anggota_jabatan(
    IN anggota_nim VARCHAR(15),
    IN new_jabatan VARCHAR(45)
)
BEGIN
    UPDATE anggota SET jabatan = new_jabatan WHERE nim = anggota_nim;
END//

CALL update_anggota_jabatan('220441100141', 'Kepala Departemen');
SELECT * FROM anggota;

#stored procedure untuk menghapus data dalam tabel

DELIMITER//
CREATE PROCEDURE delete_anggota(
    IN anggota_nim VARCHAR(15)
)
BEGIN
    DELETE FROM anggota WHERE nim = anggota_nim;
END//

CALL delete_anggota('220441100141');
SELECT * FROM anggota;