import 'package:alisportspk/app_utills/custom_form_field.dart';
import 'package:alisportspk/app_utills/myExperimentalWidgets/detailsform.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int selectedIndex = -1;
  double selected = 0;
  List<String> popupOptions = [
    "option 1",
    "option 2",
    "option 3",
    "option 4",
    "option 5"
  ];
  final List<String> selectedOptions = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  List<IconData> tailingIcons = [
    Icons.local_shipping_outlined,
    Icons.storefront_sharp,
  ];
  void _onContainerTap(int index) {
    setState(() {
      selectedIndex = index;
    }); // Perform any action with the selected container index or value here
    debugPrint('Selected container index: $index');
  }

  Widget _buildSelectableContainer({required int index, required Text text}) {
    return GestureDetector(
      onTap: () => _onContainerTap(index),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 16.0.w),
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: selectedIndex == index ? Colors.blue : Colors.grey,
            width: 2.0,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 20.h,
              height: 20.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectedIndex == index ? Colors.blue : Colors.black,
              ),
            ),
            SizedBox(width: 16.0.w),
            text,
          ],
        ),
      ),
    );
  }

//   Widget customFormTextField({required TextEditingController fieldController, required Text text,InputDecoration? decoration
//    ,TextInputType? keyboardType, TextInputAction? textInputAction,TextStyle? style,
//   StrutStyle? strutStyle,
//   TextDirection? textDirection,
//   TextAlign textAlign = TextAlign.start,
//   TextAlignVertical? textAlignVertical,
//   bool autofocus = false,
//   bool readOnly = false,
//    String obscuringCharacter = '•',
//   bool obscureText = false,
//   bool autocorrect = true,
//   SmartDashesType? smartDashesType,
//   SmartQuotesType? smartQuotesType,
//   bool enableSuggestions = true,
//   MaxLengthEnforcement? maxLengthEnforcement,
//   int? maxLines = 1,
//   int? minLines,
//   bool expands = false,
//   int? maxLength,
//   String? errorMessage,
//    final String? Function(String?) customizedValidation,
//     Widget? prefixIcon,
//    Widget? suffixIcon,
//   void Function(String)? onChanged,
//   void Function()? onTap,
//   }) {
//     return TextFormField(

//       controller: fieldController,
//       decoration: InputDecoration(
//           prefixIcon:prefixIcon,
//       suffixIcon:suffixIcon,
//         enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(width: 0.5, color: Colors.grey)),
//         focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(width: 1, color: Colors.teal)),
//         labelText: 'Address',
//       ),
//       keyboardType: keyboardType, textInputAction: textInputAction,style: style,
//  strutStyle: strutStyle,
//   textDirection: textDirection,
//    textAlign :textAlign,
//   textAlignVertical: textAlignVertical,
//   autofocus : autofocus,
//   readOnly: readOnly,
//    obscuringCharacter: obscuringCharacter ,
//   obscureText :obscureText,
//   autocorrect:autocorrect ,
//  smartDashesType: smartDashesType,
//   smartQuotesType: smartQuotesType,
//  enableSuggestions:enableSuggestions ,
//   maxLengthEnforcement: maxLengthEnforcement,
//   maxLines: maxLines ,
//   minLines: minLines,
//   expands:expands,
//   maxLength: maxLength,
//   onChanged:onChanged,
//    onTap: onTap,

//       validator:customizedValidation ,
//     );
//   }
  List<String> options = ['Ship', 'Pickup in store'];
  String? currentOption;
  List<String> billingoptions = [
    'Same as shipping address',
    'Use a different billing address'
  ];
  String? BillingOption;
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      currentOption = options[0];
      BillingOption = billingoptions[0];
    }

    BorderRadius tileBorderRadius(int index) {
      if (index == 0) {
        return BorderRadius.only(
            topLeft: Radius.circular(7.r), topRight: Radius.circular(7.r));
      } else if (index == options.length - 1) {
        return BorderRadius.only(
            bottomLeft: Radius.circular(7.r),
            bottomRight: Radius.circular(7.r));
      } else {
        return BorderRadius.circular(0.r);
      }
    }

    return Scaffold(
        body: ListView(shrinkWrap: true, children: [
      SizedBox(
        height: 50.h,
      ),
      _buildSelectableContainer(
        index: 0,
        text: Text(
          'First Container',
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
      _buildSelectableContainer(
        index: 1,
        text: Text('Second Container', style: TextStyle(fontSize: 20.sp)),
      ),
      Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Field with Default Validation
            CustomFormTextField(
              fieldController: _nameController,
              labelText: 'Name',
            ),
            const SizedBox(height: 20),

            // Field with Custom Validation
            CustomFormTextField(
              fieldController: _emailController,
              labelText: 'Email',
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email),
              customizedValidation: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required!';
                }
                if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                    .hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Form submitted successfully!')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
            const Detailsform(),
            Column(
              children: [
                Text("Delivery",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold)),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: ListTile(
                        tileColor: currentOption == options[index]
                            ? Colors.blue[100]
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: tileBorderRadius(index),
                          side: BorderSide(
                            color: currentOption == options[index]
                                ? Colors.blue.shade700
                                : Colors.grey,
                            width: currentOption == options[index] ? 1 : 0.5,
                          ),
                        ),
                        leading: Container(
                          height: 20.h,
                          width: 20.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentOption == options[index]
                                ? Colors.blue.shade700
                                : Colors.transparent,
                            border: Border.all(
                              width: 0.5,
                              color: currentOption == options[index]
                                  ? Colors.blue.shade700
                                  : Colors.grey,
                            ),
                          ),
                          child: currentOption == options[index]
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
                        ),
                        trailing: Icon(
                          tailingIcons[index],
                          color: currentOption == options[index]
                              ? const Color.fromRGBO(25, 118, 210, 1)
                              : Colors.grey[400],
                          size: 20.h,
                        ),
                        title: Text(
                          options[index],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            currentOption = options[index];
                          });
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            Column(
              children: [
                Text("Billing address",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold)),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: ListTile(
                        tileColor: BillingOption == billingoptions[index]
                            ? Colors.blue[100]
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: tileBorderRadius(index),
                          side: BorderSide(
                            color: BillingOption == billingoptions[index]
                                ? Colors.blue.shade700
                                : Colors.grey,
                            width: BillingOption == billingoptions[index]
                                ? 1
                                : 0.5,
                          ),
                        ),
                        leading: Container(
                          height: 20.h,
                          width: 20.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: BillingOption == billingoptions[index]
                                ? Colors.blue.shade700
                                : Colors.transparent,
                            border: Border.all(
                              width: 0.5,
                              color: BillingOption == billingoptions[index]
                                  ? Colors.blue.shade700
                                  : Colors.grey,
                            ),
                          ),
                          child: BillingOption == billingoptions[index]
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
                        ),
                        title: Text(
                          billingoptions[index],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            BillingOption == billingoptions[index];
                          });
                        },
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
      PopupMenuButton(
        position: PopupMenuPosition.under,
        menuPadding: EdgeInsets.symmetric(horizontal: 12.w),
        child: const Row(
          children: [Text("options"), Icon(Icons.keyboard_arrow_down)],
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
                    Text("${selected} selected"),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Reset",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                )),
            ...popupOptions.map((item) => PopupMenuItem(
                value: item,
                child: Row(
                  children: [
                    Container(
                      height: 30.h,
                      width: 30.h,
                      decoration: BoxDecoration(border: Border.all()),
                      child: selectedOptions.contains(item)
                          ? const Center(
                              child: Icon(Icons.check, color: Colors.black))
                          : null,
                    ),
                    Text(item)
                  ],
                )))
          ];
        },
      )
    ]));
  }
}

// Track the selected container index (-1 means none)
