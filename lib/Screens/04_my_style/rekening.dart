import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tabersa_project/Screens/04_my_style/components/body.dart';
import 'package:tabersa_project/components/navigation_menu/main_menu.dart';
import 'package:tabersa_project/components/navigation_menu/navigation_provider.dart';
import 'package:tabersa_project/constant/constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyStyle());
}

class MyStyle extends StatelessWidget {
  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appTitle,
        home: MyStyleScreen(),
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          primaryColor: kPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ));
}

class MyStyleScreen extends StatefulWidget {
  @override
  _MyStyleScreenState createState() => _MyStyleScreenState();
}

class _MyStyleScreenState extends State<MyStyleScreen> {
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
