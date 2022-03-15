import 'package:f_review/category_data.dart';
import 'package:f_review/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/search_model.dart';

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
  //선택된 카테고리

  final _categoryList = <CategoryModel>[].obs;
  set categoryList(value) => _categoryList.value = value;
  List<CategoryModel> get categoryList => _categoryList;
  //카테고리 리스트

  setAllCategories() {
    if (areaList['전체']! && serviceList['전체']!) {
      categoryList = CategoryData().allCategory();
    } else {
      categoryList =
          CategoryData().selectCategory(_selectedArea, _selectedSerVice);
    }
  }

  //region
  allSelectArea() {
    areaList['전체'] = !areaList['전체']!;
    areaList.updateAll((key, value) => areaList['전체']!);
    _areaList.refresh();
    _selectedArea.clear();

    if (areaList['전체']!) {
      _selectedArea.addAll(["하남", "강동", "송파"]);
      setAllCategories();
    } else {
      categoryList.clear();
    }
  }

  selectArea(String area) {
    areaList.updateAll((key, value) => false);
    areaList[area] = true;

    _selectedArea.clear();
    _selectedArea.add(area);
    //선택 카테고리 업데이트
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
    _selectedSerVice.clear();

    if (serviceList['전체']!) {
      _selectedSerVice.addAll(["카페", "맛집", "헤어샵", "네일샵", "전자제품", "도서", "공방"]);
      setAllCategories();
    } else {
      categoryList.clear();
    }
  }

  selectService(String service) {
    serviceList.updateAll((key, value) => false);
    serviceList[service] = true;

    _selectedSerVice.clear();
    _selectedSerVice.add(service);
    //선택 카테고리 업데이트
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

  final _searchResult = <SearchModel>[
    const SearchModel(type: "tag", name: "하남", subTitle: "1234"),
    const SearchModel(type: "place", name: "하남돼지", subTitle: "1234"),
    const SearchModel(
        type: "user", name: "하남이", subTitle: "안녕하세요 하남의 대표 하남이입니다."),
  ].obs;
  List<SearchModel> get searchResult => _searchResult;
  set searchResult(val) => _searchResult.value = val;

  getSearchAutoCompleteResult() async {
    // TODO:자동완성 결과 불러오기
  }
  //자동 완성

  getCategoryImage() async {
    // TODO:카테고리 썸네일 이미지 불러오기
  }
}
