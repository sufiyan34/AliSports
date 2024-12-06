import 'package:alisportspk/view/constents/catagory_selected_from_appbar.dart';
import 'package:flutter/material.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';

class AccessoriesDropdown extends StatefulWidget {
  const AccessoriesDropdown({super.key});

  @override
  State<AccessoriesDropdown> createState() => _AccessoriesDropdownState();
}

class _AccessoriesDropdownState extends State<AccessoriesDropdown> {
  late final List<PlutoMenuItem> whiteTapMenus;
  final List<String> _accessories = [
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
        title: 'Accessories',
        icon: Icons.keyboard_arrow_down,
        children: [
          PlutoMenuItem(
              title: 'Accessories',
              onTap: () {
                message(context, '_accessories');
              },
              children: [
                ..._accessories.map((e) {
                  //   int index = _accessories.indexOf(e);

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
