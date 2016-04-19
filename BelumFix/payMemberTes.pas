Program coba; //program menangani fungsi F13-Login member

uses sysutils;

type 
	DataFilm = Record
		JudulFilm : string;
		GenreFilm: string;
		Rating : string;
		Durasi : string;
		Sinopsis : string;
		EndPrice : string;
		DaysPrice : string;
	end;

type 
	DataPemesanan = Record
		NomorPemesanan : string;
		NamaFilm : string;
		TanggalTayang : string;
		BulanTayang : string;
		TahunTayang  : string;
		JamTayang : string;
		JumlahKursi : string;
		Total : string;
		JenisPembayaran : string;
		end;

type 
	tabPemesanan = array [0..1000] of DataPemesanan;
	
type
	tabDataFilm = array [0..1000] of DataFilm;

type Member = record
		UserName,
		Password : string;
		Saldo : longint;
end;

type dbMember = record
		Member : array[1..1000] of Member;
		Neff : integer;
end;


//prosedur login
procedure login(T: dbMember; var cek: boolean; var idx: integer);

//kamus
var a : integer;
	sandi, user : string;
	found: boolean;

//algoritma lokal
begin
	a := 1 ;
	found := false;
	write('> Masukkan username :');
	readln(user);
	write('> Masukkan password :');
	readln(sandi);
	while (Found = False) and (a <= 1000) do
	begin
		if (user = T.Member[a].UserName) and (sandi = T.Member[a].Password) then
		begin
			found:= True;
			writeln('> Halo ! Anda login sebagai ', T.Member[a].UserName);
			writeln('> Sisa Saldo anda adalah ', T.Member[a].Saldo);
		end else
		begin 
			a:= a + 1;
		end;
	end;
	
	if (found = False) then
	begin
		writeln('> Username atau password salah');
	end;
	cek:= found;
	idx := a;
end;

//kamus
var isLogin : boolean;
	T3 : dbMember;
	T2 : tabDataFilm;
	T1 : tabPemesanan;
	harga, sisaSaldo : longint;
	i, c  : integer;
	nopesan :string;
//algoritma
begin
	T2[1].JudulFilm := 'The Jungle Book';
	T2[1].EndPrice := '35000';
	T1[1].NomorPemesanan := '001';
	T1[1].TanggalTayang := '16';
	T1[1].BulanTayang := '04';
	T1[1].TahunTayang := '2016';
	T1[1].NamaFilm := 'The Jungle Book';
	T1[1].JumlahKursi := '25';
	T1[1].Total := '7000';
	T1[1].JenisPembayaran := 'Belum dibayar'; 
	T3.Member[3].UserName := 'anang';
	T3.Member[3].Password := 'akuganteng';
	T3.Member[3].Saldo := 150000;
	login(T3, isLogin, i);
	writeln(i);
	//fungsi paymember
	if (isLogin = True) then
	begin
		writeln('> Anda akan melakukan pembayaran menggunakan saldo member');
		write('> Nomor pesanan: ');
		read(nopesan);
		c := StrToInt(nopesan[3]);
		Val(T1[c].Total,harga); 			//mengubah isi dari tabel ke long int dan menampungnya ke suatu variable 
		writeln('> Harga yang harus dibayar: ',harga);
		if (T3.Member[i].Saldo > harga) then
			begin
				sisaSaldo:= T3.Member[i].Saldo - harga;
				writeln('> Sisa saldo anda adalah : ',sisaSaldo);
				writeln('> Pembayaran sukses!'); 
			end else
			begin
					writeln('> Sisa saldo anda tidak mencukupi');
			end;

	//mmengganti status pencatatan di array
	T1[c].JenisPembayaran := 'Member';
	end;
end.



