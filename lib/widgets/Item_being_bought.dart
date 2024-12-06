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
  double shippingPrice = 300.00;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey[300],
        padding: EdgeInsets.only(right: 100.w, left: 20.w),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 14.h),
                            badgeColor: Colors.black87,
                          ),
                          badgeContent: Text(
                            appControllers.productPurchaseQuantity.toString(),
                            style: GoogleFonts.notoSerifAhom(
                                fontSize: 10.sp, color: Colors.white),
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
                        RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.black),
                                text: "${chosenProduct.title!}\n",
                                children: [
                                  TextSpan(
                                    text: appControllers.productSize.value,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.black.withOpacity(0.8)),
                                  )
                                ])),
                      ],
                    ),
                    Text(appControllers.productDiscountedPrice.toString())
                  ],
                ),
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
                    Text(shippingPrice.toString()),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Toal",
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                    Text(
                        "PKR ${appControllers.productDiscountedPrice + shippingPrice}"),
                  ],
                )
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
