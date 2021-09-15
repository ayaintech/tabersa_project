import 'package:flutter/material.dart';
import 'package:tabersa_project/Screens/01_auth/login/component/body.dart';
import 'package:tabersa_project/components/tittle_text.dart';
import 'package:tabersa_project/constant/constants.dart';

import 'package:tabersa_project/components/primary_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        // constraints: BoxConstraints.tightForFinite(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [kPrimaryColor, kSecondaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.all(kDefaultPadding),
              ),
              Image.asset("assets/images/Logo_TST_main_color.png",
                  width: 180, height: 348.86, fit: BoxFit.cover),
              SizedBox(
                height: 30,
              ),
              TitleText('Selamat Datang', kTextSecondaryColor, 'Quicksand'),
              SizedBox(
                height: 60,
              ),
              PrimaryButton(
                  title: "Lanjutkan",
                  press: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  }),
            ]),
      ),
    );
  }
}
