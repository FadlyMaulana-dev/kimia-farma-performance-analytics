# Hasil Analisis

Folder ini berisi dokumentasi hasil analisis dari Project-Based Internship:

> **Analisis Kinerja Bisnis Kimia Farma Tahun 2020–2023 (Performance Analytics)**

Analisis dilakukan menggunakan **Google BigQuery** sebagai media pengolahan dan analisis data serta **Looker Studio** sebagai media visualisasi dashboard.

---

## 1. Ringkasan Proyek

Proyek ini bertujuan untuk menganalisis kinerja bisnis Kimia Farma berdasarkan data transaksi, produk, persediaan, dan kantor cabang selama periode **2020–2023**.

Beberapa aspek yang dianalisis meliputi:

* perkembangan jumlah transaksi dari tahun ke tahun;
* perkembangan nett sales;
* rata-rata nilai penjualan;
* pertumbuhan nett sales;
* distribusi transaksi berdasarkan provinsi;
* gross profit berdasarkan kategori harga produk;
* profit berdasarkan provinsi;
* hubungan rating cabang dengan aktivitas transaksi;
* tren penjualan berdasarkan periode;
* serta indikator kinerja lainnya yang divisualisasikan melalui dashboard.

---

# 2. Dataset yang Digunakan

Analisis menggunakan empat dataset utama:

| Dataset                | Keterangan                                                                                       |
| ---------------------- | ------------------------------------------------------------------------------------------------ |
| `kf_final_transaction` | Data transaksi pelanggan, tanggal transaksi, cabang, produk, harga, diskon, dan rating transaksi |
| `kf_inventory`         | Data persediaan/stok produk pada setiap cabang                                                   |
| `kf_kantor_cabang`     | Data cabang, kategori cabang, kota, provinsi, dan rating cabang                                  |
| `kf_product`           | Data produk, kategori produk, dan harga produk                                                   |

Keempat dataset tersebut digunakan sebagai dasar proses **integrasi, join, validasi, dan analisis data**.

---

# 3. Validasi dan Integrasi Data

Sebelum dilakukan analisis, data dari beberapa tabel digabungkan untuk menghasilkan dataset yang dapat digunakan sebagai dasar analisis.

Proses integrasi dilakukan dengan menghubungkan data transaksi dengan informasi produk dan kantor cabang.

Hasil validasi menunjukkan:

* **Total data hasil join:** 672.458 baris
* **Total transaksi:** 672.458
* **Transaksi unik:** 672.458
* **Periode data:** 1 Januari 2020 – 30 Desember 2023

### Validasi Data

Validasi juga dilakukan terhadap beberapa atribut penting dari data produk dan kantor cabang.

| Field yang Divalidasi | Jumlah NULL |
| --------------------- | ----------: |
| `product_name`        |           0 |
| `category`            |           0 |
| `branch_name`         |           0 |
| `kota`                |           0 |
| `provinsi`            |           0 |

Tidak ditemukan nilai `NULL` pada atribut penting tersebut sehingga data dapat digunakan untuk proses analisis berikutnya.

Dataset hasil pengolahan kemudian digunakan sebagai dasar pembuatan tabel:

`kf_analisis_transaksi`

Dokumentasi proses validasi dan integrasi data dapat dilihat pada folder:

`01-validasi-data/`

---

# 4. Contoh Validasi Hasil Perhitungan

Salah satu transaksi digunakan untuk melakukan pengecekan terhadap hasil pengolahan dan perhitungan nett sales.

Contoh transaksi:

| Atribut        | Nilai            |
| -------------- | ---------------- |
| Transaction ID | `TRX7894145`     |
| Tanggal        | 22 November 2020 |
| Branch ID      | `11079`          |
| Product ID     | `KF723`          |
| Actual Price   | Rp739.100        |
| Discount       | 14%              |
| Nett Sales     | Rp635.626        |

Nilai nett sales diperoleh dari harga aktual setelah dikurangi diskon.

Pengecekan ini dilakukan untuk memastikan bahwa proses perhitungan harga setelah diskon menghasilkan nilai yang sesuai.

---

# 5. Challenge 1 — Analisis Tren Penjualan

## Tujuan

Challenge 1 digunakan untuk mengetahui perkembangan kinerja penjualan Kimia Farma selama periode 2020–2023.

Indikator utama yang dianalisis meliputi:

* jumlah transaksi;
* nett sales;
* rata-rata nilai penjualan;
* pertumbuhan nett sales;
* transaksi berdasarkan cabang;
* transaksi berdasarkan produk;
* serta distribusi transaksi berdasarkan wilayah.

Dokumentasi hasil Challenge 1 dapat dilihat pada folder:

`02-challenge-1/`

---

## 5.1 Periode Transaksi

Data transaksi yang dianalisis mencakup periode:

**1 Januari 2020 – 30 Desember 2023**

Periode tersebut mencakup empat tahun data yang digunakan sebagai dasar analisis tren kinerja bisnis.

---

## 5.2 Perhitungan Nett Sales

Nett sales dihitung berdasarkan harga aktual setelah memperhitungkan persentase diskon.

Secara umum:

**Nett Sales = Actual Price × (1 − Discount Percentage)**

Perhitungan ini digunakan sebagai dasar untuk memperoleh nilai penjualan bersih pada setiap transaksi.

---

## 5.3 Kinerja Penjualan Tahunan

Hasil agregasi berdasarkan tahun adalah sebagai berikut:

| Tahun | Total Transaksi | Nett Sales | Rata-rata Nilai Penjualan |
| ----- | --------------: | ---------: | ------------------------: |
| 2020  |         168.651 |  Rp80,44 M |              Rp476.947,10 |
| 2021  |         167.697 |  Rp80,04 M |              Rp477.276,56 |
| 2022  |         168.642 |  Rp80,58 M |              Rp477.807,70 |
| 2023  |         167.468 |  Rp80,12 M |              Rp478.403,59 |

### Interpretasi

Nett sales Kimia Farma selama periode 2020–2023 berada pada kisaran **Rp80 miliar per tahun**.

Pergerakan penjualan relatif stabil. Pada 2021 terjadi penurunan dibandingkan tahun sebelumnya, kemudian meningkat pada 2022 dan kembali mengalami penurunan pada 2023.

Sementara itu, rata-rata nilai penjualan menunjukkan peningkatan secara bertahap dari sekitar **Rp476.947 pada 2020** menjadi sekitar **Rp478.404 pada 2023**.

Hal tersebut menunjukkan bahwa meskipun jumlah transaksi mengalami perubahan setiap tahun, rata-rata nilai penjualan per transaksi cenderung meningkat.

---

## 5.4 Pertumbuhan Nett Sales

Pertumbuhan nett sales dibandingkan tahun sebelumnya:

| Tahun | Pertumbuhan Nett Sales |
| ----- | ---------------------: |
| 2021  |                 -0,50% |
| 2022  |                 +0,68% |
| 2023  |                 -0,57% |

### Interpretasi

Pertumbuhan nett sales menunjukkan bahwa perubahan kinerja penjualan dari tahun ke tahun relatif kecil.

* **2021:** nett sales turun sekitar 0,50%.
* **2022:** nett sales meningkat sekitar 0,68%.
* **2023:** nett sales kembali turun sekitar 0,57%.

Dengan demikian, belum terlihat pertumbuhan penjualan yang konsisten secara tahunan dalam periode pengamatan.

---

## 5.5 Provinsi dengan Jumlah Transaksi Tertinggi

Hasil analisis menunjukkan tiga provinsi dengan jumlah transaksi tertinggi:

| Peringkat | Provinsi       | Total Transaksi |
| --------- | -------------- | --------------: |
| 1         | Jawa Barat     |         198.723 |
| 2         | Sumatera Utara |          48.178 |
| 3         | Jawa Tengah    |          46.494 |

### Interpretasi

**Jawa Barat** menjadi provinsi dengan jumlah transaksi tertinggi dalam dataset dengan total **198.723 transaksi**.

Posisi berikutnya ditempati oleh **Sumatera Utara** dan **Jawa Tengah**.

Informasi tersebut dapat digunakan untuk melihat wilayah dengan aktivitas transaksi paling tinggi serta menjadi salah satu bahan evaluasi kinerja berdasarkan wilayah.

---

## 5.6 Top 10 Cabang

Analisis juga dilakukan untuk mengetahui cabang dengan jumlah transaksi tertinggi.

Hasil ini digunakan untuk mengidentifikasi cabang yang memiliki aktivitas transaksi paling tinggi selama periode pengamatan.

Dokumentasi hasil analisis terdapat pada:

`02-challenge-1/05_top_10_cabang.png`

---

## 5.7 Top 10 Produk

Analisis berikutnya dilakukan untuk mengetahui produk dengan jumlah transaksi tertinggi.

Informasi ini digunakan untuk melihat produk yang memiliki tingkat permintaan paling tinggi berdasarkan jumlah transaksi.

Dokumentasi hasil analisis terdapat pada:

`02-challenge-1/06_top_10_produk.png`

---

# 6. Challenge 2 — Analisis Profitabilitas

## Tujuan

Challenge 2 berfokus pada analisis profitabilitas berdasarkan kategori harga produk dan wilayah.

Analisis dilakukan untuk mengetahui:

* persentase gross profit berdasarkan kategori harga;
* revenue selama periode 2020–2023;
* transaksi berdasarkan provinsi;
* nett sales berdasarkan provinsi;
* rating cabang dibandingkan dengan jumlah transaksi;
* profit berdasarkan provinsi;
* serta tren nett sales bulanan.

Dokumentasi hasil Challenge 2 dapat dilihat pada folder:

`03-challenge-2/`

---

# 7. Gross Profit Berdasarkan Kategori Harga

Persentase gross profit ditentukan berdasarkan kategori harga produk sebagai berikut:

| Kategori Harga          | Gross Profit |
| ----------------------- | -----------: |
| ≤ Rp50.000              |          10% |
| > Rp50.000 – Rp100.000  |          15% |
| > Rp100.000 – Rp300.000 |          20% |
| > Rp300.000 – Rp500.000 |          25% |
| > Rp500.000             |          30% |

### Interpretasi

Terdapat pola bahwa semakin tinggi kategori harga produk, semakin tinggi pula persentase gross profit yang digunakan.

Produk dengan harga **≤ Rp50.000** memiliki persentase gross profit sebesar **10%**, sedangkan produk dengan harga **> Rp500.000** memiliki persentase gross profit sebesar **30%**.

Kategori harga **> Rp500.000** juga memiliki jumlah transaksi terbesar dalam hasil analisis, yaitu **348.915 transaksi**.

---

# 8. Revenue Tahun 2020–2023

Analisis revenue dilakukan untuk melihat perkembangan nilai penjualan selama periode pengamatan.

Analisis ini digunakan sebagai salah satu indikator untuk melihat kondisi kinerja bisnis secara keseluruhan dari tahun ke tahun.

Dokumentasi hasil analisis terdapat pada:

`03-challenge-2/03_revenue_tahun_2020-2023.png`

---

# 9. Transaksi Berdasarkan Provinsi

Analisis distribusi transaksi berdasarkan provinsi digunakan untuk melihat wilayah dengan aktivitas transaksi paling tinggi.

Hasil analisis menunjukkan bahwa **Jawa Barat** memiliki jumlah transaksi tertinggi dibandingkan provinsi lainnya.

Dokumentasi hasil analisis terdapat pada:

`03-challenge-2/04_top_10_transaksi_provinsi.png`

---

# 10. Nett Sales Berdasarkan Provinsi

Analisis nett sales berdasarkan provinsi digunakan untuk mengetahui wilayah yang memberikan kontribusi penjualan terbesar.

Jawa Barat menjadi salah satu wilayah dengan kontribusi nett sales tertinggi dalam hasil analisis, sejalan dengan tingginya jumlah transaksi di wilayah tersebut.

Dokumentasi hasil analisis terdapat pada:

`03-challenge-2/05_top_10_nett_sales_provinsi.png`

---

# 11. Rating Cabang dan Aktivitas Transaksi

Analisis dilakukan dengan membandingkan **rating cabang** dengan jumlah transaksi untuk melihat distribusi aktivitas transaksi pada cabang dengan tingkat rating yang berbeda.

Analisis ini membantu memberikan gambaran mengenai hubungan antara penilaian cabang dan aktivitas transaksi dalam dataset.

Dokumentasi hasil analisis terdapat pada:

`03-challenge-2/06_top_5_rating_cabang_vs_transaksi.png`

---

# 12. Profit Berdasarkan Provinsi

Hasil analisis profit berdasarkan provinsi menunjukkan tiga wilayah dengan nett profit tertinggi:

| Peringkat | Provinsi       | Nett Profit |
| --------- | -------------- | ----------: |
| 1         | Jawa Barat     |   Rp26,94 M |
| 2         | Sumatera Utara |    Rp6,52 M |
| 3         | Jawa Tengah    |    Rp6,32 M |

### Interpretasi

**Jawa Barat** menjadi wilayah dengan kontribusi nett profit terbesar, yaitu sekitar **Rp26,94 miliar**.

Posisi berikutnya ditempati oleh **Sumatera Utara** dan **Jawa Tengah**.

Jawa Barat memiliki jumlah transaksi dan nett profit yang sama-sama tinggi sehingga menjadi wilayah dengan kontribusi paling besar dalam hasil analisis.

Dokumentasi hasil analisis terdapat pada:

`03-challenge-2/07_profit_per_provinsi.png`

---

# 13. Tren Nett Sales Bulanan

Analisis tren nett sales bulanan dilakukan untuk melihat perubahan penjualan secara lebih detail berdasarkan bulan selama periode 2020–2023.

Analisis ini membantu melihat pola naik-turun penjualan yang tidak terlihat apabila data hanya dibandingkan berdasarkan total tahunan.

Dokumentasi hasil analisis terdapat pada:

`03-challenge-2/08_tren_nett_sales_bulanan.png`

---

# 14. Dashboard Looker Studio

Hasil pengolahan dan analisis data kemudian divisualisasikan menggunakan **Looker Studio**.

Dashboard digunakan untuk menyajikan hasil analisis dalam bentuk indikator dan visualisasi sehingga informasi kinerja bisnis dapat dipahami dengan lebih mudah.

Sumber data utama dashboard menggunakan tabel:

`kf_analisis_transaksi`

### Informasi yang Divisualisasikan

Dashboard mencakup beberapa indikator utama:

* Total transaksi
* Nett sales
* Nett profit
* Persentase gross profit
* Rating cabang
* Rating transaksi
* Tren penjualan berdasarkan periode
* Penjualan berdasarkan provinsi
* Profit berdasarkan provinsi
* Analisis kategori harga

Dokumentasi dashboard akan ditempatkan pada folder:

`04-dashboard/`

---

# 15. Kesimpulan Analisis

Berdasarkan hasil pengolahan dan analisis data, diperoleh beberapa temuan utama:

1. **Nett sales relatif stabil** selama periode 2020–2023 dengan nilai sekitar Rp80 miliar per tahun.

2. **Jumlah transaksi mengalami fluktuasi** dari tahun ke tahun, sedangkan rata-rata nilai penjualan menunjukkan peningkatan secara bertahap.

3. **Pertumbuhan nett sales belum konsisten**, dengan penurunan pada 2021, peningkatan pada 2022, dan kembali mengalami penurunan pada 2023.

4. **Jawa Barat menjadi wilayah dengan jumlah transaksi tertinggi**, yaitu sebanyak 198.723 transaksi.

5. **Jawa Barat juga menjadi provinsi dengan nett profit terbesar**, yaitu sekitar Rp26,94 miliar.

6. **Kategori harga > Rp500.000 memiliki persentase gross profit tertinggi**, yaitu 30%, serta memiliki jumlah transaksi terbesar dalam hasil analisis.

7. Hasil analisis dari BigQuery kemudian digunakan sebagai dasar pembuatan **dashboard Looker Studio** untuk mempermudah pemantauan indikator kinerja bisnis.

---

# 16. Tools yang Digunakan

| Tools           | Penggunaan                                             |
| --------------- | ------------------------------------------------------ |
| Google BigQuery | Penyimpanan, penggabungan, validasi, dan analisis data |
| SQL             | Pengolahan dan analisis data                           |
| Looker Studio   | Pembuatan dashboard dan visualisasi                    |
| GitHub          | Dokumentasi dan penyimpanan project                    |

---

# 17. Struktur Project

Struktur dokumentasi hasil analisis dalam repository adalah sebagai berikut:

```text
Struktur Repository
kimia-farma-performance-analytics/
│
├── hasil-analisis/
│   │
│   ├── 01-validasi-data/
│   │   ├── 01_struktur_tabel_bigquery.png.png
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

Keterangan Folder

hasil-analisis/
Berisi dokumentasi hasil proses validasi data, analisis Challenge 1 dan Challenge 2, serta hasil akhir dashboard.

01-validasi-data/
Berisi bukti proses validasi struktur tabel, proses join, pengecekan jumlah data, dan pengecekan nilai NULL.

02-challenge-1/
Berisi hasil analisis periode transaksi, nett sales, kinerja tahunan, pertumbuhan penjualan, top cabang, dan top produk.

03-challenge-2/
Berisi hasil analisis laba, gross profit, revenue, performa provinsi, rating cabang, profit per provinsi, dan tren nett sales bulanan.

04-dashboard/
Berisi hasil akhir visualisasi analisis dalam bentuk dashboard Looker Studio.

sql/
Berisi dokumentasi query SQL yang digunakan dalam proses pengolahan dan analisis data.

README.md
Berisi penjelasan utama mengenai project, tujuan, tools, proses analisis, hasil, dan struktur repository.

---

# 18. Status Project

**Project-Based Internship — Performance Analytics**

**Status:** Analisis data telah dikerjakan dan dashboard Looker Studio sedang/dalam tahap dokumentasi.

**Periode data:** 2020–2023

**Platform analisis:** Google BigQuery

**Platform visualisasi:** Looker Studio

**Dokumentasi:** GitHub
