import 'package:alisportspk/getx/appcontrollers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FilterPopup extends StatefulWidget {
  final List<String> popupOptions;
  final int filter_number;
  final String label;
  const FilterPopup(
      {super.key,
      required this.popupOptions,
      required this.filter_number,
      required this.label});

  @override
  State<FilterPopup> createState() => _FilterPopupState();
}

class _FilterPopupState extends State<FilterPopup> {
  AppControllers appControllers = Get.put(AppControllers());

  final List<String> selectedOptions = [];
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (event) {
          setState(() {
            appControllers.filterTitleIndex = widget.filter_number.obs;
          });
        },
        onExit: (event) {
          setState(() {
            appControllers.filterTitleIndex = 0.obs;
          });
        },
        child: PopupMenuButton(
          position: PopupMenuPosition.under,
          menuPadding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            children: [
              Text(widget.label),
              const Icon(Icons.keyboard_arrow_down)
            ],
          ),
          onSelected: (value) {
            setState(() {
              if (selectedOptions.contains(value)) {
                selectedOptions.remove(value); // Deselect if already selected
              } else {
                selectedOptions.add(value); // Add to selected options
              }
            });
          },
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                  enabled: false,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${selectedOptions.length} selected"),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Reset",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  )),
              ...widget.popupOptions.map((item) => PopupMenuItem(
                  value: item,
                  child: Row(
                    children: [
                      Container(
                        height: 20.h,
                        width: 20.h,
                        decoration: BoxDecoration(border: Border.all()),
                        child: selectedOptions.contains(item)
                            ? const Center(
                                child: Icon(Icons.check, color: Colors.black))
                            : null,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(item)
                    ],
                  )))
            ];
          },
        ));
  }
}
