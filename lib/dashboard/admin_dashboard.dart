import 'dart:js';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:modernlogintute/responsive.dart';
import '../components/chart.dart';
import '../components/tabledaftaralumni.dart';
import '../components/header.dart';
import '../components/list_jurusan.dart';
import '../components/mydataalumni.dart';

class DashboardScreen extends StatelessWidget {
  get infinity => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      JurusanDetails(),
                      SizedBox(height: 2),
                      Daftaralumni(context),
                      if (Responsive.isMobile(context)) SizedBox(height: 2),
                      if (Responsive.isMobile(context)) Mydataalumni(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
