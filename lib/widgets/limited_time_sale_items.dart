import 'package:alisportspk/getx/appcontrollers.dart';
import 'package:alisportspk/view/constents/content_cards._grid.dart';

import 'package:alisportspk/view/modules/filters/saleItem_brand_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LimitedTimeSaleItems extends StatefulWidget {
  LimitedTimeSaleItems({super.key});

  @override
  State<LimitedTimeSaleItems> createState() => _LimitedTimeSaleItemsState();
}

class _LimitedTimeSaleItemsState extends State<LimitedTimeSaleItems> {
  TextEditingController startingPrice = TextEditingController();
  TextEditingController endingPrice = TextEditingController();
  int? priceField;

  int? priceFieldHover;

  //List<int>? filterIndex;

  AppControllers appControllers = Get.put(AppControllers());
  int? filteroptionIndex;

  List<String> titles = [
    'Price',
    'Brand',
    'Product Type',
    'Size',
    'Avaliability'
  ];

  //final List<List<dynamic>> saleitems =[['Rs.1,450.00 PKR', 'Brand', 'Product Type', 'Size', ],];
  // final List<Map<String, String>> SaleitemsUrlsMap = [
  //   {
  //     "image": "assets/images/armguard.png",
  //     "image2": "assets/images/armguard.png",
  //     "title": "CA Gold Cricket Arm Guard",
  //     "brand": "CA",
  //     "Price": "Rs.1,450.00 PKR",
  //     "price": "1450.00",
  //     "maincategory": "cricket others",
  //     'Product Type': "leg wear",
  //     "size": "Large",
  //     "discount": "25",
  //     "quantity": "25",
  //   },
  //   {
  //     "image": "assets/images/saleItem7-removebg-preview.png",
  //     "image2": "assets/images/saleItem7_1-removebg-preview.png",
  //     "title": "CA Kamo Cricket Shoes",
  //     "Price": "Rs.6,500.00 PKR",
  //     "price": "6500.00",
  //     "brand": "CA",
  //     "quantity": "25",
  //     "maincategory": "cricket shoes",
  //     "discount": "25",
  //   },
  //   {
  //     "image": "assets/images/saleItem1_1-removebg-preview.png",
  //     "image2": "assets/images/saleItem1_2-removebg-preview.png",
  //     "title": "Summer Sports V2 T-Shirt",
  //     "Price": "Rs.1,450.00 PKR",
  //     "price": "1450.00",
  //     "brand": "Psl",
  //     "quantity": "25",
  //     "maincategory": "cricket t-shirt",
  //     "discount": "11",
  //   },
  //   {
  //     "image": "assets/images/saleItem2_1-removebg-preview.png",
  //     "image2": "assets/images/saleItem2_2-removebg-preview.png",
  //     "title": "Summer Sports V3 T-Shirt",
  //     "Price": "Rs.1,450.00 PKR",
  //     "price": "1450.00",
  //     "quantity": "25",
  //     "brand": "Psl",
  //     "maincategory": "cricket t-shirt",
  //     "discount": "22",
  //   },
  //   {
  //     "image": "assets/images/saleItem3_1-removebg-preview.png",
  //     "image2": "assets/images/saleItem3_2-removebg-preview.png",
  //     "title": "Summer Sports V4 T-Shirt",
  //     "Price": "Rs.1,490.00 PKR",
  //     "price": "1490.00",
  //     "brand": "Psl",
  //     "maincategory": "cricket t-shirt",
  //     "discount": "19",
  //     "quantity": "25",
  //   },
  //   {
  //     "image": "assets/images/saleItem4_1-removebg-preview.png",
  //     "image2": "assets/images/saleItem4_2-removebg-preview.png",
  //     "title": "Dual Tone Dry Sports T-Shirt",
  //     "Price": "Rs.1,490.00 PKR",
  //     "price": "1490.00",
  //     "brand": "Psl",
  //     "maincategory": "cricket t-shirt",
  //     "discount": "16",
  //     "quantity": "25",
  //   },
  //   {
  //     "image": "assets/images/saleItem5_1-removebg-preview.png",
  //     "image2": "assets/images/saleItem5_2-removebg-preview.png",
  //     "title": "Dual Tone Dry Sports V2 T-Shirt",
  //     "Price": "Rs.1,490.00 PKR",
  //     "price": "1490.00",
  //     "brand": "Psl",
  //     "maincategory": "cricket t-shirt",
  //     "quantity": "25",
  //     "discount": "25",
  //   },
  //   {
  //     "image": "assets/images/saleItem8_1-removebg-preview.png",
  //     "image2": "assets/images/saleItem8-removebg-preview.png",
  //     "title": "CA PRO Boost Cricket Shoes",
  //     "Price": "Rs.1,550.00 PKR",
  //     "price": "1550.00",
  //     "brand": "CA",
  //     "maincategory": "cricket t-shirt",
  //     "discount": "25",
  //     "quantity": "25",
  //   },
  //   {
  //     "image": "assets/images/saleItem6_1-removebg-preview.png",
  //     "image2": "assets/images/saleItem6_2-removebg-preview.png",
  //     "title": "Dual Tone Dry Sports V8 T-Shirt",
  //     "Price": "Rs.1,490.00 PKR",
  //     "price": "1490.00 ",
  //     "brand": "Psl",
  //     "quantity": "25",
  //     "maincategory": "cricket t-shirt",
  //     "discount": "20",
  //   },
  //   {
  //     "image": "assets/images/chestGuard.png",
  //     "image2": "assets/images/chestguard2.png",
  //     "title": "CA Plus Cricket chest Guard",
  //     "brand": "CA",
  //     "Price": "Rs.1,950.00 PKR",
  //     "price": "1950.00",
  //     "maincategory": "cricket",
  //     "discount": "12",
  //     "quantity": "25",
  //   },
  //   {
  //     "image": "assets/images/cricket_helmet.png",
  //     "image2": "assets/images/crickethelmet2.png",
  //     "title": "CA Plus Cricket Helmet",
  //     "brand": "CA",
  //     "Price": "Rs.4,500.00 PKR",
  //     "price": "4500.00",
  //     "maincategory": "cricket",
  //     "discount": "19",
  //     "quantity": "25",
  //   },
  //   {
  //     "image": "assets/images/thighGuard.png",
  //     "image2": "assets/images/thightguard3.png",
  //     "quantity": "25",
  //     "title": "CA Performance 15000 Thigh Pad",
  //     "brand": "CA",
  //     "Price": "Rs.5,450.00 PKR",
  //     "price": "5450.00",
  //     "maincategory": "cricket",
  //     "discount": "25",
  //   },
  //   {
  //     "image": "assets/images/thighguard2.png",
  //     "image2": "assets/images/thighguard4.png",
  //     "title": "CA Performance 10000 Thigh Pad",
  //     "brand": "CA",
  //     "Price": "Rs.4,650.00 PKR",
  //     "price": "4650.00",
  //     "maincategory": "cricket",
  //     "discount": "25",
  //     "quantity": "25",
  //   },
  //   {
  //     "image": "assets/images/shoes.png",
  //     "image2": "assets/images/shoes2.png",
  //     "title": "CA Kamo Cricket Shoes",
  //     "brand": "CA",
  //     "Price": "Rs.6,500.00 PKR",
  //     "price": "6500.00",
  //     "maincategory": "cricket",
  //     "discount": "18",
  //     "quantity": "25",
  //   },
  //   {
  //     "image": "assets/images/rollerStick2.png",
  //     "quantity": "25",
  //     "image2": "assets/images/rollerStick.png",
  //     "title":
  //         "Deep Tissue Muscle Massage Roller Stick for Pain Relief & Recovery ",
  //     "brand": "ALI SPORTS",
  //     "Price": "Rs.1,550.00 PKR",
  //     "price": "1550.00",
  //     "maincategory": "massage",
  //     "discount": "14",
  //   },
  //   {
  //     "image2": "assets/images/yogaball2.png",
  //     "image": "assets/images/yogaball.png",
  //     "title": "Anti-Burst Exercise Gym Ball for Yoga & Fitness",
  //     "brand": "ALI SPORTS",
  //     "Price": "Rs.1,850.00 PKR",
  //     "price": "1850.00",
  //     "maincategory": "exercise",
  //     "discount": "25",
  //     "quantity": "25",
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 125.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Text(
              textAlign: TextAlign.start,
              "Sale",
              style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w300),
            ),
          ),
          // DataFilters(
          //   data: saleitems,
          //   filterTitle: titles,
          //   showAnimation: true,
          //    recent_selected_data_index: (List<int>? index) {
          //     filterIndex = index;
          //     // setState(() {

          //     // });
          //   },
          //   style: FilterStyle(
          //     buttonColor: Colors.green,
          //     buttonColorText: Colors.white,
          //     filterBorderColor: Colors.grey,
          //   ),
          // ),

          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 100.w, bottom: 12.w),
            child: Row(
              children: [
                Text("Filter:"),
                SizedBox(
                  child: MouseRegion(
                    onEnter: (event) {
                      setState(() {
                        appControllers.filterTitleIndex = 1.obs;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        appControllers.filterTitleIndex = 0.obs;
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(
                              color: appControllers.filterTitleIndex == 1.obs
                                  ? Colors.black
                                  : const Color.fromARGB(221, 34, 34, 34)),
                        ),
                        PopupMenuButton(
                          icon: const Icon(Icons.keyboard_arrow_down),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("the highest price is Rs.44,990.00"),
                                    InkWell(
                                      onTap: () {},
                                      child: MouseRegion(
                                        onEnter: (event) {
                                          setState(() {
                                            filteroptionIndex = 1;
                                          });
                                        },
                                        onExit: (event) {
                                          setState(() {
                                            filteroptionIndex = 0;
                                          });
                                        },
                                        child: Text(
                                          "Reset",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            decorationStyle:
                                                TextDecorationStyle.solid,
                                            decorationThickness:
                                                filteroptionIndex! == 1
                                                    ? 4.0.h
                                                    : 2.0.h,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        const Text("Rs"),
                                        InkWell(
                                          onTap: () {
                                            priceField = 0;
                                          },
                                          child: MouseRegion(
                                            onEnter: (event) {
                                              priceFieldHover = 0;
                                            },
                                            onExit: (event) {
                                              priceFieldHover = null;
                                            },
                                            child: Container(
                                              height: 50.h,
                                              width: 120.w,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width:
                                                          priceFieldHover == 0
                                                              ? 4.h
                                                              : 1.h,
                                                      color: priceField == 0
                                                          ? Colors.black
                                                          : const Color
                                                              .fromARGB(221, 59,
                                                              59, 59))),
                                              child: TextField(
                                                controller: startingPrice,
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration:
                                                    const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        labelText: 'From',
                                                        labelStyle: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    221,
                                                                    59,
                                                                    59,
                                                                    59))),
                                                onTapOutside: (event) {
                                                  priceField = null;

                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text("Rs"),
                                        InkWell(
                                          onTap: () {
                                            priceField = 0;
                                          },
                                          child: MouseRegion(
                                            onEnter: (event) {
                                              priceFieldHover = 1;
                                            },
                                            onExit: (event) {
                                              priceFieldHover = null;
                                            },
                                            child: Container(
                                              height: 50.h,
                                              width: 120.w,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width:
                                                          priceFieldHover == 0
                                                              ? 4.h
                                                              : 1.h,
                                                      color: priceField == 1
                                                          ? Colors.black
                                                          : const Color
                                                              .fromARGB(221, 59,
                                                              59, 59))),
                                              child: TextField(
                                                controller: endingPrice,
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration:
                                                    const InputDecoration(
                                                        labelText: 'to',
                                                        border:
                                                            InputBorder.none,
                                                        labelStyle: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    221,
                                                                    59,
                                                                    59,
                                                                    59))),
                                                onTapOutside: (event) {
                                                  priceField = null;

                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ];
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SaleitemBrandFilter(),
                MouseRegion(
                    onEnter: (event) {
                      setState(() {
                        appControllers.filterTitleIndex = 3.obs;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        appControllers.filterTitleIndex = 0.obs;
                      });
                    },
                    child: InkWell(
                      onTap: () {
                        showMenu(
                          context: context,
                          position: const RelativeRect.fromLTRB(
                              100, 100, 100, 100), //(left, top, right, bottom)
                          items: [
                            const PopupMenuItem(
                              value: 1,
                              child: Icon(Icons.add),
                              //ProductTypeFilter(),
                            ),
                          ],
                        );
                      },
                      child: Text(
                        "Product Type",
                        style: TextStyle(
                            color: appControllers.filterTitleIndex == 3.obs
                                ? Colors.black
                                : const Color.fromARGB(221, 34, 34, 34)),
                      ),
                    )),
              ],
            ),
          ),
          ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
          const ContentCardsGridView(),
        ],
      ),
    );
  }
}
