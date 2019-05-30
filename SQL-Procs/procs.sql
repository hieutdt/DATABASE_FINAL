use DB_2k19_11_SieuTriTue

go
create procedure THONG_KE_TRAN_DAU as
begin
	select		TRANDAU.matrandau, ngaythang, SUM(diemdoia) as TiSoA, SUM(diemdoib) as TiSoB
	from		TRANDAU left join TRANDAU_VONGDAU on (TRANDAU.matrandau = TRANDAU_VONGDAU.matrandau)
	group by	TRANDAU.matrandau
end

go
create procedure THEM_TRAN_DAU
	@matrandau	char(12),
	@ngaythang	date,
	@madoia		char(12),
	@madoib		char(12)
as
begin
	insert into TRANDAU values (@matrandau, @ngaythang, @madoia, @madoib)
end

go
create procedure THEM_KET_QUA
	@matrandau		char(12),
	@tenvongdau		nvarchar(30),
	@diemdoia		int,
	@diemdoib		int
as
begin
	insert into TRANDAU_VONGDAU values (@matrandau, @tenvongdau, @diemdoia, @diemdoib)
end

go
create procedure THEM_BGK
	@matrandau		char(12),
	@cmnd			char(12)
as
begin
	insert into TRANDAU_BGK_KM values (@matrandau, @cmnd, 'BGK')
end

go
create procedure THEM_KHACH_MOI
	@matrandau		char(12),
	@cmnd			char(12)
as
begin
	insert into TRANDAU_BGK_KM values (@matrandau, @cmnd, 'KM')
end

go
create procedure THEM_DOI
	@madoi		char(12),
	@tendoi		nvarchar(50)
as
begin
	insert into DOICHOI values (@madoi, @tendoi)
end

go
create procedure THEM_THANH_VIEN
	@madoi		char(12),
	@cmnd		char(12)
as
begin
	insert into DOICHOI_THANHVIEN values (@madoi, @cmnd)
end