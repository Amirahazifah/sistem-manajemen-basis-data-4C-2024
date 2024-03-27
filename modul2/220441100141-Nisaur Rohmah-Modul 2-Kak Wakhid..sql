CREATE VIEW readonly_view1 AS
	SELECT proker.id_proker, proker.nama_proker, proker.pj_proker, proker.id_departemen, departemen.nama_departemen
	FROM proker
	JOIN departemen ON proker.id_departemen = departemen.id_departemen;
SELECT * FROM readonly_view1;

CREATE VIEW readonly_view2 AS
	SELECT agenda.id_agenda, agenda.nama_agenda, agenda.pj_agenda, agenda.id_departemen, departemen.nama_departemen
	FROM agenda
	JOIN departemen ON agenda.id_departemen = departemen.id_departemen;
SELECT * FROM readonly_view2;

