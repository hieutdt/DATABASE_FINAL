use DB_2k19_11_SieuTriTue

insert into NGUOI(CMND, HoTen, NgaySinh, QuocTinh, MoTa) values
('000000000001', 'Nguyen Van A', '07-01-1995', 'VN', 'mota'),
('000000000002', 'Nguyen Van A', '07-01-1995', 'VN', 'mota'),
('000000000003', 'Nguyen Van A', '07-01-1995', 'VN', 'mota'),
('000000000004', 'Nguyen Van A', '07-01-1995', 'VN', 'mota'),
('000000000005', 'Zhang Wei', '07-01-1995', 'CH', 'mota'),
('000000000006', 'Wang Wei', '07-01-1995', 'CH', 'mota'),
('000000000007', 'Wang Fang', '07-01-1995', 'CH', 'mota'),
('000000000008', 'Zheng Caiqian', '07-01-1995', 'CH', 'mota'),
('000000000009', 'Franco Gengotti', '07-01-1995', 'IT', 'mota'),
('000000000010', 'Marco Pellegrini', '07-01-1995', 'IT', 'mota'),
('000000000011', 'Andrea La Torre', '07-01-1995', 'IT', 'mota'),
('000000000012', 'Matteo Salvo', '07-01-1995', 'IT', 'mota'),
('000000000013', 'Antia Martinez', '07-01-1995', 'SP', 'mota'),
('000000000014', 'Martin Lopez-Nores', '07-01-1995', 'SP', 'mota'),
('000000000015', 'Alexander Olleta', '07-01-1995', 'SP', 'mota'),
('000000000016', N'Paco Páze', '07-01-1995', 'SP', 'mota'),
('000000000017', 'Tao Ching-Ying', '07-01-1995', 'CH', 'mota'),--guest
('000000000018', 'Zhang Ziyi', '07-01-1995', 'CH', 'mota'),
('000000000019', 'Jay Chou', '07-01-1995', 'CH', 'mota'),
('000000000020', 'Li Yanhong', '07-01-1995', 'CH', 'mota'),--guest
('000000000021', 'Robert Desimone', '07-01-1995', 'US', 'mota'), --judge
('000000000022', 'Zhang Xiu Ying', '07-01-1995', 'CH', 'mota'),
('000000000023', 'Zhang Min', '07-01-1995', 'CH', 'mota') --judge

insert into VONGDAU(TenVong, QuyDinh) values 
(N'Tính nhẩm', N'Tính nhẩm phép toán trên màn hình'),
(N'Giải rubik', N'Giải 100 rubik trong thời gian ngắn nhất'),
(N'Xác định âm thanh', N'Các thí sinh xác định tiếng nhạc piano trong một không gian tràn tiếng ồn'),
(N'Mô tả trang phục', N'Các thí sinh đối mặt với 20 người khác nhau và ghi nhớ trang phục của họ'),
(N'Tính trọng lượng nước', N'Tính năng lực của nước trong kính dựa trên những âm thanh của kim loại khi va vào kính'),
(N'Ghi nhớ chuỗi số', N'Các thí sinh đối mặt với 100 người và ghi nhớ các con số họ đưa ra theo đúng thứ tự'),
(N'Sudoku đặc biệt', N'Các thí sinh giải Sudoku với những luật lệ đặc biệt khác được đưa ra')

insert into DOICHOI(MaDoi, TenDoi) values
('1', N'Việt Nam'),
('2', N'China'),
('3', 'Italy'),
('4', 'Spain')

insert into DOICHOI_THANHVIEN(MaDoi, CMND) values 
('1', '000000000001'),
('1', '000000000002'),
('1', '000000000003'),
('1', '000000000004'),
('2', '000000000005'),
('2', '000000000006'),
('2', '000000000007'),
('2', '000000000008'),
('3', '000000000009'),
('3', '000000000010'),
('3', '000000000011'),
('3', '000000000012'),
('4', '000000000013'),
('4', '000000000014'),
('4', '000000000015'),
('4', '000000000016')

insert into TRANDAU(MATranDau, NgayThang, MaDoiA, MaDoiB) values
('1', '01-01-2015', '2', '1'),
('2', '03-01-2015', '2', '3'),
('3', '05-01-2015', '2', '4')

insert into TRANDAU_VONGDAU(MaTranDau, TenVongDau, DiemDoiA, DiemDoiB) values 
('1', N'Tính nhẩm', 1, 2),
('1', N'Giải rubik', 1, 2),
('1', N'Xác định âm thanh', 1, 2),
('2', N'Tính nhẩm', 1, 2),
('2', N'Mô tả trang phục', 1, 2),
('2', N'Ghi nhớ chuỗi số', 1, 2),
('3', N'Mô tả trang phục', 1, 2),
('3', N'Ghi nhớ chuỗi số', 1, 2),
('3', N'Sudoku đặc biệt', 1, 2)

insert into TRANDAU_BGK_KM(MaTranDau, CMND, Loai) values
('1', '000000000017', 'KM'),
('1', '000000000018', 'BGK'),
('2', '000000000019', 'KM'),
('2', '000000000020', 'BGK'),
('3', '000000000021', 'KM'),
('3', '000000000023', 'BGK')

