import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:f_review/model/bookmark_model.dart';
import 'package:f_review/model/profile_model.dart';
import 'package:f_review/model/profile_review_model.dart';
import 'package:f_review/model/review_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../review_heart_count.dart';

class ProfilePageController extends GetxController {
  final _reviews = <ProfileReviewModel>[].obs;
  set reviews(value) => _reviews.value = value;
  List<ProfileReviewModel> get reviews => _reviews;

  final _isReviewsLoading = false.obs;
  get isReviewsLoading => _isReviewsLoading.value;
  set isReviewsLoading(val) => _isReviewsLoading.value = val;

  getProfileReviews(int id, String orderBy) async {
    isReviewsLoading = false;
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_REVIEW_PROFILE";
      map['userId'] = id.toString();
      map['orderBy'] = orderBy;
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
    ReviewHeartCount()
        .reviewHeartCount(reviews[index].reviewId, 331, reviews[index].isHeart);
    _reviews.refresh();
  }
  //리뷰

  final _selectedReviews = <ProfileReviewModel>[].obs;
  set selectedReviews(value) => _selectedReviews.value = value;
  List<ProfileReviewModel> get selectedReviews => _selectedReviews;

  selectedReviewsHeartChange(int index) {
    selectedReviews[index].isHeart = !selectedReviews[index].isHeart;
    ReviewHeartCount().reviewHeartCount(
        selectedReviews[index].reviewId, 331, selectedReviews[index].isHeart);
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
  setItem(String value, int userId) {
    selectedValue = value;
    switch (value) {
      case "최신순":
        getProfileReviews(userId, "ORDER BY id DESC");
        break;
      case "추천순":
        getProfileReviews(userId, "ORDER BY heartCount DESC");
        break;
    }
  }

//정렬

  final _profileInfo = ProfileModel(
    userId: "userId",
    profileImg: "defaultImage.png",
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

  profileEdit(int userId) async {
    profileInfo.profile = profileContentController.text;
    _profileInfo.refresh();
    try {
      var map = <String, dynamic>{};
      map['action'] = "WRITE_PROFILE";
      map['userId'] = userId.toString();
      map['profile'] = profileInfo.profile;
      final response = await http
          .post(Uri.parse("$kBaseUrl/flu_review_profile.php"), body: map);
      print('Write Profile Response : ${response.body}');
      if (200 == response.statusCode) {
      } else {}
    } catch (e) {
      print("exception : $e");
    }
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

  final _savedPlace = <BookmarkModel>[].obs;
  List<BookmarkModel> get savedPlace => _savedPlace;
  set savedPlace(val) => _savedPlace.value = val;

  final _isBookmarkLoading = false.obs;
  get isBookmarkLoading => _isBookmarkLoading.value;
  set isBookmarkLoading(val) => _isBookmarkLoading.value = val;

  getSaved(int id) async {
    isBookmarkLoading = false;
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_SAVED_PLACE";
      map['userId'] = id.toString();
      final response = await http
          .post(Uri.parse("$kBaseUrl/flu_review_saved.php"), body: map);
      print('Saved Place Response : ${response.body}');
      if (200 == response.statusCode) {
        savedPlace = parseResponseSaved(response.body);
        isBookmarkLoading = true;
      } else {}
    } catch (e) {
      print("exception : $e");
      savedPlace = <BookmarkModel>[];
      isBookmarkLoading = true;
    }
  }

  Future<ReviewModel?> getReviewFromProfile(int reviewId, int userId) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_REVIEW_FROM_PROFILE";
      map['reviewId'] = reviewId.toString();
      map['userId'] = userId.toString();
      final response =
          await http.post(Uri.parse("$kBaseUrl/flu_review.php"), body: map);
      print('Review Response : ${response.body}');
      if (200 == response.statusCode) {
        return parseResponseReviewModel(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print("exception : $e");
      return null;
    }
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

  static List<BookmarkModel> parseResponseSaved(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<BookmarkModel>((json) => BookmarkModel.fromJson(json))
        .toList();
  }

  static ReviewModel parseResponseReviewModel(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<ReviewModel>((json) => ReviewModel.fromJson(json))
        .toList()[0];
  }
}
