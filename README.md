```plaintext
1. -DESKRIPSI APLIKASI-
    Quiz AR App adalah aplikasi quiz interaktif berbasis Flutter untuk menguji pemahaman Flutter dan Dart.
    Aplikasi ini memiliki tampilan modern dengan fitur jawaban, timer, dan skor otomatis.

2. -DASAR TEORI-
    Flutter adalah framework untuk pengembangan aplikasi mobile yang menggunakan bahasa Dart.
    Flutter menerapkan konsep widget-based UI, di mana seluruh tampilan dibangun menggunakan widget.
    Terdapat dua jenis widget utama:
    StatelessWidget → digunakan untuk tampilan statis
    StatefulWidget → digunakan untuk tampilan dinamis
    Konsep ini memungkinkan aplikasi menjadi modular, rapi, dan mudah dikembangkan.

3. -STRUKTUR PROJECT-
QUIZ_AR_APP_PRAK2/
│
├── assets/
│   ├── questions.json
│   └── welcome.png
│
├── lib/
│   ├── main.dart
│   │
│   ├── models/
│   │   └── question_model.dart
│   │
│   ├── services/
│   │   └── question_service.dart
│   │
│   └── pages/
│       ├── welcome_page.dart
│       ├── stateless_page.dart
│       ├── stateful_page.dart
│       ├── result_page.dart
│       └── about_page.dart
│
├── pubspec.yaml
├── pubspec.lock
└── README.md

    Penjelasan:
    pages → berisi seluruh halaman aplikasi
    models → struktur data soal
    services → pengambilan data JSON
    assets → menyimpan file gambar dan soal

4. -FITUR APLIKASI-
    Quiz interaktif
    Soal ditampilkan secara acak
    Timer setiap soal
    Progress bar
    Perhitungan skor otomatis
    Tampilan UI modern
    Navigasi antar halaman

5. -NAVIGASI ANTAR HALAMAN-
    Aplikasi memiliki alur navigasi sebagai berikut:
    Welcome Page → Home (Stateless Page)
    Home → About Page
    Home → Quiz (Stateful Page)
    Quiz → Result Page
    Result → Home
    Navigasi ini menunjukkan bahwa aplikasi berjalan secara terstruktur dan memenuhi ketentuan praktikum.

6. -HALAMAN APLIKASI-
    a. Welcome Page
       Halaman awal aplikasi yang berisi tampilan pembuka dan tombol “Get Started”.

    b. Stateless Page
       Halaman utama yang bersifat statis, menampilkan informasi aplikasi dan tombol menuju quiz.

    c. Stateful Page
       Halaman quiz dinamis yang menggunakan setState() dengan interaksi menjawab soal, timer, dan skor..
    
    d. Result Page
       Halaman hasil yang menampilkan skor dan persentase nilai setelah quiz selesai.

    e. About Page
       Halaman yang berisi informasi mengenai aplikasi, fitur, teknologi, dan tujuan aplikasi.

7. -WIDGET PADA STATELESS PAGE-
    a. Scaffold
       Widget ini sebagai kerangka utama halaman yang menampung AppBar, Drawer, dan body untuk menyusun struktur tampilan.

    b. AppBar
       Widget ini bekerja sebagai header di bagian atas halaman sehingga digunakan untuk menampilkan judul aplikasi.

    c. Drawer
       Widget ini bekerja sebagai panel navigasi samping yang muncul dari kiri sehingga digunakan untuk berpindah halaman.

    d. ListView
       Widget ini menyusun daftar secara vertikal dan dapat discroll untuk menampilkan menu drawer.

    e. DrawerHeader
       Widget ini bekerja sebagai bagian atas drawer sehingga digunakan untuk menampilkan identitas aplikasi.

    f. ListTile
       Widget ini bekerja sebagai item menu yang dapat ditekan sehingga digunakan untuk navigasi.

    g. Icon
       Widget ini bekerja menampilkan simbol visual sehingga digunakan untuk memperjelas menu dan fitur.

    h. SafeArea
       Widget ini bekerja menjaga konten agar tidak tertutup sistem sehingga digunakan agar tampilan aman di semua perangkat.

    i. Padding
       Widget ini bekerja memberi jarak di sekitar widget sehingga digunakan agar tampilan tidak terlalu rapat.

    j. Column
       Widget ini bekerja menyusun widget secara vertikal sehingga digunakan untuk layout utama halaman.

    k. Text
       Widget ini bekerja menampilkan teks sehingga digunakan untuk judul dan deskripsi aplikasi.

    l. SizedBox
       Widget ini bekerja memberi ruang kosong dengan ukuran tertentu sehingga digunakan untuk jarak antar elemen.

    m. Container
       Widget ini sebagai pembungkus dengan dekorasi untuk membuat tampilan seperti kartu informasi.

    n. Row
       Widget ini bekerja menyusun widget secara horizontal sehingga digunakan untuk menampilkan fitur aplikasi.

    o. Expanded
       Widget ini bekerja mengisi ruang kosong dalam Row sehingga digunakan agar ukuran elemen seimbang.

    p. ElevatedButton
       Widget ini bekerja sebagai tombol interaktif sehingga digunakan untuk navigasi ke halaman quiz.

    q. Spacer
       Widget ini bekerja mengisi ruang kosong fleksibel sehingga digunakan untuk mendorong posisi tombol ke bawah.

    r. TweenAnimationBuilder
       Widget ini bekerja membuat animasi perubahan nilai sehingga digunakan untuk efek muncul teks.

    s. Opacity
       Widget ini bekerja mengatur transparansi sehingga digunakan untuk efek fade in.

    t. Transform
       Widget ini bekerja mengubah posisi widget sehingga digunakan untuk animasi pergeseran.

8. -WIDGET PADA STATEFUL PAGE-
    a. Scaffold
       Widget ini bekerja sebagai kerangka utama halaman quiz sehingga digunakan untuk menyusun struktur tampilan.

    b. AppBar
       Widget ini bekerja sebagai header halaman sehingga digunakan untuk menampilkan judul quiz.

    c. Center
       Widget ini bekerja menempatkan widget di tengah layar sehingga digunakan untuk tampilan loading.

    d. CircularProgressIndicator
       Widget ini bekerja menampilkan loading berbentuk lingkaran sehingga digunakan saat data belum dimuat.

    e. Padding
       Widget ini bekerja memberi jarak pada konten sehingga digunakan agar tampilan lebih rapi.

    f. Column
       Widget ini bekerja menyusun widget secara vertikal sehingga digunakan untuk layout halaman quiz.

    g. LinearProgressIndicator
       Widget ini bekerja menampilkan progress dalam bentuk garis sehingga digunakan untuk progress soal dan timer.

    h. SizedBox
       Widget ini bekerja memberi ruang kosong sehingga digunakan untuk jarak antar elemen.

    i. Stack
       Widget ini bekerja menumpuk beberapa widget sehingga digunakan untuk tampilan timer.

    j. ClipRRect
       Widget ini bekerja membuat sudut membulat sehingga digunakan untuk memperhalus progress bar.

    k. Positioned
       Widget ini bekerja mengatur posisi widget dalam Stack sehingga digunakan untuk teks timer.
 
    l. Text
       Widget ini bekerja menampilkan teks sehingga digunakan untuk soal, hasil, dan skor.

    m. Container
       Widget ini bekerja sebagai pembungkus dengan dekorasi sehingga digunakan untuk soal dan pilihan jawaban.

    n. GestureDetector
       Widget ini bekerja mendeteksi sentuhan pengguna sehingga digunakan untuk memilih jawaban.

    o. AnimatedScale
       Widget ini bekerja memberi animasi perubahan ukuran sehingga digunakan saat memilih jawaban.

    p. Row
       Widget ini bekerja menyusun widget secara horizontal sehingga digunakan untuk opsi jawaban.

    q. Expanded
       Widget ini bekerja mengisi ruang kosong sehingga digunakan agar teks jawaban proporsional.

    r. Icon
       Widget ini bekerja menampilkan simbol sehingga digunakan untuk indikator benar atau salah.

    s. ElevatedButton
       Widget ini bekerja sebagai tombol interaktif sehingga digunakan untuk tombol Next.

9. -SUMBER DATA (JSON)-
   Data soal disimpan dalam file: assets/questions.json
   Struktur data:
    - questionVariants → variasi soal
    - correctAnswer → jawaban benar
    - wrongAnswers → jawaban salah
   Penggunaan JSON membuat data lebih fleksibel dan mudah dikelola.

10. -MODEL DATA-
    File:
    models/question_model.dart
    Digunakan untuk:
     - Merepresentasikan data soal
     - Mengubah JSON menjadi object Dart

11. -SERVICE DATA-
    File: services/question_service.dart
    Digunakan untuk:
     -  Membaca file JSON dari assets
     -  Mengubah data menjadi list soal

12. -IMPLEMENTASI UI-
    Aplikasi menggunakan:
    Material Design
    Warna konsisten
    Layout Column dan Row
    Animasi sederhana
    Hal ini membuat tampilan aplikasi lebih modern dan user-friendly.
