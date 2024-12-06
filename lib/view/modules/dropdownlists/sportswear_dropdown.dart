import 'package:alisportspk/view/constents/catagory_selected_from_appbar.dart';
import 'package:flutter/material.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';

class SportswearDropdown extends StatefulWidget {
  const SportswearDropdown({super.key});

  @override
  State<SportswearDropdown> createState() => _SportswearDropdownState();
}

class _SportswearDropdownState extends State<SportswearDropdown> {
  final List<String> _sportsWear = [
    "Shirts",
    "Trousers",
    "Shorts",
    "Tracksuits & Uppers",
    "Base Layers",
    "Socks",
    "Underwear",
    "View all"
  ];
  void initState() {
    super.initState();

    whiteTapMenus = _makeMenus(context);
  }

  void message(context, String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final snackBar = SnackBar(
      content: Text(text),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  List<PlutoMenuItem> _makeMenus(BuildContext context) {
    return [
      PlutoMenuItem(
        title: 'Sports Wear',
        icon: Icons.keyboard_arrow_down,
        children: [
          PlutoMenuItem(
              title: 'Sports Wear',
              onTap: () {
                message(context, '_sportsWear');
              },
              children: [
                ..._sportsWear.map((e) {
                  //  int index = _sportsWear.indexOf(e);

                  return (PlutoMenuItem(
                    title: e,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CatagorySelectedFromAppbar(
                              catagory: e,
                              subcatagory: e,
                              selection: e,
                            ),
                          ));
                      setState(() {});
                      message(context, e);
                    },
                  ));
                })
              ]),
        ],
      ),
    ];
  }

  late final List<PlutoMenuItem> whiteTapMenus;
  @override
  Widget build(BuildContext context) {
    return PlutoMenuBar(
      mode: PlutoMenuBarMode.hover,
      backgroundColor: Colors.white,
      itemStyle: const PlutoMenuItemStyle(
        activatedColor: Colors.white,
        indicatorColor: Colors.deepOrange,
        textStyle: TextStyle(color: Colors.black),
        iconColor: Colors.black87,
        moreIconColor: Colors.black,
      ),
      menus: whiteTapMenus,
    );
  }
}
