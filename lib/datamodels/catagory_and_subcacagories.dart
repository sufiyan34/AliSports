import 'dart:core';

import 'package:flutter/material.dart';

class Category {
  String? categoryName;
  List<String>? subCategories;

  Category({
    this.categoryName,
    this.subCategories,
  });
}

class CatagoryAndSubcacagories {
  // List<List<String>>? category;
  // List<List<String>>? subCategory;
  String? mainCategory;
  List<Category>? categories;

  CatagoryAndSubcacagories({
    this.mainCategory,
    this.categories,
  });

  // CatagoryAndSubcacagories({
  //   this.mainCategory,
  //   this.category,
  //   this.subCategory,

  // }) {
  //   mainCategory = mainCategory ?? "No Category";
  //   category = category ??
  //       [
  //         ["No Category"]
  //       ];
  //   subCategory = subCategory ??
  //       [
  //         ["No SubCategory"]
  //       ];

  // }

  ///////////////LIST of Item //////////////////////////
  List<CatagoryAndSubcacagories> itemsInfo = [
    CatagoryAndSubcacagories(
      mainCategory: "Cricket",
      categories: [
        Category(
          categoryName: "hardballItems",
          subCategories: hardballItems,
        ),
        Category(
          categoryName: "softballItems",
          subCategories: softballItems,
        ),
      ],
    ),
    CatagoryAndSubcacagories(
      mainCategory: "Badminton",
      categories: [
        Category(
          categoryName: "badmintonEquipment",
          subCategories: badmintonEquipment,
        ),
      ],
    ),
    CatagoryAndSubcacagories(
      mainCategory: "Tennis",
      categories: [
        Category(
          categoryName: "tennisEquipment",
          subCategories: tennisEquipment,
        ),
      ],
    ),
    CatagoryAndSubcacagories(
      mainCategory: "Table Tennis",
      categories: [
        Category(
          categoryName: "tabletennisEquipment",
          subCategories: tabletennisEquipment,
        ),
      ],
    ),
    CatagoryAndSubcacagories(
      mainCategory: "Exercise & Fitness",
      categories: [
        Category(
          categoryName: "exerciseAndFittnessEquipment",
          subCategories: exerciseAndFittnessEquipment,
        ),
      ],
    ),
    CatagoryAndSubcacagories(
      mainCategory: "Sports Wear",
      categories: [
        Category(
          categoryName: "sportsWear",
          subCategories: sportsWear,
        ),
      ],
    ),
    CatagoryAndSubcacagories(
      mainCategory: "Accessories",
      categories: [
        Category(
          categoryName: "accessories",
          subCategories: accessories,
        ),
      ],
    ),
    CatagoryAndSubcacagories(
      mainCategory: "Football",
      categories: [
        Category(
          categoryName: "footballs",
          subCategories: [
            "Football Balls",
            "Shoes",
            "Goalkeeper Gloves",
            "Shin Guards",
            "Other Accessories"
          ],
        ),
        Category(
          categoryName: "footballShoes",
          subCategories: ["Football Shoes"],
        ),
        Category(
          categoryName: "goalkeeperGloves",
          subCategories: ["Goalkeeper Gloves"],
        ),
        Category(
          categoryName: "otherAccessories",
          subCategories: ["Shin Guards", "Other Accessories"],
        ),
      ],
    ),
    CatagoryAndSubcacagories(
      mainCategory: "Basketball",
      categories: [
        Category(
          categoryName: "basketballs",
          subCategories: ["Basketballs"],
        ),
        Category(
          categoryName: "basketballShoes",
          subCategories: ["Basketball Shoes"],
        ),
        Category(
          categoryName: "basketballAccessories",
          subCategories: ["Jerseys", "Other Accessories"],
        ),
      ],
    ),
    CatagoryAndSubcacagories(
      mainCategory: "Volleyball",
      categories: [
        Category(
          categoryName: "volleyballs",
          subCategories: ["Volleyball Balls"],
        ),
        Category(
          categoryName: "volleyballAccessories",
          subCategories: ["Shoes", "Nets", "Other Accessories"],
        ),
      ],
    ),
    CatagoryAndSubcacagories(
      mainCategory: "Snooker & Billiard",
      categories: [
        Category(
          categoryName: "cues",
          subCategories: ["Cues"],
        ),
        Category(
          categoryName: "balls",
          subCategories: ["Balls"],
        ),
        Category(
          categoryName: "tables",
          subCategories: ["Tables"],
        ),
        Category(
          categoryName: "otherAccessories",
          subCategories: ["Other Accessories"],
        ),
      ],
    ),
    CatagoryAndSubcacagories(
      mainCategory: "Squash",
      categories: [
        Category(
          categoryName: "squashRackets",
          subCategories: ["Rackets"],
        ),
        Category(
          categoryName: "squashBalls",
          subCategories: ["Balls"],
        ),
        Category(
          categoryName: "squashAccessories",
          subCategories: ["Shoes", "Other Accessories"],
        ),
      ],
    ),
    CatagoryAndSubcacagories(
      mainCategory: "Swimming",
      categories: [
        Category(
          categoryName: "swimwear",
          subCategories: ["Swimsuits"],
        ),
        Category(
          categoryName: "swimmingAccessories",
          subCategories: ["Goggles", "Swim Caps", "Other Accessories"],
        ),
      ],
    ),
    CatagoryAndSubcacagories(
      mainCategory: "Skating & Scooty",
      categories: [
        Category(
          categoryName: "skates",
          subCategories: ["Skates"],
        ),
        Category(
          categoryName: "scooters",
          subCategories: ["Scooters"],
        ),
        Category(
          categoryName: "safetyAccessories",
          subCategories: ["Helmets", "Pads", "Other Accessories"],
        ),
      ],
    ),
    CatagoryAndSubcacagories(
      mainCategory: "Indoor Games",
      categories: [
        Category(
          categoryName: "boardGames",
          subCategories: ["Chess", "Carrom", "Ludo", "Other Indoor Games"],
        ),
        Category(
          categoryName: "tableGames",
          subCategories: ["Table Games"],
        ),
        Category(
          categoryName: "puzzleGames",
          subCategories: ["Puzzles"],
        ),
      ],
    ),
    CatagoryAndSubcacagories(
      mainCategory: "Trophies & Awards",
      categories: [
        Category(
          categoryName: "trophies",
          subCategories: ["Trophies"],
        ),
        Category(
          categoryName: "medals",
          subCategories: ["Medals"],
        ),
        Category(
          categoryName: "plaques",
          subCategories: ["Plaques"],
        ),
      ],
    ),
    CatagoryAndSubcacagories(
      mainCategory: "Sale",
      categories: [
        Category(
          categoryName: "discountedItems",
          subCategories: ["Discounted Items"],
        ),
        Category(
          categoryName: "specialOffers",
          subCategories: ["Special Offers", "Clearance"],
        ),
      ],
    ),
  ];

  // List<CatagoryAndSubcacagories> itemsInfo = [
  //   CatagoryAndSubcacagories(
  //     mainCategory: "Cricket",
  //     categories:[  Category(
  //         categoryName: "hardballItems",
  //         subCategories: hardballItems,
  //       ),
  //       Category(
  //         categoryName: "softballItems",
  //         subCategories: softballItems,
  //       ),
  //       ]

  //   ),
  //   CatagoryAndSubcacagories(
  //     mainCategory: "Badminton",
  //      categories:[  Category(
  //         categoryName: "badmintonEquipment",
  //         subCategories: badmintonEquipment,
  //       ),

  //       ]

  //   ),
  //   CatagoryAndSubcacagories(
  //     mainCategory: "Tennis",
  //      categories:[  Category(
  //         categoryName: "tennisEquipment",
  //         subCategories: tennisEquipment,
  //       ),

  //       ]

  //   ),
  //   CatagoryAndSubcacagories(
  //     mainCategory: "Table Tennis",

  //      categories:[  Category(
  //         categoryName: "tabletennisEquipment",
  //         subCategories: tabletennisEquipment,
  //       ),

  //       ]
  //     category: [
  //       ["tabletennisEquipment"]
  //     ],
  //     subCategory: [tabletennisEquipment],
  //   ),
  //   CatagoryAndSubcacagories(
  //     mainCategory: "Exercise & Fitness",
  //     category: [
  //       ["exerciseAndFittnessEquipment"]
  //     ],
  //     subCategory: [exerciseAndFittnessEquipment],
  //   ),
  //   CatagoryAndSubcacagories(
  //     mainCategory: "Sports Wear",
  //     category: [
  //       ["sportsWear"]
  //     ],
  //     subCategory: [sportsWear],
  //   ),
  //   CatagoryAndSubcacagories(
  //     mainCategory: "Accessories",
  //     category: [
  //       ["accessories"]
  //     ],
  //     subCategory: [accessories],
  //   ),
  //   CatagoryAndSubcacagories(
  //     mainCategory: "Football",
  //     category: [
  //       ["footballs", "footballShoes", "goalkeeperGloves", "otherAccessories"]
  //     ],
  //     subCategory: [
  //       [
  //         "Football Balls",
  //         "Shoes",
  //         "Goalkeeper Gloves",
  //         "Shin Guards",
  //         "Other Accessories"
  //       ]
  //     ],
  //   ),
  //   CatagoryAndSubcacagories(
  //     mainCategory: "Basketball",
  //     category: [
  //       ["basketballs", "basketballShoes", "basketballAccessories"]
  //     ],
  //     subCategory: [
  //       ["Basketballs", "Shoes", "Jerseys", "Other Accessories"]
  //     ],
  //   ),
  //   CatagoryAndSubcacagories(
  //     mainCategory: "Volleyball",
  //     category: [
  //       ["volleyballs", "volleyballAccessories"]
  //     ],
  //     subCategory: [
  //       ["Volleyball Balls", "Shoes", "Nets", "Other Accessories"]
  //     ],
  //   ),
  //   CatagoryAndSubcacagories(
  //     mainCategory: "Snooker & Billiard",
  //     category: [
  //       ["cues", "balls", "tables", "otherAccessories"]
  //     ],
  //     subCategory: [
  //       ["Cues", "Balls", "Tables", "Other Accessories"]
  //     ],
  //   ),
  //   CatagoryAndSubcacagories(
  //     mainCategory: "Squash",
  //     category: [
  //       ["squashRackets", "squashBalls", "squashAccessories"]
  //     ],
  //     subCategory: [
  //       ["Rackets", "Balls", "Shoes", "Other Accessories"]
  //     ],
  //   ),
  //   CatagoryAndSubcacagories(
  //     mainCategory: "Swimming",
  //     category: [
  //       ["swimwear", "swimmingAccessories"]
  //     ],
  //     subCategory: [
  //       ["Swimsuits", "Goggles", "Swim Caps", "Other Accessories"]
  //     ],
  //   ),
  //   CatagoryAndSubcacagories(
  //     mainCategory: "Skating & Scooty",
  //     category: [
  //       ["skates", "scooters", "safetyAccessories"]
  //     ],
  //     subCategory: [
  //       ["Skates", "Scooters", "Helmets", "Pads", "Other Accessories"]
  //     ],
  //   ),
  //   CatagoryAndSubcacagories(
  //     mainCategory: "Indoor Games",
  //     category: [
  //       ["boardGames", "tableGames", "puzzleGames"]
  //     ],
  //     subCategory: [
  //       ["Chess", "Carrom", "Puzzles", "Ludo", "Other Indoor Games"]
  //     ],
  //   ),
  //   CatagoryAndSubcacagories(
  //     mainCategory: "Trophies & Awards",
  //     category: [
  //       ["trophies", "medals", "plaques"]
  //     ],
  //     subCategory: [
  //       ["Trophies", "Medals", "Plaques", "Other Awards"]
  //     ],
  //   ),
  //   CatagoryAndSubcacagories(
  //     mainCategory: "Sale",
  //     category: [
  //       ["discountedItems", "specialOffers"]
  //     ],
  //     subCategory: [
  //       ["Discounted Items", "Special Offers", "Clearance"]
  //     ],
  //   ),
  // ];

  ///////////////////////////////////////////////////////y
  ///// Filtered list to store matching main categories///////////
  static List<CatagoryAndSubcacagories> filteredItems = [];
  ////////////////////ADD PRODUCT ///////////////////////
  void addItemsInfo(CatagoryAndSubcacagories item) {
    itemsInfo.add(item);
  }

  // Method to update a Productinfo item at a specific index
  void updateItemsInfo({int? index, CatagoryAndSubcacagories? updatedProduct}) {
    if (index! >= 0 && index < itemsInfo.length) {
      itemsInfo[index] = updatedProduct!;
    } else {
      debugPrint('Index out of range');
    }
  }

  // Method to delete a Productinfo item at a specific index
  void deleteItemsInfo(int index) {
    if (index >= 0 && index < itemsInfo.length) {
      itemsInfo.removeAt(index);
    } else {
      debugPrint('Index out of range');
    }
  }

  // Method to filter items by main category and add to filteredItems
  void filterItems(String mainCategory) {
    filteredItems =
        itemsInfo.where((item) => item.mainCategory == mainCategory).toList();
    debugPrint('$filteredItems');
  }
}

List<String> myMainCategory = [
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
List<String> myCategory = [
  "hardballItems",
  "softballItems",
  "badmintonEquipment",
  "tennisEquipment",
  "tabletennisEquipment",
  "exerciseAndFittnessEquipment",
  "sportsWear",
  "accessories",
];
List<List<String>> mySubCategory = [
  hardballItems,
  softballItems,
  badmintonEquipment,
  tennisEquipment,
  tabletennisEquipment,
  exerciseAndFittnessEquipment,
  sportsWear,
  accessories
];
List<String> hardballItems = [
  "Bats",
  "Balls",
  "Batting Gloves",
  "Batting Pads",
  "Wicket Keeping Gloves",
  "Wicket Keeping Pads",
  "Helmets",
  "Thigh Pads",
  "Kit Bags",
  "Shoes",
  "Other Accessories"
];
List<String> softballItems = [
  "Bats",
  "Balls",
  "Shoes",
  "Kitbags",
  "Other Accessories"
];
final List<String> badmintonEquipment = [
  'Rackets',
  'Strings',
  'Shuttlecocks',
  'Shoes',
  'Racket Bags',
  'Badminton Nets',
  'Other Accessories',
  'View all',
];
final List<String> tennisEquipment = [
  "Rackets",
  "Strings",
  "Balls",
  "Shoes",
  "Racket Bags",
  "Other Accessories",
  'View all',
];
final List<String> tabletennisEquipment = [
  "Rackets",
  "Balls",
  "Shoes",
  "Other Accessories",
  'View all',
];
final List<String> exerciseAndFittnessEquipment = [
  "FittnessEquipment",
  'Recovery Sports',
];
final List<String> sportsWear = [
  "Shirts",
  "Trousers",
  "Shorts",
  "Tracksuits & Uppers",
  "Base Layers",
  "Socks",
  "Underwear",
  "View all"
];
final List<String> accessories = [
  "Shirts",
  "Trousers",
  "Shorts",
  "Tracksuits & Uppers",
  "Base Layers",
  "Socks",
  "Underwear",
  "View all"
];
