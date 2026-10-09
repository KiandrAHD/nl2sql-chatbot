-- =====================================================================
-- DATABASE SEKOLAH (SMK) - bahan latihan NL2SQL
-- 6 tabel: jurusan, guru, kelas, siswa, mapel, nilai
-- =====================================================================
PRAGMA foreign_keys = ON;
 
CREATE TABLE jurusan (
    id    INTEGER PRIMARY KEY,
    kode  TEXT NOT NULL UNIQUE,      -- contoh: 'PPLG', 'TJKT'
    nama  TEXT NOT NULL              -- nama lengkap jurusan
);
 
CREATE TABLE guru (
    id      INTEGER PRIMARY KEY,
    nama    TEXT NOT NULL,
    bidang  TEXT NOT NULL            -- bidang keahlian guru
);
 
CREATE TABLE kelas (
    id             INTEGER PRIMARY KEY,
    nama           TEXT NOT NULL,    -- contoh: 'X PPLG 1'
    tingkat        INTEGER NOT NULL, -- 10 atau 11
    jurusan_id     INTEGER NOT NULL,
    wali_kelas_id  INTEGER,
    FOREIGN KEY (jurusan_id)    REFERENCES jurusan(id),
    FOREIGN KEY (wali_kelas_id) REFERENCES guru(id)
);
 
CREATE TABLE siswa (
    id             INTEGER PRIMARY KEY,
    nis            TEXT NOT NULL UNIQUE,  -- nomor induk siswa
    nama           TEXT NOT NULL,
    jenis_kelamin  TEXT NOT NULL,         -- 'L' = laki-laki, 'P' = perempuan
    kelas_id       INTEGER NOT NULL,
    tahun_masuk    INTEGER NOT NULL,
    FOREIGN KEY (kelas_id) REFERENCES kelas(id)
);
 
CREATE TABLE mapel (
    id       INTEGER PRIMARY KEY,
    nama     TEXT NOT NULL,
    guru_id  INTEGER NOT NULL,            -- guru pengampu
    FOREIGN KEY (guru_id) REFERENCES guru(id)
);
 
CREATE TABLE nilai (
    id           INTEGER PRIMARY KEY,
    siswa_id     INTEGER NOT NULL,
    mapel_id     INTEGER NOT NULL,
    semester     INTEGER NOT NULL,        -- 1 = ganjil, 2 = genap
    nilai_akhir  INTEGER NOT NULL,        -- skala 0 - 100
    FOREIGN KEY (siswa_id) REFERENCES siswa(id),
    FOREIGN KEY (mapel_id) REFERENCES mapel(id)
);
 
-- ------------------------------ DATA ------------------------------
 
INSERT INTO jurusan (id, kode, nama) VALUES
(1, 'PPLG', 'Pengembangan Perangkat Lunak dan Gim'),
(2, 'TJKT', 'Teknik Jaringan Komputer dan Telekomunikasi'),
(3, 'DKV', 'Desain Komunikasi Visual'),
(4, 'AKL', 'Akuntansi dan Keuangan Lembaga');
 
INSERT INTO guru (id, nama, bidang) VALUES
(1, 'Budi Santoso', 'Pemrograman'),
(2, 'Siti Rahmawati', 'Basis Data'),
(3, 'Agus Prabowo', 'Jaringan'),
(4, 'Dewi Lestari', 'Keamanan Jaringan'),
(5, 'Rina Kurniasari', 'Desain Grafis'),
(6, 'Hendra Wijaya', 'Akuntansi'),
(7, 'Fitri Handayani', 'Matematika'),
(8, 'Joko Susilo', 'Bahasa');
 
INSERT INTO kelas (id, nama, tingkat, jurusan_id, wali_kelas_id) VALUES
(1, 'X PPLG 1', 10, 1, 1),
(2, 'XI PPLG 1', 11, 1, 2),
(3, 'X TJKT 1', 10, 2, 3),
(4, 'XI TJKT 1', 11, 2, 4),
(5, 'X DKV 1', 10, 3, 5),
(6, 'XI AKL 1', 11, 4, 6);
 
INSERT INTO siswa (id, nis, nama, jenis_kelamin, kelas_id, tahun_masuk) VALUES
(1, '25001', 'Ahmad Fauzi', 'L', 1, 2025),
(2, '25002', 'Alya Putri', 'P', 1, 2025),
(3, '25003', 'Bima Pratama', 'L', 1, 2025),
(4, '25004', 'Citra Maharani', 'P', 1, 2025),
(5, '24005', 'Dimas Saputra', 'L', 2, 2024),
(6, '24006', 'Eka Wulandari', 'P', 2, 2024),
(7, '24007', 'Farhan Hidayat', 'L', 2, 2024),
(8, '24008', 'Gita Permata', 'P', 2, 2024),
(9, '25009', 'Hafiz Ramadhan', 'L', 3, 2025),
(10, '25010', 'Intan Nuraini', 'P', 3, 2025),
(11, '25011', 'Joko Prasetyo', 'L', 3, 2025),
(12, '25012', 'Kirana Dewi', 'P', 3, 2025),
(13, '24013', 'Lutfi Hakim', 'L', 4, 2024),
(14, '24014', 'Maya Anggraini', 'P', 4, 2024),
(15, '24015', 'Naufal Akbar', 'L', 4, 2024),
(16, '24016', 'Olivia Safitri', 'P', 4, 2024),
(17, '25017', 'Putra Mahendra', 'L', 5, 2025),
(18, '25018', 'Qonita Azzahra', 'P', 5, 2025),
(19, '25019', 'Rizky Firmansyah', 'L', 5, 2025),
(20, '25020', 'Salsabila Nur', 'P', 5, 2025),
(21, '24021', 'Taufik Hidayah', 'L', 6, 2024),
(22, '24022', 'Umi Kalsum', 'P', 6, 2024),
(23, '24023', 'Vino Aditya', 'L', 6, 2024),
(24, '24024', 'Wulan Sari', 'P', 6, 2024);
 
INSERT INTO mapel (id, nama, guru_id) VALUES
(1, 'Matematika', 7),
(2, 'Bahasa Indonesia', 8),
(3, 'Bahasa Inggris', 8),
(4, 'Informatika', 1);
 
INSERT INTO nilai (siswa_id, mapel_id, semester, nilai_akhir) VALUES
  (1, 1, 1, 70), (1, 2, 1, 76), (1, 3, 1, 76), (1, 4, 1, 63),
  (2, 1, 1, 81), (2, 2, 1, 77), (2, 3, 1, 82), (2, 4, 1, 81),
  (3, 1, 1, 95), (3, 2, 1, 98), (3, 3, 1, 94), (3, 4, 1, 87),
  (4, 1, 1, 59), (4, 2, 1, 60), (4, 3, 1, 66), (4, 4, 1, 60),
  (5, 1, 1, 71), (5, 2, 1, 86), (5, 3, 1, 81), (5, 4, 1, 77),
  (6, 1, 1, 77), (6, 2, 1, 80), (6, 3, 1, 80), (6, 4, 1, 81),
  (7, 1, 1, 96), (7, 2, 1, 82), (7, 3, 1, 90), (7, 4, 1, 82),
  (8, 1, 1, 91), (8, 2, 1, 83), (8, 3, 1, 83), (8, 4, 1, 88),
  (9, 1, 1, 79), (9, 2, 1, 70), (9, 3, 1, 61), (9, 4, 1, 72),
  (10, 1, 1, 82), (10, 2, 1, 81), (10, 3, 1, 70), (10, 4, 1, 80),
  (11, 1, 1, 92), (11, 2, 1, 90), (11, 3, 1, 78), (11, 4, 1, 88),
  (12, 1, 1, 88), (12, 2, 1, 85), (12, 3, 1, 89), (12, 4, 1, 81),
  (13, 1, 1, 88), (13, 2, 1, 85), (13, 3, 1, 86), (13, 4, 1, 86),
  (14, 1, 1, 75), (14, 2, 1, 64), (14, 3, 1, 61), (14, 4, 1, 58),
  (15, 1, 1, 95), (15, 2, 1, 82), (15, 3, 1, 92), (15, 4, 1, 94),
  (16, 1, 1, 76), (16, 2, 1, 68), (16, 3, 1, 64), (16, 4, 1, 75),
  (17, 1, 1, 93), (17, 2, 1, 95), (17, 3, 1, 86), (17, 4, 1, 95),
  (18, 1, 1, 78), (18, 2, 1, 86), (18, 3, 1, 85), (18, 4, 1, 84),
  (19, 1, 1, 82), (19, 2, 1, 75), (19, 3, 1, 78), (19, 4, 1, 77),
  (20, 1, 1, 58), (20, 2, 1, 61), (20, 3, 1, 71), (20, 4, 1, 73),
  (21, 1, 1, 83), (21, 2, 1, 78), (21, 3, 1, 80), (21, 4, 1, 87),
  (22, 1, 1, 87), (22, 2, 1, 86), (22, 3, 1, 84), (22, 4, 1, 88),
  (23, 1, 1, 79), (23, 2, 1, 87), (23, 3, 1, 88), (23, 4, 1, 92),
  (24, 1, 1, 74), (24, 2, 1, 76), (24, 3, 1, 68), (24, 4, 1, 74);


SELECT COUNT(*) FROM siswa;