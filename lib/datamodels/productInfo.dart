import 'package:flutter/material.dart';

class Productinfo {
  String? image;
  String? image2;
  String? title;
  String? textualPrice;
  double? price;
  int? quantity;
  String? brand;
  String? mainCategory;
  String? subCategory;
  String? precizeCategory;
  double? discount;
  String? size;
  List<Color> itemcolor = [];
  Productinfo({
    this.image,
    this.image2,
    this.title,
    this.textualPrice,
    this.price,
    this.quantity,
    this.brand,
    this.mainCategory,
    this.subCategory,
    this.precizeCategory,
    this.discount,
    this.size,
    List<Color>? itemcolor,
  });

  static List<Productinfo> productinfo = [
    Productinfo(
      image: "assets/images/armguard.png",
      image2: "assets/images/armguard.png",
      title: "CA Gold Cricket Arm Guard",
      brand: "CA",
      textualPrice: "Rs.1,450.00 PKR",
      price: 1450.00,
      mainCategory: "cricket",
      subCategory: "cricket others",
      precizeCategory: "leg wear",
      size: "Large",
      discount: 25.0,
      quantity: 25,
    ),
    Productinfo(
      image: "assets/images/saleItem7-removebg-preview.png",
      image2: "assets/images/saleItem7_1-removebg-preview.png",
      title: "CA Kamo Cricket Shoes",
      brand: "CA",
      textualPrice: "Rs.6,500.00 PKR",
      price: 6500.00,
      mainCategory: "cricket",
      subCategory: "cricket shoes",
      precizeCategory: "shoes",
      discount: 25.0,
      quantity: 25,
    ),
    Productinfo(
      image: "assets/images/saleItem1_1-removebg-preview.png",
      image2: "assets/images/saleItem1_2-removebg-preview.png",
      title: "Summer Sports V2 T-Shirt",
      brand: "Psl",
      textualPrice: "Rs.1,450.00 PKR",
      price: 1450.00,
      subCategory: "cricket t-shirt",
      mainCategory: "cricket",
      precizeCategory: "t-shirt",
      discount: 11.0,
      quantity: 25,
    ),
    Productinfo(
      image: "assets/images/saleItem2_1-removebg-preview.png",
      image2: "assets/images/saleItem2_2-removebg-preview.png",
      title: "Summer Sports V3 T-Shirt",
      brand: "Psl",
      textualPrice: "Rs.1,450.00 PKR",
      price: 1450.00,
      subCategory: "cricket t-shirt",
      mainCategory: "cricket",
      precizeCategory: "t-shirt",
      discount: 22.0,
      quantity: 25,
    ),
    Productinfo(
      image: "assets/images/saleItem3_1-removebg-preview.png",
      image2: "assets/images/saleItem3_2-removebg-preview.png",
      title: "Summer Sports V4 T-Shirt",
      brand: "Psl",
      textualPrice: "Rs.1,490.00 PKR",
      price: 1490.00,
      subCategory: "cricket t-shirt",
      mainCategory: "cricket",
      precizeCategory: "t-shirt",
      discount: 19.0,
      quantity: 25,
    ),
    Productinfo(
      image: "assets/images/saleItem4_1-removebg-preview.png",
      image2: "assets/images/saleItem4_2-removebg-preview.png",
      title: "Dual Tone Dry Sports T-Shirt",
      brand: "Psl",
      textualPrice: "Rs.1,490.00 PKR",
      price: 1490.00,
      subCategory: "cricket t-shirt",
      mainCategory: "cricket",
      precizeCategory: "t-shirt",
      discount: 16.0,
      quantity: 25,
    ),
    Productinfo(
      image: "assets/images/saleItem5_1-removebg-preview.png",
      image2: "assets/images/saleItem5_2-removebg-preview.png",
      title: "Dual Tone Dry Sports V2 T-Shirt",
      brand: "Psl",
      textualPrice: "Rs.1,490.00 PKR",
      price: 1490.00,
      subCategory: "cricket t-shirt",
      mainCategory: "cricket",
      precizeCategory: "t-shirt",
      discount: 25.0,
      quantity: 25,
    ),
    Productinfo(
      image: "assets/images/saleItem8_1-removebg-preview.png",
      image2: "assets/images/saleItem8-removebg-preview.png",
      title: "CA PRO Boost Cricket Shoes",
      brand: "CA",
      textualPrice: "Rs.1,550.00 PKR",
      price: 1550.00,
      subCategory: "cricket t-shirt",
      mainCategory: "cricket",
      precizeCategory: "shoes",
      discount: 25.0,
      quantity: 25,
    ),
    Productinfo(
      image: "assets/images/saleItem6_1-removebg-preview.png",
      image2: "assets/images/saleItem6_2-removebg-preview.png",
      title: "Dual Tone Dry Sports V8 T-Shirt",
      brand: "Psl",
      textualPrice: "Rs.1,490.00 PKR",
      price: 1490.00,
      subCategory: "cricket t-shirt",
      mainCategory: "cricket",
      precizeCategory: "t-shirt",
      discount: 20.0,
      quantity: 25,
    ),
    Productinfo(
      image: "assets/images/chestGuard.png",
      image2: "assets/images/chestguard2.png",
      title: "CA Plus Cricket chest Guard",
      brand: "CA",
      textualPrice: "Rs.1,950.00 PKR",
      price: 1950.00,
      subCategory: "cricket others",
      mainCategory: "cricket",
      precizeCategory: "chest Guard",
      discount: 12.0,
      quantity: 25,
    ),
    Productinfo(
      image: "assets/images/cricket_helmet.png",
      image2: "assets/images/crickethelmet2.png",
      title: "CA Plus Cricket Helmet",
      brand: "CA",
      textualPrice: "Rs.4,500.00 PKR",
      price: 4500.00,
      subCategory: "cricket others",
      mainCategory: "cricket",
      precizeCategory: "Cricket Helmet",
      discount: 19.0,
      quantity: 25,
    ),
    Productinfo(
      image: "assets/images/thighGuard.png",
      image2: "assets/images/thightguard3.png",
      title: "CA Performance 15000 Thigh Pad",
      brand: "CA",
      textualPrice: "Rs.5,450.00 PKR",
      price: 5450.00,
      subCategory: "cricket others",
      mainCategory: "cricket",
      precizeCategory: "Thigh Pad",
      discount: 25.0,
      quantity: 25,
    ),
    Productinfo(
      image: "assets/images/thighguard2.png",
      image2: "assets/images/thighguard4.png",
      title: "CA Performance 10000 Thigh Pad",
      brand: "CA",
      textualPrice: "Rs.4,650.00 PKR",
      price: 4650.00,
      subCategory: "cricket others",
      mainCategory: "cricket",
      precizeCategory: "Thigh Pad",
      discount: 25.0,
      quantity: 25,
    ),
    Productinfo(
      image: "assets/images/shoes.png",
      image2: "assets/images/shoes2.png",
      title: "CA Kamo Cricket Shoes",
      brand: "CA",
      textualPrice: "Rs.6,500.00 PKR",
      price: 6500.00,
      mainCategory: "cricket",
      subCategory: "cricket shoes",
      precizeCategory: "shoes",
      discount: 18.0,
      quantity: 25,
    ),
    Productinfo(
      image: "assets/images/rollerStick2.png",
      image2: "assets/images/rollerStick.png",
      title:
          "Deep Tissue Muscle Massage Roller Stick for Pain Relief & Recovery",
      brand: "ALI SPORTS",
      textualPrice: "Rs.1,550.00 PKR",
      price: 1550.00,
      mainCategory: "fitness & exercise",
      subCategory: "massage",
      precizeCategory: "Roller",
      discount: 14.0,
      quantity: 25,
    ),
    Productinfo(
      image: "assets/images/yogaball.png",
      image2: "assets/images/yogaball2.png",
      title: "Anti-Burst Exercise Gym Ball for Yoga & Fitness",
      brand: "ALI SPORTS",
      textualPrice: "Rs.1,850.00 PKR",
      price: 1850.00,
      mainCategory: "fitness & exercise",
      subCategory: "exercise",
      precizeCategory: "Gym Ball",
      discount: 25.0,
      quantity: 25,
    ),
  ];

  void addProductInfo(Productinfo product) {
    productinfo.add(product);
  }

  // Method to update a Productinfo item at a specific index
  void updateProduct(int index, Productinfo updatedProduct) {
    if (index >= 0 && index < productinfo.length) {
      productinfo[index] = updatedProduct;
    } else {
      debugPrint('Index out of range');
    }
  }

  // Method to delete a Productinfo item at a specific index
  void deleteProduct(int index) {
    if (index >= 0 && index < productinfo.length) {
      productinfo.removeAt(index);
    } else {
      debugPrint('Index out of range');
    }
  }

  List<Productinfo> filterProducts(bool Function(Productinfo) condition) {
    return productinfo.where(condition).toList();
  }
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////DEMO//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//  Productinfo product1 = Productinfo(
//   image: 'path/to/image1.jpg',
//   title: 'Product 1',
//   textualPrice: '\$100',
//   price: 100.0,
//   quantity: 10,
//   brand: 'Brand A',
//   mainCategory: 'Category A',
//   subCategory: 'Subcategory A',
//   precizeCategory: 'Precize Category A',
//   discount: 10.0,
//   size: 'M',
//   itemcolor: [Colors.red, Colors.blue],
// );

// Productinfo product2 = Productinfo(
//   image: 'path/to/image2.jpg',
//   title: 'Product 2',
//   textualPrice: '\$200',
//   price: 200.0,
//   quantity: 5,
//   brand: 'Brand B',
//   mainCategory: 'Category B',
//   subCategory: 'Subcategory B',
//   precizeCategory: 'Precize Category B',
//   discount: 15.0,
//   size: 'L',
//   itemcolor: [Colors.green, Colors.yellow],
// );

// // Add products to the productinfo list
// productManager.addProductInfo(product1);
// productManager.addProductInfo(product2);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////HOW TO FILTER////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////
// List<Productinfo> caCricketProducts = Productinfo.productinfo.where((product) =>
//     product.brand == "CA" && product.mainCategory == "cricket"
// ).toList();
// List<Productinfo> discountedProducts = Productinfo.filterProducts((product) => product.discount != null && product.discount! > 20.0);

//   List<Productinfo> caBrandProducts = Productinfo.productinfo.where((product) => product.brand == "CA").toList();
// List<Productinfo> cricketCategoryProducts = Productinfo.productinfo.where((product) => product.mainCategory == "cricket").toList();
// // Get products with brand "CA"
// caBrandProducts = Productinfo.filterProducts((product) => product.brand == "CA");


// List<Productinfo> cricketProducts = Productinfo.filterProducts((product) => product.mainCategory == "cricket");


// caCricketProducts = Productinfo.filterProducts((product) =>
//     product.brand == "CA" && product.mainCategory == "cricket")

////////////////////////////////////////////////////////////////////////////////////////////////////////////