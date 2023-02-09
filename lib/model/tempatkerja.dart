import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String? assetsSrc, title, totalPersentase;
  final int? numOfOrang, percentage;
  final Color? color;

  CloudStorageInfo(
      {this.assetsSrc,
      this.title,
      this.totalPersentase,
      this.numOfOrang,
      this.percentage,
      this.color});
}

List demoMyFiles = [
  CloudStorageInfo(
      title: "IRC TIRE",
      numOfOrang: 34,
      assetsSrc: "images/Icons/irc.png",
      totalPersentase: "29%",
      percentage: 35,
      color: Color.fromARGB(255, 7, 44, 255)),
  CloudStorageInfo(
      title: "G tech",
      numOfOrang: 53,
      assetsSrc: "images/Icons/gtech.png",
      totalPersentase: "36%",
      percentage: 35,
      color: Color.fromARGB(255, 0, 0, 0)),
  CloudStorageInfo(
      title: "G Pay",
      numOfOrang: 29,
      assetsSrc: "images/Icons/gpay.png",
      totalPersentase: "25%",
      percentage: 10,
      color: Color.fromARGB(255, 255, 12, 182)),
  CloudStorageInfo(
      title: "Bank Ganesha",
      numOfOrang: 22,
      assetsSrc: "images/Icons/bangga.png",
      totalPersentase: "10%",
      percentage: 78,
      color: Color.fromARGB(255, 248, 147, 14)),
];
