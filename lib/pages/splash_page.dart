import 'package:find_house_app_flutter/pages/home_page.dart';
import 'package:find_house_app_flutter/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50, left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text('Find Cozy House\nto Stay and Happy',
                        style: mediumBlack.copyWith(
                          fontSize: 24,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Stop membuang banyak waktu\npada tempat yang tidak habitable',
                      style: lightGrey.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 210,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ));
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            17,
                          ),
                        ),
                        color: purpleColor,
                        child: Text(
                          'Explore Now',
                          style: mediumWhite.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Image.asset(
                'assets/splash.png',
              )
            ],
          ),
        ),
      ),
    );
  }
}
