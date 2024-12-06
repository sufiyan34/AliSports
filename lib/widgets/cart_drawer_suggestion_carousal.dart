import 'package:alisportspk/datamodels/productInfo.dart';
import 'package:alisportspk/getx/appcontrollers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartDrawerSuggestionCarousal extends StatefulWidget {
  const CartDrawerSuggestionCarousal({super.key});

  @override
  State<CartDrawerSuggestionCarousal> createState() =>
      _CartDrawerSuggestionCarousalState();
}

class _CartDrawerSuggestionCarousalState
    extends State<CartDrawerSuggestionCarousal> {
  CarouselSliderController _scrollController = CarouselSliderController();
  Productinfo product = Productinfo();
  AppControllers appControllers = Get.put(AppControllers());
  void scrollForward() {
    _scrollController.nextPage(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  void scrollBackward() {
    _scrollController.previousPage(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              scrollBackward();
              setState(() {});
            },
            icon: CachedNetworkImage(
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: 'assets/images/leftarrow.png',
              height: 20.w,
              color: Colors.grey,
              width: 20.w,
            )),
        Container(
          height: 100.h,
          width: 400.w,
          margin: EdgeInsets.only(top: 7.h, bottom: 20.h),
          child: CarouselSlider.builder(
            carouselController: _scrollController,
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
            itemCount: appControllers.suggestionProductsRelatedToCart.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              // TextViewRespectiveToSlider.currentPageIndex = index;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageUrl: appControllers
                        .suggestionProductsRelatedToCart[index].image
                        .toString(),
                    height: 80.h,
                    width: 100.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: Text(
                          appControllers
                              .suggestionProductsRelatedToCart[index].title
                              .toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w300,
                              fontSize: 20.sp),
                        ),
                      ),
                      Text(
                        appControllers
                            .suggestionProductsRelatedToCart[index].textualPrice
                            .toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      product =
                          appControllers.suggestionProductsRelatedToCart[index];
                      appControllers.addedInCartProducts.add(product);
                      appControllers.suggestionForProducs();
                      setState(() {});
                    },
                    child: Container(
                      height: 40.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Center(
                        child: Text("Add to cart",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black.withOpacity(0.9))),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
        IconButton(
            onPressed: () {
              scrollForward();
              setState(() {});
            },
            icon: CachedNetworkImage(
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: 'assets/images/rightarrow.png',
              height: 20.w,
              color: Colors.grey,
              width: 20.w,
            )),
      ],
    );
  }
}
