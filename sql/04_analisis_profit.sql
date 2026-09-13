-- =====================================================
-- 04. ANALISIS PROFIT KIMIA FARMA
-- Periode: 2020-2023
-- =====================================================

-- 1. Persentase gross profit berdasarkan kategori harga
SELECT
  CASE
    WHEN actual_price <= 50000 THEN '≤ 50 ribu'
    WHEN actual_price <= 100000 THEN '>50–100 ribu'
    WHEN actual_price <= 300000 THEN '>100–300 ribu'
    WHEN actual_price <= 500000 THEN '>300–500 ribu'
    ELSE '>500 ribu'
  END AS kategori_harga,
  
  persentase_gross_laba,
  COUNT(*) AS jumlah_transaksi

FROM
  `valiant-healer-507913-b8.kimia_farma.kf_analisis_transaksi`

GROUP BY
  kategori_harga,
  persentase_gross_laba

ORDER BY
  persentase_gross_laba;


-- 2. Nett profit berdasarkan provinsi
SELECT
  provinsi,
  SUM(nett_profit) AS total_nett_profit

FROM
  `valiant-healer-507913-b8.kimia_farma.kf_analisis_transaksi`

GROUP BY
  provinsi

ORDER BY
  total_nett_profit DESC;
