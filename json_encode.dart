import 'dart:convert'; // Mengimpor pustaka dart:convert untuk pengolahan JSON

void main() {
  // Deklarasi variabel dengan informasi yang akan dimasukkan ke dalam JSON
  String nama = "Cynthia Widya"; // Variabel untuk menyimpan nama mahasiswa
  String nim = "22082010045"; // Variabel untuk menyimpan NIM mahasiswa
  String fakultas = "Fakultas Ilmu Komputer"; // Variabel untuk menyimpan fakultas mahasiswa
  String programStudi = "Sistem Informasi"; // Variabel untuk menyimpan program studi mahasiswa
  String universitas = "Universitas Pembangunan Nasional 'Veteran' Jawa Timur"; // Variabel untuk menyimpan universitas mahasiswa
  // List<dynamic> untuk menyimpan informasi mata kuliah dalam bentuk objek JSON
  List<dynamic> mataKuliah = [
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
  ]; 

// Menggunakan jsonEncode untuk mengubah variabel-variabel di atas menjadi string JSON
  String jsonString = jsonEncode({
    "nama": nama,
    "nim": nim,
    "fakultas": fakultas,
    "program_studi": programStudi,
    "universitas": universitas,
    "mata_kuliah": mataKuliah
  }); 
  // Mencetak string JSON yang dihasilkan
  print(jsonString);
}
