import 'package:alisportspk/view/constents/catagory_selected_from_appbar.dart';
import 'package:flutter/material.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';

class ExerciseAndFittnessDropdown extends StatefulWidget {
  const ExerciseAndFittnessDropdown({super.key});

  @override
  State<ExerciseAndFittnessDropdown> createState() =>
      _ExerciseAndFittnessDropdownState();
}

class _ExerciseAndFittnessDropdownState
    extends State<ExerciseAndFittnessDropdown> {
  final List<String> _exerciseAndFittnessEquipment = [
    "FittnessEquipment",
    'Recovery Sports',
  ];
  void initState() {
    super.initState();

    whiteTapMenus = _makeMenus(context);
  }

  late final List<PlutoMenuItem> whiteTapMenus;
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
        title: 'Exercise And Fittness Equipment',
        icon: Icons.keyboard_arrow_down,
        children: [
          PlutoMenuItem(
              title: 'Exercise And Fittness Equipment',
              onTap: () {
                message(context, '_exerciseAndFittnessEquipment');
              },
              children: [
                ..._exerciseAndFittnessEquipment.map((e) {
                  //  int index = _exerciseAndFittnessEquipment.indexOf(e);

                  return (PlutoMenuItem(
                    title: e,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CatagorySelectedFromAppbar(
                              catagory: "fitness & exercise",
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
