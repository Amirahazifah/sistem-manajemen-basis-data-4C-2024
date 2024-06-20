CREATE VIEW anggota_view AS
    SELECT nim, nama, ttl, jabatan
    FROM anggota;
SELECT * FROM anggota_view;

CREATE VIEW agenda_view AS
    SELECT nama_agenda, pj_agenda, id_departemen
    FROM agenda;
SELECT * FROM agenda_view;

CREATE VIEW readonly_view1 AS
	SELECT proker.id_proker, proker.nama_proker, proker.pj_proker, proker.id_departemen, departemen.nama_departemen
	FROM proker
	JOIN departemen ON proker.id_departemen = departemen.id_departemen;
SELECT * FROM readonly_view1;

UPDATE readonly_view1 SET nama_proker = 'ospek', nama_departemen = 'Hubungan Masyarakat' WHERE id_proker= 501;
SELECT * FROM proker;

CREATE VIEW readonly_view2 AS
	SELECT agenda.id_agenda, agenda.nama_agenda, agenda.pj_agenda, agenda.id_departemen, departemen.nama_departemen
	FROM agenda
	JOIN departemen ON agenda.id_departemen = departemen.id_departemen;
SELECT * FROM readonly_view2;

