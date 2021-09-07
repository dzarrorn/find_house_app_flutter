import 'package:find_house_app_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:find_house_app_flutter/models/tips.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;
  TipsCard(this.tips);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageUrl,
          width: 80,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.title,
              style: mediumBlack.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Updated ${tips.updateAt}',
              style: lightGrey.copyWith(fontSize: 14),
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_right,
            size: 24,
            color: greykColor,
          ),
        )
      ],
    );
  }
}
