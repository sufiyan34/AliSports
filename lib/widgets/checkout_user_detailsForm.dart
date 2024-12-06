// ignore_for_file: file_names

import 'package:alisportspk/app_utills/custom_form_field.dart';
import 'package:alisportspk/app_utills/custom_radiotiles_bloc.dart';
import 'package:alisportspk/app_utills/myExperimentalWidgets/detailsform.dart';
import 'package:alisportspk/getx/appcontrollers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CheckoutUserDetailsform extends StatefulWidget {
  const CheckoutUserDetailsform({super.key});

  @override
  State<CheckoutUserDetailsform> createState() =>
      _CheckoutUserDetailsformState();
}

class _CheckoutUserDetailsformState extends State<CheckoutUserDetailsform> {
  final _formKey = GlobalKey<FormState>();
  AppControllers appControllers = Get.put(AppControllers());
  bool offerUpdates = true;
  bool saveinfo = true;

  TextEditingController email = TextEditingController();
  bool isChecked = true;

  String? billingaddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      padding: EdgeInsets.only(left: 100.w, right: 20.w),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Contact",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold)),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Log in",
                        style: TextStyle(
                            color: Colors.blue[600],
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
              CustomFormTextField(
                fieldController: email,
                labelText: 'Email',
                customizedValidation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  // Regex to validate email format
                  if (!RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              CheckboxListTile(
                value: isChecked,
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue[600],
                checkColor: Colors.white,
                title: Text(
                    "Sign up for order updates,exclusive offers and news via WhattsApp and Email",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400)),
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                },
              ),
              CustomRadiotilesBloc(
                options: const ['Ship', 'Pickup in store'],
                labelText: "Delivery",
                tailingIcons: const [
                  Icons.local_shipping_outlined,
                  Icons.storefront_sharp,
                ],
                toggleColor: true,
                stringName: appControllers.pickkupValue,
              ),
              SizedBox(height: 15.h),
              Obx(() {
                return appControllers.pickkupValue.value == 'Pickup in store'
                    ? SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Store locations",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.5,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "There is 1 store with stock close to your location",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.72),
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w400)),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text("Change my location",
                                            style: TextStyle(
                                                color: Colors.indigo[700],
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w400))),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 16.h),
                                decoration: BoxDecoration(
                                  color: Colors.blue[100],
                                  border: Border.all(
                                      color: Colors.blue[700]!, width: 0.7),
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.28,
                                      child: RichText(
                                        textAlign: TextAlign.left,
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Colors.black,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w300),
                                            text:
                                                "10-Municipal Shopping Plaza, Baldia Road, Bahawalnagar",
                                            children: [
                                              TextSpan(
                                                  text: " (203.8 km)\n",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.72),
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              TextSpan(
                                                  text:
                                                      "10-Municipal Shopping Plaza, Baldia Road, Bahawalnagar, Bahawalnagar",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.72),
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.w400))
                                            ]),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.12,
                                      child: RichText(
                                        textAlign: TextAlign.right,
                                        text: TextSpan(
                                            text: "Free\n",
                                            style: TextStyle(
                                                color: Colors.black,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 19.sp,
                                                fontWeight: FontWeight.bold),
                                            children: [
                                              TextSpan(
                                                  text:
                                                      "Usually ready in 24 hours",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.7),
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.w400))
                                            ]),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ]),
                      )
                    : Column(
                        children: [
                          const Detailsform(),
                          SizedBox(height: 15.h),
                          CheckboxListTile(
                            value: saveinfo,
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Colors.blue[600],
                            checkColor: Colors.white,
                            title: Text("Save this information for next time ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400)),
                            onChanged: (bool? value) {
                              setState(() {
                                saveinfo = value ?? false;
                              });
                            },
                            checkboxShape: const RoundedRectangleBorder(
                                side: BorderSide(width: 0.5)),
                          ),
                          SizedBox(height: 15.h),
                          CheckboxListTile(
                            checkboxShape: const RoundedRectangleBorder(
                                side: BorderSide(width: 0.5)),
                            value: offerUpdates,
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Colors.blue[600],
                            checkColor: Colors.white,
                            title: Text("text me with news and offers",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400)),
                            onChanged: (bool? value) {
                              setState(() {
                                offerUpdates = value ?? false;
                              });
                            },
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 14.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: Colors.lightBlue[100]!.withOpacity(0.5),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.blue[600]!,
                                )),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Standard",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  "Rs 300.00",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
              }),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.h),
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text("Shipping method",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold)),
              ),
              CustomRadiotilesBloc(
                options: const [
                  'PAYFAST(Pay via Debit/Credit/Wallet/Bank Account)',
                  'Cash on Delivery (COD)',
                  "Bank Deposit"
                ],
                labelText: "Payment",
                isExpandable: const [true, true, true],
                expandedWidgets: const [
                  Text(
                      "After clicking “Pay now”, you will be redirected to \n PAYFAST(Pay via Debit/Credit/Wallet/Bank Account) to\n complete your purchase securely."),
                  Text(
                      "Cash on delivery service is only available for orders within Pakistan."),
                  Text(
                      "Cash on delivery service is only available for orders within Pakistan.")
                ],
                toggleColor: true,
                stringName: appControllers.payment,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                margin: EdgeInsets.only(top: 25.h, bottom: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payment",
                      style: TextStyle(
                          fontSize: 30.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "All transactions are secure and encrypted.",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w200),
                    )
                  ],
                ),
              ),
              CustomRadiotilesBloc(
                stringName: appControllers.billingAddress,
                isExpandable: const [false, true],
                expandedWidgets: const [SizedBox.shrink(), Detailsform()],
                options: const [
                  'Same as shipping address',
                  'Use a different billing address'
                ],
                labelText: "Billing address",
              ),
              SizedBox(
                height: 25.h,
              )
            ],
          )),
    );
  }
}
 
 // TextFormField(
              //   controller: email,
              //   decoration: const InputDecoration(
              //     enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(width: 0.5, color: Colors.grey)),
              //     focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(width: 1, color: Colors.teal)),
              //     labelText: 'Email',
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter your email address';
              //     }
              //     // Regex to validate email format
              //     if (!RegExp(
              //             r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
              //         .hasMatch(value)) {
              //       return 'Please enter a valid email address';
              //     }
              //     return null;
              //   },
              // ),
               // DropdownButtonFormField(
              //   decoration: const InputDecoration(
              //     enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(width: 0.5, color: Colors.grey)),
              //     focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(width: 1, color: Colors.teal)),
              //     labelText: 'Country/Region',
              //   ),
              //   value: country,
              //   items: [
              //     DropdownMenuItem(
              //       enabled: false,
              //       value: null,
              //       child: Column(
              //         children: [
              //           Text(
              //             country,
              //             style:
              //                 TextStyle(fontSize: 20.sp, color: Colors.black),
              //           ),
              //           Text(
              //             "---",
              //             style:
              //                 TextStyle(fontSize: 20.sp, color: Colors.black),
              //           ),
              //         ],
              //       ),
              //     ),
              //     ...getDropdownCountries().map((country) => DropdownMenuItem(
              //           value: country,
              //           child: Text(country),
              //         )),
              //   ],
              //   onChanged: (value) {
              //     setState(() {
              //       country = value!;
              //     });
              //   },
              // ),
              // SizedBox(height: 15.h),
              // TextFormField(
              //   controller: phoneNumber,
              //   decoration: const InputDecoration(
              //     enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(width: 0.5, color: Colors.grey)),
              //     focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(width: 1, color: Colors.teal)),
              //     labelText: 'Contact Numbber',
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter your Contact';
              //     }
              //     return null;
              //   },
              // ),
              // SizedBox(height: 15.h),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     SizedBox(
              //       width: MediaQuery.of(context).size.width * 0.20,
              //       child: TextFormField(
              //         controller: firstName,
              //         decoration: const InputDecoration(
              //           enabledBorder: OutlineInputBorder(
              //               borderSide:
              //                   BorderSide(width: 0.5, color: Colors.grey)),
              //           focusedBorder: OutlineInputBorder(
              //               borderSide:
              //                   BorderSide(width: 1, color: Colors.teal)),
              //           labelText: 'First Name',
              //         ),
              //         validator: (value) {
              //           if (value == null || value.isEmpty) {
              //             return 'Please enter your First Name';
              //           }
              //           return null;
              //         },
              //       ),
              //     ),
              //     SizedBox(
              //       width: MediaQuery.of(context).size.width * 0.20,
              //       child: TextFormField(
              //         controller: lastName,
              //         decoration: const InputDecoration(
              //           enabledBorder: OutlineInputBorder(
              //               borderSide:
              //                   BorderSide(width: 0.5, color: Colors.grey)),
              //           focusedBorder: OutlineInputBorder(
              //               borderSide:
              //                   BorderSide(width: 1, color: Colors.teal)),
              //           labelText: 'Last Name',
              //         ),
              //         validator: (value) {
              //           if (value != null && value.isNotEmpty) {
              //             return value;
              //           }
              //           return null;
              //           // Valid if empty
              //         },
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 15.h),
              // TextFormField(
              //   controller: address,
              //   decoration: const InputDecoration(
              //     enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(width: 0.5, color: Colors.grey)),
              //     focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(width: 1, color: Colors.teal)),
              //     labelText: 'Address',
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter your Address';
              //     }
              //     return null;
              //   },
              // ),
              // SizedBox(height: 15.h),
              // TextFormField(
              //   controller: apartmentSuite,
              //   decoration: const InputDecoration(
              //     enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(width: 0.5, color: Colors.grey)),
              //     focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(width: 1, color: Colors.teal)),
              //     labelText: 'Apartment,suite, etc(optional)',
              //   ),
              //   validator: (value) {
              //     if (value != null && value.isNotEmpty) {
              //       return 'your appartment is :$value';
              //     }
              //     return null;
              //   },
              // ),
              // SizedBox(height: 15.h),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     SizedBox(
              //       width: MediaQuery.of(context).size.width * 0.20,
              //       child: TextFormField(
              //         controller: city,
              //         decoration: const InputDecoration(
              //           enabledBorder: OutlineInputBorder(
              //               borderSide:
              //                   BorderSide(width: 0.5, color: Colors.grey)),
              //           focusedBorder: OutlineInputBorder(
              //               borderSide:
              //                   BorderSide(width: 1, color: Colors.teal)),
              //           labelText: 'City',
              //         ),
              //         validator: (value) {
              //           if (value == null || value.isEmpty) {
              //             return 'Please enter your City Name';
              //           }
              //           return null;
              //         },
              //       ),
              //     ),
              //     SizedBox(
              //       width: MediaQuery.of(context).size.width * 0.20,
              //       child: TextFormField(
              //         controller: postalCode,
              //         decoration: const InputDecoration(
              //           enabledBorder: OutlineInputBorder(
              //               borderSide:
              //                   BorderSide(width: 0.5, color: Colors.grey)),
              //           focusedBorder: OutlineInputBorder(
              //               borderSide:
              //                   BorderSide(width: 1, color: Colors.teal)),
              //           labelText: 'Postalcode(optional)',
              //         ),
              //         validator: (value) {
              //           if (value != null && value.isNotEmpty) {
              //             return 'your Postalcode is :$value';
              //           }
              //           // Valid if empty
              //           return null;
              //         },
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 15.h),
              // TextFormField(
              //   controller: phoneNumber,
              //   decoration: InputDecoration(
              //     suffixIcon: InfoPopupWidget(
              //       contentTitle:
              //           'In case we need to contact you about your order',
              //       arrowTheme: InfoPopupArrowTheme(
              //         color: Colors.black.withOpacity(0.6),
              //         arrowDirection: ArrowDirection.down,
              //       ),
              //       contentTheme: InfoPopupContentTheme(
              //         infoContainerBackgroundColor:
              //             Colors.black.withOpacity(0.6),
              //         infoTextStyle:
              //             TextStyle(color: Colors.white, fontSize: 16.sp),
              //         contentPadding:
              //             EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
              //         contentBorderRadius:
              //             BorderRadius.all(Radius.circular(10.r)),
              //         infoTextAlign: TextAlign.center,
              //       ),
              //       child: Icon(
              //         Icons.help_outline,
              //         size: 20.h,
              //       ),
              //     ),
              //     enabledBorder: const OutlineInputBorder(
              //         borderSide: BorderSide(width: 0.5, color: Colors.grey)),
              //     focusedBorder: const OutlineInputBorder(
              //         borderSide: BorderSide(width: 1, color: Colors.teal)),
              //     hintText:
              //         'Phone number for orders, delivery & offer uppdates',
              //     labelText: "Phone number",
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isNotEmpty) {
              //       return 'Please enter your Phone number';
              //     }
              //     return null;
              //   },
              // ),
              // SizedBox(height: 15.h),
              ////////////////////////////////////////////////////////////////////
              /// List<String> deliveryOptions = ['Ship', 'Pickup in store'];
 // String? currentShippingOption;
 // currentShippingOption = deliveryOptions[0];
              // Text("Delivery",
              //     style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 25.sp,
              //         fontWeight: FontWeight.bold)),
             
              // ListTile(
              //   leading: Container(
              //       height: 20.h,
              //       width: 20.h,
              //       decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: currentShippingOption == deliveryOptions[0]
              //               ? Colors.blue.shade700
              //               : Colors.transparent,
              //           border: Border.all(
              //               width: 0.35,
              //               color: currentShippingOption == deliveryOptions[0]
              //                   ? Colors.blue.shade700
              //                   : Colors.grey[300]!)),
              //       child: currentShippingOption == deliveryOptions[0]
              //           ? Center(
              //               child: Container(
              //                 height: 7.h,
              //                 width: 7.h,
              //                 decoration: const BoxDecoration(
              //                   color: Colors.white,
              //                   shape: BoxShape.circle,
              //                 ),
              //               ),
              //             )
              //           : const SizedBox.shrink()),
              //   trailing: Icon(
              //     Icons.local_shipping_outlined,
              //     color: currentShippingOption == deliveryOptions[0]
              //         ? Colors.blue.shade700
              //         : Colors.grey[400],
              //     size: 20.h,
              //   ),
              //   title: Text("Ship",
              //       style: TextStyle(
              //           color: Colors.black,
              //           fontSize: 20.sp,
              //           fontWeight: FontWeight.w500)),
              //   tileColor: currentShippingOption == deliveryOptions[0]
              //       ? Colors.lightBlue.shade100
              //       : Colors.white,
              //   shape: RoundedRectangleBorder(
              //     side: BorderSide(
              //       color: currentShippingOption == deliveryOptions[0]
              //           ? Colors.blue.shade700
              //           : Colors.grey.shade300,
              //       width: currentShippingOption == deliveryOptions[0] ? 2 : 1,
              //     ),
              //     borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(7.r),
              //         topRight: Radius.circular(7.r)),
              //   ),
              //   onTap: () {
              //     currentShippingOption = deliveryOptions[0];
              //     setState(() {});
              //   },
              // ),
              // ListTile(
              //   leading: Container(
              //       height: 20.h,
              //       width: 20.h,
              //       decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: currentShippingOption == deliveryOptions[1]
              //               ? Colors.blue.shade700
              //               : Colors.transparent,
              //           border: Border.all(
              //               width: 0.35,
              //               color: currentShippingOption == deliveryOptions[1]
              //                   ? Colors.blue.shade700
              //                   : Colors.grey[300]!)),
              //       child: currentShippingOption == deliveryOptions[1]
              //           ? Center(
              //               child: Container(
              //                 height: 7.h,
              //                 width: 7.h,
              //                 decoration: const BoxDecoration(
              //                   color: Colors.white,
              //                   shape: BoxShape.circle,
              //                 ),
              //               ),
              //             )
              //           : const SizedBox.shrink()),
              //   trailing: Icon(
              //     Icons.storefront_sharp,
              //     color: currentShippingOption == deliveryOptions[1]
              //         ? Colors.blue.shade700
              //         : Colors.grey[400],
              //     size: 20.h,
              //   ),
              //   title: Text('Pickup in store',
              //       style: TextStyle(
              //           color: Colors.black,
              //           fontSize: 20.sp,
              //           fontWeight: FontWeight.w500)),
              //   tileColor: currentShippingOption == deliveryOptions[1]
              //       ? Colors.lightBlue.shade100
              //       : Colors.white,
              //   shape: RoundedRectangleBorder(
              //     side: BorderSide(
              //       color: currentShippingOption == deliveryOptions[1]
              //           ? Colors.blue.shade700
              //           : Colors.grey.shade300,
              //       width: currentShippingOption == deliveryOptions[1] ? 2 : 1,
              //     ),
              //     borderRadius: BorderRadius.only(
              //         bottomLeft: Radius.circular(7.r),
              //         bottomRight: Radius.circular(7.r)),
              //   ),
              //   onTap: () {
              //     currentShippingOption = deliveryOptions[1];

              //     setState(() {});
              //   },
              // ),
             