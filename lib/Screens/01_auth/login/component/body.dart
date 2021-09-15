import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabersa_project/Screens/01_auth/register/register.dart';
import 'package:tabersa_project/Screens/02_home/home_screen.dart';
import 'package:tabersa_project/components/primary_button.dart';
import 'package:tabersa_project/components/responsive_ui.dart';
import 'package:tabersa_project/components/small_logo.dart';
import 'package:tabersa_project/components/subtittle_text.dart';
import 'package:tabersa_project/components/textformfield.dart';
import 'package:tabersa_project/components/tittle_text.dart';
import 'package:tabersa_project/constant/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

enum statusLogin { signIn, notSignIn }

class _LoginScreenState extends State<LoginScreen> {
  late double _height;
  late double _width;
  late double _pixelRatio;
  late bool _large;
  late bool _medium;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();

  statusLogin _loginStatus = statusLogin.notSignIn;

  var loading = false;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    switch (_loginStatus) {
      case statusLogin.notSignIn:
        return Material(
          child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints.tightForFinite(),
            decoration: BoxDecoration(
              color: kBackgroundColor,
            ),
            height: _height,
            width: _width,
            padding: EdgeInsets.only(bottom: 5),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SmallLogo(),
                  SizedBox(height: 18),
                  TitleText('Sudah punya Akun', kTextPrimaryColor, 'Quicksand'),
                  SizedBox(height: 18),
                  SubtitleText('Silahkan Log-in disini', kTextSecondaryColor,
                      'Quicksand'),
                  form(),

                  SizedBox(height: _height / 40.0),
                  // button(),
                  PrimaryButton(
                      title: "Masuk",
                      press: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      }),
                  SizedBox(height: 18),
                  // signUpTextRow(),
                  new Container(
                    alignment: Alignment.centerLeft,
                    padding: new EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
                    child:
                        TitleText('Pengguna Baru', kPrimaryColor, 'Quicksand'),
                  ),
                  new Container(
                    alignment: Alignment.centerLeft,
                    padding: new EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 5.0),
                    child: SubtitleText(
                        'Daftar Disini', kTextSecondaryColor, 'Asap'),
                  ),
                  PrimaryButton(
                      title: "Daftar Baru",
                      press: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ),
                        );
                      }),
                  //  forgetPassTextRow(),
                  new Container(
                    alignment: Alignment.centerLeft,
                    padding: new EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 5.0),
                    child: SubtitleText(
                        'Lupa Password ?', kTextSecondaryColor, 'Asap'),
                  ),
                ],
              ),
            ),
          ),
        );
        break;
      case statusLogin.signIn:
        return Home();
        break;
    }
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 10.0, right: _width / 10.0, top: _height / 20.0),
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            emailTextFormField(),
            SizedBox(height: _height / 40.0),
            passwordTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      textEditingController: emailController,
      icon: Icons.email,
      hint: "Kode Akses",
    );
  }

  Widget passwordTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      textEditingController: passwordController,
      icon: Icons.password,
      obscureText: true,
      hint: "Password",
    );
  }

  Widget forgetPassTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Forgot your password?",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 14 : (_medium ? 12 : 10)),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              print("Routing");
            },
            child: Text(
              "Recover",
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.green[200]),
            ),
          )
        ],
      ),
    );
  }

  Widget button() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        padding: EdgeInsets.all(0.0),
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
      onPressed: () {},
      child: Container(
        alignment: Alignment.center,
        width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: [Colors.pinkAccent, Colors.green],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('SIGN IN',
            style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10))),
      ),
    );
  }
}
