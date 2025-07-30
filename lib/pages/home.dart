import 'package:fitness/models/category_model.dart';
import 'package:fitness/models/diet_model.dart';
import 'package:fitness/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key}) {
    _initializeData(); // Constructor içinde çağrıldı
  }

  final List<CategoryModel> categories = [];
  final List<DietModel> diets = [];
  final List<PopularDietsModel> popularDiets = [];

  void _initializeData() {
    categories.addAll(CategoryModel.getCategories());
    diets.addAll(DietModel.getDiets());
    popularDiets.addAll(PopularDietsModel.getPopularDiets());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(), //burayı düzenle ama appBar: appBar() olarak kalmak zorunda
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.only(bottom: 40),
        children: [
          _searchField(),
          const SizedBox(height: 40),
          _categoriesSection(),
          const SizedBox(height: 40),
          _dietSection(),
          const SizedBox(height: 40),
          _popularSection(),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Kahvaltı',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height: 20,
            width: 20,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0,
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Ara',
          contentPadding: const EdgeInsets.all(15),
          hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/icons/Search.svg'),
          ),
          suffixIcon: Container(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const VerticalDivider(
                    color: Colors.black,
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assets/icons/Filter.svg'),
                  ),
                ],
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _categoriesSection() {
    return _sectionWithTitle(
      title: 'Kategoriler',
      child: SizedBox(
        height: 120,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: categories.length,
          separatorBuilder: (_, __) => const SizedBox(width: 25),
          itemBuilder: (context, index) {
            final category = categories[index];
            return Container(
              width: 100,
              decoration: BoxDecoration(
                color: category.boxColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(category.iconPath),
                    ),
                  ),
                  Text(
                    category.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _dietSection() {
    return _sectionWithTitle(
      title: 'Öneriler\n Diyet',
      child: SizedBox(
        height: 240,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: diets.length,
          separatorBuilder: (_, __) => const SizedBox(width: 25),
          itemBuilder: (context, index) {
            final diet = diets[index];
            return Container(
              width: 210,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: diet.boxColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(diet.iconPath),
                  Column(
                    children: [
                      Text(
                        diet.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '${diet.level} | ${diet.duration} | ${diet.calorie}',
                        style: const TextStyle(
                          color: Color(0xff7B6F72),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 45,
                    width: 130,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: diet.viewIsSelected
                          ? const LinearGradient(
                              colors: [Color(0xff9DCEFF), Color(0xff92A3FD)],
                            )
                          : null,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      'View',
                      style: TextStyle(
                        color: diet.viewIsSelected
                            ? Colors.white
                            : const Color(0xffC58BF2),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _popularSection() {
    return _sectionWithTitle(
      title: 'Popüler',
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: popularDiets.length,
        separatorBuilder: (_, __) => const SizedBox(height: 25),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          final item = popularDiets[index];
          return Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: item.boxIsSelected ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              boxShadow: item.boxIsSelected
                  ? [
                      BoxShadow(
                        color: const Color(0xff1D1617).withOpacity(0.07),
                        offset: const Offset(0, 10),
                        blurRadius: 40,
                      )
                    ]
                  : [],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(item.iconPath, width: 65, height: 65),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '${item.level} | ${item.duration} | ${item.calorie}',
                      style: const TextStyle(
                        color: Color(0xff7B6F72),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/icons/button.svg',
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _sectionWithTitle({required String title, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 15),
          child,
        ],
      ),
    );
  }
}
