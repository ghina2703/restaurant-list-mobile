**Nama: Ghina Nabila Gunawan\
NPM: 2206825914\
Kelas: PBP-B**

## TUGAS 7
*Jelaskan apa yang dimaksud dengan `stateless widget` dan `stateful widget` dan jelaskan perbedaan dari keduanya?*
- `Stateless widget` adalah widget yang hanya bertugas untuk menampilkan sesuatu secara statis. Tanpa melakukan tracking perubahan data dari waktu ke waktu. Intinya, tampilan dari `stateless widget` akan seperti itu-itu saja dan tidak ada mekanisme untuk memantau state perubahan aplikasi.
- `Stateful Widget` merupakan widget yang dinamis. Ini berarti widget ini dapat merubah tampilannya sesuai response dari events yang dipicu baik dari interaksi user maupun adanya variabel atau nilai baru yang didapat. `Stateful widget` dapat mengubah atau mengupdate tampilan, menambah widget lainnya, mengubah nilai variabel, icon, warna dan masih banyak lagi.
- Terdapat perbedaan yang signifikan antara stateless dan `stateful widget`. Pada `stateless widget`, seluruh konfigurasi yang dimuat di dalamnya diinisiasikan sejak awal dan tidak dapat diubah, sehingga fungsi setState() tidak dapat digunakan dalam `stateless widget`. Oleh karena itu, `stateless widget` cocok kita gunakan ketika kita hanya perlu menampilkan data yang sifatnya statis atau tidak perlu adanya perubahan nilai. `Stateful widget` merupakan suatu widget yang sifatnya dinamis atau dapat berubah-ubah, kebalikan dari `stateless widget`. Oleh karena itu, `stateful widget` cocok kita gunakan ketika kita menampilkan data dari database yang sifatnya akan berubah-ubah atau data apapun yang sifatnya akan berubah dikemudian hari.

*Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya?*
- `MyApp` (main.dart): Ini adalah root widget dari aplikasi Flutter. Ini adalah widget yang pertama kali dijalankan saat aplikasi dimulai. Dalam tugas ini, MyApp dibuat menjadi `StatelessWidget`.
- `MyHomePage` (menu.dart): Ini adalah widget yang mewakili halaman utama aplikasi. Ini adalah widget stateless yang berisi menu utama dan daftar item yang akan ditampilkan. Widget ini menggunakan Scaffold untuk mengatur tata letak, AppBar, dan GridView untuk menampilkan item menu.
- `RestaurantItem`: Ini adalah kelas untuk merepresentasikan item-menu. Ini memiliki tiga properti: name (nama item), icon (ikon item), dan color (warna tombol).
- `items`: Ini adalah daftar item-menu yang diisi dengan instance dari RestaurantItem. Daftar ini digunakan untuk mengisi daftar item yang ditampilkan dalam GridView.
- `RestaurantCard`: Ini adalah widget yang digunakan untuk menampilkan setiap item-menu dalam GridView. Widget ini adalah stateless dan menerima instance RestaurantItem sebagai parameter. Ini menggunakan Material untuk mengatur warna latar belakang dan InkWell untuk menambahkan efek respons jika di klik. Selain itu, widget ini menggunakan Icon dan Text untuk menampilkan ikon dan teks yang sesuai.
- `SingleChildScrollView`: Ini adalah widget yang digunakan agar kita bisa scroll jika kontennya lebih panjang dari layar.
- `GridView.count`: Digunakan untuk membuat grid layout dengan jumlah kolom yang ditentukan (dalam tugas ini, 3 kolom). 

**Implementasi Step-by-Step + BONUS:**
1. Membuat proyek baru dengan cara menjalankan "flutter create restaurant_list" di `cmd`.
2. Mengubah judul hompage menjadi "Restaurant List" di `main.dart` pada direktori `restaurant_list/lib`.
3. Buat file baru dengan nama `menu.dart` pada direktori `restaurant_list/lib`, kemudian tambahkan `import 'package:flutter/material.dart';`.
4. Dalam file `main.dart` untuk class MyHomePage dan MyHomePageState, pindahkan ke file `menu.dart`. Kemudian tambahkan `import 'package:shopping_list/menu.dart';`.
5. Pada file `main.dart` dibagian tema aplikasi yang mempunyai tipe `Material Color` ubah menjadi `(...Colors.pink),`. Lalu ubah `MyHomePage(title: 'Flutter Demo Home Page')` menjadi `MyHomePage()`.
6. Salah satu bentuk perubahan dari stateful menjadi stateless yang saya lakukan yaitu mengubah `({super.key, required this.title})` menjadi `({Key? key}) : super(key: key);` . Hapus `final String title;` . Hapus fungsi **State** yang ada dibawah bagian stateless widget
7. Setelah itu saya menambahkan teks dan card untuk memperlihatkan barang yang dijual.
- Membuat kelas RestaurantItem untuk merepresentasikan item yang dijual. 
- Buat daftar item yang dijual dengan mengisi instance dari RestaurantItem.
- Dalam widget MyHomePage, gunakan GridView.count untuk menampilkan item di dalam Scaffold.
- Buat widget RestaurantCard yang berisi tampilan item di dalam GridView.
- Untuk mengimplementasikan warna yang berbeda di tiap tombol, saya menambahkan properti color di dalam class RestaurantItem.

# restaurant_list

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
