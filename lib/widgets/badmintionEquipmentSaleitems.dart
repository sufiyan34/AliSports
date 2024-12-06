import 'package:alisportspk/datamodels/productInfo.dart';
import 'package:alisportspk/getx/appcontrollers.dart';
import 'package:alisportspk/view/constents/sale_items_catogrised_cards.dart';
import 'package:alisportspk/view/modules/filters/saleItem_brand_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BadmintionEquipmentSaleItems extends StatefulWidget {
  const BadmintionEquipmentSaleItems({super.key});

  @override
  State<BadmintionEquipmentSaleItems> createState() =>
      _BadmintionEquipmentSaleItemsState();
}

class _BadmintionEquipmentSaleItemsState
    extends State<BadmintionEquipmentSaleItems> {
  TextEditingController startingPrice = TextEditingController();
  TextEditingController endingPrice = TextEditingController();
  int? priceField;
  int? priceFieldHover;
  AppControllers appControllers = Get.put(AppControllers());
  int? filteroptionIndex;
  List<String> titles = [
    'Price',
    'Brand',
    'Product Type',
    'Size',
    'Avaliability'
  ];
  void initState() {
    desiredTypeproducts = Productinfo.productinfo
        .where((product) => product.mainCategory == "badmintion")
        .toList();

    super.initState();
  }

  List<Productinfo> desiredTypeproducts = [];
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
          SaleItemsCatogrisedCards(
            productsList: desiredTypeproducts,
          ),
        ],
      ),
    );
  }
}
