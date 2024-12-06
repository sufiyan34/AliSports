import 'package:alisportspk/getx/appcontrollers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomRadiotilesBloc extends StatefulWidget {
  final List<String> options;
  String? currentOption;
  TextStyle? labelStyle;
  final RxString
      stringName; // it is the name of he variable that will be in Getx extended class whose value needs to be changed
  final String? labelText;
  double? iconSize;
  bool radioButtonApplied;
  List<Widget>? tailing;
  List<IconData>? tailingIcons;
  bool toggleColor; // Toggle icons color in trailing
  TextStyle? titleTextStyle;
  List<bool>? isExpandable; // Determines if a tile can expand
  List<Widget>? expandedWidgets; // Widgets shown when tiles expand
  Color? expandedTileColor; // Color for expanded tile
  Color? collapsedTileColor; // Color for collapsed tile
  BorderRadius? borderRadius; // Border radius for tiles
  Color? expandedContentBackground;
  CustomRadiotilesBloc({
    super.key,
    this.radioButtonApplied = true,
    this.tailing,
    required this.stringName,
    this.iconSize,
    this.tailingIcons,
    this.expandedContentBackground,
    this.toggleColor = true,
    this.titleTextStyle,
    this.currentOption,
    this.labelStyle,
    this.labelText = '',
    required this.options,
    this.isExpandable,
    this.expandedWidgets,
    this.expandedTileColor,
    this.collapsedTileColor,
    this.borderRadius,
  });

  @override
  State<CustomRadiotilesBloc> createState() => _CustomRadiotilesBlocState();
}

class _CustomRadiotilesBlocState extends State<CustomRadiotilesBloc> {
  late List<bool> expandedStates;
  AppControllers appControllers = Get.put(AppControllers());
  @override
  void initState() {
    super.initState();
    widget.currentOption = widget.options[0];
    expandedStates = List<bool>.filled(widget.options.length, false);
    if (widget.currentOption != null) {
      widget.stringName.value = widget.currentOption!;
    }
  }

  BorderRadius tileBorderRadius(int index) {
    if (index == 0) {
      return BorderRadius.only(
          topLeft: Radius.circular(7.r), topRight: Radius.circular(7.r));
    } else if (index == widget.options.length - 1) {
      return BorderRadius.only(
          bottomLeft: Radius.circular(7.r), bottomRight: Radius.circular(7.r));
    } else {
      return BorderRadius.circular(0.r);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.labelText!,
            style: widget.labelStyle ??
                TextStyle(
                    color: Colors.black,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold)),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.options.length,
          itemBuilder: (context, index) {
            bool isTileExpandable = widget.isExpandable?[index] ?? false;
            Widget? expandedContent = widget.expandedWidgets != null &&
                    index < widget.expandedWidgets!.length
                ? widget.expandedWidgets![index]
                : const SizedBox.shrink();

            bool isSelected = widget.currentOption == widget.options[index];

            return Container(
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue[100] : Colors.white,
                border: Border.all(
                  color: isSelected ? Colors.blue.shade700 : Colors.grey,
                  width: isSelected ? 1 : 0.5,
                ),
                borderRadius: widget.borderRadius ?? tileBorderRadius(index),
              ),
              child: isTileExpandable
                  ? ExpansionTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: tileBorderRadius(index),
                      ),
                      leading: widget.radioButtonApplied
                          ? Container(
                              height: 20.h,
                              width: 20.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected
                                    ? Colors.blue.shade700
                                    : Colors.transparent,
                                border: Border.all(
                                  width: 0.5,
                                  color: isSelected
                                      ? Colors.blue.shade700
                                      : Colors.grey,
                                ),
                              ),
                              child: isSelected
                                  ? Center(
                                      child: Container(
                                        height: 7.h,
                                        width: 7.h,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            )
                          : null,
                      trailing: widget.tailingIcons != null &&
                              index < widget.tailingIcons!.length
                          ? Icon(
                              widget.tailingIcons![index],
                              color: isSelected
                                  ? const Color.fromRGBO(25, 118, 210, 1)
                                  : Colors.grey[400],
                              size: widget.iconSize ?? 20.h,
                            )
                          : widget.tailing != null &&
                                  index < widget.tailing!.length
                              ? widget.tailing![index]
                              : null,
                      title: Text(
                        widget.options[index],
                        style: widget.titleTextStyle ??
                            TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      tilePadding: EdgeInsets.symmetric(horizontal: 16.w),
                      children: [
                        Container(
                          color: widget.expandedContentBackground ??
                              Colors.grey[300], // Expanded content background
                          padding: EdgeInsets.all(8.w),
                          child: expandedContent,
                        ),
                      ],
                      onExpansionChanged: (isExpanded) {
                        setState(() {
                          expandedStates[index] = isExpanded;
                          if (isExpanded) {
                            widget.currentOption = widget.options[index];
                            widget.stringName.value = widget.currentOption!;
                          }
                        });
                      },
                    )
                  : ListTile(
                      tileColor: isSelected ? Colors.blue[100] : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: tileBorderRadius(index),
                        side: BorderSide(
                          color:
                              isSelected ? Colors.blue.shade700 : Colors.grey,
                          width: isSelected ? 1 : 0.5,
                        ),
                      ),
                      leading: widget.radioButtonApplied
                          ? Container(
                              height: 20.h,
                              width: 20.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected
                                    ? Colors.blue.shade700
                                    : Colors.transparent,
                                border: Border.all(
                                  width: 0.5,
                                  color: isSelected
                                      ? Colors.blue.shade700
                                      : Colors.grey,
                                ),
                              ),
                              child: isSelected
                                  ? Center(
                                      child: Container(
                                        height: 7.h,
                                        width: 7.h,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            )
                          : null,
                      trailing: widget.tailingIcons != null &&
                              index < widget.tailingIcons!.length
                          ? Icon(
                              widget.tailingIcons![index],
                              color: isSelected
                                  ? const Color.fromRGBO(25, 118, 210, 1)
                                  : Colors.grey[400],
                              size: widget.iconSize ?? 20.h,
                            )
                          : widget.tailing != null &&
                                  index < widget.tailing!.length
                              ? widget.tailing![index]
                              : null,
                      title: Text(
                        widget.options[index],
                        style: widget.titleTextStyle ??
                            TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      onTap: () {
                        setState(() {
                          widget.currentOption = widget.options[index];
                          widget.stringName.value = widget.currentOption!;
                        });
                      },
                    ),
            );
          },
        ),
      ],
    );
  }
}
