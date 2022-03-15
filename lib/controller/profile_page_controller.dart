import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:f_review/model/profile_model.dart';
import 'package:f_review/model/profile_review_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class ProfilePageController extends GetxController {
  final _reviews = <ProfileReviewModel>[].obs;
  set reviews(value) => _reviews.value = value;
  List<ProfileReviewModel> get reviews => _reviews;

  final _isReviewsLoading = false.obs;
  get isReviewsLoading => _isReviewsLoading.value;
  set isReviewsLoading(val) => _isReviewsLoading.value = val;

  getProfileReviews(int id) async {
    isReviewsLoading = false;
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_REVIEW_PROFILE";
      map['userId'] = id.toString();
      final response =
          await http.post(Uri.parse("$kBaseUrl/flu_review.php"), body: map);
      print('Profile Reviews Response : ${response.body}');
      if (200 == response.statusCode) {
        reviews = parseResponse(response.body);
        isReviewsLoading = true;
        setCategory();
      } else {}
    } catch (e) {
      print("exception : $e");
      reviews = <ProfileReviewModel>[];
      isReviewsLoading = true;
      setCategory();
    }
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
    if (!categoryPressed['전체']!) {
      selectedReviews.clear();
    }
    _categoryPressed.refresh();
  }

  selectCategory(String i) {
    categoryPressed.updateAll((key, value) => false);
    categoryPressed[i] = true;

    updateCategoryList();
    _categoryPressed.refresh();
  }
  //endregion
  //리뷰 카테고리

  updateCategoryList() {
    selectedReviews.clear();
    categoryPressed.forEach((key, value) {
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

  final _profileInfo = ProfileModel(
    userId: "userId",
    profileImg: "profileImg",
    profile: "profile",
    heartCount: 0,
    imageCount: 0,
  ).obs;
  ProfileModel get profileInfo => _profileInfo.value;
  set profileInfo(val) => _profileInfo.value = val;

  getProfileInfo(int id) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_PROFILE_INFO";
      map['userId'] = id.toString();
      final response = await http
          .post(Uri.parse("$kBaseUrl/flu_review_profile.php"), body: map);
      print('Profile Response : ${response.body}');
      if (200 == response.statusCode) {
        profileInfo = parseResponseProfile(response.body);
      } else {}
    } catch (e) {
      print("exception : $e");
      profileInfo = <ProfileReviewModel>[];
    }
  }

  final profileContentController = TextEditingController();

  profileEdit() {
    profileInfo.profile = profileContentController.text;
    _profileInfo.refresh();
    Get.back();
  }

  String getShortArea(String area) {
    List<String> tmp = area.split(" ");
    String first = tmp[0];
    String second = tmp[1];
    if (second.length > 2) {
      second = second.substring(0, 2);
    }
    if (first.length != 4) {
      first = first.substring(0, 2);
    } else {
      first = first.split("")[0] + first.split("")[2];
    }
    return first + " " + second;
  }

  static List<ProfileReviewModel> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<ProfileReviewModel>((json) => ProfileReviewModel.fromJson(json))
        .toList();
  }

  static ProfileModel parseResponseProfile(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<ProfileModel>((json) => ProfileModel.fromJson(json))
        .toList()[0];
  }
}
