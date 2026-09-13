# Analisis Kinerja Bisnis Kimia Farma 2020–2023

## Deskripsi

Repository ini berisi hasil pengerjaan Project-Based Internship sebagai
Big Data Analytics Intern dengan topik:

**Analisis Kinerja Bisnis Kimia Farma Tahun 2020–2023 (Performance Analytics).**

Analisis dilakukan menggunakan Google BigQuery untuk mengolah data transaksi,
produk, inventory, dan kantor cabang, kemudian hasil analisis divisualisasikan
menggunakan Looker Studio.

## Tools yang Digunakan

- Google BigQuery
- Looker Studio
- SQL
- GitHub

## Dataset

Dataset yang digunakan terdiri dari:

- `kf_final_transaction`
- `kf_inventory`
- `kf_kantor_cabang`
- `kf_product`

Data mencakup periode **2020–2023**.

## Analisis yang Dilakukan

Analisis dalam project ini meliputi:

1. Validasi dan penggabungan data
2. Analisis jumlah transaksi per tahun
3. Analisis nett sales per tahun
4. Analisis penjualan berdasarkan provinsi
5. Analisis persentase gross profit berdasarkan kategori harga
6. Analisis nett profit berdasarkan provinsi
7. Analisis rating cabang
8. Analisis rating transaksi
9. Analisis tren penjualan

## Struktur Repository

```text
kimia-farma-performance-analytics/
│
├── README.md
│
├── sql/
│   ├── 01_validasi_data.sql
│   ├── 02_join_data.sql
│   ├── 03_analisis_penjualan.sql
│   ├── 04_analisis_profit.sql
│   └── 05_analisis_rating.sql

Hasil Utama

Beberapa temuan dari hasil analisis:

Kinerja nett sales Kimia Farma selama 2020–2023 relatif stabil.
Jawa Barat menjadi provinsi dengan kontribusi transaksi dan nett sales tertinggi.
Persentase gross profit meningkat seiring dengan kenaikan harga produk.
Jawa Barat juga menjadi provinsi dengan nett profit tertinggi.
Rating cabang dan rating transaksi dapat digunakan untuk mengevaluasi kualitas pelayanan dan pengalaman pelanggan.
Dashboard

Hasil analisis divisualisasikan menggunakan Looker Studio dalam bentuk
dashboard interaktif yang mencakup indikator penjualan, profitabilitas,
rating, serta tren kinerja bisnis.


│
└── hasil-analisis/
    └── README.md
