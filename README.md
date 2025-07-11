# 🍽️ DapurKita

**DapurKita** adalah aplikasi mobile berbasis Flutter yang menampilkan berbagai resep masakan secara real-time. Aplikasi ini menggunakan API publik [TheMealDB](https://www.themealdb.com/) untuk mengambil data.

---

## 🎯 Fitur Aplikasi

- Tampilan splash screen otomatis masuk ke halaman utama
- Halaman utama menampilkan daftar resep berdasarkan kategori
- Halaman detail resep menampilkan gambar, deskripsi, dan bahan-bahan
- Navigasi antar halaman
- Desain responsif dengan Material Design

---

## 🛠️ Widget yang Digunakan

1. `MaterialApp` – untuk inisialisasi aplikasi
2. `Scaffold` – sebagai kerangka layout setiap halaman
3. `AppBar` – untuk menampilkan judul halaman
4. `FutureBuilder` – untuk mengambil data dari API secara asynchronous
5. `ListView.builder` – untuk menampilkan daftar resep
6. `Card` – menampilkan setiap resep dalam bentuk kotak
7. `Image.network` – untuk menampilkan gambar dari URL
8. `Text` – menampilkan nama makanan dan deskripsi
9. `ElevatedButton` – untuk tombol navigasi ke detail resep
10. `SingleChildScrollView` – agar halaman detail bisa di-scroll
11. `Navigator` + `MaterialPageRoute` – untuk pindah halaman

---

## 🔧 Teknologi yang Digunakan

- Flutter + Dart
- HTTP Package
- REST API (TheMealDB)
- Android Studio

---

## 🌐 API yang Digunakan

- List resep berdasarkan kategori:
https://www.themealdb.com/api/json/v1/1/filter.php?c=Chicken


- Detail resep berdasarkan ID:
https://www.themealdb.com/api/json/v1/1/lookup.php?i=MealID


---

## 🚀 Cara Menjalankan

1. Clone repo:
git clone https://github.com/linggapras/DapurK.git
cd DapurK
flutter pub get
flutter run


---

## 📂 Struktur Folder Singkat

lib/
├── main.dart
├── model/
│   ├── meal_model.dart
│   └── meal_detail_model.dart
├── services/
│   └── api_service.dart
├── widget/
│   ├── home_page.dart
│   └── detail_page.dart

