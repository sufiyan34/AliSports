import 'package:alisportspk/datamodels/productInfo.dart';
import 'package:alisportspk/getx/appcontrollers.dart';
import 'package:alisportspk/view/constents/filter_popup.dart';
import 'package:alisportspk/view/constents/laptop_app_bar.dart';
import 'package:alisportspk/view/constents/sale_items_catogrised_cards.dart';
import 'package:alisportspk/view/modules/filters/product_type_filter.dart';
import 'package:alisportspk/view/modules/filters/saleItem_brand_filter.dart';
import 'package:alisportspk/widgets/mobile_ap_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

// ignore: must_be_immutable
class CatagorySelectedFromAppbar extends StatefulWidget {
  String catagory;
  String subcatagory;
  String selection;
  CatagorySelectedFromAppbar(
      {super.key,
      required this.selection,
      required this.catagory,
      required this.subcatagory});

  @override
  State<CatagorySelectedFromAppbar> createState() =>
      _CatagorySelectedFromAppbarState();
}

class _CatagorySelectedFromAppbarState
    extends State<CatagorySelectedFromAppbar> {
  TextEditingController startingPrice = TextEditingController();
  TextEditingController endingPrice = TextEditingController();
  int? priceField;
  int? priceFieldHover;
  AppControllers appControllers = Get.put(AppControllers());

  List<Productinfo> desiredTypeproducts = [];
  void initState() {
    desiredTypeproducts = Productinfo.productinfo
        .where((product) =>
            (product.mainCategory == widget.catagory ||product.mainCategory == widget.selection ||
                
                product.precizeCategory == widget.catagory)&&
            (product.subCategory == widget.catagory ||
                product.subCategory == widget.selection ||
                product.precizeCategory == widget.selection) &&
            (product.mainCategory == widget.subcatagory ||
                product.subCategory == widget.subcatagory ||
                product.precizeCategory == widget.subcatagory))
        .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: false,
          floating: true,
          flexibleSpace: ResponsiveBuilder(
            builder: (context, sizingInformation) {
              if (sizingInformation.deviceScreenType ==
                  DeviceScreenType.desktop) {
                return const LaptopAppBar(
                    // scaffoldKey: scaffoldKey,
                    );
              } else {
                return const MobileAppBar();
              }
            },
          ),
          toolbarHeight: 280.w,
          backgroundColor: Colors.red,
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 125.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Text(
                    textAlign: TextAlign.start,
                    widget.selection,
                    style:
                        TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w300),
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
                      MouseRegion(
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
                        child: PopupMenuButton(
                          child: Row(
                            children: [
                              Text(
                                "Price",
                                style: TextStyle(
                                    color:
                                        appControllers.filterTitleIndex == 1.obs
                                            ? Colors.black
                                            : const Color.fromARGB(
                                                221, 34, 34, 34)),
                              ),
                              const Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                enabled: false,
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
                                            appControllers.filterTitleIndex =
                                                1.obs;
                                          });
                                        },
                                        onExit: (event) {
                                          setState(() {
                                            appControllers.filterTitleIndex =
                                                0.obs;
                                          });
                                        },
                                        child: Text(
                                          "Reset",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            decorationStyle:
                                                TextDecorationStyle.solid,
                                            decorationThickness: appControllers
                                                        .filterTitleIndex ==
                                                    1.obs
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
                                enabled: false,
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
                      ),
                      SaleitemBrandFilter(),
                      FilterPopup(
                        popupOptions: [
                          widget.selection,
                        ],
                        filter_number: 3,
                        label: 'Product Type',
                      ),
                      FilterPopup(
                        popupOptions: [
                          "In stock(${desiredTypeproducts.length})",
                          "Out of stock(${desiredTypeproducts.length})"
                        ],
                        filter_number: 4,
                        label: 'Availability',
                      ),
                      
                      Text("Sorted by:")
                         FilterPopup(
                        popupOptions: [
                          "No Option Avaliable",
                         
                        ],
                        filter_number: 5,
                        label: 'Featured',
                      ),
                      Text("${desiredTypeproducts.length} products")

                    ],
                  ),
                ),
                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                SaleItemsCatogrisedCards(
                  productsList: desiredTypeproducts,
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
