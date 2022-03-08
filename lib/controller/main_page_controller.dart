import 'package:f_review/category_data.dart';
import 'package:f_review/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {
  static const List<String> _areaList = ["전체", "하남", "강동", "송파"];
  List<String> get areaList => _areaList;

  static const List<String> _serviceList = [
    "전체",
    "카페",
    "맛집",
    "헤어샵",
    "네일샵",
    "전자제품",
    "도서",
    "공방"
  ];
  List<String> get serviceList => _serviceList;

  final _categoryList = <CategoryModel>[
    CategoryModel(
        area: "하남",
        service: "카페",
        image: CategoryData().categories["하남"]!['카페']!),
    CategoryModel(
        area: "송파",
        service: "맛집",
        image: CategoryData().categories["송파"]!['맛집']!),
    CategoryModel(
        area: "강동",
        service: "공방",
        image: CategoryData().categories["강동"]!['공방']!),
    CategoryModel(
        area: "강동",
        service: "네일샵",
        image: CategoryData().categories["강동"]!['네일샵']!),
  ].obs;

  set categoryList(value) => _categoryList.value = value;
  List<CategoryModel> get categoryList => _categoryList;

  final _areaPressed = List.generate(_areaList.length, (index) => true).obs;

  set areaPressed(value) => _areaPressed.value = value;
  List<bool> get areaPressed => _areaPressed;

  final _servicePressed =
      List.generate(_serviceList.length, (index) => true).obs;

  set servicePressed(value) => _servicePressed.value = value;
  List<bool> get servicePressed => _servicePressed;

  setAllCategories() {
    if (areaPressed[0] && servicePressed[0]) {
      categoryList = CategoryData()
          .categories
          .entries
          .map((e) => e.value.entries
              .map((e2) =>
                  CategoryModel(area: e.key, service: e2.key, image: e2.value))
              .toList())
          .toList()
          .expand((element) => element)
          .toList();
    }
  }

  setCategories() {}

  allSelectArea() {
    areaPressed[0] = !areaPressed[0];
    areaPressed.fillRange(1, areaPressed.length, areaPressed[0]);
    _areaPressed.refresh();

    if (areaPressed[0]) {
      setAllCategories();
    } else {
      categoryList.clear();
    }
  }

  selectArea(int i) {
    areaPressed[i] = !areaPressed[i];
    if (!areaPressed[i]) {
      areaPressed[0] = false;
    }
    if (areaPressed.where((element) => element == true).length + 1 ==
        areaPressed.length) {
      areaPressed[0] = true;
      setAllCategories();
    }
    _areaPressed.refresh();
  }

  allSelectService() {
    servicePressed[0] = !servicePressed[0];
    servicePressed.fillRange(1, servicePressed.length, servicePressed[0]);
    _servicePressed.refresh();

    if (servicePressed[0]) {
      setAllCategories();
    } else {
      categoryList.clear();
    }
  }

  selectService(int i) {
    servicePressed[i] = !servicePressed[i];
    if (!servicePressed[i]) {
      servicePressed[0] = false;
    }
    if (servicePressed.where((element) => element == true).length + 1 ==
        servicePressed.length) {
      servicePressed[0] = true;
      setAllCategories();
    }

    _servicePressed.refresh();
  }

  var controller = TextEditingController();
}
