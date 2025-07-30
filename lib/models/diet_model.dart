import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxColor,
    required this.viewIsSelected
  });

  static List < DietModel > getDiets() {
    List < DietModel > diets = [];

    diets.add(
      DietModel(
       name: 'Ballı pankek',
       iconPath: 'assets/icons/honey-pancakes.svg',
       level: 'Kolay',
       duration: '30 dakika',
       calorie: '180 kalori',
       viewIsSelected: true,
       boxColor: Color(0xff9DCEFF)
      )
    );

    diets.add(
      DietModel(
       name: 'Canai ekmeği',
       iconPath: 'assets/icons/canai-bread.svg',
       level: 'Kolay',
       duration: '20 dakika',
       calorie: '230 kalori',
       viewIsSelected: false,
       boxColor: Color(0xffEEA4CE)
      )
    );

    return diets;
  }
}