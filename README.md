# Analisis Kinerja Bisnis Kimia Farma 2020–2023

## Deskripsi

Repository ini berisi hasil pengerjaan Project-Based Internship sebagai **Big Data Analytics Intern** dengan topik:

**Analisis Kinerja Bisnis Kimia Farma Tahun 2020–2023 (Performance Analytics).**

Analisis dilakukan menggunakan **Google BigQuery** untuk mengolah data transaksi, produk, inventory, dan kantor cabang. Hasil pengolahan kemudian dianalisis dan divisualisasikan menggunakan **Looker Studio**.

## Tools yang Digunakan

* Google BigQuery
* SQL
* Looker Studio
* GitHub

## Dataset

Dataset yang digunakan terdiri dari beberapa tabel utama:

* `kf_final_transaction`
* `kf_inventory`
* `kf_kantor_cabang`
* `kf_product`

Data mencakup periode **2020–2023**.

## Analisis yang Dilakukan

Analisis dalam project ini meliputi:

1. Validasi dan penggabungan data
2. Analisis jumlah transaksi per tahun
3. Analisis nett sales per tahun
4. Analisis pertumbuhan nett sales
5. Analisis penjualan berdasarkan provinsi
6. Analisis persentase gross profit berdasarkan kategori harga
7. Analisis nett profit berdasarkan provinsi
8. Analisis rating cabang
9. Analisis rating transaksi
10. Analisis tren penjualan bulanan
11. Visualisasi hasil analisis dalam dashboard

## Hasil Utama

Beberapa temuan dari hasil analisis:

* Kinerja **nett sales Kimia Farma selama 2020–2023 relatif stabil**.
* **Jawa Barat** menjadi provinsi dengan kontribusi transaksi dan nett sales tertinggi.
* Persentase **gross profit meningkat seiring dengan kenaikan kategori harga produk**.
* Jawa Barat juga menjadi provinsi dengan **nett profit tertinggi**.
* Rating cabang dan rating transaksi dapat digunakan sebagai indikator tambahan untuk mengevaluasi kualitas pelayanan dan pengalaman pelanggan.

## Dashboard

Hasil analisis divisualisasikan menggunakan **Looker Studio** dalam bentuk dashboard interaktif yang mencakup indikator:

* Total transaksi
* Nett sales
* Nett profit
* Gross profit
* Rating cabang
* Rating transaksi
* Tren penjualan
* Performa berdasarkan provinsi

Screenshot dashboard tersedia pada folder [`hasil-analisis/04-dashboard`](hasil-analisis/04-dashboard/).

## Struktur Repository

```text
kimia-farma-performance-analytics/
│
├── hasil-analisis/
│   │
│   ├── 01-validasi-data/
│   │   ├── 01_struktur_tabel_bigquery.png
│   │   ├── 02_join_final_data.png
│   │   ├── 02_join_final_data_query1.png
│   │   ├── 03_validasi_jumlah_join.png
│   │   ├── 04_cek_jumlah_tabel_analisis.png
│   │   └── 05_cek_null_join.png
│   │
│   ├── 02-challenge-1/
│   │   ├── 01_cek_periode_transaksi.png
│   │   ├── 02_perhitungan_nett_sales.png
│   │   ├── 03_kinerja_tahunan.png
│   │   ├── 04_pertumbuhan_nett_sales.png
│   │   ├── 05_top_10_cabang.png
│   │   ├── 06_top_10_produk.png
│   │   └── 06_top_10_produk_query.png
│   │
│   ├── 03-challenge-2/
│   │   ├── 01_validasi_perhitungan_laba.png
│   │   ├── 02_validasi_persentase_gross_laba.png
│   │   ├── 03_revenue_tahunan_2020_2023.png
│   │   ├── 04_top_10_transaksi_provinsi.png
│   │   ├── 05_top_10_nett_sales_provinsi.png
│   │   ├── 06_top_5_rating_cabang_vs_transaksi.png
│   │   ├── 07_profit_per_provinsi.png
│   │   └── 08_tren_nett_sales_bulanan.png
│   │
│   └── 04-dashboard/
│       └── dashboard-looker-studio.png
│
├── README.md
│
└── sql/
    └── README.md
```

### Keterangan Dokumentasi

File yang memiliki **dua screenshot dengan topik yang sama** digunakan untuk memisahkan antara **proses/query yang dijalankan** dan **hasil/output analisis**. Hal ini dilakukan agar proses analisis dapat ditelusuri dengan lebih jelas.

Sedangkan file yang hanya memiliki **satu screenshot** berarti screenshot tersebut sudah mencakup hasil atau bukti yang diperlukan untuk tahap tersebut.

Contoh:

* `02_join_final_data.png` dan `02_join_final_data_query1.png` → dokumentasi proses **query/join** dan hasilnya.
* `06_top_10_produk.png` dan `06_top_10_produk_query.png` → dokumentasi **query analisis** dan hasil top 10 produk.
* File lain yang hanya memiliki satu screenshot → sudah mewakili hasil analisis pada tahap tersebut.
