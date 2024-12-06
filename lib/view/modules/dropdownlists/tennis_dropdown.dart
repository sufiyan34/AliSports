import 'package:alisportspk/view/constents/catagory_selected_from_appbar.dart';
import 'package:flutter/material.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';

class TennisDropdown extends StatefulWidget {
  const TennisDropdown({super.key});

  @override
  State<TennisDropdown> createState() => _TennisDropdownState();
}

class _TennisDropdownState extends State<TennisDropdown> {
  final List<String> _tennisEquipment = [
    "Rackets",
    "Strings",
    "Balls",
    "Shoes",
    "Racket Bags",
    "Other Accessories",
    'View all',
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
        title: 'Tennis Equipment',
        icon: Icons.keyboard_arrow_down,
        children: [
          PlutoMenuItem(
              title: 'Tennis Equipment',
              onTap: () {
                message(context, '_tennisEquipment');
              },
              children: [
                ..._tennisEquipment.map((e) {
                  //  int index = _tennisEquipment.indexOf(e);

                  return (PlutoMenuItem(
                    title: e,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CatagorySelectedFromAppbar(
                              catagory: 'tennis',
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
