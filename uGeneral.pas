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

procedure F15Exit (T1 : dbKapasitas; T2 : dbPemesanan; T3 : dbMember);
{* Procedure F15Exit digunakan untuk menyalin semua hasil perubahan file eksternal
   yang ditampung di dalam array ke dalam file eksternal awal tersebut
   I.S : T1, T2, dan T3 telah terdefinisi
   F.S : File eksternal kapasitas.txt, pemesanan.txt, dan member.txt telah di-update *}

implementation

procedure F15Exit (T1 : dbKapasitas; T2 : dbPemesanan; T3 : dbMember);

{Kamus Lokal}
var
	i,j,k : integer;
	fin1,fin2,fin3 : text;
	tanggal, bulan, tahun, nomor, total, saldo : string;

{Algoritma}
begin
		assign(fin1, 'database/kapasitas.txt');
		rewrite(fin1);
		for i := 1 to T1.Neff do
		begin
			Str(T1.Kapasitas[i].Tanggal, tanggal);
			Str(T1.Kapasitas[i].Bulan, bulan);
			Str(T1.Kapasitas[i].Tahun, tahun);
			write(fin1, T1.Kapasitas[i].Nama,' | ',tanggal,' | ',bulan,' | ',tahun,' | ',T1.Kapasitas[i].Jam,' | ',T1.Kapasitas[i].Kapasitas,' | ')
		end;
		assign(fin2, 'database/pemesanan.txt');
		rewrite(fin2);
		for j := 1 to T2.Neff do
		begin
			Str(T2.Pemesanan[i].No, nomor);
			Str(T2.Pemesanan[i].Tanggal, tanggal);
			Str(T2.Pemesanan[i].Bulan, bulan);
			Str(T2.Pemesanan[i].Tahun, tahun);
			Str(T2.Pemesanan[i].Total, total);
			write(fin2, nomor,' | ',tanggal,' | ',bulan,' | ',tahun,' | ',T2.Pemesanan[i].Jam,' | ',T2.Pemesanan[i].Jumlahkursi,' | ',total,' | ',T2.Pemesanan[i].Jenis,' | ')
		end;
		assign(fin3, 'database/member.txt');
		rewrite(fin3);
		for k := 1 to T3.Neff do
		begin
			Str(T3.Member[i].Saldo, saldo);
			write(fin3, T3.Member[i].Username,' | ',T3.Member[i].Password,' | ',saldo,' | ')
		end;
		close(fin1);
		close(fin2);
		close(fin3);
end;

end.
