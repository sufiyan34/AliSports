import 'package:alisportspk/datamodels/productInfo.dart';
import 'package:alisportspk/view/constents/order_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentCardsGridView extends StatefulWidget {
  const ContentCardsGridView({super.key});

  @override
  State<ContentCardsGridView> createState() => _ContentCardsGridViewState();
}

class _ContentCardsGridViewState extends State<ContentCardsGridView> {
  bool togle = false;
  int? itemindex;
  Productinfo productinformaion = Productinfo();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2000.h,
      width: MediaQuery.of(context).size.width,

      child: ListView(
        children: [
          Wrap(children: [
            ...Productinfo.productinfo.map((e) {
              int index = Productinfo.productinfo.indexOf(e);
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return OrderItemScreen(
                        productinfo: e,
                        // textualPrice: itemsUrlsMap.elementAt(index)["Price"]!,
                        // brand: itemsUrlsMap.elementAt(index)["brand"]!,
                        // title: itemsUrlsMap.elementAt(index)["title"]!,
                        // image2: itemsUrlsMap.elementAt(index)["image2"]!,
                        // image: itemsUrlsMap.elementAt(index)["image"]!,
                        // discount: itemsUrlsMap.elementAt(index)["discount"]!,
                        // mainCategory:
                        //     itemsUrlsMap.elementAt(index)["mainCategory"]!,
                        // price: itemsUrlsMap.elementAt(index)["price"]!,
                        // totalQuantity:
                        //     itemsUrlsMap.elementAt(index)["quantity"]!,

                        // productinfo: itemsUrlsMap[itemindex!],
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
                    height: 500.w,
                    color: Colors.red,
                    width: MediaQuery.of(context).size.width * 0.20,
                    margin: EdgeInsets.all(
                      MediaQuery.of(context).size.width * 0.02,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 45.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 30.w),
                            height: 250.w,
                            child: itemindex == index
                                ? Image.network(
                                    //itemsUrlsMap[index].image2!,
                                    e.image2.toString(),
                                    // itemsUrlsMap.elementAt(index)["image2"],
                                    height: 250,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    // itemsUrlsMap[index].image!,
                                    //itemsUrlsMap.elementAt(index)["image"]
                                    e.image.toString(),
                                  )),
                        Wrap(
                          children: [
                            Text(
                                // itemsUrlsMap[index].title!,
                                textAlign: TextAlign.left,
                                //itemsUrlsMap.elementAt(index)["title"],
                                e.title.toString(),
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black)),
                          ],
                        ),
                        Text(
                            // itemsUrlsMap[index].brand!,
                            textAlign: TextAlign.left,
                            e.brand.toString(),
                            //itemsUrlsMap.elementAt(index)["brand"],
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w200,
                                color: Colors.black)),
                        Text(
                            // itemsUrlsMap[index].textualPrice!,
                            textAlign: TextAlign.left,
                            e.textualPrice.toString(),
                            // itemsUrlsMap.elementAt(index)["Price"],
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w200,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              );
            })
          ]),
        ],
      ),

// Container(
//           height: 500.h,
//           width: MediaQuery.of(context).size.width * 0.22,
//           child: InkWell(
//             onTap: () {
//               _itemindex = 1;
//               _tap = !_tap;
//               // OrderItemScreen orderItem = OrderItemScreen( image: productinformaion.productinfo[index].image,
//               //             image2: productinformaion.image2,
//               //             brand: productinformaion.productinfo[index].brand,
//               //             category:
//               //                 productinformaion.productinfo[index].mainCategory,
//               //             discount:
//               //                 productinformaion.productinfo[index].discount,
//               //             price: productinformaion.productinfo[index].price,
//               //             title: productinformaion.productinfo[index].title,
//               //             totalQuantity:
//               //                 productinformaion.productinfo[index].quantity,);

// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//               ///////////////////////////////////////////////////////////////////////
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //       builder: (context) => OrderItemScreen(
//               //             productinfo: productinformaion.productinfo[index],
//               //           )),
//               // );
//             },
//             child: MouseRegion(
//               onEnter: (event) {
//                 _itemindex = 1;
//               },
//               onExit: (event) {
//                 _itemindex = null;
//               },
//               child: Stack(children: [
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 45.w),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                           margin: EdgeInsets.symmetric(vertical: 30.w),
//                           height: 250.w,
//                           child: _itemindex == 1
//                               ? Image.network(
//                                   productinformaion.productinfo[1].image2!,
//                                   height: 250,
//                                   fit: BoxFit.cover,
//                                 )
//                               : Image.network(
//                                   productinformaion.productinfo[1].image!)),
//                       Wrap(
//                         children: [
//                           Text(
//                               textAlign: TextAlign.left,
//                               productinformaion.productinfo[1].title!,
//                               style: TextStyle(
//                                   fontSize: 20.sp,
//                                   fontWeight: FontWeight.w200,
//                                   color: Colors.black)),
//                         ],
//                       ),
//                       Text(
//                           textAlign: TextAlign.left,
//                           productinformaion.productinfo[1].brand!,
//                           style: TextStyle(
//                               fontSize: 14.sp,
//                               fontWeight: FontWeight.w200,
//                               color: Colors.black)),
//                       Text(
//                           textAlign: TextAlign.left,
//                           productinformaion.productinfo[1].textualPrice!,
//                           style: TextStyle(
//                               fontSize: 20.sp,
//                               fontWeight: FontWeight.w200,
//                               color: Colors.black)),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                     top: 255.w,
//                     child: Card(
//                       color: const Color(0xff5b20e6),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15.r),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 12.w, vertical: 7.w),
//                         child: Text(
//                             "${productinformaion.productinfo[1].discount!}% OFF",
//                             style: TextStyle(
//                                 fontSize: 16.sp,
//                                 fontWeight: FontWeight.w200,
//                                 color: Colors.white)),
//                       ),
//                     ))
//               ]),
//             ),
//           ),
//         )
// //
    );
  }
}

//         SizedBox(
//   width: MediaQuery.of(context).size.width,
//   child: GridView.builder(
//     physics: const NeverScrollableScrollPhysics(),
//     shrinkWrap: true, // Let the GridView determine its height
//     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       mainAxisExtent: 500.w,
//       crossAxisCount: 4,
//       mainAxisSpacing: 30.w,
//       crossAxisSpacing: 30.w,
//     ),
//     itemCount: productinformaion.productinfo.length,
//     itemBuilder: (context, index) {
//       return InkWell(
//         onTap: () {
//           _itemindex = index;
//           _tap = !_tap;
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => OrderItemScreen(
//                 image: productinformaion.productinfo[index].image,
//                 image2: productinformaion.productinfo[index].image2,
//                 brand: productinformaion.productinfo[index].brand,
//                 category: productinformaion.productinfo[index].mainCategory,
//                 discount: productinformaion.productinfo[index].discount,
//                 price: productinformaion.productinfo[index].price,
//                 title: productinformaion.productinfo[index].title,
//                 totalQuantity: productinformaion.productinfo[index].quantity,
//               ),
//             ),
//           );
//         },
//         child: MouseRegion(
//           onEnter: (event) => _itemindex = index,
//           onExit: (event) => _itemindex = null,
//           child: Stack(
//             children: [
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 45.w),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.symmetric(vertical: 30.w),
//                       height: 250.w,
//                       child: Image.network(
//                         _itemindex == index
//                             ? productinformaion.productinfo[index].image2!
//                             :productinformaion.productinfo[index].image!,
//                         height: 250,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Wrap(
//                       children: [
//                         Text(
//                          productinformaion.productinfo[index].title!,
//                           style: TextStyle(
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.w200,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(
//                      productinformaion.productinfo[index].brand!,
//                       style: TextStyle(
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w200,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Text(
//                      productinformaion.productinfo[index].textualPrice!,
//                       style: TextStyle(
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.w200,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 top: 255.w,
//                 child: Card(
//                   color: const Color(0xff5b20e6),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15.r),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.w),
//                     child: Text(
//                       "${productinformaion.productinfo[index].discount!}% OFF",
//                       style: TextStyle(
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w200,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   ),
// )
