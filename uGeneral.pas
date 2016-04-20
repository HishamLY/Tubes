unit uGeneral;

interface


type Tayang = record
		Nama,
		Jam : string;
		Tanggal,
		Bulan,
		Tahun,
		LamaTayang : integer;
end;

type dbTayang = record
	Tayang : array[1..1000] of Tayang;
	Neff : integer;
end;

type Kapasitas = record
		Nama,
		Jam : string;
		Tanggal,
		Bulan,
		Tahun,
		Kapasitas : integer;
end;

type dbKapasitas = record
	Kapasitas : array[1..1000] of Kapasitas;
	Neff : integer;
end;

type Member = record
		UserName,
		Password : string;
		Saldo : longint;
end;

type dbMember = record
		Member : array[1..1000] of Member;
		Neff : integer;
end;

type Tanggal = record
	Hari : string;
	Tanggal,
	Bulan,
	Tahun : integer;
end;

type Pemesanan = record
	No : integer;
	Nama : string;
	Tanggal, Bulan, Tahun : integer;
	Jam : string;
	Jumlahkursi : integer;
	Total : longint;
	Jenis : string;
end;

type dbPemesanan = record
		Pemesanan : array [1..1000] of Pemesanan;
		Neff : integer;
end;

implementation


end.
