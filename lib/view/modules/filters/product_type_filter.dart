// class ProductTypeFilter extends StatefulWidget {
//   ProductTypeFilter({super.key});
//   @override
//   State<ProductTypeFilter> createState() => _ProductTypeFilterState();
// }

// class _ProductTypeFilterState extends State<ProductTypeFilter> {
//   int? filteroptionInde;

//   // @override
//   // void initState() {
//   //    var _items =
//   //     proudectTypeMap((e) => MultiSelectItem<ProudectTypeMap>(e, e.productType))
//   //         .toList();
//   //   super.initState();
//   // }
//   //  final _items =
//   //     proudectTypeMap((e) => MultiSelectItem<ProudectTypeMap>(e, e.productType))
//   //         .toList();

//   bool boldUnderline = false;

//   final _multiSelectKey = GlobalKey<FormFieldState>();

//   List<ProudectTypeMap> _selectedTypes = [];

//   AppControllers appControllers = Get.put(AppControllers());

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 150.w,
//       child: MultiSelectDialogField(
//         dialogHeight: 600.h,
//         confirmText: const Text('Ok'),
//         dialogWidth: 600.w,
//         items: proudectTypeMap,
//         key: _multiSelectKey,
//         searchable: true,
//         initialValue: _selectedTypes, // Set initial selected values
//         onConfirm: (values) {
//           _selectedTypes = values.cast<ProudectTypeMap>();
//           //_selectedTypes.add(values);
//           // Update selected items
//         },

//         chipDisplay: MultiSelectChipDisplay(
//           scroll: true,
//           textStyle: const TextStyle(color: Colors.black87),
//           chipColor: Colors.white70,
//           scrollBar: HorizontalScrollBar(),
//           onTap: (value) {
//             _selectedTypes.remove(value);
//           },
//         ),
//         title: Text(' ${_selectedTypes.length} selected'),
//         selectedColor: Colors.blue,
//         decoration: null,
//         buttonIcon: const Icon(
//           Icons.keyboard_arrow_down,
//           color: Colors.grey,
//         ),
//         buttonText: Text(
//           "Brand",
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 16.sp,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:alisportspk/getx/appcontrollers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductTypeFilter extends StatefulWidget {
  const ProductTypeFilter({super.key});

  @override
  State<ProductTypeFilter> createState() => _ProductTypeFilterState();
}

class _ProductTypeFilterState extends State<ProductTypeFilter> {
  bool boldResetUnderline = false;
  AppControllers appControllers = Get.put(AppControllers());
  int? filteroptionIndex;
  static List<Map<String, String>> proudectTypeMap = [
    {"items": "23", "productType": "Shirt"},
    {"items": "48", "productType": "Shoes"},
    {"items": "35", "productType": "Racket"},
    {"items": "60", "productType": "Cricket Bat"},
    {"items": "15", "productType": "Soccer Ball"},
    {"items": "80", "productType": "Running Shoes"},
    {"items": "45", "productType": "Basketball"},
    {"items": "22", "productType": "Baseball Glove"},
    {"items": "37", "productType": "Tennis Balls"},
    {"items": "90", "productType": "Hockey Stick"},
    {"items": "67", "productType": "Yoga Mat"},
    {"items": "55", "productType": "Swim Goggles"},
    {"items": "12", "productType": "Golf Club"},
    {"items": "74", "productType": "Badminton Racket"},
    {"items": "33", "productType": "Wrestling Shoes"},
    {"items": "88", "productType": "Cycling Helmet"},
    {"items": "29", "productType": "Weightlifting Belt"},
    {"items": "66", "productType": "Surfboard"},
    {"items": "18", "productType": "Skateboard"},
    {"items": "42", "productType": "Rowing Machine"},
    {"items": "51", "productType": "Treadmill"},
    {"items": "39", "productType": "Jump Rope"},
    {"items": "25", "productType": "Kettlebells"},
    {"items": "58", "productType": "Boxing Gloves"},
    {"items": "92", "productType": "Ski Poles"},
    {"items": "77", "productType": "Fishing Rod"},
  ];
  List<dynamic> _selectedTypes = [];
// dynamic product ;
//         dynamic productType ;
//         dynamic isSelected ;
// @override
//   void initState() {

//           productType = product["productType"];
//           isSelected = _selectedTypes.contains(productType);
//     super.initState();
//   }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.87),
      height: 700.h,
      width: 700.w,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            height: 200.h,
            width: 700.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${_selectedTypes.length} selected"),
                MouseRegion(
                  onEnter: (event) {
                    setState(() {
                      boldResetUnderline == true;
                    });
                  },
                  onExit: (event) {
                    setState(() {
                      boldResetUnderline == false;
                    });
                  },
                  child: TextButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: Text(
                        "Reset",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationThickness:
                              boldResetUnderline == true ? 4.0.h : 2.0.h,
                        ),
                      )),
                )
              ],
            ),
          ),
          Container(
            height: 500.h,
            width: 700.w,
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: ListView.builder(
              itemCount: proudectTypeMap.length,
              itemBuilder: (BuildContext context, int index) {
                return CheckboxListTile(
                  value: _selectedTypes.contains(
                      proudectTypeMap.elementAt(index)["productType"]!),
                  title: Text(
                      "${proudectTypeMap.elementAt(index)["productType"]!} (${proudectTypeMap.elementAt(index)["items"]!}"),
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        _selectedTypes.add(
                            proudectTypeMap.elementAt(index)["productType"]!);
                      } else {
                        _selectedTypes.remove(
                            proudectTypeMap.elementAt(index)["productType"]!);
                      }
                    });
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

// class ProudectTypeMap {
//   final int? items;
//   final String? productType;

//   ProudectTypeMap({
//     this.items,
//     this.productType,
//   });
// }
// 