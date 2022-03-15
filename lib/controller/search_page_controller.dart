import 'dart:convert';

import 'package:f_review/model/review_model.dart';
import 'package:f_review/model/search_result_model.dart';
import 'package:f_review/ui/profile_page/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:numeral/fun.dart';

import '../constants.dart';
import '../ui/search_page/widget/search_sub.dart';

class SearchPageController extends GetxController {
  final _searchResult = <SearchResultModel>[].obs;
  List<SearchResultModel> get searchResult => _searchResult;
  set searchResult(val) => _searchResult.value = val;

  final _searchType = "tag".obs;
  get searchType => _searchType.value;
  set searchType(val) => _searchType.value = val;

  final _searchKeyword = "".obs;
  get searchKeyword => _searchKeyword.value;
  set searchKeyword(val) => _searchKeyword.value = val;

  getSearchResult(String keyword, String type) async {
    searchKeyword = keyword;
    isTextField = false;
    print(keyword);
    print(type);
    searchType = type;
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_SEARCH_RESULT";
      map['keyword'] = keyword;
      map['type'] = type;
      final response = await http
          .post(Uri.parse("$kBaseUrl/flu_review_search.php"), body: map);
      print('Search Response : ${response.body}');
      if (200 == response.statusCode) {
        searchResult = parseResponse(response.body);
      }
    } catch (e) {
      print("exception : $e");
      searchResult = <SearchResultModel>[];
    }
  }

  static List<SearchResultModel> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<SearchResultModel>((json) => SearchResultModel.fromJson(json))
        .toList();
  }

  getPlace(String placeName) {
    // TODO:장소 reviewModel 불러오기
  }

  onTapAction(int index) {
    switch (searchType) {
      case "tag":
        Get.to(SearchSub(
          tag: searchResult[index].name,
        ));
        break;
      case "place":
        // TODO:장소이름으로 검색 후 결과 reviewModel Get.to(NamePage(reviewModel:reviewModel);
        break;
      case "user":
        Get.to(ProfilePage(userId: searchResult[index].userId!));
        break;
    }
  }

  String getSubTitle(int index) {
    if (searchResult[index].type == "user") {
      return searchResult[index].subTitle;
    } else {
      return "총" + numeral(int.parse(searchResult[index].subTitle)) + "게시물";
    }
  }

  ///Search Page 변수, 함수

  final _tagPost = <ReviewModel>[].obs;
  List<ReviewModel> get tagPost => _tagPost;
  set tagPost(val) => _tagPost.value = val;

  final _tagCount = 1234.obs;
  int get tagCount => _tagCount.value;
  set tagCount(val) => _tagCount.value = val;

  getTagPost(String tag) {
    // TODO:해당 태그 게시물 검색
    getTagPostCount(tag);
  }

  getTagPostCount(String tag) {
    // TODO:해당 태그 게시물 총 게시물 수
  }

  static const _crossCount = [2, 1, 1, 2, 2, 1, 1, 2];
  static const _mainCount = [2, 1, 1, 1, 1, 1, 1, 2];

  get crossCount => _crossCount;
  get mainCount => _mainCount;

  final _isTextField = false.obs;
  get isTextField => _isTextField.value;
  set isTextField(val) => _isTextField.value = val;

  final searchTextController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  ///Search Sub Page 변수, 함수

}
