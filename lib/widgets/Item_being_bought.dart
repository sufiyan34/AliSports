import 'package:alisportspk/app_utills/custom_form_field.dart';
import 'package:alisportspk/getx/appcontrollers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:badges/badges.dart' as badges;
import 'package:google_fonts/google_fonts.dart';

class ItemBeingBought extends StatelessWidget {
  ItemBeingBought({super.key});
  AppControllers appControllers = Get.put(AppControllers());
  TextEditingController discountCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        padding: EdgeInsets.only(right: 120.w, left: 50.w, top: 40.h),
        child: Obx(
          () {
            final chosenProduct = appControllers.choosenProduct.value;

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        badges.Badge(
                          badgeStyle: badges.BadgeStyle(
                            // padding: EdgeInsets.symmetric(
                            //     horizontal: 10.w, vertical: 14.h),
                            badgeColor: Colors.black.withOpacity(0.75),
                          ),
                          badgeContent: Center(
                            child: Text(
                              appControllers.productPurchaseQuantity.toString(),
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.white),
                            ),
                          ),
                          child: Container(
                            height: 80.w,
                            width: 80.w,
                            padding: EdgeInsets.all(10.h),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.r),
                                border: Border.all(
                                    width: 1, color: Colors.grey[300]!)),
                            child: Center(
                              child: CachedNetworkImage(
                                height: 60.h,
                                width: 60.w,
                                imageUrl: chosenProduct.image!.toString(),
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                                style: TextStyle(
                                    fontSize: 18.sp, color: Colors.black),
                                text: "${chosenProduct.title!}\n",
                                children: [
                                  TextSpan(
                                    text: appControllers.productSize.value,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.grey[800]),
                                  )
                                ])),
                      ],
                    ),
                    Text(
                      appControllers.productDiscountedPrice.toString(),
                      style: TextStyle(fontSize: 18.sp, color: Colors.black),
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SizedBox(
                      width: 500.w,
                      child: CustomFormTextField(
                        fieldController: discountCode,
                        labelText: "Discount code",
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 55.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.grey.shade400)),
                        child: Center(
                          child: Text(
                            "Apply",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                                color: Colors.blueGrey[600]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Text(
                      "Subtotal",
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                    Text(appControllers.productDiscountedPrice.toString()),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Text(
                      "Shipping",
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          _showMyDialog(context);
                        },
                        icon: Icon(
                          Icons.help_outline_sharp,
                          color: Colors.grey.shade800,
                          size: 14.h,
                        )),
                    Text(appControllers.productShippingPrice.value.toString()),
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Text(
                      "Toal",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "PKR",
                      style: TextStyle(
                          fontSize: 18.sp, color: Colors.grey.shade800),
                    ),
                    Text(
                      " ${appControllers.productDiscountedPrice + 300.00
                      //appControllers.productShippingPrice.value
                      }",
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
              ],
            );
          },
        ));
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // User must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(20.0),
        title: Row(
          children: [
            Text(
              'Shipping policy',
              style:
                  GoogleFonts.catamaran(color: Colors.black, fontSize: 28.sp),
            ),
            IconButton(
              icon: Icon(
                Icons.close_outlined,
                color: Colors.grey[800],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        content: RichText(
            text: TextSpan(
                style:
                    GoogleFonts.catamaran(color: Colors.black, fontSize: 28.sp),
                text:
                    "We offer nationwide shipping across Pakistan, with delivery options available for major cities and rural areas.",
                children: [
              TextSpan(
                  style: GoogleFonts.catamaran(
                      color: Colors.black.withOpacity(0.9), fontSize: 20.sp),
                  text: "\nOrders are processed and shipped within 1-3 business days of receipt.Shipping fees are calculated based on the weight of the order and the delivery location.\n" +
                      "For standard shipping, delivery times are estimated at 3-5 business days within Pakistan.\n" +
                      "In the event of any delays or shipping-related issues, our customer service team will be available to assist you.\n" +
                      "We take pride in our secure packaging to ensure your products arrive in the same condition as they left our facility.")
            ])),
      );
    },
  );
}
