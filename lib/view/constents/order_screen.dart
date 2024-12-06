import 'package:alisportspk/datamodels/productInfo.dart';
import 'package:alisportspk/getx/appcontrollers.dart';
import 'package:alisportspk/view/constents/bottom_page.dart';
import 'package:alisportspk/view/constents/buy_and_checkout.dart';
import 'package:alisportspk/view/constents/laptop_app_bar.dart';
import 'package:alisportspk/widgets/brands_scrolling_list.dart';
import 'package:alisportspk/widgets/cart_drawer.dart';
import 'package:alisportspk/widgets/mobile_ap_bar.dart';
import 'package:alisportspk/widgets/write_your_review.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:share_plus_dialog/share_plus_dialog.dart';

class OrderItemScreen extends StatefulWidget {
  final Productinfo productinfo;

  const OrderItemScreen({super.key, required this.productinfo});
  @override
  State<OrderItemScreen> createState() => _OrderItemScreenState();
}

class _OrderItemScreenState extends State<OrderItemScreen> {
  @override
  void initState() {
    showcaseImage = widget.productinfo.image.toString();

    totalQuantity = widget.productinfo.quantity!;

    priceWithDiscount = widget.productinfo.price! -
        (widget.productinfo.price! * (widget.productinfo.discount! / 100));

    _scrollControllerPopupContainer.addListener(_listenToScroll);
    suggestionsProducts = Productinfo.productinfo
        .where((product) =>
            product.mainCategory == widget.productinfo.mainCategory ||
            product.brand == widget.productinfo.brand)
        .toList();
    trendingProducts = Productinfo.productinfo;

    super.initState();
  }

  final DateTime orderDate = DateTime.now();
  String? hoverOverSize;
  final DateFormat dateFormatter = DateFormat('MMM/dd');

  String? formattedDate;
  AppControllers appControllers = Get.put(AppControllers());
  List<Productinfo> trendingProducts = [];
  bool togle = false;
  int? itemindex;
  String pickUpLocation =
      " Pickup available at 10-Municipal Shopping Plaza,Baldia Road, Bahawalnagar";
  int? cartButton;
  String sizeValue = 'M';
  bool image1 = true;
  String? showcaseImage;
  final HtmlEditorController controller = HtmlEditorController();
  double? priceWithDiscount;

  bool boldUnderlineStroeInfoButton = false;
  bool boldUnderlineTextButton = false;
  ScrollController _scrollControllerPopupContainer = ScrollController();
  bool _isVisible = false;
  var orderQuantity = 1;
  List<Productinfo> suggestionsProducts = [];

  int? totalQuantity;
  CarouselSliderController _scrollController = CarouselSliderController();
  void scrollForward() {
    _scrollController.nextPage(
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  void _listenToScroll() {
    if (_scrollControllerPopupContainer.offset >= 100) {
      setState(() {
        _isVisible = true;
      });
    } else {
      setState(() {
        _isVisible = false;
      });
    }
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
  void dispose() {
    _scrollControllerPopupContainer.dispose();
    super.dispose();
  }

  void scrollBackward() {
    _scrollController.previousPage(
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        endDrawer: const CartDrawer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: AnimatedContainer(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 4.4),
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
          height: _isVisible ? 65.h : 0,
          color: const Color.fromARGB(255, 13, 31, 48),
          width: _isVisible ? MediaQuery.of(context).size.width : 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.productinfo.title.toString(),
                      style: GoogleFonts.robotoSlab(
                          fontSize: 16.sp, color: Colors.white),
                    ),
                    Wrap(
                      children: [
                        Text(
                          "Rs.${widget.productinfo.price.toString()} PKR",
                          style: GoogleFonts.robotoSlab(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 16.sp,
                              color: Colors.grey),
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          "Rs.$priceWithDiscount PKR",
                          style: GoogleFonts.robotoSlab(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 55.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          sizeValue,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        PopupMenuButton(
                          initialValue: sizeValue,
                          position: PopupMenuPosition.over,
                          icon: Icon(Icons.keyboard_arrow_down),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                                value: "S",
                                child: Center(
                                    child: Text(
                                  "S",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w500),
                                ))),
                            PopupMenuItem(
                                value: "M",
                                child: Center(
                                    child: Text(
                                  "M",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w500),
                                ))),
                            PopupMenuItem(
                                value: "L",
                                child: Center(
                                    child: Text(
                                  "L",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w500),
                                )))
                          ],
                          onSelected: (value) {
                            sizeValue = value;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 3.5.w),
                    height: 55.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.r),
                        bottomLeft: Radius.circular(8.r),
                      ),
                    ),
                    child: Center(
                      child: IconButton(
                          iconSize: 14.h,
                          onPressed: () {
                            orderQuantity == 0 ? null : orderQuantity--;
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.black,
                          )),
                    ),
                  ),
                  Container(
                    height: 55.h,
                    width: 35.w,
                    margin: EdgeInsets.symmetric(horizontal: 0.5.w),
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        "$orderQuantity",
                        style: GoogleFonts.robotoSlab(
                            fontSize: 16.sp, fontWeight: FontWeight.w200),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 3.5.w),
                    height: 55.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8.r),
                        bottomRight: Radius.circular(8.r),
                      ),
                      color: Colors.white,
                    ),
                    child: Center(
                        child: IconButton(
                            iconSize: 14.h,
                            onPressed: () {
                              orderQuantity == totalQuantity
                                  ? null
                                  : orderQuantity++;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                            ))),
                  ),
                  InkWell(
                    onTap: () {
                      appControllers.addedInCartProducts
                          .add(widget.productinfo);
                      appControllers.suggestionForProducs();
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 3.5.w),
                      height: 55.h,
                      width: 500.w,
                      child: Card(
                        color: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.r)),
                        child: Center(
                            child: Text("Add To Cart",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.sp))),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        body: CustomScrollView(
          controller: _scrollControllerPopupContainer,
          slivers: [
            SliverAppBar(
              pinned: false,
              floating: true,
              flexibleSpace: ResponsiveBuilder(
                builder: (context, sizingInformation) {
                  if (sizingInformation.deviceScreenType ==
                      DeviceScreenType.desktop) {
                    return const LaptopAppBar();
                  } else {
                    return const MobileAppBar();
                  }
                },
              ),
              toolbarHeight: 280.w,
              backgroundColor: const Color(0xff274d72),
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () {
                      debugPrint(
                          ' should open: ${appControllers.openMenuContainer.value}, open index no: ${appControllers.dropdownPlutoMenusIndex.value}');
                      return appControllers.openMenuContainer.value == true
                          ? Container(
                              color: Colors.white.withOpacity(0.90),
                              width: MediaQuery.of(context).size.width,
                              child: appControllers.dropdownPlutoMenus[
                                  appControllers.dropdownPlutoMenusIndex.value],
                            )
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            );
                    },
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.4))),
                            height: 700.w,
                            width: 500.w,
                            margin: EdgeInsets.only(
                                left: 300.w,
                                right: 200.w,
                                top: 50.w,
                                bottom: 50.w),
                            child: Image.network(
                              showcaseImage!,
                              height: 700.w,
                              width: 500.w,
                            ),
                          ),
                          Row(
                            children: [
                              InkWell(
                                hoverColor: Colors.transparent,
                                onTap: () {
                                  showcaseImage = widget.productinfo.image;
                                  widget.productinfo.image.toString();
                                  image1 = true;
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: image1 == true
                                              ? Colors.black
                                              : Colors.transparent)),
                                  height: 200.w,
                                  width: 250.w,
                                  margin: EdgeInsets.only(
                                    left: 300.w,
                                  ),
                                  child: Image.network(
                                      widget.productinfo.image.toString()),
                                ),
                              ),
                              InkWell(
                                hoverColor: Colors.transparent,
                                onTap: () {
                                  showcaseImage = widget.productinfo.image2;
                                  widget.productinfo.image2.toString();
                                  image1 = false;
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: image1 == false
                                              ? Colors.black
                                              : Colors.transparent)),
                                  height: 200.w,
                                  width: 250.w,
                                  margin: EdgeInsets.only(
                                    right: 200.w,
                                  ),
                                  child: Image.network(
                                      widget.productinfo.image2.toString()),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 50.w, bottom: 50.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Reach",
                              style: TextStyle(
                                  fontSize: 20.sp, color: Colors.black54),
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            SizedBox(
                              width: 500.w,
                              child: Text(
                                widget.productinfo.title.toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 45.sp, color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Wrap(
                              children: [
                                Text(
                                  "Rs.${widget.productinfo.price.toString()} PKR",
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 30.sp,
                                      color: Colors.black54),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "Rs.$priceWithDiscount PKR",
                                  style: TextStyle(
                                    fontSize: 30.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Card(
                              color: const Color(0xff5b20e6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 7.w),
                                child: Text(
                                    "Sale ${widget.productinfo.discount.toString()}% Off",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white.withOpacity(0.85))),
                              ),
                            ),
                            SizedBox(
                              height: 3.w,
                            ),
                            Wrap(
                              children: [
                                MouseRegion(
                                  onEnter: (event) {
                                    boldUnderlineTextButton = true;
                                    setState(() {});
                                  },
                                  onExit: (event) {
                                    boldUnderlineTextButton = false;
                                    setState(() {});
                                  },
                                  child: InkWell(
                                      hoverColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {},
                                      child: Text(
                                        "Shipping",
                                        style: TextStyle(
                                          color: boldUnderlineTextButton
                                              ? Colors.black
                                              : Colors.black.withOpacity(0.85),
                                          fontSize: boldUnderlineTextButton
                                              ? 17.sp
                                              : 16.sp,
                                          decoration: TextDecoration.underline,
                                          decorationColor:
                                              boldUnderlineTextButton
                                                  ? Colors.black
                                                  : Colors.black
                                                      .withOpacity(0.85),
                                          decorationThickness:
                                              boldUnderlineTextButton ? 2 : 1,
                                          fontWeight: boldUnderlineTextButton
                                              ? FontWeight.w400
                                              : FontWeight.w200,
                                        ),
                                      )),
                                ),
                                SizedBox(width: 3.w),
                                Text("Calculated at checkout",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.black.withOpacity(0.85))),
                              ],
                            ),
                            SizedBox(
                              height: 8.w,
                            ),
                            Text("Size",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.black.withOpacity(0.85))),
                            SizedBox(
                              height: 6.w,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    sizeValue = "S";
                                    setState(() {});
                                  },
                                  child: MouseRegion(
                                    onEnter: (event) {
                                      hoverOverSize = "S";
                                      setState(() {});
                                    },
                                    onExit: (event) {
                                      hoverOverSize = null;
                                      setState(() {});
                                    },
                                    child: Tooltip(
                                      message: 'Small Size (S)',
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 5.h),
                                      child: Card(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                        ),
                                        elevation: hoverOverSize == "S" ||
                                                sizeValue == "S"
                                            ? 2
                                            : 0,
                                        color: hoverOverSize == "S" ||
                                                sizeValue == "S"
                                            ? Colors.black
                                            : Colors.transparent,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 0.7)),
                                          height: 60.w,
                                          width: 60.w,
                                          child: Center(
                                            child: Text(
                                              "S",
                                              style: TextStyle(
                                                fontSize: 25.sp,
                                                fontWeight: FontWeight.w200,
                                                color: hoverOverSize == "S" ||
                                                        sizeValue == "S"
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    sizeValue = "M";
                                    setState(() {});
                                  },
                                  child: MouseRegion(
                                    onEnter: (event) {
                                      hoverOverSize = "M";
                                      setState(() {});
                                    },
                                    onExit: (event) {
                                      hoverOverSize = null;
                                      setState(() {});
                                    },
                                    child: Tooltip(
                                      message: 'Medium Size (M)',
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 5.h),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 15.w),
                                        child: Card(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero,
                                          ),
                                          elevation: hoverOverSize == "M" ||
                                                  sizeValue == "M"
                                              ? 2
                                              : 0,
                                          color: hoverOverSize == "M" ||
                                                  sizeValue == "M"
                                              ? Colors.black
                                              : Colors.transparent,
                                          child: Container(
                                            height: 60.w,
                                            width: 60.w,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 0.7)),
                                            child: Center(
                                              child: Text(
                                                "M",
                                                style: TextStyle(
                                                  fontSize: 25.sp,
                                                  color: hoverOverSize == "M" ||
                                                          sizeValue == "M"
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontWeight: FontWeight.w200,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    sizeValue = "L";
                                    setState(() {});
                                  },
                                  child: MouseRegion(
                                    onEnter: (event) {
                                      hoverOverSize = "L";
                                      setState(() {});
                                    },
                                    onExit: (event) {
                                      hoverOverSize = null;
                                      setState(() {});
                                    },
                                    child: Tooltip(
                                      message: 'Large Size (L)',
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 5.h),
                                      child: Card(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                        ),
                                        elevation: hoverOverSize == "L" ||
                                                sizeValue == "L"
                                            ? 2
                                            : 0,
                                        color: hoverOverSize == "L" ||
                                                sizeValue == "L"
                                            ? Colors.black
                                            : Colors.transparent,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 0.7)),
                                          height: 60.w,
                                          width: 60.w,
                                          child: Center(
                                            child: Text(
                                              "L",
                                              style: TextStyle(
                                                fontSize: 25.sp,
                                                color: hoverOverSize == "L" ||
                                                        sizeValue == "L"
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontWeight: FontWeight.w200,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 3.w,
                            ),
                            Text(
                              "Quantity",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w200),
                            ),
                            SizedBox(
                              height: 4.w,
                            ),
                            Container(
                              height: 60.w,
                              width: 160.w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 0.7)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        iconSize: 20.w,
                                        onPressed: () {
                                          orderQuantity == 0
                                              ? null
                                              : orderQuantity--;
                                          setState(() {});
                                        },
                                        icon: const Icon(Icons.remove)),
                                    Text(
                                      "$orderQuantity",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w200),
                                    ),
                                    IconButton(
                                        iconSize: 20.w,
                                        onPressed: () {
                                          orderQuantity == totalQuantity
                                              ? null
                                              : orderQuantity++;
                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                        ))
                                  ]),
                            ),
                            SizedBox(height: 15.w),
                            InkWell(
                              onTap: () {
                                appControllers.addedInCartProducts
                                    .add(widget.productinfo);
                                appControllers.suggestionForProducs();
                                setState(() {});
                              },
                              child: MouseRegion(
                                onEnter: (event) {
                                  cartButton = 1;
                                  setState(() {});
                                },
                                onExit: (event) {
                                  cartButton = null;
                                  setState(() {});
                                },
                                child: Container(
                                    height: 60.w,
                                    width: cartButton == 1 ? 500.w : 497.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black,
                                            width: cartButton == 1 ? 2.5 : 1)),
                                    child: const Center(
                                      child: Text("Add To card"),
                                    )),
                              ),
                            ),
                            SizedBox(height: 5.w),
                            InkWell(
                              onTap: () {
                                appControllers.choosenProduct.value =
                                    widget.productinfo;
                                appControllers.productPurchaseQuantity =
                                    orderQuantity.obs;
                                appControllers.productSize.value = sizeValue;
                                appControllers.productDiscountedPrice.value =
                                    priceWithDiscount!;
                                debugPrint(
                                    "Buy it now  Navigating to next page");
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const BuyAndCheckout();
                                  },
                                ));
                              },
                              child: MouseRegion(
                                onEnter: (event) {
                                  cartButton = 2;
                                  setState(() {});
                                },
                                onExit: (event) {
                                  cartButton = null;
                                  setState(() {});
                                },
                                child: Container(
                                    height: 60.w,
                                    width: cartButton == 2 ? 500.w : 497.w,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        border: Border.all(
                                            color: Colors.black,
                                            width: cartButton == 2 ? 2.5 : 1)),
                                    child: const Center(
                                      child: Text("Buy it now",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    )),
                              ),
                            ),
                            Container(
                              width: 500.w,
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "You may also like",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22.sp),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            scrollBackward();
                                            setState(() {});
                                          },
                                          icon: CachedNetworkImage(
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                CircularProgressIndicator(
                                                    value: downloadProgress
                                                        .progress),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                            imageUrl:
                                                'assets/images/leftarrow.png',
                                            height: 20.w,
                                            width: 20.w,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            scrollForward();
                                            setState(() {});
                                          },
                                          icon: CachedNetworkImage(
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                CircularProgressIndicator(
                                                    value: downloadProgress
                                                        .progress),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                            imageUrl:
                                                'assets/images/rightarrow.png',
                                            height: 20.w,
                                            width: 20.w,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 150.w,
                              width: 500.w,
                              margin: EdgeInsets.only(top: 7.h, bottom: 20.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.r),
                                  border: Border.all(
                                      color: Colors.black54, width: 0.85)),
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
                                itemCount: suggestionsProducts.length,
                                itemBuilder: (BuildContext context, int index,
                                    int realIndex) {
                                  return Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          child: CachedNetworkImage(
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                CircularProgressIndicator(
                                                    value: downloadProgress
                                                        .progress),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                            imageUrl: suggestionsProducts[index]
                                                .image
                                                .toString(),
                                            height: 80.h,
                                            width: 80.h,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 150.w,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                suggestionsProducts[index]
                                                    .title
                                                    .toString(),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 20.sp),
                                              ),
                                              Text(
                                                suggestionsProducts[index]
                                                    .textualPrice
                                                    .toString(),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 18.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            appControllers.addedInCartProducts
                                                .add(
                                                    suggestionsProducts[index]);
                                            appControllers
                                                .suggestionForProducs();
                                            setState(() {});
                                          },
                                          child: Container(
                                            height: 40.h,
                                            width: 90.w,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(5.r)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(Icons.add,
                                                    size: 16.h,
                                                    color: Colors.white
                                                        .withOpacity(0.8)),
                                                SizedBox(width: 4.w),
                                                Text("Add",
                                                    style: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(0.8)))
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: Colors.green,
                                    size: 17.h,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 480.w,
                                        child: RichText(
                                            text: TextSpan(
                                                text: "Pickup avaliable at",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 20.sp,
                                                    color: Colors.black
                                                        .withOpacity(0.72)),
                                                children: [
                                              TextSpan(
                                                text: pickUpLocation,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 20.sp,
                                                    color: Colors.black
                                                        .withOpacity(0.92)),
                                              )
                                            ])),
                                      ),
                                      SizedBox(
                                        height: 7.h,
                                      ),
                                      Text(
                                        "usually ready in 24 hours",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w200,
                                            fontSize: 16.sp,
                                            color:
                                                Colors.black.withOpacity(0.72)),
                                      ),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      MouseRegion(
                                        onEnter: (event) {
                                          boldUnderlineStroeInfoButton = true;
                                          setState(() {});
                                        },
                                        onExit: (event) {
                                          boldUnderlineStroeInfoButton = false;
                                          setState(() {});
                                        },
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          onTap: () {},
                                          child: Text(
                                            "View Store Information",
                                            style: TextStyle(
                                                fontWeight:
                                                    boldUnderlineStroeInfoButton
                                                        ? FontWeight.w300
                                                        : FontWeight.w200,
                                                fontSize:
                                                    boldUnderlineStroeInfoButton
                                                        ? 16.sp
                                                        : 16.sp,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationThickness:
                                                    boldUnderlineStroeInfoButton
                                                        ? 2
                                                        : 1,
                                                decorationColor: Colors.black,
                                                color: Colors.black
                                                    .withOpacity(0.72)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                            SizedBox(
                              height: 22.h,
                            ),
                            SizedBox(
                              height: 500.h,
                              width: 500.w,
                              child: HtmlEditor(
                                controller: controller,
                                htmlEditorOptions: const HtmlEditorOptions(
                                  hint: "Your text here...",
                                  //initalText: "text content initial, if any",
                                ),
                                otherOptions: OtherOptions(
                                  height: 400.h,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 22.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.symmetric(
                                horizontal: BorderSide(
                                    color: Colors.black45, width: 0.7.h),
                              )),
                              width: 500.w,
                              padding: EdgeInsets.symmetric(vertical: 15.h),
                              margin: EdgeInsets.symmetric(vertical: 15.h),
                              child: ExpandablePanel(
                                header: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    const Icon(Icons.local_shipping_outlined),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "Shipping & Returns",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w200),
                                    )
                                  ],
                                ),
                                collapsed: const SizedBox.shrink(),
                                expanded: Container(
                                  color: Colors.grey[200],
                                  height: 500.h,
                                  width: 500.w,
                                  child: Center(
                                    child: Text(
                                      'expanded',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w200),
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                                theme: const ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: true,
                                  tapBodyToCollapse: true,
                                  hasIcon: true,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30.r,
                                      backgroundColor: Colors.black,
                                      child: const Center(
                                        child: Icon(
                                          Icons.calendar_today_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 3,
                                      width: 160.w,
                                      color: Colors.black,
                                    ),
                                    CircleAvatar(
                                      radius: 30.r,
                                      backgroundColor: Colors.black,
                                      child: const Center(
                                        child: Icon(
                                          Icons.local_shipping_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 3,
                                      width: 160.w,
                                      color: Colors.black,
                                    ),
                                    CircleAvatar(
                                      radius: 30.r,
                                      backgroundColor: Colors.black,
                                      child: const Center(
                                        child: Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 500.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            dateFormatter.format(orderDate),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.sp),
                                          ),
                                          Text(
                                            "Order placed",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.sp),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            " ${dateFormatter.format(orderDate.add(Duration(days: 2)))} - ${dateFormatter.format(orderDate.add(Duration(days: 3)))}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.sp),
                                          ),
                                          Text(
                                            "Order shipped",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.sp),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "${dateFormatter.format(orderDate.add(Duration(days: 5)))}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.sp),
                                          ),
                                          Text(
                                            "Delivered!",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.sp),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20.h),
                            InkWell(
                              onTap: () {
                                ShareDialog.share(context,
                                    body: 'Some random text to be shared',
                                    platforms: SharePlatform.defaults);
                              },
                              child: Row(
                                children: [
                                  Image.network(
                                    'assets/images/upload.png',
                                    height: 40.h,
                                    width: 40.h,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    "Share",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20.sp),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 100.w, vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Frequently Bought Together",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30.sp,
                              color: Colors.black.withOpacity(0.90)),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 440.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: suggestionsProducts.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return OrderItemScreen(
                                        productinfo: suggestionsProducts[index],
                                      );
                                    },
                                  ));
                                  togle = true;
                                  itemindex = index;
                                  setState(() {});
                                },
                                child: MouseRegion(
                                  onEnter: (event) {
                                    togle = true;
                                    itemindex = index;
                                    setState(() {});
                                  },
                                  onExit: (event) {
                                    togle = false;
                                    itemindex = null;

                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 400.w,
                                    width: MediaQuery.of(context).size.width *
                                        0.20,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 45.w),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 30.w),
                                          height: 250.w,
                                          child: itemindex == index
                                              ? CachedNetworkImage(
                                                  progressIndicatorBuilder: (context,
                                                          url,
                                                          downloadProgress) =>
                                                      CircularProgressIndicator(
                                                          value:
                                                              downloadProgress
                                                                  .progress),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                  imageUrl:
                                                      suggestionsProducts[index]
                                                          .image2
                                                          .toString(),
                                                  height: 200.h,
                                                  width: 200.w,
                                                )
                                              : CachedNetworkImage(
                                                  progressIndicatorBuilder: (context,
                                                          url,
                                                          downloadProgress) =>
                                                      CircularProgressIndicator(
                                                          value:
                                                              downloadProgress
                                                                  .progress),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                  imageUrl:
                                                      suggestionsProducts[index]
                                                          .image
                                                          .toString(),
                                                  height: 200.h,
                                                  width: 200.w,
                                                ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.20,
                                          child: Text(
                                              textAlign: TextAlign.left,
                                              suggestionsProducts[index]
                                                  .title
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w200,
                                                  color: Colors.black)),
                                        ),
                                        Text(
                                            textAlign: TextAlign.left,
                                            suggestionsProducts[index]
                                                .brand
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w200,
                                                color: Colors.black)),
                                        Text(
                                            textAlign: TextAlign.left,
                                            suggestionsProducts[index]
                                                .textualPrice
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w200,
                                                color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  WriteYourReview(
                    productinfo: widget.productinfo,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 300.w),
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: "Free Shipping\n",
                                  style: GoogleFonts.workSans(
                                      fontSize: 25.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                TextSpan(
                                  text:
                                      'We are offering free shipping on orders over Rs 4999.\n',
                                  style: GoogleFonts.workSans(
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                TextSpan(
                                  text: '*Terms and Conditions applied.',
                                  style: GoogleFonts.workSans(
                                      fontSize: 18.sp, color: Colors.grey[600]),
                                )
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: 100.h,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 300.w),
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: "Timely Delivery\n",
                                  style: GoogleFonts.workSans(
                                      fontSize: 25.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                TextSpan(
                                  text:
                                      " At All Sports we understand the importance of timely delivery. That\'s why we partner with leading courier services to ensure that your products reach you in perfect condition and on time. You can rely on us to promptly deliver your sports equipment, apparel, and accessories, so you can start enjoying your purchase right away. Shop with us and experience hassle-free and timely delivery.",
                                  style: GoogleFonts.workSans(
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ]),
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 300.w),
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "Hassle-Free Returns & Exchanges\n",
                              style: GoogleFonts.workSans(
                                  color: Colors.black,
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                              text:
                                  "We offer industry leading Exchange and Return Policy because customer satisfaction is our utmost priority. All purchased items can be returned and exchanged within 7 Working Days prior use. So you can shop all you want without any hesitation.",
                              style: GoogleFonts.workSans(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ]),
                        ),
                      )
                    ],
                  ),
                  // OrderScreenLists(productinfo: widget.productinfo,),
                  const BrandsScrollingList(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Trending Products",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30.sp,
                              color: Colors.black.withOpacity(0.90)),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            SizedBox(
                              height: 400.h,
                              width: 1300.w,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                controller: _trendingListScrollController,
                                itemCount: trendingProducts.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 7.w,
                                    ),
                                    width: 300.w,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 250.w,
                                          alignment: Alignment.center,
                                          child: CachedNetworkImage(
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                CircularProgressIndicator(
                                                    value: downloadProgress
                                                        .progress),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                            imageUrl: trendingProducts[index]
                                                .image
                                                .toString(),
                                            height: 300.h,
                                            width: 250.w,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 200.w,
                                          child: Text(
                                            trendingProducts[index]
                                                .title
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 27.sp),
                                          ),
                                        ),
                                        Text(
                                          trendingProducts[index]
                                              .textualPrice
                                              .toString(),
                                          style: GoogleFonts.playfairDisplay(
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 20.sp),
                                        ),
                                      ],
                                    ),
                                  );
                                },
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
                      ],
                    ),
                  ),

                  const BottomPage(),
                ],
              ),
            )
          ],
        ));
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.3737500, size.height * 0.4180000);
    path.lineTo(size.width * 0.3737500, size.height * 0.5000000);
    path.lineTo(size.width * 0.4275000, size.height * 0.5020000);
    path.lineTo(size.width * 0.4362500, size.height * 0.5220000);
    path.lineTo(size.width * 0.4437500, size.height * 0.5020000);
    path.lineTo(size.width * 0.5000000, size.height * 0.5000000);
    path.lineTo(size.width * 0.4987500, size.height * 0.4200000);
    path.lineTo(size.width * 0.3737500, size.height * 0.4180000);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
