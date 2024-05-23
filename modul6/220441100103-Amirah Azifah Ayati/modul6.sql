--1--
DELIMITER $$
CREATE PROCEDURE TopProduct(
    IN p_id_bandara VARCHAR(10)
)
BEGIN
    DECLARE top_bandara_id VARCHAR(10);
    DECLARE bandara_name VARCHAR(100);

    SELECT Kode_Bandara_Asal INTO top_bandara_id
    FROM Rute
    WHERE Kode_Bandara_Asal = p_id_bandara
    GROUP BY Kode_Bandara_Asal
    ORDER BY COUNT(*) DESC
    LIMIT 1;

    SELECT Nama_Bandara INTO bandara_name
    FROM Bandara
    WHERE Kode_Bandara = p_id_bandara;

    IF p_id_bandara = top_bandara_id THEN
        SELECT CONCAT(bandara_name, ' adalah penerbangan terbanyak') AS Message;
    ELSE
        SELECT CONCAT(bandara_name, ' bukan penerbangan terbanyak') AS Message;
    END IF;
END$$
DELIMITER ;

CALL TopProduct('BND02');

--2--
DELIMITER $$

CREATE PROCEDURE TampilkanTiket()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE max_id INT;
    
    SELECT MAX(ID_Tiket) INTO max_id FROM Tiket_Penerbangan;

    WHILE i <= 10 AND i <= max_id DO
        SELECT * FROM Tiket_Penerbangan WHERE ID_Tiket = i;
        SET i = i + 1;
    END WHILE;
    
END$$
DELIMITER ;

CALL TampilkanTiket();

