import 'package:flutter/material.dart';

import 'chart.dart';
import 'alumni_jurusan.dart';

class JurusanDetails extends StatelessWidget {
  const JurusanDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Data Alumni",
            style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Colors.white, fontWeight: FontWeight.w600, height: 2),
          ),
          SizedBox(height: 2),
          Chart(),
          Jurusan(
            assetsSrc: "images/user.png",
            title: "Industri",
            amountOfFiles: "40 %",
            numOfOrang: 120,
            color: Color.fromARGB(255, 6, 94, 165),
          ),
          Jurusan(
            assetsSrc: "images/user.png",
            title: "Elektro",
            amountOfFiles: "25 %",
            numOfOrang: 80,
            color: Color.fromARGB(255, 224, 0, 0),
          ),
          Jurusan(
            assetsSrc: "images/user.png",
            title: "Mesin",
            amountOfFiles: "35 %",
            numOfOrang: 100,
            color: Color.fromARGB(255, 138, 0, 138),
          ),
        ],
      ),
    );
  }
}
