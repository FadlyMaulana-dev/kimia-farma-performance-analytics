# Hasil Analisis

Folder ini berisi dokumentasi hasil analisis dari Project-Based Internship:

> **Analisis Kinerja Bisnis Kimia Farma Tahun 2020–2023 (Performance Analytics)**

Analisis dilakukan menggunakan **Google BigQuery** sebagai media pengolahan data dan **Looker Studio** sebagai media visualisasi dashboard.

---

## 1. Ringkasan Proyek

Proyek ini bertujuan untuk menganalisis kinerja bisnis Kimia Farma berdasarkan data transaksi, produk, persediaan, dan kantor cabang selama periode **2020–2023**.

Analisis dilakukan dengan menggabungkan beberapa sumber data agar dapat menghasilkan informasi mengenai:

* perkembangan transaksi dari tahun ke tahun;
* perkembangan nett sales;
* rata-rata nilai penjualan;
* distribusi transaksi berdasarkan provinsi;
* gross profit berdasarkan kategori harga produk;
* profit berdasarkan provinsi;
* rating cabang dan transaksi;
* serta indikator kinerja lainnya yang divisualisasikan dalam dashboard.

---

# 2. Dataset yang Digunakan

Analisis menggunakan empat dataset utama:

| Dataset                | Keterangan                                                                             |
| ---------------------- | -------------------------------------------------------------------------------------- |
| `kf_final_transaction` | Data transaksi pelanggan, tanggal transaksi, cabang, produk, harga, diskon, dan rating |
| `kf_inventory`         | Data persediaan/stok produk pada setiap cabang                                         |
| `kf_kantor_cabang`     | Data cabang, kategori cabang, kota, provinsi, dan rating cabang                        |
| `kf_product`           | Data produk, kategori produk, dan harga produk                                         |

Keempat dataset tersebut digunakan sebagai dasar proses **join dan validasi data** sebelum dilakukan analisis lebih lanjut.

---

# 3. Validasi dan Integrasi Data

Data dari beberapa tabel digabungkan untuk menghasilkan dataset analisis yang dapat digunakan pada tahap berikutnya.

Hasil validasi menunjukkan:

* **Total data hasil join:** 672.458 baris
* **Total transaksi:** 672.458
* **Transaksi unik:** 672.458
* **Periode data:** 1 Januari 2020 – 30 Desember 2023

Validasi juga dilakukan terhadap informasi produk dan cabang.

| Field yang Divalidasi | Jumlah NULL |
| --------------------- | ----------: |
| `product_name`        |           0 |
| `category`            |           0 |
| `branch_name`         |           0 |
| `kota`                |           0 |
| `provinsi`            |           0 |

Hasil tersebut menunjukkan bahwa data yang digunakan untuk analisis utama tidak memiliki nilai NULL pada atribut penting yang berasal dari tabel produk dan kantor cabang.

Dataset hasil pengolahan kemudian digunakan sebagai dasar pembuatan tabel analisis:

`kf_analisis_transaksi`

---

# 4. Contoh Hasil Perhitungan

Salah satu transaksi digunakan untuk melakukan pengecekan hasil pengolahan data.

Contoh:

| Atribut        | Nilai            |
| -------------- | ---------------- |
| Transaction ID | `TRX7894145`     |
| Tanggal        | 22 November 2020 |
| Branch ID      | `11079`          |
| Product ID     | `KF723`          |
| Actual Price   | Rp739.100        |
| Discount       | 14%              |
| Nett Sales     | Rp635.626        |

Pengecekan ini dilakukan untuk memastikan bahwa proses perhitungan harga setelah diskon menghasilkan nilai yang sesuai.

---

# 5. Challenge 1 — Analisis Tren Penjualan

## Tujuan

Challenge 1 digunakan untuk melihat perkembangan kinerja penjualan Kimia Farma selama periode 2020–2023.

Indikator utama yang dianalisis:

* jumlah transaksi;
* nett sales;
* rata-rata nilai transaksi/penjualan;
* pertumbuhan penjualan;
* distribusi transaksi berdasarkan provinsi.

---

## 5.1 Kinerja Penjualan Tahunan

Hasil agregasi berdasarkan tahun:

| Tahun | Total Transaksi | Nett Sales |    Rata-rata |
| ----- | --------------: | ---------: | -----------: |
| 2020  |         168.651 |  Rp80,44 M | Rp476.947,10 |
| 2021  |         167.697 |  Rp80,04 M | Rp477.276,56 |
| 2022  |         168.642 |  Rp80,58 M | Rp477.807,70 |
| 2023  |         167.468 |  Rp80,12 M | Rp478.403,59 |

### Pertumbuhan Nett Sales

| Periode | Pertumbuhan |
| ------- | ----------: |
| 2021    |      -0,50% |
| 2022    |      +0,68% |
| 2023    |      -0,57% |

### Interpretasi

Secara umum, nett sales Kimia Farma selama periode 2020–2023 berada pada kisaran **Rp80 miliar per tahun**.

Pergerakan penjualan relatif stabil. Terdapat penurunan pada 2021, kemudian sedikit peningkatan pada 2022, dan kembali mengalami penurunan pada 2023.

Walaupun total transaksi mengalami perubahan setiap tahun, **rata-rata nilai penjualan menunjukkan peningkatan secara bertahap**, dari sekitar Rp476.947 pada 2020 menjadi sekitar Rp478.404 pada 2023.

Hal ini menunjukkan bahwa nilai rata-rata transaksi relatif terjaga meskipun jumlah transaksi tahunan mengalami perubahan.

---

# 6. Analisis Berdasarkan Provinsi

Analisis berikutnya dilakukan untuk mengetahui wilayah dengan jumlah transaksi tertinggi.

### Provinsi dengan Transaksi Tertinggi

| Peringkat | Provinsi       | Total Transaksi |
| --------- | -------------- | --------------: |
| 1         | Jawa Barat     |         198.723 |
| 2         | Sumatera Utara |          48.178 |
| 3         | Jawa Tengah    |          46.494 |

### Interpretasi

**Jawa Barat** menjadi provinsi dengan jumlah transaksi tertinggi dalam dataset, dengan **198.723 transaksi**.

Posisi berikutnya adalah **Sumatera Utara** dan **Jawa Tengah**.

Hasil ini dapat digunakan sebagai dasar untuk melihat wilayah yang memiliki aktivitas transaksi paling tinggi dan menjadi salah satu pertimbangan dalam evaluasi kinerja cabang berdasarkan wilayah.

---

# 7. Challenge 2 — Analisis Profitabilitas

## Tujuan

Challenge 2 berfokus pada analisis profitabilitas berdasarkan kategori harga produk dan wilayah.

Analisis ini digunakan untuk melihat bagaimana tingkat gross profit ditentukan berdasarkan kelompok harga produk serta wilayah yang memberikan kontribusi profit terbesar.

---

# 8. Gross Profit Berdasarkan Kategori Harga

Kategori harga yang digunakan:

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

# 9. Profit Berdasarkan Provinsi

Analisis profit berdasarkan provinsi menghasilkan tiga wilayah dengan profit tertinggi:

| Peringkat | Provinsi       | Nett Profit |
| --------- | -------------- | ----------: |
| 1         | Jawa Barat     |   Rp26,94 M |
| 2         | Sumatera Utara |    Rp6,52 M |
| 3         | Jawa Tengah    |    Rp6,32 M |

### Interpretasi

Jawa Barat menjadi wilayah dengan kontribusi profit terbesar, yaitu sekitar **Rp26,94 miliar**.

Posisi berikutnya ditempati oleh Sumatera Utara dan Jawa Tengah.

Hasil ini menunjukkan bahwa Jawa Barat tidak hanya memiliki jumlah transaksi tertinggi, tetapi juga memberikan kontribusi profit yang paling besar dibandingkan provinsi lainnya dalam hasil analisis.

---

# 10. Dashboard Looker Studio

Hasil pengolahan dan analisis kemudian divisualisasikan menggunakan **Looker Studio**.

Dashboard dibuat untuk memberikan gambaran kinerja bisnis secara lebih mudah dipahami tanpa harus membaca hasil query SQL secara langsung.

### Informasi yang ditampilkan dalam dashboard

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

Sumber data utama dashboard menggunakan tabel:

`kf_analisis_transaksi`

---

# 11. Kesimpulan Analisis

Berdasarkan hasil analisis yang telah dilakukan, terdapat beberapa temuan utama:

1. **Kinerja nett sales relatif stabil** selama periode 2020–2023 dengan nilai sekitar Rp80 miliar per tahun.

2. **Jumlah transaksi mengalami fluktuasi**, tetapi rata-rata nilai penjualan menunjukkan peningkatan secara bertahap dari 2020 hingga 2023.

3. **Jawa Barat menjadi wilayah dengan aktivitas transaksi tertinggi**, dengan 198.723 transaksi.

4. **Jawa Barat juga menjadi provinsi dengan nett profit terbesar**, yaitu sekitar Rp26,94 miliar.

5. **Kategori harga > Rp500.000 memiliki persentase gross profit tertinggi**, yaitu 30%, dan memiliki jumlah transaksi terbesar dalam hasil analisis.

6. Hasil analisis kemudian divisualisasikan melalui **Looker Studio** untuk mempermudah pemantauan indikator kinerja bisnis.

---

# 12. Tools yang Digunakan

| Tools           | Penggunaan                                             |
| --------------- | ------------------------------------------------------ |
| Google BigQuery | Penyimpanan, penggabungan, validasi, dan analisis data |
| SQL             | Query pengolahan dan analisis data                     |
| Looker Studio   | Pembuatan dashboard dan visualisasi                    |
| GitHub          | Dokumentasi dan penyimpanan project                    |

---

# 13. Struktur Project

```text
kimia-farma-performance-analytics/
│
├── README.md
│
├── sql/
│   ├── ...
│   └── ...
│
└── hasil-analisis/
    └── README.md
```

Folder `sql/` digunakan untuk menyimpan query yang digunakan selama proses pengolahan dan analisis data.

Folder `hasil-analisis/` digunakan untuk menyimpan dokumentasi hasil analisis dan hasil visualisasi.

---

## Status Project

**Project-Based Internship — Performance Analytics**

**Status:** Analisis dan dashboard telah dikerjakan.

**Periode data:** 2020–2023

**Platform analisis:** Google BigQuery

**Platform visualisasi:** Looker Studio

