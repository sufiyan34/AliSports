import 'package:alisportspk/view/constents/catagory_selected_from_appbar.dart';
import 'package:flutter/material.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';

class CricketDropdown extends StatefulWidget {
  const CricketDropdown({super.key});

  @override
  State<CricketDropdown> createState() => _CricketDropdownState();
}

class _CricketDropdownState extends State<CricketDropdown> {
  late final List<PlutoMenuItem> whiteTapMenus;
  String? selectedItem;
  List<String> hardballItems = [
    "Bats",
    "Balls",
    "Batting Gloves",
    "Batting Pads",
    "Wicket Keeping Gloves",
    "Wicket Keeping Pads",
    "Helmets",
    "Thigh Pads",
    "Kit Bags",
    "Shoes",
    "Other Accessories"
  ];
  List<String> softballItems = [
    "Bats",
    "Balls",
    "Shoes",
    "Kitbags",
    "Other Accessories"
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
        title: 'Cricket',
        icon: Icons.keyboard_arrow_down,
        children: [
          PlutoMenuItem(
              title: 'Hardball',
              onTap: () {
                message(context, 'hardball');
              },
              children: [
                ...hardballItems.map((e) {
                  // int index = hardballItems.indexOf(e);

                  return (PlutoMenuItem(
                    title: e,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CatagorySelectedFromAppbar(
                              catagory: 'cricket',
                              subcatagory: 'hardball',
                              selection: e,
                            ),
                          ));
                      setState(() {});
                      message(context, e);
                    },
                  ));
                })
              ]),
          PlutoMenuItem(
              title: 'Softball',
              onTap: () {
                message(context, 'softball');
              },
              children: [
                ...softballItems.map((e) {
                  //  int index = softballItems.indexOf(e);

                  return (PlutoMenuItem(
                    title: e,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CatagorySelectedFromAppbar(
                              catagory: 'cricket',
                              subcatagory: 'softball',
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
