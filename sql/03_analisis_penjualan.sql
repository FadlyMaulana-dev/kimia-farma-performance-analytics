-- =====================================================
-- 03. ANALISIS PENJUALAN KIMIA FARMA
-- Periode: 2020-2023
-- =====================================================

-- 1. Analisis penjualan dan jumlah transaksi per tahun
SELECT
  EXTRACT(YEAR FROM date) AS tahun,
  COUNT(DISTINCT transaction_id) AS total_transaksi,
  SUM(nett_sales) AS total_nett_sales,
  AVG(nett_sales) AS rata_rata_nett_sales
FROM
  `valiant-healer-507913-b8.kimia_farma.kf_analisis_transaksi`
GROUP BY
  tahun
ORDER BY
  tahun;


-- 2. Jumlah transaksi berdasarkan provinsi
SELECT
  provinsi,
  COUNT(DISTINCT transaction_id) AS total_transaksi
FROM
  `valiant-healer-507913-b8.kimia_farma.kf_analisis_transaksi`
GROUP BY
  provinsi
ORDER BY
  total_transaksi DESC;


-- 3. Nett sales berdasarkan provinsi
SELECT
  provinsi,
  SUM(nett_sales) AS total_nett_sales
FROM
  `valiant-healer-507913-b8.kimia_farma.kf_analisis_transaksi`
GROUP BY
  provinsi
ORDER BY
  total_nett_sales DESC;
