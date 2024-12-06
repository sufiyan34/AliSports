import 'package:alisportspk/view/constents/catagory_selected_from_appbar.dart';
import 'package:flutter/material.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';

class TableTennisDropdown extends StatefulWidget {
  const TableTennisDropdown({super.key});

  @override
  State<TableTennisDropdown> createState() => _TableTennisDropdownState();
}

class _TableTennisDropdownState extends State<TableTennisDropdown> {
  final List<String> _tabletennisEquipment = [
    "Rackets",
    "Balls",
    "Shoes",
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
        title: 'Tabletennis Equipment',
        icon: Icons.keyboard_arrow_down,
        children: [
          PlutoMenuItem(
              title: 'Tabletennis Equipment',
              onTap: () {
                message(context, '_tabletennisEquipment');
              },
              children: [
                ..._tabletennisEquipment.map((e) {
                  // int index = _tabletennisEquipment.indexOf(e);

                  return (PlutoMenuItem(
                    title: e,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CatagorySelectedFromAppbar(
                              catagory: 'tabletennis',
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
