import 'package:alisportspk/widgets/Item_being_bought.dart';
import 'package:alisportspk/widgets/checkout_user_detailsForm.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyAndCheckout extends StatefulWidget {
  const BuyAndCheckout({super.key});

  @override
  State<BuyAndCheckout> createState() => _BuyAndCheckoutState();
}

class _BuyAndCheckoutState extends State<BuyAndCheckout> {
  String logoUrl =
      'https://cdn.shopify.com/s/files/1/0686/1914/1437/files/2021-12-24-12-47-02-291_x320.jpg?v=1670434406';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            width: MediaQuery.of(context).size.width,
            height: 250.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(
                      //   builder: (context) {
                      //     return const HomeScreen();
                      //   },
                      // ));
                    },
                    child: CachedNetworkImage(
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      imageUrl: logoUrl,
                      height: 150.w,
                      width: 150.w,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.local_mall_outlined,
                      weight: 0.5,
                    )),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.grey.shade300, width: 0.4))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [const CheckoutUserDetailsform(), ItemBeingBought()],
            ),
          )
        ],
      ),
    );
  }
}
