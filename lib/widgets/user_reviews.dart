import 'dart:math';

import 'package:alisportspk/getx/appcontrollers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:get/get.dart';

class UserReviewsListtiles extends StatefulWidget {
  const UserReviewsListtiles({super.key});

  @override
  State<UserReviewsListtiles> createState() => _UserReviewsListtilesState();
}

class _UserReviewsListtilesState extends State<UserReviewsListtiles> {
  final CarouselSliderController _scrollController = CarouselSliderController();

  AppControllers appControllers = Get.put(AppControllers());
  int userIndex = 0;
  void scrollForward() {
    _scrollController.nextPage(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  void scrollBackward() {
    _scrollController.previousPage(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  double rating = 4.5;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 100.w),
      child: Column(
        children: [
          Row(children: [
            Container(
              height: 70.w,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              color: const Color(0xff399999),
              child: Center(
                child: Text(
                  'Let customers speak for us ',
                  style: TextStyle(
                    fontSize: 32.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Container(
              height: 70.w,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                  border: Border.all(
                color: const Color(0xff399999),
                width: 0.5,
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StarRating(
                    size: 30.0,
                    rating: rating,
                    color: const Color(0xff399999),
                    borderColor: const Color(0xff399999),
                    allowHalfRating: true,
                    starCount: 5,
                    onRatingChanged: (rating) => setState(() {
                      this.rating = rating;
                    }),
                  ),
                  Text(
                    'from 99 reviews ',
                    style: TextStyle(
                      fontSize: 20.sp,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w100,
                    ),
                  )
                ],
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Text(
              "Verified by ",
              style: TextStyle(
                color: const Color(0xff399999),
                fontSize: 18.sp,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(
                height: 30.w,
                width: 30.w,
                child: Image.network(
                  'assets/images/judgeme.jpeg',
                  height: 30.w,
                  width: 30.w,
                  fit: BoxFit.cover,
                )),
            Text(
              " Judge.me",
              style: TextStyle(
                color: const Color(0xff399999),
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
          ]),
          Obx(
            () => Container(
              margin: EdgeInsets.symmetric(vertical: 30.w),
              height: 900.w,
              width: 1500.w,
              child: CarouselSlider.builder(
                carouselController: _scrollController,
                options: CarouselOptions(
                  viewportFraction: 0.333,
                  autoPlay: true,
                  height: 50.w,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  enlargeFactor: 0.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      userIndex = index;
                    });
                  },
                  scrollDirection: Axis.vertical,
                ),
                itemCount: appControllers.userReviews.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  //  String key = userReviewsMap[index].keys.elementAt(index);
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 50.w),
                    height: 500.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 500.w,
                          width: 220.w,
                          child: Center(
                            child: Image.network(
                                appControllers.userReviews[index].image!),
                          ),
                        ),
                        Container(
                          color: Colors.grey[300],
                          height: 500.w,
                          width: 980.w,
                          padding: EdgeInsets.all(25.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 8.w),
                                child: Row(
                                  children: [
                                    Text.rich(TextSpan(
                                        text: appControllers
                                            .userReviews[index].name!,
                                        style: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: [
                                          TextSpan(
                                              text: ' reviewed ',
                                              style: TextStyle(
                                                fontSize: 22.sp,
                                                fontWeight: FontWeight.w100,
                                              )),
                                          TextSpan(
                                              text: appControllers
                                                  .userReviews[index].item!,
                                              style: TextStyle(
                                                  fontSize: 21.sp,
                                                  fontWeight: FontWeight.w100,
                                                  decoration: TextDecoration
                                                      .underline)),
                                        ])),
                                    const Expanded(
                                      child: SizedBox(),
                                    ),
                                    StarRating(
                                      size: 20.0,
                                      rating: appControllers
                                          .userReviews[index].rating,
                                      color: const Color(0xff399999),
                                      borderColor: const Color(0xff399999),
                                      allowHalfRating: true,
                                      starCount: 5,
                                      onRatingChanged: (rating) => setState(() {
                                        appControllers
                                            .userReviews[index].rating = rating;
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                              Text(appControllers.userReviews[index].review!,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w200,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  color: Colors.grey[300],
                  iconSize: 40.w,
                  onPressed: () {
                    scrollForward();
                    setState(() {});
                  },
                  icon: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationZ(pi * 1 / 2),
                    child: CachedNetworkImage(
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      imageUrl: 'assets/images/leftarrow.png',
                      height: 20.w,
                      width: 20.w,
                      color: Colors.grey[400],
                    ),
                  )),
              IconButton(
                  iconSize: 40.w,
                  color: Colors.grey[300],
                  onPressed: () {
                    scrollBackward();
                    setState(() {});
                  },
                  icon: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationZ(pi * 1 / 2),
                    child: CachedNetworkImage(
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      imageUrl: 'assets/images/rightarrow.png',
                      height: 20.w,
                      width: 20.w,
                      color: Colors.grey[400],
                    ),
                  )),
            ],
          ),
          Text(
            'Need help? Call us at [92 315 2273142] or write to us [alisportsbwn@gmail.com].',
            style: TextStyle(
                color: Colors.black.withOpacity(0.4),
                fontSize: 25.sp,
                fontWeight: FontWeight.w200),
          ),
          Container(
            margin: EdgeInsets.only(top: 18.w, bottom: 40.w),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 350.w),
            child: Wrap(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  " ONLINE PRICES AND SELECTION GENERALLY MATCH OUR RETAIL STORE, BUT MAY VARY. PRICES AND  OFFERS ARE SUBJECT TO CHANGE WITHOUT ANY PRIOR NOTICE.",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w200),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
