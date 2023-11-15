**Nama: Ghina Nabila Gunawan\
NPM: 2206825914\
Kelas: PBP-B\
Kode Asdos: ZYN**

## TUGAS 8
**Jelaskan perbedaan `Navigator.push` dan `Navigator.pushReplacement`:**

`- Navigator.push () :` Metode push digunakan untuk menambahkan rute lain ke atas tumpukan screen (stack) saat ini. Halaman baru ditampilkan di atas halaman sebelumnya.\
Contoh penggunaan: Digunakan ketika menambahkan halaman baru ke navigation stack, seperti saat mengarahkan user dari satu layar ke layar lain.

`- Navigator.pushReplacement() :` Metode pushReplacement digunakan untuk menimpa/mengganti rute yang sekarang ke rute lain. Halaman baru ditampilkan dengan menggantikan halaman sebelumnya.\
Contoh penggunaan: Digunakan ketika menggantikan halaman saat ini dengan halaman baru dan menghapus halaman sebelumnya dari navigation stack, digunakan ketika tidak ingin user dapat kembali ke halaman sebelumnya.

**Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya:**

`- Container:` Digunakan untuk mengelompokkan dan mengatur widget lain dengan memberikan batasan atau padding.\
Contoh penggunaan: Mengelilingi widget lain untuk memberikan margin atau layout.

`- Row dan Column:` Digunakan untuk menempatkan widget dalam baris atau kolom.\
Contoh penggunaan: Mengatur child widget secara vertikal atau horizontal.

`- ListView:` Digunakan untuk menampilkan daftar widget dalam scroll list.\
Contoh Penggunaan: Menampilkan daftar item yang dapat di-scroll.

`- Stack:` Digunakan untuk menempatkan widget di atas satu sama lain.\
Contoh Penggunaan: Menumpuk widget untuk efek overlapping.

**Elemen Input Form yang Digunakan:**

**1. TextFormField untuk Nama Item (`_name`):**
   - Digunakan untuk memasukkan nama item atau produk.
   - Tipe data yang digunakan yaitu `string`
   - Menggunakan TextFormField karena ini adalah basic text input elements yang mendukung penggunaan keyboard untuk memasukkan teks.

**2. TextFormField untuk Amount (`_amount`):**
   - Digunakan untuk memasukkan jumlah atau amount dari item.
   - Tipe data yang digunakan yaitu `integer`
   - Kembali menggunakan TextFormField karena ini cocok untuk memasukkan data numerik dan dapat memberikan validasi serta memudahkan penggunaan keyboard numerik.

**3. TextFormField untuk Price (`_price`):**
   - Digunakan untuk memasukkan harga atau price dari item.
   - Tipe data yang digunakan yaitu `integer`
   - Seperti sebelumnya, menggunakan TextFormField karena harga umumnya berupa nilai numerik dan elemen ini mendukung validasi dan input numerik.

**4. TextFormField untuk Description (`_description`):**
   - Digunakan untuk memasukkan deskripsi atau keterangan tambahan dari item.
   - Tipe data yang digunakan yaitu `string`
   - Sekali lagi, TextFormField dipilih karena dapat menangani input teks lebih lanjut dan memberikan area input yang lebih luas untuk deskripsi yang mungkin lebih panjang.

**Penerapan Clean Architecture pada Flutter:**

`1. Entities:`
- Entities adalah representasi dari objek bisnis atau aturan bisnis.
- Pada Flutter, ini dapat mencakup kelas-kelas Dart yang mewakili model-data inti atau entitas dalam aplikasi.

`2. Use Cases:`
- Use Cases merupakan logika bisnis yang tidak bergantung pada framework atau teknologi tertentu.
- Dalam Flutter, Use Cases dapat diimplementasikan sebagai kelas-kelas Dart yang mengandung operasi bisnis inti.

`Interface Adapters:`
- Interface Adapters menghubungkan Use Cases dengan Frameworks & Drivers.
- Dalam konteks Flutter, Interface Adapters dapat berupa presenters dan controllers yang bertanggung jawab untuk mengonversi data dari Use Cases menjadi sesuatu yang dapat ditampilkan di user interface (UI).

`Frameworks & Drivers:`
- Lapisan ini berisi implementasi teknis dan third party software, seperti GUI, database, atau API eksternal.
- Dalam Flutter, Frameworks & Drivers melibatkan kode Flutter dan paket-paket pub.

**Implementasi Step-by-Step:**

**1. Halaman Formulir Tambah Item Baru (`restaurantlist_form.dart`):**

*a. Memakai Minimal Tiga Elemen Input:*
   - Dalam class `_RestaurantFormPageState`, telah dibuat tiga elemen input yaitu `_name`, `_amount`, `_price` dan `_description` menggunakan TextFormField dengan tipe data yang sudah disesuaikan masing-masing.

*b. Tombol "Save":*
   - Tombol "Save" diimplementasikan menggunakan ElevatedButton di bagian paling bawah pada halaman form

*c. Validasi Setiap Elemen Input:*
   - Setiap elemen input divalidasi menggunakan properti `validator` pada masing-masing TextFormField.

**2. Mengarahkan Pengguna ke Halaman Form Tambah Item Baru:**
   - Menerapkan fungsi `navigateToRestaurantFormPage(BuildContext context)` yang menggunakan `Navigator.push` untuk mengarahkan pengguna dari halaman utama (`MyHomePage`) ke halaman form tambah item baru (`RestaurantFormPage`).

***3. Menampilkan Data dalam Pop-up**
   - Setelah tombol "Save" ditekan, data dimasukkan ke dalam `itemRepository.items` dan kemudian ditampilkan dalam sebuah AlertDialog menggunakan `showDialog`.

**4. Drawer pada Aplikasi:**
   - Drawer dibuat menggunakan class `LeftDrawer` di dalam file `left_drawer.dart`.
   - Dalam Drawer, terdapat tiga opsi: "Main Page", "Lihat Item", dan "Tambah Item" menggunakan ListTile.
   - Menavigasikan pengguna ke halaman utama atau halaman form tambah item baru menggunakan `Navigator.push` ketika salah satu opsi dipilih.

**## BONUS ##**

**1. Membuat Halaman Daftar Item (`item_list_page.dart`):**

*a. Buat Class untuk Item:*
   - Dalam `item_list_page.dart`, kita sudah memiliki class `Item`. Pastikan class ini sudah dengan benar.

*b. Buat Class untuk Menyimpan dan Mengelola Data Item:*
   - Gunakan `ItemRepository` untuk menyimpan dan mengelola data item. Pastikan item yang telah ditambahkan melalui halaman form dapat diakses dari sini.

*c. Buat Halaman Daftar Item (`ItemsListPage`):*
   - Tambahkan class `ItemsListPage` untuk menampilkan daftar item.

**2. Mengarahkan Pengguna ke Halaman Daftar Item:**

*a. Tambahkan Fungsi Navigasi di `menu.dart`:*
   - Pada `menu.dart`, pastikan fungsi `navigateToItemsListPage` sudah diimplementasikan dengan benar untuk menavigasikan pengguna ke halaman daftar item (`ItemsListPage`).

*b. Tambahkan Opsi di Drawer:*
   - Pastikan opsi "Lihat Item" pada drawer memanggil fungsi `navigateToItemsListPage` saat ditekan.

*c. Tambahkan Navigasi dari Halaman Utama:*
   - Pada `MyHomePage`, pastikan tombol "Lihat Item" menavigasikan pengguna ke halaman daftar item.

**3. Menampilkan Data pada Halaman Daftar Item:**
   - Pastikan `ItemsListPage` mengambil data dari `itemRepository.items` dan menampilkannya menggunakan `ListView.builder`, sesuai dengan yang sudah diimplementasikan.


## TUGAS 7
**Jelaskan apa yang dimaksud dengan `stateless widget` dan `stateful widget` dan jelaskan perbedaan dari keduanya?**
- `Stateless widget` adalah widget yang hanya bertugas untuk menampilkan sesuatu secara statis. Tanpa melakukan tracking perubahan data dari waktu ke waktu. Intinya, tampilan dari `stateless widget` akan seperti itu-itu saja dan tidak ada mekanisme untuk memantau state perubahan aplikasi.
- `Stateful Widget` merupakan widget yang dinamis. Ini berarti widget ini dapat merubah tampilannya sesuai response dari events yang dipicu baik dari interaksi user maupun adanya variabel atau nilai baru yang didapat. `Stateful widget` dapat mengubah atau mengupdate tampilan, menambah widget lainnya, mengubah nilai variabel, icon, warna dan masih banyak lagi.
- Terdapat perbedaan yang signifikan antara `stateless` dan `stateful widget`. Pada `stateless widget`, seluruh konfigurasi yang dimuat di dalamnya diinisiasikan sejak awal dan tidak dapat diubah, sehingga fungsi setState() tidak dapat digunakan dalam `stateless widget`. Oleh karena itu, `stateless widget` cocok kita gunakan ketika kita hanya perlu menampilkan data yang sifatnya statis atau tidak perlu adanya perubahan nilai. `Stateful widget` merupakan suatu widget yang sifatnya dinamis atau dapat berubah-ubah, kebalikan dari `stateless widget`. Oleh karena itu, `stateful widget` cocok kita gunakan ketika kita menampilkan data dari database yang sifatnya akan berubah-ubah atau data apapun yang sifatnya akan berubah dikemudian hari.

**Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya?**
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
4. Dalam file `main.dart` untuk class MyHomePage dan MyHomePageState, pindahkan ke file `menu.dart`. Kemudian tambahkan `import 'package:restaurant_list/menu.dart';`.
5. Pada file `main.dart` dibagian tema aplikasi yang mempunyai tipe `Material Color` ubah menjadi `(...Colors.pink),`. Lalu ubah `MyHomePage(title: 'Flutter Demo Home Page')` menjadi `MyHomePage()`.
6. Salah satu bentuk perubahan dari stateful menjadi stateless yang saya lakukan yaitu mengubah `({super.key, required this.title})` menjadi `({Key? key}) : super(key: key);`. Hapus `final String title;`. Hapus fungsi **State** yang ada dibawah bagian stateless widget.
7. Setelah itu saya menambahkan teks dan card untuk memperlihatkan barang yang dijual dengan cara sebagai berikut:
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