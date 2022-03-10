import 'package:f_review/category_data.dart';
import 'package:f_review/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {
  final _areaList = {
    "전체": true,
    "하남": true,
    "강동": true,
    "송파": true,
  }.obs;
  Map<String, bool> get areaList => _areaList;
  set areaList(val) => _areaList.value = val;
  //지역 카테고리
  final _serviceList = {
    "전체": true,
    "카페": true,
    "맛집": true,
    "헤어샵": true,
    "네일샵": true,
    "전자제품": true,
    "도서": true,
    "공방": true
  }.obs;
  Map<String, bool> get serviceList => _serviceList;
  set serviceList(val) => _serviceList.value = val;
  //서비스 카테고리

  final _selectedArea = ["전체", "하남", "강동", "송파"];
  final _selectedSerVice = ["전체", "카페", "맛집", "헤어샵", "네일샵", "전자제품", "도서", "공방"];

  final _categoryList = <CategoryModel>[].obs;
  set categoryList(value) => _categoryList.value = value;
  List<CategoryModel> get categoryList => _categoryList;
  //카테고리 리스트

  setAllCategories() {
    if (areaList['전체']! && serviceList['전체']!) {
      categoryList = CategoryData().allCategory();
    }
  }

  //region
  allSelectArea() {
    areaList['전체'] = !areaList['전체']!;
    areaList.updateAll((key, value) => areaList['전체']!);
    _areaList.refresh();

    if (areaList['전체']!) {
      setAllCategories();
    } else {
      categoryList.clear();
    }
  }

  selectArea(String area) {
    areaList[area] = !areaList[area]!;
    if (!areaList[area]!) {
      areaList['전체'] = false;
    }
    //전체 선택 해제
    _selectedArea.clear();
    areaList.forEach((key, value) {
      if (value && key != "전체") {
        _selectedArea.add(key);
      }
    });
    //선택 카테고리 업데이트
    if (areaList.values.where((element) => element).length + 1 ==
        areaList.length) {
      areaList['전체'] = true;
    }
    //모든 카테고리 선택시 전체 버튼 활성화
    print(_selectedArea);
    print(_selectedSerVice);
    categoryList =
        CategoryData().selectCategory(_selectedArea, _selectedSerVice);
    _areaList.refresh();
  }
  //endregion
  //지역 선택 함수

  //region
  allSelectService() {
    serviceList['전체'] = !serviceList['전체']!;
    serviceList.updateAll((key, value) => serviceList['전체']!);
    _serviceList.refresh();

    if (serviceList['전체']!) {
      setAllCategories();
    } else {
      categoryList.clear();
    }
  }

  selectService(String service) {
    serviceList[service] = !serviceList[service]!;
    if (!serviceList[service]!) {
      serviceList['전체'] = false;
    }
    //전체 선택 해제
    _selectedSerVice.clear();
    serviceList.forEach((key, value) {
      if (value && key != "전체") {
        _selectedSerVice.add(key);
      }
    });
    //선택 카테고리 업데이트
    if (serviceList.values.where((element) => element).length + 1 ==
        serviceList.length) {
      serviceList['전체'] = true;
    }
    //모든 카테고리 선택시 전체 버튼 활성화
    print(_selectedArea);
    print(_selectedSerVice);
    categoryList =
        CategoryData().selectCategory(_selectedArea, _selectedSerVice);
    _serviceList.refresh();
  }
  //endregion
  //서비스 선택 함수

  var controller = TextEditingController();
}
