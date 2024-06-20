-1
DELIMITER $$

CREATE PROCEDURE TopProduct(
    IN p_id_kamar INT
)
BEGIN
    DECLARE top_product_id INT;
    DECLARE product_name VARCHAR(255);

    SELECT ID_Kamar INTO top_product_id
    FROM Pemesanan
    GROUP BY ID_Kamar
    ORDER BY COUNT(*) DESC
    LIMIT 1;

    SELECT Tipe_Kamar INTO product_name
    FROM Kamar
    WHERE ID_Kamar = p_id_kamar;

    IF p_id_kamar = top_product_id THEN
        SELECT CONCAT(product_name, ' adalah produk/jasa terlaris') AS Message;
    ELSE
        SELECT CONCAT(product_name, ' bukan produk/jasa terlaris') AS Message;
    END IF;
END$$

DELIMITER ;
CALL TopProduct(10);

-2
DELIMITER $$

CREATE PROCEDURE TampilkanTamu()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE max_id INT;
    
    SELECT MAX(ID_Tamu) INTO max_id FROM Tamu;

    WHILE i <= 10 AND i <= max_id DO
        SELECT * FROM Tamu WHERE ID_Tamu = i;
        SET i = i + 1;
    END WHILE;
    
END$$
DELIMITER ;

CALL TampilkanTamu();