import 'package:flutter/material.dart';

class DropdownMenuList extends StatefulWidget {
  const DropdownMenuList({super.key});

  @override
  State<DropdownMenuList> createState() => _DropdownMenuListState();
}

class _DropdownMenuListState extends State<DropdownMenuList> {
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
  List<String> cricketHardballItems = [
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
  List<String> cricketSoftballItems = [
    "Bats",
    "Balls",
    "Shoes",
    "Kitbags",
    "Other Accessories"
  ];
  final List<String> _badmintonEquipment = [
    'Rackets',
    'Strings',
    'Shuttlecocks',
    'Shoes',
    'Racket Bags',
    'Badminton Nets',
    'Other Accessories',
    'View all',
  ];
  final List<String> _tennisEquipment = [
    "Rackets",
    "Strings",
    "Balls",
    "Shoes",
    "Racket Bags",
    "Other Accessories",
    'View all',
  ];
  final List<String> _accessories = [
    "Shirts",
    "Trousers",
    "Shorts",
    "Tracksuits & Uppers",
    "Base Layers",
    "Socks",
    "Underwear",
    "View all"
  ];
  final List<String> _exerciseAndFittnessEquipment = [
    "FittnessEquipment",
    'Recovery Sports',
  ];
  final List<String> _sportsWear = [
    "Shirts",
    "Trousers",
    "Shorts",
    "Tracksuits & Uppers",
    "Base Layers",
    "Socks",
    "Underwear",
    "View all"
  ];
  final List<String> _tabletennisEquipment = [
    "Rackets",
    "Balls",
    "Shoes",
    "Other Accessories",
    'View all',
  ];
  Map<String, List> sportsEquipmentMap = {};

  @override
  void initState() {
    sportsEquipmentMap = {
      "Cricket": [cricketHardballItems, cricketSoftballItems],
      "Badminton": [_badmintonEquipment],
      "Tennis": [_tennisEquipment],
      "Table Tennis": [_tabletennisEquipment],
      "Football": [],
      "Basketball": [],
      "Volleyball": [],
      "Snooker & Billiard": [],
      "Squash": [],
      "Swimming": [],
      "Skating & Scooty": [],
      "Exercise & Fitness": [_exerciseAndFittnessEquipment],
      "Indoor Games": [],
      "Sports Wear": [_sportsWear],
      "Accessories": [_accessories],
      "Trophies & Awards": [],
      "Sale": [],
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        children: [],
      ),
    );
  }
}
