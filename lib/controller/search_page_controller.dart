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
              userId: 0)
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

  final _tagPost = <ReviewModel>[
    ReviewModel(
      id: 1,
      profileImage: 'assets/avatar_2.png',
      userName: '유그린',
      date: '12.12 토',
      placeName: '마시랑게',
      review:
          '분위기가 너무 좋아요. 여러 카페 다녀봤는데 이렇게 깔끔하고 예쁘게 플레이팅 되서 나오는 카페는 처음 봤어요. 사진도 잘 안찍는데 감동 받아서 찍어봅니다.. 다들 마시랑게 하세요 bb',
      heartCount: 0,
      tags: ["하남카페", "다들", "마시랑게", "하세요"],
      images: ['assets/name_img2.png'],
      isHeart: false,
    ),
    ReviewModel(
      id: 1,
      profileImage: 'assets/avatar_1.png',
      userName: '유라희',
      date: "6.12.일",
      placeName: "마시랑게",
      review:
          "매장도 예쁘고 디저트도 맛있어요 ㅎㅎ 포토존도 따로 있는데 사람이 많아서 줄 서서 기다려야되용.. 그래도 그만큼 사진도 너무 잘나오고 ...",
      heartCount: 0,
      tags: ["하남카페", "포토존", "비쥬얼맛집"],
      images: ["assets/sub_img.png"],
      isHeart: false,
    ),
    ReviewModel(
      id: 1,
      profileImage: 'assets/avatar_1.png',
      userName: '유라희',
      date: "6.12.일",
      placeName: "마시랑게",
      review:
          "매장도 예쁘고 디저트도 맛있어요 ㅎㅎ 포토존도 따로 있는데 사람이 많아서 줄 서서 기다려야되용.. 그래도 그만큼 사진도 너무 잘나오고 ...",
      heartCount: 0,
      tags: ["하남카페", "포토존", "비쥬얼맛집"],
      images: ["assets/sub_img.png"],
      isHeart: false,
    ),
    ReviewModel(
      id: 1,
      profileImage: 'assets/avatar_2.png',
      userName: '유그린',
      date: '12.12 토',
      placeName: '마시랑게',
      review:
          '분위기가 너무 좋아요. 여러 카페 다녀봤는데 이렇게 깔끔하고 예쁘게 플레이팅 되서 나오는 카페는 처음 봤어요. 사진도 잘 안찍는데 감동 받아서 찍어봅니다.. 다들 마시랑게 하세요 bb',
      heartCount: 0,
      tags: ["하남카페", "다들", "마시랑게", "하세요"],
      images: ['assets/name_img2.png'],
      isHeart: false,
    ),
    ReviewModel(
      id: 1,
      profileImage: 'assets/avatar_2.png',
      userName: '유그린',
      date: '12.12 토',
      placeName: '마시랑게',
      review:
          '분위기가 너무 좋아요. 여러 카페 다녀봤는데 이렇게 깔끔하고 예쁘게 플레이팅 되서 나오는 카페는 처음 봤어요. 사진도 잘 안찍는데 감동 받아서 찍어봅니다.. 다들 마시랑게 하세요 bb',
      heartCount: 0,
      tags: ["하남카페", "다들", "마시랑게", "하세요"],
      images: ['assets/name_img2.png'],
      isHeart: false,
    ),
    ReviewModel(
      id: 1,
      profileImage: 'assets/avatar_2.png',
      userName: '유그린',
      date: '12.12 토',
      placeName: '마시랑게',
      review:
          '분위기가 너무 좋아요. 여러 카페 다녀봤는데 이렇게 깔끔하고 예쁘게 플레이팅 되서 나오는 카페는 처음 봤어요. 사진도 잘 안찍는데 감동 받아서 찍어봅니다.. 다들 마시랑게 하세요 bb',
      heartCount: 0,
      tags: ["하남카페", "다들", "마시랑게", "하세요"],
      images: ['assets/name_img2.png'],
      isHeart: false,
    ),
    ReviewModel(
      id: 1,
      profileImage: 'assets/avatar_1.png',
      userName: '유라희',
      date: "6.12.일",
      placeName: "마시랑게",
      review:
          "매장도 예쁘고 디저트도 맛있어요 ㅎㅎ 포토존도 따로 있는데 사람이 많아서 줄 서서 기다려야되용.. 그래도 그만큼 사진도 너무 잘나오고 ...",
      heartCount: 0,
      tags: ["하남카페", "포토존", "비쥬얼맛집"],
      images: ["assets/sub_img.png"],
      isHeart: false,
    ),
    ReviewModel(
      id: 1,
      profileImage: 'assets/avatar_1.png',
      userName: '유라희',
      date: "6.12.일",
      placeName: "마시랑게",
      review:
          "매장도 예쁘고 디저트도 맛있어요 ㅎㅎ 포토존도 따로 있는데 사람이 많아서 줄 서서 기다려야되용.. 그래도 그만큼 사진도 너무 잘나오고 ...",
      heartCount: 0,
      tags: ["하남카페", "포토존", "비쥬얼맛집"],
      images: ["assets/sub_img.png"],
      isHeart: false,
    ),
    ReviewModel(
      id: 1,
      profileImage: 'assets/avatar_2.png',
      userName: '유그린',
      date: '12.12 토',
      placeName: '마시랑게',
      review:
          '분위기가 너무 좋아요. 여러 카페 다녀봤는데 이렇게 깔끔하고 예쁘게 플레이팅 되서 나오는 카페는 처음 봤어요. 사진도 잘 안찍는데 감동 받아서 찍어봅니다.. 다들 마시랑게 하세요 bb',
      heartCount: 0,
      tags: ["하남카페", "다들", "마시랑게", "하세요"],
      images: ['assets/name_img2.png'],
      isHeart: false,
    ),
    ReviewModel(
      id: 1,
      profileImage: 'assets/avatar_2.png',
      userName: '유그린',
      date: '12.12 토',
      placeName: '마시랑게',
      review:
          '분위기가 너무 좋아요. 여러 카페 다녀봤는데 이렇게 깔끔하고 예쁘게 플레이팅 되서 나오는 카페는 처음 봤어요. 사진도 잘 안찍는데 감동 받아서 찍어봅니다.. 다들 마시랑게 하세요 bb',
      heartCount: 0,
      tags: ["하남카페", "다들", "마시랑게", "하세요"],
      images: ['assets/name_img2.png'],
      isHeart: false,
    ),
  ].obs;
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

  ///Search Sub Page 변수, 함수
}
