import 'package:flutter/material.dart';

class Jurusan extends StatelessWidget {
  const Jurusan(
      {Key? key,
      required this.title,
      required this.assetsSrc,
      required this.amountOfFiles,
      required this.numOfOrang,
      required this.color})
      : super(key: key);

  final String title, assetsSrc, amountOfFiles;
  final int numOfOrang;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.white.withOpacity(0.35)),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: color,
      ),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: Image.asset(assetsSrc),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(color: Colors.white),
                  ),
                  Text(
                    "$numOfOrang Orang",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Text(
            amountOfFiles,
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
