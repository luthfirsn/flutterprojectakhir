import 'package:flutter/material.dart';

import '../model/profilalumni.dart';

Container Daftaralumni(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(2),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: DataTable(
            horizontalMargin: 2,
            columnSpacing: 2,
            columns: [
              DataColumn(
                label: Text("Nama Lengkap",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.white, height: 0.5)),
              ),
              DataColumn(
                label: Text("Jurusan",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.white, height: 0.5)),
              ),
              DataColumn(
                  label: Text("Tempat Kerja",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.white, height: 0.1))),
            ],
            rows: List.generate(
              demoRecentFiles.length,
              (index) => recentnamaalumni(demoRecentFiles[index]),
            ),
          ),
        ),
      ],
    ),
  );
}

DataRow recentnamaalumni(RecentFile fileInfo) {
  return DataRow(cells: [
    DataCell(
      Row(
        children: [
          Image.asset(
            fileInfo.foto!,
            height: 30,
            width: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Text(
              fileInfo.nama!,
            ),
          ),
        ],
      ),
    ),
    DataCell(Text(
      fileInfo.jurusan!,
    )),
    DataCell(Text(fileInfo.tempat_kerja!)),
  ]);
}
