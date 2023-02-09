import 'package:flutter/material.dart';

class RecentFile {
  final String? foto, nama, jurusan, tempat_kerja;

  RecentFile({this.foto, this.nama, this.jurusan, this.tempat_kerja});
}

List demoRecentFiles = [
  RecentFile(
    foto: "images/foto/tretan1.png",
    nama: "Tretan Muslim",
    jurusan: "Industri",
    tempat_kerja: "G Tech",
  ),
  RecentFile(
    foto: "images/foto/coki1.png",
    nama: "Coki Pardede",
    jurusan: "Idustri",
    tempat_kerja: "G Pay",
  ),
  RecentFile(
    foto: "images/foto/dustin1.png",
    nama: "Dustin Tiffany",
    jurusan: "Mesin",
    tempat_kerja: "IRC TIRE",
  ),
  RecentFile(
    foto: "images/foto/uus.png",
    nama: "Uus",
    jurusan: "Elektro",
    tempat_kerja: "IRC TIRE",
  ),
  RecentFile(
    foto: "images/foto/erickolim.png",
    nama: "Ericko Lim",
    jurusan: "Mesin",
    tempat_kerja: "Bank Ganesha",
  ),
  RecentFile(
    foto: "images/foto/atta1.png",
    nama: "Atta Halilintar",
    jurusan: "Industri",
    tempat_kerja: "G Tech",
  ),
];
