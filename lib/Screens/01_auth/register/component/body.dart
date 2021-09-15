import 'package:flutter/material.dart';
import 'package:tabersa_project/Screens/01_auth/login/login.dart';
import 'package:tabersa_project/Screens/02_home/home_screen.dart';
import 'package:tabersa_project/components/primary_button.dart';
import 'package:tabersa_project/components/responsive_ui.dart';
import 'package:tabersa_project/components/subtittle_text.dart';
import 'package:tabersa_project/components/textformfield_2.dart';
import 'package:tabersa_project/components/tittle_text.dart';
import 'package:tabersa_project/constant/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool checkBoxValue = false;
  late double _height;
  late double _width;
  late double _pixelRatio;
  late bool _large;
  late bool _medium;
  bool validate = false;
  late bool isSuccess;

  TextEditingController emailController = new TextEditingController();
  TextEditingController handphoneController = new TextEditingController();
  TextEditingController kodeaksesController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  var loading = false;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: Column(
            children: <Widget>[
              form(),
              SizedBox(height: _height / 60.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            new Container(
              alignment: Alignment.topLeft,
              padding: new EdgeInsets.fromLTRB(0.0, 10.0, 30.0, 10.0),
              child: TitleText("Daftar Baru", kTextPrimaryColor, 'Quicksand'),
            ),
            SizedBox(height: _height / 32.0),
            new Container(
              alignment: Alignment.topLeft,
              padding: new EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
              child: SubtitleText("Email", kTextSecondaryColor, 'Asap'),
            ),
            emailTextFormField(),
            SizedBox(height: _height / 60.0),
            new Container(
              alignment: Alignment.topLeft,
              padding: new EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
              child:
                  SubtitleText("Nomor Handphone", kTextSecondaryColor, 'Asap'),
            ),
            handphoneTextFormField(),
            SizedBox(height: _height / 60.0),
            new Container(
              alignment: Alignment.topLeft,
              padding: new EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
              child: SubtitleText("Kode Akses", kTextSecondaryColor, 'Asap'),
            ),
            kodeaksesTextFormField(),
            SizedBox(height: _height / 60.0),
            new Container(
              alignment: Alignment.topLeft,
              padding: new EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
              child: SubtitleText("Password", kTextSecondaryColor, 'Asap'),
            ),
            passwordTextFormField(),
            SizedBox(height: _height / 60.0),
            new Container(
              alignment: Alignment.topLeft,
              child: Row(children: <Widget>[
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: kPrimaryColor,
                  value: checkBoxValue,
                  onChanged: (value) {
                    setState(() {
                      checkBoxValue = value!;
                    });
                  },
                ),
                new Flexible(
                  child: new Container(
                    child: new RichText(
                      text: TextSpan(
                        text: 'Saya menyetujui ',
                        style: TextStyle(
                          fontFamily: 'Asap',
                          fontSize: 10,
                          color: Colors.white,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Syarat, Ketentuan dan Kebijakan Privasi',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Asap',
                                fontSize: 10,
                                color: Colors.white,
                              )),
                          TextSpan(
                              text: ' yang berlaku.',
                              style: TextStyle(
                                fontFamily: 'Asap',
                                fontSize: 10,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(height: _height / 60.0),
            PrimaryButton(
                title: "Lanjutkan",
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                }),
            SizedBox(height: _height / 60.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SubtitleText('Sudah Punya Akun ?', kTextSecondaryColor, 'Asap'),
                TextButton(
                  child: Text(
                    "Masuk",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontFamily: 'Asap',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget emailTextFormField() {
    return CustomTextField2(
      keyboardType: TextInputType.text,
      textEditingController: emailController,
      hint: "Masukan Email Anda",
    );
  }

  Widget handphoneTextFormField() {
    return CustomTextField2(
      keyboardType: TextInputType.text,
      textEditingController: handphoneController,
      hint: "+62",
    );
  }

  Widget kodeaksesTextFormField() {
    return CustomTextField2(
      keyboardType: TextInputType.text,
      textEditingController: kodeaksesController,
      hint: "Kode Akses akan digunakan untuk Login",
    );
  }

  Widget passwordTextFormField() {
    return CustomTextField2(
      keyboardType: TextInputType.text,
      textEditingController: passwordController,
      hint: "Password Anda",
      obscureText: true,
    );
  }
}
