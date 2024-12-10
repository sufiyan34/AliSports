//import 'package:alisportspk/getx/appcontrollers.dart';
import 'dart:developer';

import 'package:alisportspk/getx/appcontrollers.dart';
import 'package:alisportspk/view/constents/searchable_dropdown.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

class LaptopAppBar extends StatefulWidget {
  const LaptopAppBar({
    super.key,
  });

  @override
  State<LaptopAppBar> createState() => _LaptopAppBarState();
}

class _LaptopAppBarState extends State<LaptopAppBar> {
  List<String> text = [
    'alisportsbwn@gmail.com|0315-2273142',
    "Minimum order: Rs 1000/-"
  ];

  int? dropdownitemindex;
  int menuIndex = 0;

  bool hoverStatus = false;
  int? _hoverIndex;
  bool isDropdownSelected = false;
  List<String> sportsCategories = [
    "Cricket",
    "Badminton",
    "Tennis",
    "Table Tennis",
    "Football",
    "Basketball",
    "Volleyball",
    "Snooker & Billiard",
    "Squash",
    "Swimming",
    "Skating & Scooty",
    "Exercise & Fitness",
    "Indoor Games",
    "Sports Wear",
    "Accessories",
    "Trophies & Awards",
    "Sale"
  ];

  final Uri mainpage = Uri.parse('https://www.alisports.pk/');
  final Uri faceBook = Uri.parse('https://www.facebook.com/');
  final Uri instagram = Uri.parse('https://www.instagram.com/');
  final Uri tiktok = Uri.parse('https://www.tiktok.com/');
  final Uri youtube = Uri.parse('https://www.youtube.com/');
  final Uri profile = Uri.parse(
      'https://shopify.com/authentication/68619141437/login?client_id=4208b5f1-2a76-4697-9db1-b3d7b03b717f&locale=en&redirect_uri=https%3A%2F%2Fshopify.com%2Fauthentication%2F68619141437%2Foauth%2Fauthorize%3Fclient_id%3D4208b5f1-2a76-4697-9db1-b3d7b03b717f%26locale%3Den%26nonce%3Deaddf651-7804-40f3-985b-2249a1b5bb84%26redirect_uri%3Dhttps%253A%252F%252Fshopify.com%252F68619141437%252Faccount%252Fcallback%253Fsource%253Dcore%26response_type%3Dcode%26scope%3Dopenid%2Bemail%2Bcustomer-account-api%253Afull%26state%3D01JACQAB9SZVXGG99V6VTM2TRK');

  AppControllers appControllers = Get.put(AppControllers());
  ExpansionTileController? expansionTileController = ExpansionTileController();
  int textIndex = 0;
  final CarouselSliderController _scrollController = CarouselSliderController();
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.w,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50.w,
            color: Colors.black,
            child: Row(
              children: [
                const Expanded(child: SizedBox()),
                IconButton(
                    onPressed: () async {
                      try {
                        await launchUrl(
                            faceBook); // Replace with your desired WhatsApp number
                        debugPrint('faceBook launched successfully');
                      } catch (e) {
                        debugPrint('Error launching faceBook: $e');
                      }
                    },
                    icon: Icon(
                      Icons.facebook_rounded,
                      color: Colors.white,
                      size: 20.w,
                    )),
                IconButton(
                    onPressed: () async {
                      try {
                        await launchUrl(
                            instagram); // Replace with your desired WhatsApp number
                        debugPrint('instagram launched successfully');
                      } catch (e) {
                        debugPrint('Error launching instagram: $e');
                      }
                    },
                    icon: Image.network(
                      'assets/images/instagram.png',
                      color: Colors.white,
                      height: 20.w,
                      width: 20.w,
                    )),
                IconButton(
                    onPressed: () async {
                      try {
                        await launchUrl(
                            youtube); // Replace with your desired WhatsApp number
                        debugPrint(' youtube launched successfully');
                      } catch (e) {
                        debugPrint('Error launching  youtube: $e');
                      }
                    },
                    icon: Image.network(
                      'assets/images/youtube.png',
                      color: Colors.white,
                      height: 20.w,
                      width: 20.w,
                    )),
                IconButton(
                    onPressed: () async {
                      try {
                        await launchUrl(
                            tiktok); // Replace with your desired WhatsApp number
                        debugPrint('tiktok launched successfully');
                      } catch (e) {
                        debugPrint('Error launching tiktok: $e');
                      }
                    },
                    icon: Icon(
                      Icons.tiktok,
                      color: Colors.white,
                      size: 20.w,
                    )),
                const Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            scrollBackward();
                          });
                        },
                        icon: Image.network(
                          'assets/images/leftarrow.png',
                          color: Colors.white,
                          height: 10.w,
                          width: 10.w,
                        )),
                    SizedBox(
                      height: 50.w,
                      width: 500.w,
                      child: Center(
                        child: CarouselSlider.builder(
                          options: CarouselOptions(
                            viewportFraction: 1,
                            autoPlay: true,
                            height: 50.w,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            enlargeFactor: 0.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                textIndex = index;
                              });
                            },
                            scrollDirection: Axis.horizontal,
                          ),
                          itemCount: text.length,
                          carouselController: _scrollController,
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
                            return Center(
                              child: SizedBox(
                                width: 500.w,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  text[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            scrollForward();
                          });
                        },
                        icon: Image.network(
                          'assets/images/rightarrow.png',
                          color: Colors.white,
                          height: 10.w,
                          width: 10.w,
                        )),
                  ],
                ),
                const Expanded(child: SizedBox()),
                const SearchableDropdownMenuButton(),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 20.w),
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: 230.w,
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 20.w),
                    child: InkWell(
                      onTap: () async {
                        try {
                          await launchUrl(
                              mainpage); // Replace with your desired WhatsApp number
                          debugPrint('mainpage launched successfully');
                        } catch (e) {
                          debugPrint('Error launching mainpage: $e');
                        }
                      },
                      child: CachedNetworkImage(
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        imageUrl:
                            'https://cdn.shopify.com/s/files/1/0686/1914/1437/files/2021-12-24-12-47-02-291_x320.jpg?v=1670434406',
                        height: 100.w,
                        width: 100.w,
                      ),
                    )),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 50.w, top: 20.w),
                    child: Wrap(
                      children: [
                        ...sportsCategories.map((e) {
                          int index = sportsCategories.indexOf(e);
                          return InkWell(
                            splashColor: Colors.pink[900],
                            onTap: () {
                              appControllers.dropdownPlutoMenusIndex.value =
                                  index;

                              appControllers.openMenuContainer.toggle();
                              isDropdownSelected = !isDropdownSelected;
                              dropdownitemindex = index;
                              log(' open status : ${appControllers.openMenuContainer.value},pluto index no: ${appControllers.dropdownPlutoMenusIndex.value}');
                            },
                            child: Container(
                              width: 180.w,
                              padding: EdgeInsets.symmetric(vertical: 5.w),
                              child: MouseRegion(
                                onEnter: (event) {
                                  setState(() {
                                    hoverStatus = true;
                                    _hoverIndex = index;
                                  });
                                },
                                onExit: (event) {
                                  setState(() {
                                    _hoverIndex = null;
                                    hoverStatus = false;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      e,
                                      style: (_hoverIndex == index ||
                                              (dropdownitemindex == index &&
                                                  isDropdownSelected))
                                          ? TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.sp,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationStyle:
                                                  TextDecorationStyle.solid,
                                              decorationThickness:
                                                  dropdownitemindex == index
                                                      ? 4.0
                                                      : 2.0,
                                            )
                                          : TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.sp),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Icon((index == dropdownitemindex &&
                                            isDropdownSelected == true)
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down),
                                  ],
                                ),
                                //  ExpandablePanel(
                                //   header: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.center,
                                //     children: [
                                //       Text(
                                //         e,
                                //         style: (_hoverIndex == index ||
                                //                 (dropdownitemindex == index &&
                                //                     isDropdownSelected))
                                //             ? TextStyle(
                                //                 color: Colors.black,
                                //                 fontSize: 16.sp,
                                //                 decoration:
                                //                     TextDecoration.underline,
                                //                 decorationStyle:
                                //                     TextDecorationStyle.solid,
                                //                 decorationThickness:
                                //                     dropdownitemindex == index
                                //                         ? 4.0
                                //                         : 2.0,
                                //               )
                                //             : TextStyle(
                                //                 color: Colors.black,
                                //                 fontSize: 16.sp),
                                //       ),
                                //       SizedBox(
                                //         width: 5.w,
                                //       ),
                                //       ExpandableIcon(
                                //         theme: ExpandableThemeData(
                                //           iconPadding:
                                //               EdgeInsets.only(left: 3.w),
                                //           expandIcon:
                                //               Icons.keyboard_arrow_down,
                                //           collapseIcon:
                                //               Icons.keyboard_arrow_up,
                                //           iconColor: Colors.black,
                                //           iconSize: 22.w,
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                //   theme: const ExpandableThemeData(
                                //     hasIcon: false,
                                //     tapHeaderToExpand: false,
                                //     tapBodyToCollapse: false,
                                //     tapBodyToExpand:false,
                                //   ),
                                //   collapsed:
                                //       SizedBox(height: 1.w, width: 1.w),
                                //   expanded: dropdowns[index],
                                // )
                                ///////////////////////////////////////////////////////////
                                //  ExpansionTile(
                                //   // controller: expansionTileController,
                                //   title: Text(
                                //     e,
                                //     style: (_hoverIndex == index ||
                                //             (dropdownitemindex == index &&
                                //                 isDropdownSelected))
                                //         ? TextStyle(
                                //             color: Colors.black,
                                //             fontSize: 14.sp,
                                //             decoration:
                                //                 TextDecoration.underline,
                                //             decorationStyle:
                                //                 TextDecorationStyle.solid,
                                //             decorationThickness:
                                //                 dropdownitemindex == index
                                //                     ? 4.0
                                //                     : 2.0,
                                //           )
                                //         : TextStyle(
                                //             color: Colors.black,
                                //             fontSize: 14.sp),
                                //   ),
                                //   trailing: Icon((index == dropdownitemindex &&
                                //           isDropdownSelected == true)
                                //       ? Icons.keyboard_arrow_up
                                //       : Icons.keyboard_arrow_down),
                                //   children: [
                                //     dropdowns[index],
                                //   ],
                                // ),
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search_outlined,
                          weight: 0.5,
                        )),
                    IconButton(
                        onPressed: () async {
                          try {
                            await launchUrl(
                                profile); // Replace with your desired WhatsApp number
                            debugPrint('profile launched successfully');
                          } catch (e) {
                            debugPrint('Error launching profile: $e');
                          }
                        },
                        icon: const Icon(
                          Icons.person_outlined,
                          weight: 0.5,
                        )),
                    IconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        icon: const Icon(
                          Icons.local_mall_outlined,
                          weight: 0.5,
                        )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
