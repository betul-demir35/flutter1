import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

CategoryModel({
required this.name,
required this.iconPath,
required this.boxColor,
});
static List<CategoryModel> getCategories(){
  List<CategoryModel> categories = [];

  categories.add(
    CategoryModel(  
      name: 'salata',
      iconPath: 'assets/icons/plate.svg',
      boxColor: Color(0xff92A3FD),
     )
  );
    categories.add(
    CategoryModel(  
      name: 'tatlı',
      iconPath: 'assets/icons/pie.svg',
      boxColor: Color(0xff92A3FD),
     )
  );
    categories.add(
    CategoryModel(  
      name: 'pasta',
      iconPath: 'assets/icons/pancakes.svg',
      boxColor: Color(0xffC58BF2),
     )
  );
    categories.add(
    CategoryModel(  
      name: 'smoothe',
      iconPath: 'assets/icons/orange-snacks.svg',
      boxColor: Color(0xff92A3FD),
     )
  );
  return categories;
}
}