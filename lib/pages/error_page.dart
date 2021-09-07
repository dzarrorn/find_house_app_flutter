import 'package:find_house_app_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 214,
                ),
                Image.asset(
                  'assets/error.png',
                  width: 300,
                  height: 85.95,
                ),
                SizedBox(
                  height: 70.5,
                ),
                Text(
                  'Where are you going?',
                  style: mediumBlack.copyWith(fontSize: 24),
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  'Seems like the page that you were\nrequested is already gone',
                  style: lightGrey.copyWith(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 210,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                          (route) => false);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        17,
                      ),
                    ),
                    color: purpleColor,
                    child: Text(
                      'Back to Home',
                      style: mediumWhite.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 236,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
