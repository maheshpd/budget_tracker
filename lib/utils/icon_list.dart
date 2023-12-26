import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppIcon {
  final List<Map<String, dynamic>> homeExpansesCategories = [
    {
      "name": "Gas Filling",
      "icon": FontAwesomeIcons.gasPump,
    },
    {
      "name": "Grocery",
      "icon": FontAwesomeIcons.cartShopping,
    },
    {
      "name": "Milk",
      "icon": FontAwesomeIcons.mugHot,
    },
    {
      "name": "Internet",
      "icon": FontAwesomeIcons.wifi,
    },
    {
      "name": "Water",
      "icon": FontAwesomeIcons.water,
    },
    {
      "name": "Rent",
      "icon": FontAwesomeIcons.house,
    },
    {
      "name": "Phone Bill",
      "icon": FontAwesomeIcons.phone,
    },
    {
      "name": "Dining Out",
      "icon": FontAwesomeIcons.utensils,
    },
    {
      "name": "Entertainment",
      "icon": FontAwesomeIcons.utensils,
    },
    {
      "name": "Healthcare",
      "icon": FontAwesomeIcons.suitcaseMedical,
    },
    {
      "name": "Transportation",
      "icon": FontAwesomeIcons.bus,
    },
    {
      "name": "Clothing",
      "icon": FontAwesomeIcons.shirt,
    },
    {
      "name": "Insurance",
      "icon": FontAwesomeIcons.shieldHalved,
    },
    {
      "name": "Education",
      "icon": FontAwesomeIcons.graduationCap,
    },
    {
      "name": "Others",
      "icon": FontAwesomeIcons.cartShopping,
    },
  ];

   IconData getExpenseategoryIcons(String categoryName) {
    final category = homeExpansesCategories.firstWhere(
        (category) => category['name'] == categoryName,
        orElse: () => {'icon': FontAwesomeIcons.cartShopping});
    return category['icon'];
  }
}
