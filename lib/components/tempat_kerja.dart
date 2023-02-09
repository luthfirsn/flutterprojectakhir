import 'package:flutter/material.dart';

import '../model/tempatkerja.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final CloudStorageInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 2, color: Colors.blue.withOpacity(1)),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(2 * 0.75),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 2, color: Colors.orange.withOpacity(1)),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: Image.asset(
                  info.assetsSrc!,
                ),
              ),
              Icon(Icons.more_vert, color: Colors.orange),
            ],
          ),
          Text(info.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Colors.black, fontWeight: FontWeight.w900, height: 2)),
          PlaceworkLine(
            color: info.color!,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${info.numOfOrang} Orang",
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.black),
              ),
              Text(
                info.totalPersentase!,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.black),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PlaceworkLine extends StatelessWidget {
  const PlaceworkLine({
    Key? key,
    required Color color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (0.5),
            height: 5,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
