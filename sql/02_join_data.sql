```sql
-- =====================================================
-- 02. JOIN DATA KIMIA FARMA
-- Project: Analisis Kinerja Bisnis Kimia Farma 2020-2023
-- =====================================================
-- Tujuan:
-- Menggabungkan data transaksi, produk, inventory,
-- dan kantor cabang menjadi satu tabel analisis.
-- =====================================================


-- Membuat tabel analisis berdasarkan penggabungan
-- empat tabel sumber.

CREATE OR REPLACE TABLE
  `valiant-healer-507913-b8.kimia_farma.kf_analisis_transaksi` AS

SELECT
  ft.transaction_id,
  ft.date,
  ft.branch_id,
  kc.branch_name,
  kc.kota,
  kc.provinsi,
  kc.rating AS rating_cabang,
  ft.customer_name,
  ft.product_id,
  p.product_name,

  -- Harga produk sebelum diskon
  ft.price AS actual_price,

  -- Persentase diskon transaksi
  ft.discount_percentage,

  -- Menentukan persentase gross laba berdasarkan harga produk
  CASE
    WHEN ft.price <= 50000 THEN 0.10
    WHEN ft.price > 50000 AND ft.price <= 100000 THEN 0.15
    WHEN ft.price > 100000 AND ft.price <= 300000 THEN 0.20
    WHEN ft.price > 300000 AND ft.price <= 500000 THEN 0.25
    WHEN ft.price > 500000 THEN 0.30
  END AS persentase_gross_laba,

  -- Menghitung harga setelah diskon
  ft.price * (1 - ft.discount_percentage) AS nett_sales,

  -- Menghitung keuntungan berdasarkan persentase gross laba
  (ft.price * (1 - ft.discount_percentage))
    *
  CASE
    WHEN ft.price <= 50000 THEN 0.10
    WHEN ft.price > 50000 AND ft.price <= 100000 THEN 0.15
    WHEN ft.price > 100000 AND ft.price <= 300000 THEN 0.20
    WHEN ft.price > 300000 AND ft.price <= 500000 THEN 0.25
    WHEN ft.price > 500000 THEN 0.30
  END AS nett_profit,

  -- Rating transaksi dari tabel transaksi
  ft.rating AS rating_transaksi

FROM
  `valiant-healer-507913-b8.kimia_farma.kf_final_transaction` AS ft

LEFT JOIN
  `valiant-healer-507913-b8.kimia_farma.kf_product` AS p
ON
  ft.product_id = p.product_id

LEFT JOIN
  `valiant-healer-507913-b8.kimia_farma.kf_kantor_cabang` AS kc
ON
  ft.branch_id = kc.branch_id;
```
