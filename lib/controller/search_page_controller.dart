import 'package:f_review/model/review_model.dart';
import 'package:f_review/model/search_result_model.dart';
import 'package:f_review/ui/profile_page/profile_page.dart';
import 'package:get/get.dart';
import 'package:numeral/fun.dart';

import '../ui/search_page/widget/search_sub.dart';

class SearchPageController extends GetxController {
  final _searchResult = <SearchResultModel>[
    SearchResultModel(type: "tag", name: "하남", subTitle: "1234"),
    SearchResultModel(type: "place", name: "하남돼지", subTitle: "1234"),
    SearchResultModel(
        type: "user", name: "하남이", subTitle: "안녕하세요 하남의 대표 하남이입니다.", userId: 0),
  ].obs;
  List<SearchResultModel> get searchResult => _searchResult;
  set searchResult(val) => _searchResult.value = val;

  final _searchType = "tag".obs;
  get searchType => _searchType.value;
  set searchType(val) => _searchType.value = val;

  getSearchResult(String keyword, String type) {
    print(keyword);
    print(type);
    searchType = type;
    switch (type) {
      case "tag":
        searchResult = [
          SearchResultModel(type: "tag", name: "하남", subTitle: "1234")
        ];
        break;
      case "place":
        searchResult = [
          SearchResultModel(type: "place", name: "하남돼지", subTitle: "1234")
        ];
        break;
      case "user":
        searchResult = [
          SearchResultModel(
              type: "user",
              name: "하남이",
              subTitle: "안녕하세요 하남의 대표 하남이입니다.",
              userId: 331)
        ];
        break;
    }
    // TODO:검색어 : keyword, 타입 : type(태그,장소,계정)
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

  ///Search Sub Page 변수, 함수

}
