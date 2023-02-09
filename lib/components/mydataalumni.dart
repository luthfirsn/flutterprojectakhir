import 'package:flutter/material.dart';
import 'package:modernlogintute/model/tempatkerja.dart';
import 'package:modernlogintute/responsive.dart';

import 'tempat_kerja.dart';

class Mydataalumni extends StatelessWidget {
  const Mydataalumni({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Penempatan Kerja",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: Colors.blue, height: 0.5)),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 2 * 1.5,
                  vertical: 2,
                ),
              ),
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Add Data"),
            ),
          ],
        ),
        SizedBox(height: 2),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
          ),
          tablet: FileInfoCardGridView(),
          desktop: FileInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.0 : 1.2,
          ),
        )
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 2,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => InfoCard(info: demoMyFiles[index]),
    );
  }
}
