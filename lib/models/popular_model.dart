class PopularDietsModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;

  PopularDietsModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxIsSelected
  });

  static List < PopularDietsModel > getPopularDiets() {
    List < PopularDietsModel > popularDiets = [];

    popularDiets.add(
      PopularDietsModel(
       name: 'yaban mersinli pankek',
       iconPath: 'assets/icons/blueberry-pancake.svg',
       level: 'orta',
       duration: '30 dakika',
       calorie: '230 kalori',
       boxIsSelected: true,
      )
    );

    popularDiets.add(
      PopularDietsModel(
       name: 'Somon Nigiri',
       iconPath: 'assets/icons/salmon-nigiri.svg',
       level: 'kolay',
       duration: '20 dakika',
       calorie: '120 kalori',
       boxIsSelected: false,
      )
    );

    return popularDiets;
  }
}