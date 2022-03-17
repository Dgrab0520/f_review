import 'dart:convert';

import 'package:f_review/category_data.dart';
import 'package:f_review/model/category_model.dart';
import 'package:f_review/model/sponsor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
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

  final _selectedArea = ["하남", "강동", "송파"];
  final _selectedSerVice = ["카페", "맛집", "헤어샵", "네일샵", "전자제품", "도서", "공방"];
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

  final _searchResult = <SearchModel>[].obs;
  List<SearchModel> get searchResult => _searchResult;
  set searchResult(val) => _searchResult.value = val;

  getSearchAutoCompleteResult() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_AUTO";
      final response = await http
          .post(Uri.parse("$kBaseUrl/flu_review_autocomplete.php"), body: map);
      print('Auto Complete Words Response : ${response.body}');
      if (200 == response.statusCode) {
        searchResult = parseResponse(response.body);
      }
    } catch (e) {
      print("exception : $e");
    }
  }
  //자동 완성

  getCategoryImage() async {
    // TODO:카테고리 썸네일 이미지 불러오기
  }

  Future<SponsorModel?> getSponsorOnce(String area, String serviceType) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_POPUP_SPONSOR";
      map['area'] = area;
      map['serviceType'] = serviceType;
      final response = await http
          .post(Uri.parse("$kBaseUrl/flu_review_sponsor.php"), body: map);
      print('Popup Sponsor Response : ${response.body}');
      if (200 == response.statusCode) {
        return parseResponseSponsor(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print("exception : $e");
      return null;
    }
  }

  static SponsorModel parseResponseSponsor(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<SponsorModel>((json) => SponsorModel.fromJson(json))
        .toList()[0];
  }

  static List<SearchModel> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<SearchModel>((json) => SearchModel.fromJson(json))
        .toList();
  }

  final ScrollController scrollController = ScrollController();
}
