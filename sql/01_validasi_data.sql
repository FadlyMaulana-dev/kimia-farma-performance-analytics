-- =====================================================
-- 01. VALIDASI DATA
-- Project: Analisis Kinerja Bisnis Kimia Farma 2020-2023
-- =====================================================
-- Tujuan:
-- Memastikan data hasil analisis memiliki jumlah baris,
-- transaksi unik, rentang tanggal, dan tidak memiliki
-- nilai NULL pada kolom penting.
-- =====================================================


-- 1. Mengecek jumlah total data dan transaksi unik
SELECT
  COUNT(*) AS total_data,
  COUNT(DISTINCT transaction_id) AS transaksi_unik
FROM `valiant-healer-507913-b8.kimia_farma.kf_analisis_transaksi`;


-- 2. Mengecek rentang tanggal transaksi
SELECT
  MIN(date) AS tanggal_awal,
  MAX(date) AS tanggal_akhir
FROM `valiant-healer-507913-b8.kimia_farma.kf_analisis_transaksi`;


-- 3. Mengecek NULL pada informasi produk
SELECT
  COUNTIF(product_name IS NULL) AS null_product_name,
  COUNTIF(category IS NULL) AS null_category
FROM `valiant-healer-507913-b8.kimia_farma.kf_analisis_transaksi`;


-- 4. Mengecek NULL pada informasi cabang
SELECT
  COUNTIF(branch_name IS NULL) AS null_branch_name,
  COUNTIF(kota IS NULL) AS null_kota,
  COUNTIF(provinsi IS NULL) AS null_provinsi
FROM `valiant-healer-507913-b8.kimia_farma.kf_analisis_transaksi`;
