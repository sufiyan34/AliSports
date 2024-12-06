import 'package:alisportspk/datamodels/productInfo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderScreenLists extends StatefulWidget {
  final Productinfo productinfo;
  const OrderScreenLists({super.key, required this.productinfo});

  @override
  State<OrderScreenLists> createState() => _OrderScreenListsState();
}

class _OrderScreenListsState extends State<OrderScreenLists> {
  List<Productinfo> suggestionsProducts = [];
  List<Productinfo> trendingProducts = [];
  @override
  void initState() {
    suggestionsProducts = Productinfo.productinfo
        .where((product) =>
            product.mainCategory == widget.productinfo.mainCategory ||
            product.brand == widget.productinfo.brand)
        .toList();

    //////Initiall iam settting it equal to orignal list but it needs to be changed when i have more data //////
    trendingProducts = Productinfo.productinfo;

    super.initState();
  }

  final PageController _trendingListScrollController = PageController();
  void trendingListScrollForward() {
    _trendingListScrollController.animateTo(
      _trendingListScrollController.position.pixels +
          _trendingListScrollController.position.viewportDimension,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  void trendingListScrollBackward() {
    _trendingListScrollController.animateTo(
      _trendingListScrollController.position.pixels -
          _trendingListScrollController.position.viewportDimension,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 420.h,
          margin: EdgeInsets.symmetric(horizontal: 300.w, vertical: 20.h),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: suggestionsProducts.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                height: 300.h,
                width: 200.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: CachedNetworkImage(
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        imageUrl: suggestionsProducts[index].image.toString(),
                        height: 200.h,
                        width: 200.w,
                      ),
                    ),
                    Text(
                      suggestionsProducts[index].title.toString(),
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w300,
                          fontSize: 22.sp),
                    ),
                    Text(
                      suggestionsProducts[index].textualPrice.toString(),
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w300,
                          fontSize: 20.sp),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 300.w, vertical: 20.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    trendingListScrollBackward();
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
              Expanded(
                child: Container(
                  height: 420.h,
                  margin:
                      EdgeInsets.symmetric(horizontal: 300.w, vertical: 20.h),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _trendingListScrollController,
                    itemCount: trendingProducts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        height: 400.h,
                        width: 200.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: CachedNetworkImage(
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                imageUrl:
                                    trendingProducts[index].image.toString(),
                                height: 300.h,
                                width: 200.w,
                              ),
                            ),
                            Text(
                              trendingProducts[index].title.toString(),
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 22.sp),
                            ),
                            Text(
                              trendingProducts[index].brand.toString(),
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 22.sp),
                            ),
                            Text(
                              trendingProducts[index].textualPrice.toString(),
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20.sp),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    trendingListScrollForward();
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
