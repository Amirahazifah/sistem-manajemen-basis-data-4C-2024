DELIMITER//
CREATE PROCEDURE cetak_nama(
IN namadepan VARCHAR 20),
IN namabelakang VARCHAR (30)
)
BEGIN
DECLARE nama VARCHAR (50); #deklarasi variabel nama

SET nama = CONCAT(namadepan,'',namabelakang);
SELECT nama AS Nama_Lengkap;
END//
DELIMITER;

CALL cetak_nama('Zayn','Malik');

DELIMITER //
CREATE PROCEDURE contoh_variable(
     #parameter out untuk menangkap isi variable
     OUT out_angka INT,
     OUT out_angka_default INT,
     OUT out_string VARCHAR(100)
)
BEGIN
 #Deklarasi Variable
 DECLARE angka INT;
 DECLARE angka_default INT DEFAULT 1;
 DECLARE str VARCHAR(100); 
 
 #Mengisi Nilai Variable
 SET angka = 5;
 SET str = 'sistem manajemena basis data';
 
 #keluarkan isi variable lewat parameter out
 SET out_angka_default = angka_default;
 SET out_angka = angka;
 SET out_string = str;
END//
DELIMITER ;

DELIMITER//
CREATE PROCEDURE cobaIF(
	IN bil INT(3)
)
BEGIN
	#deklarasi variabel
	DECLARE str VARCHAR(50);
	
	IF (bil < 0) THEN
		SET str = 'Bilangan Negatif';
	ELSE
		SET str = 'Bilangan Positif';
	END IF;
	SELECT str;
END//
DELIMITER;

CALL cobaIF(0);

DELIMITER//
CREATE PROCEDURE contoh_loop()
BEGIN
	DECLARE counter INT DEFAULT;
	DECLARE result INT DEFAULT;
	
	my_loop: LOOP
		SET result = result + counter;
		SET counter = counter + 1;
		
		IF counter > 10 THEN 
		LEAVE my_loop;
		
		END IF;
	END LOOP my_loop;
	
	SELECT result;
END//
DELIMITER;

CALL contoh_loop();

DELIMITER//
CREATE PROCEDURE whileloop(
	IN bil INT(3)
)
BEGIN
	#deklarasi variabel
	DECLARE str VARCHAR (150);
	DECLARE i INT(3);
	
	SET i=1;
	SET str=" ";
	
	WHILE i <= bil DO
		SET str=CONCAT(str,i);
		SET i=i+1;
	END WHILE;
	SELECT str;
END//
DELIMITER;

CALL whileloop(10);

DELIMITER //
CREATE PROCEDURE example_repeat_loop()
BEGIN
    DECLARE counter INT DEFAULT 1;
    DECLARE result INT DEFAULT 0;

    REPEAT
        SET result = result + counter;
        SET counter = counter + 1;
    UNTIL counter > 10
    END REPEAT;

    SELECT result;
END //
DELIMITER ;

CALL example_repeat_loop();


SELECT CONCAT ("halo","dunia");
SELECT LOWER ("Halo")
SELECT NOW ():
SELECT DATEDIEF  (NOW "20220-05-05");
SELECT TIMESTAMPDIEF(MONTH,"2020-05-05",NOW ())