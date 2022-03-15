import 'dart:convert';

import 'package:f_review/model/place_model.dart';
import 'package:f_review/model/review_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class NamePageController extends GetxController {
  final _placeModel = PlaceModel(
    address: "주소",
    service: "카테고리",
    name: "이름",
    reviewCount: 0,
    isSave: false,
  ).obs;
  PlaceModel get placeModel => _placeModel.value;
  set placeModel(val) => _placeModel.value = val;

  getPlace(int placeId) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_PLACE";
      map['placeId'] = placeId.toString();
      map['userId'] = "331";
      final response =
          await http.post(Uri.parse("$kBaseUrl/flu_place.php"), body: map);
      print('Place Info Response : ${response.body}');
      if (200 == response.statusCode) {
        Iterable jsonResponse = jsonDecode(response.body);
        placeModel =
            jsonResponse.map((e) => PlaceModel.fromJson(e)).toList()[0];
      }
    } catch (e) {
      print("exception : $e");
    }
  }

  placeCheck() {
    placeModel.isSave = !placeModel.isSave;
    _placeModel.refresh();
    if (placeModel.isSave) {
      //TODO:장소 저장
      if (!Get.isSnackbarOpen) {
        Get.snackbar("성공", "장소를 저장했습니다");
      }
    }
  }

  //장소

  final _mainReview = ReviewModel(
    id: 0,
    userId: 0,
    profileImage: "profileImage",
    userName: "userName",
    date: DateTime.now(),
    placeName: "placeName",
    review: "review",
    heartCount: 0,
    tags: [],
    images: [],
    isHeart: false,
    placeId: 0,
  ).obs;
  ReviewModel get mainReview => _mainReview.value;
  set mainReview(val) => _mainReview.value = val;

  Future<ReviewModel?> getMainReview(int reviewId) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_REVIEW_SAVED";
      map['reviewId'] = reviewId.toString();
      map['userId'] = "331";
      final response =
          await http.post(Uri.parse("$kBaseUrl/flu_review.php"), body: map);
      print('Place Reviews Response : ${response.body}');
      if (200 == response.statusCode) {
        return parseResponseOnce(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print("exception : $e");
      return null;
    }
  }

  mainHeartChange() {
    mainReview.isHeart = !mainReview.isHeart;
    if (mainReview.isHeart) {
      mainReview.heartCount++;
      // TODO:메인 리뷰 좋아요 증가
    } else {
      mainReview.heartCount--;
      // TODO:메인 리뷰 좋아요 감소
    }
    _mainReview.refresh();
  }
  // 메인 리뷰

  final _anotherReviews = <ReviewModel>[].obs;
  List<ReviewModel> get anotherReviews => _anotherReviews;
  set anotherReviews(val) => _anotherReviews.value = val;

  final _isAnotherReviewLoading = false.obs;
  get isAnotherReviewLoading => _isAnotherReviewLoading.value;
  set isAnotherReviewLoading(val) => _isAnotherReviewLoading.value = val;

  getReviews(int placeId, int mainReviewId) async {
    print(placeId);
    isAnotherReviewLoading = false;
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_REVIEW_PLACE";
      map['placeId'] = placeId.toString();
      map['userId'] = "331";
      map['mainReviewId'] = mainReviewId.toString();
      final response =
          await http.post(Uri.parse("$kBaseUrl/flu_review.php"), body: map);
      print('Place Reviews Response : ${response.body}');
      if (200 == response.statusCode) {
        anotherReviews = parseResponse(response.body);
        isAnotherReviewLoading = true;
      }
    } catch (e) {
      print("exception : $e");
      anotherReviews = <ReviewModel>[];
      isAnotherReviewLoading = true;
    }
  }

  anotherHeartChange(int index) {
    anotherReviews[index].isHeart = !anotherReviews[index].isHeart;
    if (anotherReviews[index].isHeart) {
      anotherReviews[index].heartCount++;
      // TODO:리뷰 좋아요 증가
    } else {
      anotherReviews[index].heartCount--;
      // TODO:리뷰 좋아요 감소
    }
    _anotherReviews.refresh();
  }

  //다른 리뷰

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

  getReviewsSort(int id, String sort) async {
    //TODO:프로필 페이지에서 리뷰 불러오기(정렬)
  }
  //정렬

  void launchURL(String placeName) async {
    //구글 맵 검색
    if (!await launch("https://www.google.com/maps/search/$placeName}")) {
      throw 'Could not launch $placeName';
    }
  }

  static List<ReviewModel> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<ReviewModel>((json) => ReviewModel.fromJson(json))
        .toList();
  }

  static ReviewModel parseResponseOnce(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<ReviewModel>((json) => ReviewModel.fromJson(json))
        .toList()[0];
  }
}
