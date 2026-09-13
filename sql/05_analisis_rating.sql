-- =====================================================
-- 05. ANALISIS RATING KIMIA FARMA
-- Periode: 2020-2023
-- =====================================================

-- 1. Rata-rata rating cabang berdasarkan provinsi
SELECT
  provinsi,
  AVG(rating_cabang) AS rata_rata_rating_cabang
FROM
  `valiant-healer-507913-b8.kimia_farma.kf_analisis_transaksi`
GROUP BY
  provinsi
ORDER BY
  rata_rata_rating_cabang DESC;


-- 2. Rata-rata rating transaksi berdasarkan provinsi
SELECT
  provinsi,
  AVG(rating_transaksi) AS rata_rata_rating_transaksi
FROM
  `valiant-healer-507913-b8.kimia_farma.kf_analisis_transaksi`
GROUP BY
  provinsi
ORDER BY
  rata_rata_rating_transaksi DESC;


-- 3. Top 5 provinsi dengan rating cabang tinggi
-- tetapi rating transaksi relatif rendah
SELECT
  provinsi,
  AVG(rating_cabang) AS rata_rata_rating_cabang,
  AVG(rating_transaksi) AS rata_rata_rating_transaksi
FROM
  `valiant-healer-507913-b8.kimia_farma.kf_analisis_transaksi`
GROUP BY
  provinsi
ORDER BY
  rata_rata_rating_cabang DESC,
  rata_rata_rating_transaksi ASC
LIMIT 5;
