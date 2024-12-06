import 'package:alisportspk/datamodels/productInfo.dart';
import 'package:alisportspk/getx/appcontrollers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartDrawerCarteditemCarousal extends StatefulWidget {
  const CartDrawerCarteditemCarousal({super.key});

  @override
  State<CartDrawerCarteditemCarousal> createState() =>
      _CartDrawerCarteditemCarousalState();
}

class _CartDrawerCarteditemCarousalState
    extends State<CartDrawerCarteditemCarousal> {
  CarouselSliderController _cartItemscrollController =
      CarouselSliderController();
  AppControllers appControllers = Get.put(AppControllers());
  void cartItemsscrollForward() {
    _cartItemscrollController.nextPage(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  void cartItemsscrollBackward() {
    _cartItemscrollController.previousPage(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  Productinfo product = Productinfo();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: Colors.red,
          height: 200.h,
          width: 600.w,
          margin: EdgeInsets.only(top: 7.h, bottom: 20.h),
          child: CarouselSlider.builder(
            carouselController: _cartItemscrollController,
            options: CarouselOptions(
              viewportFraction: 1,
              height: MediaQuery.of(context).size.height,
              initialPage: 0,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (index, reason) {},
              scrollDirection: Axis.horizontal,
            ),
            itemCount: appControllers.addedInCartProducts.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: CachedNetworkImage(
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        imageUrl: appControllers
                            .addedInCartProducts[index].image
                            .toString(),
                        height: 200.h,
                        width: 200.w,
                      ),
                    ),
                    SizedBox(
                      height: 200.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 350.w,
                            child: Text(
                              appControllers.addedInCartProducts[index].title
                                  .toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 24.sp),
                            ),
                          ),
                          Text(
                            appControllers
                                .addedInCartProducts[index].textualPrice
                                .toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w300,
                                fontSize: 22.sp),
                          ),
                          InkWell(
                            onTap: () {
                              product =
                                  appControllers.addedInCartProducts[index];
                              appControllers.addedInCartProducts
                                  .remove(product);
                              appControllers.removeSuggestionForProducs();
                              setState(() {});
                            },
                            child: Container(
                              height: 40.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(5.r)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.delete_sharp,
                                      size: 16.h,
                                      color: Colors.white.withOpacity(0.8)),
                                  SizedBox(width: 4.w),
                                  Text("Delete",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colors.white.withOpacity(0.8)))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(
          width: 600.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    cartItemsscrollBackward();
                    setState(() {});
                  },
                  icon: CachedNetworkImage(
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageUrl: 'assets/images/leftarrow.png',
                    height: 20.w,
                    width: 20.w,
                  )),
              IconButton(
                  onPressed: () {
                    cartItemsscrollForward();
                    setState(() {});
                  },
                  icon: CachedNetworkImage(
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageUrl: 'assets/images/rightarrow.png',
                    height: 20.w,
                    width: 20.w,
                  )),
            ],
          ),
        )
      ],
    );
  }
}
