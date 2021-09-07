import 'package:find_house_app_flutter/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:find_house_app_flutter/models/space.dart';
import '../theme.dart';

class SpaceCard extends StatelessWidget {
  final Space space;
  SpaceCard(this.space);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(space),
          ),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 130,
              height: 110,
              child: Stack(
                children: [
                  Image.network(
                    space.imageUrl,
                    width: 130,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icon_star.png',
                              width: 22,
                              height: 22,
                            ),
                            Text(
                              '${space.rating}/5',
                              style: mediumWhite.copyWith(
                                fontSize: 13,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                space.name,
                style: mediumBlack.copyWith(
                  fontSize: 18,
                ),
              ),
              Row(
                children: [
                  Text(
                    '\$${space.price}',
                    style: mediumPurple.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    ' / month',
                    style: lightGrey.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                '${space.city}, ${space.country}',
                style: lightGrey.copyWith(
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
