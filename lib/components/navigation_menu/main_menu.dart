import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabersa_project/Screens/01_auth/login/login.dart';
import 'package:tabersa_project/Screens/02_home/home_screen.dart';
import 'package:tabersa_project/Screens/03_rekening/rekening.dart';
import 'package:tabersa_project/Screens/04_my_style/rekening.dart';
import 'package:tabersa_project/Screens/05_experience/experience.dart';
import 'package:tabersa_project/Screens/06_setting/setting.dart';
import 'package:tabersa_project/components/navigation_menu/data/drawer_items.dart';
import 'package:tabersa_project/components/navigation_menu/model/drawer_item.dart';
import 'package:tabersa_project/components/navigation_menu/navigation_provider.dart';

import 'package:tabersa_project/components/small_logo.dart';
import 'package:tabersa_project/constant/constants.dart';

class MainMenu extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final safeArea =
        EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top);

    final provider = Provider.of<NavigationProvider>(context);
    final isCollapsed = provider.isCollapsed;

    return new Container(
        width: isCollapsed ? MediaQuery.of(context).size.width * 0.25 : null,
        child: Drawer(
          child: Flexible(
            child: new Container(
              color: Color(0xFF008db1),
              child: new Column(
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.symmetric(vertical: 24).add(safeArea),
                    width: double.infinity,
                    color: kPrimaryColor,
                    child: buildHeader(context, isCollapsed),
                  ),
                  const SizedBox(height: 24),
                  new Container(
                      child: isCollapsed
                          ? ListTile(
                              leading: CircleAvatar(
                                  radius: 32,
                                  backgroundColor: Colors.white,
                                  child: Text("RG")),
                            )
                          : new Column(
                              children: <Widget>[
                                const SizedBox(height: 12),
                                SmallLogo(),
                                const SizedBox(height: 12),
                                new Container(
                                  margin:
                                      EdgeInsets.fromLTRB(0, 10.0, 10.0, 10.0),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                        radius: 48,
                                        backgroundColor: Colors.white,
                                        child: Text("RG")),
                                    title: new Column(children: <Widget>[
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text("Romoin Grosjean",
                                            style: TextStyle(
                                              color: kTextSecondaryColor,
                                              fontFamily: 'Asap',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text("rgrosjean@mail.com",
                                            style: TextStyle(
                                              color: kTextSecondaryColor,
                                              fontFamily: 'Asap',
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            )),
                                      ),
                                    ]),
                                  ),
                                ),
                              ],
                            )),
                  const SizedBox(height: 12),
                  Divider(color: Colors.white70),
                  buildList(items: itemsFirst, isCollapsed: isCollapsed),
                  const SizedBox(height: 12),
                  Divider(color: Colors.white70),
                  const SizedBox(height: 12),
                  buildList(
                    indexOffset: itemsFirst.length,
                    items: itemsSecond,
                    isCollapsed: isCollapsed,
                  ),
                  Spacer(),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ));
  }

  Widget buildList({
    required bool isCollapsed,
    required List<DrawerItem> items,
    int indexOffset = 0,
  }) =>
      ListView.separated(
        padding: isCollapsed ? EdgeInsets.zero : padding,
        shrinkWrap: true,
        primary: false,
        itemCount: items.length,
        separatorBuilder: (context, index) => SizedBox(height: 16),
        itemBuilder: (context, index) {
          final item = items[index];

          return buildMenuItem(
            isCollapsed: isCollapsed,
            text: item.title,
            icon: item.icon,
            onClicked: () => selectItem(context, indexOffset + index),
          );
        },
      );

  void selectItem(BuildContext context, int index) {
    final navigateTo = (page) => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => page,
        ));

    Navigator.of(context).pop();

    switch (index) {
      case 0:
        navigateTo(Home());
        break;
      case 1:
        navigateTo(Rekening());
        break;
      case 2:
        navigateTo(MyStyle());
        break;
      case 3:
        navigateTo(Experience());
        break;
      case 4:
        navigateTo(Login());
        break;
      case 5:
        navigateTo(Setting());
        break;
    }
  }

  Widget buildMenuItem({
    required bool isCollapsed,
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final leading = Icon(icon, color: color);

    return Material(
      color: Colors.transparent,
      child: isCollapsed
          ? ListTile(
              title: leading,
              onTap: onClicked,
            )
          : ListTile(
              leading: leading,
              title: Text(text, style: TextStyle(color: color, fontSize: 16)),
              onTap: onClicked,
            ),
    );
  }

  Widget buildCollapseIcon(BuildContext context, bool isCollapsed) {
    final double size = 32;
    final icon = isCollapsed ? Icons.menu : Icons.menu_open;
    final alignment = isCollapsed ? Alignment.center : Alignment.centerRight;
    final margin = isCollapsed ? null : EdgeInsets.only(right: 16);
    final width = isCollapsed ? double.infinity : size;

    return Container(
      alignment: alignment,
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            width: width,
            height: size,
            child: Icon(icon, color: Colors.white),
          ),
          onTap: () {
            final provider =
                Provider.of<NavigationProvider>(context, listen: false);
            provider.toggleIsCollapsed();
          },
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context, bool isCollapsed) => isCollapsed
      ? new Container(
          child: Align(
            alignment: Alignment.center,
            child: buildCollapseIcon(context, isCollapsed),
          ),
        )
      : new Container(
          child: Align(
            alignment: Alignment.centerRight,
            child: buildCollapseIcon(context, isCollapsed),
          ),
        );
}
