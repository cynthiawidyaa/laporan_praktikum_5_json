import 'dart:convert'; // Mengimpor pustaka dart:convert untuk pengolahan JSON

void main() {
  // Definisi string JSON sebagai variabel jsonString yang berisikan mahasiswa dengan mata kuliahnya
  String jsonString = ''' 
  {
    "nama": "Cynthia Widya",
    "nim": "22082010045",
    "fakultas": "Fakultas Ilmu Komputer",
    "program_studi": "Sistem Informasi",
    "universitas": "Universitas Pembangunan Nasional 'Veteran' Jawa Timur",
    "mata_kuliah": [ 
      {"kode": "MK101", "nama": "Pengetahuan Bisnis", "sks": 3, "nilai_uts": 85, "nilai_uas": 90, "nilai_akhir": "A"},
      {"kode": "MK102", "nama": "Statistika Komputasi", "sks": 3, "nilai_uts": 80, "nilai_uas": 85, "nilai_akhir": "A"},
      {"kode": "MK103", "nama": "Bahasa Pemrograman", "sks": 3, "nilai_uts": 75, "nilai_uas": 85, "nilai_akhir": "A-"},
      {"kode": "MK104", "nama": "Manajemen Sistem Informasi", "sks": 3, "nilai_uts": 85, "nilai_uas": 90, "nilai_akhir": "A"},
      {"kode": "MK105", "nama": "Basis Data", "sks": 3, "nilai_uts": 80, "nilai_uas": 85, "nilai_akhir": "A-"},
      {"kode": "MK106", "nama": "Logika dan Algoritma", "sks": 2, "nilai_uts": 75, "nilai_uas": 80, "nilai_akhir": "A"},
      {"kode": "MK107", "nama": "Matematika Komputasi", "sks": 3, "nilai_uts": 80, "nilai_uas": 85, "nilai_akhir": "A-"},
      {"kode": "MK108", "nama": "Pemrograman Mobile", "sks": 3, "nilai_uts": 85, "nilai_uas": 90, "nilai_akhir": "A"},
      {"kode": "MK109", "nama": "Bahasa Pemrograman 2", "sks": 3, "nilai_uts": 85, "nilai_uas": 90, "nilai_akhir": "A"},
      {"kode": "MK110", "nama": "Pemrograman Dekstop", "sks": 2, "nilai_uts": 80, "nilai_uas": 85, "nilai_akhir": "A-"},
      {"kode": "MK111", "nama": "Pengantar Sistem Informasi", "sks": 3, "nilai_uts": 80, "nilai_uas": 85, "nilai_akhir": "A-"}
    ]
  }
  '''; // Akhir definisi string JSON

  // Mendekodekan string JSON menjadi Map
  Map<String, dynamic> transkripJson = jsonDecode(jsonString);

  // Hitung total SKS dan total bobot nilai
  int totalSKS = 0;
  double totalBobotNilai = 0;

  // Perulangan untuk menghitung total SKS dan total bobot nilai
  for (var mataKuliah in transkripJson['mata_kuliah']) {
    int sks = mataKuliah['sks']; // Ambil jumlah SKS mata kuliah
    totalSKS += sks; // Tambahkan jumlah SKS ke totalSKS
    totalBobotNilai += _nilaiToBobot(mataKuliah['nilai_akhir']) * sks; // Hitung bobot nilai dan tambahkan ke totalBobotNilai
  }

  // Hitung IPK menggunakan double
  double ipk = totalBobotNilai / totalSKS;

  // Menampilkan informasi transkrip
  print('Nama: ${transkripJson['nama']}'); // Cetak nama mahasiswa
  print('NIM: ${transkripJson['nim']}'); // Cetak NIM mahasiswa
  print('Fakultas: ${transkripJson['fakultas']}'); // Cetak fakultas mahasiswa
  print('Program Studi: ${transkripJson['program_studi']}'); // Cetak program studi mahasiswa
  print('Universitas: ${transkripJson['universitas']}'); // Cetak universitas
  print('\nDaftar Mata Kuliah:'); // Cetak daftar mata kuliah
  for (var mataKuliah in transkripJson['mata_kuliah']) { // Looping untuk setiap mata kuliah
    print('Kode: ${mataKuliah['kode']}'); // Cetak kode mata kuliah
    print('Nama: ${mataKuliah['nama']}'); // Cetak nama mata kuliah
    print('SKS: ${mataKuliah['sks']}'); // Cetak jumlah SKS mata kuliah
    print('Nilai UTS: ${mataKuliah['nilai_uts']}'); // Cetak nilai UTS mata kuliah
    print('Nilai UAS: ${mataKuliah['nilai_uas']}'); // Cetak nilai UAS mata kuliah
    print('Nilai Akhir: ${mataKuliah['nilai_akhir']}'); // Cetak nilai akhir mata kuliah
    print(''); // Baris kosong
  }
  // Mencetak total SKS dan hasil IPK
  print('Total SKS: $totalSKS'); // Cetak total SKS
  print('IPK: ${ipk.toStringAsFixed(2)}'); // Cetak IPK dengan dua angka di belakang koma
}

// Mengubah nilai huruf menjadi bobot nilai
double _nilaiToBobot(String nilai) {
  switch (nilai) {
    case 'A':
      return 4.0;
    case 'A-':
      return 3.7;
    case 'B+':
      return 3.3;
    case 'B':
      return 3.0;
    case 'B-':
      return 2.7;
    case 'C+':
      return 2.3;
    case 'C':
      return 2.0;
    case 'C-':
      return 1.7;
    case 'D':
      return 1.0;
    case 'E':
      return 0.0;
    // Tambahkan case lainnya sesuai kebutuhan
    default:
      return 0.0; // Nilai tidak valid
  }
}
