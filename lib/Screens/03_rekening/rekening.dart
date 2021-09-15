import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tabersa_project/Screens/03_rekening/components/body.dart';
import 'package:tabersa_project/components/navigation_menu/main_menu.dart';
import 'package:tabersa_project/components/navigation_menu/navigation_provider.dart';
import 'package:tabersa_project/constant/constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(Rekening());
}

class Rekening extends StatelessWidget {
  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appTitle,
        home: RekeningScreen(),
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          primaryColor: kPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ));
}

class RekeningScreen extends StatefulWidget {
  @override
  _RekeningScreenState createState() => _RekeningScreenState();
}

class _RekeningScreenState extends State<RekeningScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(),
        body: Body(),
        drawer: MainMenu(),
      );

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
