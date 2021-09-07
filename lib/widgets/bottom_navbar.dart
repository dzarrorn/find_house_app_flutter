import 'package:find_house_app_flutter/theme.dart';
import 'package:flutter/material.dart';

class BottomNavbarItem extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  BottomNavbarItem({this.imageUrl, this.isActive});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imageUrl,
          width: 26,
        ),
        Spacer(),
        isActive
            ? ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  width: 30,
                  height: 4,
                  color: purpleColor,
                ),
              )
            : Container()
      ],
    );
  }
}
