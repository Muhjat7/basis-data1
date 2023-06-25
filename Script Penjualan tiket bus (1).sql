CREATE DATABASE penjualan_tiket_bus;
USE penjualan_tiket_bus;

-- Tabel Armada
CREATE TABLE data_armada (kode_bus INT PRIMARY KEY,
nama_bus VARCHAR(25), alamat_tujuan VARCHAR(25), keberangkatan VARCHAR(30));
  
INSERT INTO data_armada (kode_bus, nama_bus, alamat_tujuan, keberangkatan)
VALUES 	
		('1012', 'Murni Jaya', 'Palembang', 'Bekasi'),
		('1013', 'Sinar Abadi', 'Madura', 'Jakarta'),
		('1014', 'Maju Lancar', 'Semarang', 'Cikarang'),
		('1015', 'Gunung Harapan', 'Yogyakarta', 'Sukaresmi');
    
-- Tabel Jadwal Keberangkatan
CREATE TABLE jadwal_keberangkatan
(kode_keberangkatan INT PRIMARY KEY, tgl_keberangkatan VARCHAR(30));

INSERT INTO jadwal_keberangkatan (kode_keberangkatan, tgl_keberangkatan)
VALUES 
		('66183', '2024-06-19'),
		('66184', '2024-07-25'),
		('66187', '2024-06-27'),                    
		('66189', '2024-07-13'),
		('66190', '2024-06-28');
        

-- Tabel Data penumpang dan Posisi Tempat Duduk
CREATE TABLE Data_Penumpang_dan_Posisi_Tempat_Duduk 
(kode_penumpang INT PRIMARY KEY,
  nomor_tempat_duduk VARCHAR(25),
  nama VARCHAR(20),
  kode_bus INT);

-- Input database nya dulu sebelum dijadikan Foregin Key

INSERT INTO Data_Penumpang_dan_Posisi_Tempat_Duduk (kode_penumpang, nomor_tempat_duduk, nama, kode_bus)
VALUES	
		('2812', '11-20', 'Ahmad', '1012'),
		('2813', '21-30', 'Rio', '1013'),
		('2814', '31-40', 'Rina', '1014'),
		('2815', '40-45', 'Rani', '1015');
        
-- Baru Penambahan Foregin Key pada kolom kode_bus di data_penumpang_dan_posisi_tempat_duduk

ALTER TABLE data_penumpang_dan_posisi_tempat_duduk ADD FOREIGN KEY (kode_bus) REFERENCES data_armada (kode_bus);


-- Tabel Transaksi Penjualan
CREATE TABLE Transaksi_Penjualan (kode_transaksi_penjualan INT PRIMARY KEY,
kode_keberangkatan INT,
kode_penumpang INT,
tgl_transaksi_penjualan DATE,
nomor_tempat_duduk INT);


-- Input database nya dulu sebelum dijadikan Foregin Key

  
INSERT INTO Transaksi_Penjualan (kode_transaksi_penjualan, kode_keberangkatan, 
kode_penumpang, tgl_transaksi_penjualan, nomor_tempat_duduk)
VALUES 	
		('101513', '66189', '2813', '2024-07-08', '022'),
		('101414', '66190', '2815', '2024-06-18', '042'),                           
		('101215', '66184', '2812', '2024-07-14', '014'),
		('101316', '66187', '2814', '2024-06-20', '036');   


-- Baru Penambahan Foregin Key pada Kolom Kode penumpang di table Transaksi Penjualan

ALTER TABLE transaksi_penjualan ADD FOREIGN KEY (kode_penumpang)
REFERENCES Data_penumpang_dan_posisi_tempat_duduk (kode_penumpang);
        
-- Tabel Laporan Transaksi
CREATE TABLE Laporan_Transaksi (kode_transaksi INT PRIMARY KEY,
kode_transaksi_penjualan INT,
tgl_transaksi_penjualan DATE,
jumlah_pembayaran VARCHAR(50),
FOREIGN KEY (kode_transaksi_penjualan) REFERENCES Transaksi_penjualan(kode_transaksi_penjualan));


-- Input database nya dulu sebelum dijadikan Foregin Key

  
-- Menginput Data Laporan Transaksi
INSERT INTO laporan_transaksi (kode_transaksi, kode_transaksi_penjualan,
tgl_transaksi_penjualan, jumlah_pembayaran)
VALUES
		('2021513', '101513', '2024-07-08', '300.000'),
		('2031414', '101414', '2024-06-18', '500.000'),
		('2041215', '101215', '2024-07-14', '170.000'),
		('2051316', '101316', '2024-06-20', '700.000');
        


-- Baru Penambahan Foregin Key pada Kolom Kode penumpang di table Laporan_transaksi


 ALTER TABLE laporan_transaksi ADD FOREIGN KEY (kode_transaksi_penjualan)
 REFERENCES transaksi_penjualan (kode_transaksi_penjualan);
 




