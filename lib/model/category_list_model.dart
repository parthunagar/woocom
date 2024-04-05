import 'dart:convert';

import 'package:woocom/utils/app_icon_utils.dart';

List<CategoryList?>? categoryListFromJson(String str) =>
    json.decode(str) == null
        ? []
        : List<CategoryList?>.from(
            json.decode(str)!.map((x) => CategoryList.fromJson(x)));

String categoryListToJson(List<CategoryList?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class CategoryList {
  CategoryList({
    this.name,
    this.icon,
  });

  String? name, icon;

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
        name: json["name"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "icon": icon,
      };
}

List categoryList = [
  {"name": "Apple", "icon": "${AppIcon.brandApple}"},
  {"name": "Samsung", "icon": "${AppIcon.brandSamsung}"},
  {"name": "Asus", "icon": "${AppIcon.brandAsus}"},
  {"name": "Dell", "icon": "${AppIcon.brandDell}"},
  {"name": "Google", "icon": "${AppIcon.brandGoogle}"},
  {"name": "GoPro", "icon": "${AppIcon.brandGoPro}"},
  {"name": "Huawei", "icon": "${AppIcon.brandHuawei}"},
  {"name": "Iwatch", "icon": "${AppIcon.brandIWatch}"},
  {"name": "lenovo", "icon": "${AppIcon.brandLenovo}"},
  {"name": "LG", "icon": "${AppIcon.brandLg}"},
  {"name": "Louis Vuitton", "icon": "${AppIcon.brandLouisVuitton}"},
  {"name": "One Plus", "icon": "${AppIcon.brandOnePlus}"},
  {"name": "Xiaomi", "icon": "${AppIcon.brandXiaomi2}"}
];

Future<List<CategoryList>> getCategoryListData() async {
  
  // List<CategoryList>? categoryListData = [];
  // try {
  //   categoryListData =
  //       (categoryList).map((data) => CategoryList.fromJson(data)).toList();
  //   print('categoryListData : $categoryListData');
  // } catch (e) {
  //   print('ERROR : $e');
  // }
  return categoryList.map((data) => CategoryList.fromJson(data)).toList();
  // return categoryListData;
}
