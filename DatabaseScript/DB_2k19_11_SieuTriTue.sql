create database DB_2k19_11_SieuTriTue
go

use DB_2k19_11_SieuTriTue
go

create table trandau
(
	matrandau char(12) not null,
	ngaythang date,
	madoia char(12),
	madoib char(12)
)

create table vongdau
(
	tenvong nvarchar(50) not null,
	quydinh nvarchar(200)
)

create table trandau_vongdau
(
	matrandau char(12) not null,
	tenvongdau nvarchar(50) not null,
	diemdoia int,
	diemdoib int
)

create table nguoi
(
	cmnd char(12) not null,
	hoten nvarchar(50),
	ngaysinh date,
	quoctich char(2),
	mota nvarchar(200)
)

create table trandau_bgk_km
(
	matrandau char(12) not null,
	cmnd char(12) not null,
	loai char(3)
)

create table doichoi
(
	madoi char(12) not null,
	tendoi nvarchar(50)
)

create table doichoi_thanhvien
(
	madoi char(12) not null,
	cmnd char(12) not null,
)

alter table doichoi add
	constraint pk_doichoi primary key (madoi)

alter table trandau add
	constraint pk_trandau primary key (matrandau),
	constraint fk_madoia foreign key (madoia) references doichoi(madoi),
	constraint fk_madoib foreign key (madoib) references doichoi(madoi),
	constraint fk_check check (madoia != madoib)

alter table vongdau add
	constraint pk_vongdau primary key (tenvong)
	
alter table trandau_vongdau add
	constraint pk_trandau_vongdau primary key (matrandau, tenvongdau),
	constraint fk_td_vd_matrandau foreign key (matrandau) references trandau(matrandau),
	constraint fk_td_vd_tenvongdau foreign key (tenvongdau) references vongdau(tenvong)

alter table nguoi add
	constraint pk_nguoi primary key (cmnd)

alter table trandau_bgk_km add
	constraint pk_trandau_bgk_km primary key (matrandau, cmnd),
	constraint fk_trandau_bgk_km_matrandau foreign key (matrandau) references trandau(matrandau),
	constraint fk_trandau_bgk_km_cmnd foreign key (cmnd) references nguoi(cmnd),
	constraint fk_trandau_bgk_km_check check (loai = 'bgk' or loai = 'km')

alter table doichoi_thanhvien add
	constraint pk_dc_tv primary key (madoi, cmnd),
	constraint fk_dc_tv_madoi foreign key (madoi) references doichoi(madoi),
	constraint fk_dc_tv_cmnd foreign key (cmnd) references nguoi(cmnd)