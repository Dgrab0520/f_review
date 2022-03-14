import 'package:collection/collection.dart';
import 'package:f_review/model/profile_review_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfilePageController extends GetxController {
  final _reviews = <ProfileReviewModel>[
    ProfileReviewModel(
      area: "경기 하남",
      name: "마시랑게",
      image: 'assets/p_img1.png',
      serviceType: "카페",
      isHeart: false,
      reviewId: 0,
      date: DateTime.now(),
      heartCount: 5,
    ),
    ProfileReviewModel(
      area: "서울 강동",
      name: "가나다라",
      image: 'assets/p_img2.png',
      serviceType: "카페",
      isHeart: false,
      reviewId: 0,
      date: DateTime.parse("2022-03-11 12:00:00"),
      heartCount: 2,
    ),
    ProfileReviewModel(
      area: "서울 강동",
      name: "가나다라",
      image: 'assets/p_img3.png',
      serviceType: "카페",
      isHeart: false,
      reviewId: 0,
      date: DateTime.parse("2022-03-11 14:00:00"),
      heartCount: 3,
    ),
    ProfileReviewModel(
      area: "경기 일산",
      name: "아벨리움",
      image: 'assets/p_img4.png',
      serviceType: "헤어샵",
      isHeart: false,
      reviewId: 0,
      date: DateTime.parse("2022-03-11 11:00:00"),
      heartCount: 8,
    ),
    ProfileReviewModel(
      area: "서울 강동",
      name: "가나다라",
      image: 'assets/p_img5.png',
      serviceType: "카페",
      isHeart: false,
      reviewId: 0,
      date: DateTime.parse("2022-03-11 15:00:00"),
      heartCount: 1,
    ),
    ProfileReviewModel(
      area: "경기 하남",
      name: "마시랑게",
      image: 'assets/p_img1.png',
      serviceType: "카페",
      isHeart: false,
      reviewId: 0,
      date: DateTime.parse("2022-03-11 10:00:00"),
      heartCount: 0,
    ),
    ProfileReviewModel(
      area: "서울 강동",
      name: "가나다라",
      image: 'assets/p_img2.png',
      serviceType: "카페",
      isHeart: false,
      reviewId: 0,
      date: DateTime.parse("2022-03-11 05:00:00"),
      heartCount: 8,
    ),
    ProfileReviewModel(
      area: "서울 강동",
      name: "가나다라",
      image: 'assets/p_img3.png',
      serviceType: "카페",
      isHeart: false,
      reviewId: 0,
      date: DateTime.parse("2022-03-11 01:00:00"),
      heartCount: 125,
    ),
    ProfileReviewModel(
      area: "경기 일산",
      name: "아벨리움",
      image: 'assets/p_img4.png',
      serviceType: "헤어샵",
      isHeart: false,
      reviewId: 0,
      date: DateTime.parse("2022-03-11 06:00:00"),
      heartCount: 2,
    ),
    ProfileReviewModel(
      area: "서울 강동",
      name: "가나다라",
      image: 'assets/p_img5.png',
      serviceType: "카페",
      isHeart: false,
      reviewId: 0,
      date: DateTime.parse("2022-03-11 08:00:00"),
      heartCount: 5,
    ),
  ].obs;
  set reviews(value) => _reviews.value = value;
  List<ProfileReviewModel> get reviews => _reviews;

  getProfileReviews(int id) async {
    //TODO:프로필 페이지에서 리뷰 불러오기
  }

  reviewsHeartChange(int index) {
    reviews[index].isHeart = !reviews[index].isHeart;
    //TODO:좋아요 저장
    _reviews.refresh();
  }
  //리뷰

  final _selectedReviews = <ProfileReviewModel>[].obs;
  set selectedReviews(value) => _selectedReviews.value = value;
  List<ProfileReviewModel> get selectedReviews => _selectedReviews;

  selectedReviewsHeartChange(int index) {
    selectedReviews[index].isHeart = !selectedReviews[index].isHeart;
    //TODO:좋아요 저장
    _selectedReviews.refresh();
  }
  //선택한 카테고리 리뷰

  //region
  final _groupList = {}.obs;
  Map get groupList => _groupList;
  set groupList(val) => _groupList.value = val;

  final _categoryPressed = <dynamic, bool>{}.obs;
  Map<dynamic, bool> get categoryPressed => _categoryPressed;
  set categoryPressed(val) => _categoryPressed.value = val;

  setCategory() {
    groupList = {"전체": reviews};
    groupList.addAll(groupBy(reviews, (ProfileReviewModel r) => r.serviceType));
    _groupList.refresh();
    categoryPressed.addAll(Map.fromIterables(
        groupList.keys, List.generate(groupList.length, (index) => true)));
  }

  allSelectCategory() {
    categoryPressed['전체'] = !categoryPressed['전체']!;
    categoryPressed.updateAll((key, value) => categoryPressed['전체']!);
    _categoryPressed.refresh();
  }

  selectCategory(String i) {
    categoryPressed[i] = !categoryPressed[i]!;

    if (!categoryPressed[i]!) {
      categoryPressed['전체'] = false;
    }
    if (categoryPressed.values.where((element) => element).length + 1 ==
        categoryPressed.length) {
      categoryPressed['전체'] = true;
    } else {
      updateCategoryList();
    }
    _categoryPressed.refresh();
  }
  //endregion
  //리뷰 카테고리

  updateCategoryList() {
    selectedReviews.clear();
    categoryPressed.forEach((key, value) {
      print(key);
      print(value);
      if (key != "전체" && value) {
        for (var review in reviews) {
          if (review.serviceType == key) {
            selectedReviews.add(review);
          }
        }
      }
    });
    _selectedReviews.refresh();
  }

  //카테고리 업데이트

  final _selectedValue = "최신순".obs;
  set selectedValue(value) => _selectedValue.value = value;
  get selectedValue => _selectedValue.value;

  final _items = [
    '최신순',
    '조회수',
    '추천순',
  ].obs;
  set items(value) => _items.value = value;
  List<String> get items => _items;
  setItem(String value) {
    selectedValue = value;
    switch (value) {
      case "최신순":
        break;
      case "추천순":
        break;
    }
    // TODO:리뷰 정렬
  }

  getProfileReviewsSort(int id, String sort) async {
    //TODO:프로필 페이지에서 리뷰 불러오기(정렬)
  }

//정렬

  final _profileContent = "맛집탐방하는 라희 :)".obs;
  get profileContent => _profileContent.value;
  set profileContent(val) => _profileContent.value = val;
  //프로필 자기 소개

  final _profilePhotoCount = 13.obs;
  get profilePhotoCount => _profilePhotoCount.value;
//프로필 사진 수

  final _profileHeartCount = 5300.obs;
  get profileHeartCount => _profileHeartCount.value;
//프로필 사진 수

  getProfileInfo() async {
    // TODO:프로필 정보 불러오기(사진 수, 프로필 텍스트, 총 하트 수 등)
  }

  final profileContentController = TextEditingController();

  profileEdit() {}
}
