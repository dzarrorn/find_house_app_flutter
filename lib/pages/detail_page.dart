import 'package:find_house_app_flutter/models/space.dart';
import 'package:find_house_app_flutter/pages/error_page.dart';
import 'package:find_house_app_flutter/theme.dart';
import 'package:find_house_app_flutter/widgets/facility_item.dart';
import 'package:find_house_app_flutter/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Space space;
  DetailPage(this.space);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    Future<void> showConfirmation() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirmation'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Are you sure to call the owner?'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Call'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    launchUrl('tel:${widget.space.phone}');
                  },
                ),
              ],
            );
          });
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Image.network(
                widget.space.imageUrl,
                height: 350,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              ListView(
                children: [
                  SizedBox(height: 328),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      color: whiteColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        //! NOTE: TITLE
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.space.name,
                                    style: mediumBlack.copyWith(
                                      fontSize: 22,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                        text: '\$${widget.space.price}',
                                        style: mediumPurple.copyWith(
                                          fontSize: 16,
                                        ),
                                        children: [
                                          TextSpan(
                                              text: ' / month',
                                              style: lightGrey.copyWith(
                                                fontSize: 16,
                                              ))
                                        ]),
                                  )
                                ],
                              ),
                              Row(
                                children: [1, 2, 3, 4, 5].map((index) {
                                  return Container(
                                    child: RatingItem(
                                      index: index,
                                      rating: widget.space.rating,
                                    ),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                        //! NOTE: MAIN FACILITIES
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Text(
                            'Main Facilities',
                            style: regulerBlack.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FacilityItem(
                                  imageUrl: 'assets/btn_kitchen.png',
                                  name: 'kitchen',
                                  total: widget.space.numberOfKitchens),
                              FacilityItem(
                                imageUrl: 'assets/btn_bedroom.png',
                                name: 'bedroom',
                                total: widget.space.numberOfBedrooms,
                              ),
                              FacilityItem(
                                imageUrl: 'assets/btn_cupboard.png',
                                name: 'cupboard',
                                total: widget.space.numberOfCupboards,
                              ),
                            ],
                          ),
                        ),
                        //! NOTE: PHOTO
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Text(
                            'Photos',
                            style: regulerBlack.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: 88,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: widget.space.photos.map((item) {
                              return Container(
                                margin: EdgeInsets.only(
                                  left: 24,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    item,
                                    width: 110,
                                    height: 88,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        //! NOTE: LOCATION
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Text(
                            'Location',
                            style: regulerBlack.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${widget.space.adress}\n${widget.space.city}',
                                style: lightGrey.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  launchUrl(widget.space.mapUrl);
                                },
                                child: Image.asset(
                                  'assets/btn_map.png',
                                  width: 40,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          width: MediaQuery.of(context).size.width - 2 * 24,
                          height: 50,
                          child: RaisedButton(
                            onPressed: () {
                              showConfirmation();
                            },
                            color: purpleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Text(
                              'Book Now',
                              style: mediumWhite.copyWith(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 24,
                  right: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/btn_back.png',
                        width: 40,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isClicked = !isClicked;
                        });
                      },
                      child: Image.asset(
                        isClicked
                            ? 'assets/btn_wishlist_filled.png'
                            : 'assets/btn_wishlist.png',
                        width: 40,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
