import 'package:find_house_app_flutter/models/city.dart';
import 'package:find_house_app_flutter/models/space.dart';
import 'package:find_house_app_flutter/models/tips.dart';
import 'package:find_house_app_flutter/providers/space_provider.dart';
import 'package:find_house_app_flutter/theme.dart';
import 'package:find_house_app_flutter/widgets/bottom_navbar.dart';
import 'package:find_house_app_flutter/widgets/city_card.dart';
import 'package:find_house_app_flutter/widgets/space_card.dart';
import 'package:find_house_app_flutter/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        //! NOTE: TITLE/HEADER
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  'Explore Now',
                  style: mediumBlack.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  'Mencari kosan yang cozy',
                  style: lightGrey.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //! NOTE: POPULAR CITIES
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  'Popular Cities',
                  style: regulerBlack.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    CityCard(
                      City(
                        id: 1,
                        name: 'Jakarta',
                        imageUrl: 'assets/city1.png',
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      City(
                        id: 2,
                        name: 'Bandung',
                        imageUrl: 'assets/city2.png',
                        isPopular: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      City(
                        id: 3,
                        name: 'Surabaya',
                        imageUrl: 'assets/city3.png',
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      City(
                        id: 4,
                        name: 'Palembang',
                        imageUrl: 'assets/city4.png',
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      City(
                          id: 5,
                          name: 'Aceh',
                          imageUrl: 'assets/city5.png',
                          isPopular: true),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      City(
                        id: 6,
                        name: 'Bogor',
                        imageUrl: 'assets/city6.png',
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //! NOTE: RECOMMENDED SPACE
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                ),
                child: Text(
                  'Recommended Space',
                  style: regulerBlack.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                ),
                child: FutureBuilder(
                  future: spaceProvider.getRecommendedSpaces(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Space> data = snapshot.data;

                      int index = 0;

                      return Column(
                        children: data.map((item) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(
                              top: index == 1 ? 0 : 30,
                            ),
                            child: SpaceCard(item),
                          );
                        }).toList(),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              //! NOTE: TIPS&GUIDANCE
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  top: 30,
                ),
                child: Text('Tips & Guidelines',
                    style: regulerBlack.copyWith(
                      fontSize: 16,
                    )),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 30,
                ),
                child: Column(
                  children: [
                    TipsCard(
                      Tips(
                        id: 1,
                        title: 'City Guidelines',
                        imageUrl: 'assets/icon1.png',
                        updateAt: '20 Apr',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TipsCard(
                      Tips(
                        id: 2,
                        title: 'Jakarta Fairship',
                        imageUrl: 'assets/icon2.png',
                        updateAt: '11 Dec',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width - 2 * 24,
        height: 65,
        decoration: BoxDecoration(
          color: btnBackgroundColor,
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/icon_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_mail.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_favorite.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
