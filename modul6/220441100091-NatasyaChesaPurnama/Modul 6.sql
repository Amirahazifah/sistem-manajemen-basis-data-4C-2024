DELIMITER $$
CREATE PROCEDURE cekobat()
BEGIN
    SELECT o.id_obat, o.nama_obat,
        IF(SUM(lp.jumlah) IS NOT NULL AND SUM(lp.jumlah) > 0, 'Laris', 'Tidak') AS laris_status,
        SUM(lp.jumlah) AS total_penjualan
    FROM obat o
    LEFT JOIN laporan_penjualan lp ON o.id_obat = lp.id_obat
    GROUP BY o.id_obat
    ORDER BY total_penjualan DESC
    LIMIT 1;
END $$
DELIMITER ;

CALL cekobat;

DELIMITER $$
CREATE PROCEDURE dataobat()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 10 DO
        SELECT * FROM obat WHERE id_obat = i;
        SET i = i + 1;
    END WHILE;
END $$
DELIMITER ;

CALL dataobat;