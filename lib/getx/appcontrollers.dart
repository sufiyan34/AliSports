import 'package:alisportspk/datamodels/productInfo.dart';
import 'package:alisportspk/datamodels/user_reviews_ClassModel.dart';
import 'package:alisportspk/view/modules/dropdownlists/accessories_dropdown.dart';
import 'package:alisportspk/view/modules/dropdownlists/badmintion_dropdown.dart';
import 'package:alisportspk/view/modules/dropdownlists/cricket_dropdown.dart';
import 'package:alisportspk/view/modules/dropdownlists/exercise&fittness_dropdown.dart';
import 'package:alisportspk/view/modules/dropdownlists/sportswear_dropdown.dart';
import 'package:alisportspk/view/modules/dropdownlists/tabletennis_dropdown.dart';
import 'package:alisportspk/view/modules/dropdownlists/tennis_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppControllers extends GetxController {
  RxBool openDrader = false.obs;
  Rx<int> filterTitleIndex = (-1).obs;
  Rx<int> dropdownPlutoMenusIndex = (-1).obs;
  Rx<String> dropdownPlutoMenusTitle = "No Category".obs;
  RxList<bool> boldUnderline = List.filled(6, false).obs;
  RxBool openMenuContainer = false.obs;
  RxString pickkupValue = "Ship".obs;
  RxString payment = "Cash on Delivery (COD)".obs;
  RxString billingAddress = "Same as shipping address".obs;
  Rx<Productinfo> choosenProduct = Rx<Productinfo>(Productinfo());
  RxString productSize = "M".obs;
  Rx<int> productPurchaseQuantity = 1.obs;
  Rx<double> productDiscountPercentage = 0.00.obs;
  Rx<double> productDiscountedPrice = 0.00.obs;
  Rx<double> productShippingPrice = 300.0.obs;
  void toggleDrawer() {
    openDrader.toggle();
  }

  RxList<Widget> dropdownPlutoMenus = [
    const CricketDropdown(),
    const BadmintionDropdown(),
    const TennisDropdown(),
    const TableTennisDropdown(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
    const ExerciseAndFittnessDropdown(),
    const Placeholder(),
    const SportswearDropdown(),
    const AccessoriesDropdown(),
    const Placeholder(),
    const Placeholder(),
  ].obs;
  RxList<Productinfo> addedInCartProducts = <Productinfo>[].obs;

  RxList<Productinfo> suggestionProductsRelatedToCart = <Productinfo>[].obs;
  void suggestionForProducs() {
    for (var i = 0; i < addedInCartProducts.length; i++) {
      for (int j = 0; j < Productinfo.productinfo.length; j++) {
        if (addedInCartProducts[i].mainCategory ==
                Productinfo.productinfo[j].mainCategory ||
            addedInCartProducts[i].brand == Productinfo.productinfo[j].brand ||
            addedInCartProducts[i].subCategory ==
                Productinfo.productinfo[j].subCategory ||
            addedInCartProducts[i].precizeCategory ==
                Productinfo.productinfo[j].precizeCategory) {
          suggestionProductsRelatedToCart.add(Productinfo.productinfo[j]);
        }
      }
    }
  }

  void removeSuggestionForProducs() {
    for (var i = 0; i < addedInCartProducts.length; i++) {
      for (int j = 0; j < Productinfo.productinfo.length; j++) {
        if (addedInCartProducts[i].mainCategory ==
                Productinfo.productinfo[j].mainCategory ||
            addedInCartProducts[i].brand == Productinfo.productinfo[j].brand ||
            addedInCartProducts[i].subCategory ==
                Productinfo.productinfo[j].subCategory ||
            addedInCartProducts[i].precizeCategory ==
                Productinfo.productinfo[j].precizeCategory) {
          suggestionProductsRelatedToCart.remove(Productinfo.productinfo[j]);
        }
      }
    }
  }

  // Method to update specific index with a new widget
  void updateDropdownMenu(int index, Widget newWidget) {
    if (index >= 0 && index < dropdownPlutoMenus.length) {
      dropdownPlutoMenus[index] = newWidget;
    }
  }

  // Method to reset placeholders with a specific widget
  void replacePlaceholders(Widget replacementWidget) {
    for (int i = 0; i < dropdownPlutoMenus.length; i++) {
      if (dropdownPlutoMenus[i] is Placeholder) {
        dropdownPlutoMenus[i] = replacementWidget;
      }
    }
  }

  final RxList<UserReviews> userReviews = [
    UserReviews(
      image: "assets/images/catagoryItem1.jpg",
      name: "Bilal Zakir",
      item: "Cricket Bat",
      review: "I like this product",
      rating: 5.0,
    ),
    UserReviews(
      image: "assets/images/catagoryItem2.jpg",
      name: "Bilal Zakir",
      item: "Cricket Bat",
      review: "I like this product",
      rating: 5.0,
    ),
    UserReviews(
      image: "assets/images/catagoryItem3.jpg",
      name: "Bilal Zakir",
      item: "Cricket Bat",
      review: "I like this product",
      rating: 5.0,
    ),
    UserReviews(
      image: "assets/images/catagoryItem4.jpg",
      name: "Bilal Zakir",
      item: "Cricket Bat",
      review: "I like this product",
      rating: 5.0,
    ),
    UserReviews(
      image: "assets/images/catagoryItem5.jpg",
      name: "Bilal Zakir",
      item: "Cricket Bat",
      review: "I like this product",
      rating: 5.0,
    ),
    UserReviews(
      image: "assets/images/catagoryItem6.jpg",
      name: "Bilal Zakir",
      item: "Cricket Bat",
      review: "I like this product",
      rating: 5.0,
    ),
    UserReviews(
      image: "assets/images/catagoryItem7.jpg",
      name: "Bilal Zakir",
      item: "Cricket Bat",
      review: "I like this product",
      rating: 5.0,
    ),
    UserReviews(
      image: "assets/images/catagoryItem12.jpg",
      name: "Bilal Zakir",
      item: "Cricket Bat",
      review: "I like this product",
      rating: 5.0,
    ),
    UserReviews(
      image: "assets/images/catagoryItem9.jpg",
      name: "Bilal Zakir",
      item: "Cricket Bat",
      review: "I like this product",
      rating: 5.0,
    ),
    UserReviews(
      image: "assets/images/catagoryItem10.jpg",
      name: "Bilal Zakir",
      item: "Cricket Bat",
      review: "I like this product",
      rating: 5.0,
    ),
    UserReviews(
      image: "assets/images/catagoryItem11.jpg",
      name: "Bilal Zakir",
      item: "Cricket Bat",
      review: "I like this product",
      rating: 5.0,
    ),
    UserReviews(
      image: "assets/images/catagoryItem13.jpg",
      name: "Bilal Zakir",
      item: "Cricket Bat",
      review: "I like this product",
      rating: 5.0,
    ),
  ].obs;
}
