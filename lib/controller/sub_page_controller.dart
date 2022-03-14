import 'dart:convert';

import 'package:f_review/constants.dart';
import 'package:f_review/model/review_model.dart';
import 'package:f_review/model/sponsor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SubPageController extends GetxController {
  final _bestReview = [
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
  ].obs;
  set bestReview(value) => _bestReview.value = value;
  List<ReviewModel> get bestReview => _bestReview;

  final _isBestLoading = false.obs;
  get isBestLoading => _isBestLoading.value;
  set isBestLoading(val) => _isBestLoading.value = val;

  getBestReviews(String area, String type) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_BEST";
      map['area'] = area;
      map['type'] = type;
      map['userId'] = "331";
      final response =
          await http.post(Uri.parse("$kBaseUrl/flu_review.php"), body: map);
      print('AD Detail Response : ${response.body}');
      if (200 == response.statusCode) {
        bestReview = parseResponse(response.body);
        isBestLoading = true;
      } else {}
    } catch (e) {
      print("exception : $e");
    }
  }
  //베스트 리뷰

  final _reviews = <ReviewModel>[
    ReviewModel(
      id: 1,
      profileImage: 'assets/avatar_2.png',
      userName: '유그린',
      date: '6.12.일',
      placeName: '카페웨더',
      heartCount: 0,
      review:
          '빈티지한 느낌의 카페에요. 분위기 너무 좋고, 조용해요. 분위기 뿐만 아니라 매장에 디저트류도 많고, 음료도 다양해서 앞으로 제 최애 카페로 ...',
      tags: [
        "하남카페",
        "디저트",
        "빈티지",
      ],
      images: [
        "assets/img3.png",
        "assets/g_img2.png",
        "assets/g_img3.png",
      ],
      isHeart: false,
    )
  ].obs;
  set reviews(value) => _reviews.value = value;
  List<ReviewModel> get reviews => _reviews;

  final _isReviewLoading = false.obs;
  get isReviewLoading => _isReviewLoading.value;
  set isReviewLoading(val) => _isReviewLoading.value = val;

  getReviews(String area, String type) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_REVIEW";
      map['area'] = area;
      map['type'] = type;
      map['userId'] = "331";
      final response =
          await http.post(Uri.parse("$kBaseUrl/flu_review.php"), body: map);
      print('AD Detail Response : ${response.body}');
      if (200 == response.statusCode) {
        bestReview = parseResponse(response.body);
        isReviewLoading = true;
      } else {}
    } catch (e) {
      print("exception : $e");
    }
  }

  //리뷰

  getReviewImages(int reviewId) {}

  getReviewTags(int reviewId) {}

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

  getReviewsSort(String area, String type, String sort) async {
    //TODO: 리뷰 정렬
  }
  //정렬

  final _sponsorList = <SponsorModel>[
    SponsorModel(
        id: 1,
        title: '[하남 미사점] 1만원 무료쿠폰 10명',
        thumbnail: 'assets/sponsor_1.png',
        contentImage: 'contentImage'),
    SponsorModel(
        id: 2,
        title: '[하남 미사점] 에이드 무료쿠폰 20명',
        thumbnail: 'assets/sponsor_2.png',
        contentImage: 'contentImage'),
  ].obs;
  set sponsorList(value) => _sponsorList.value = value;
  List<SponsorModel> get sponsorList => _sponsorList;

  getSponsors() async {
    // TODO:스폰서 광고 불러오기
  }

  //스폰서

  var controller = TextEditingController();

  bestReviewCheck(int index) {
    bestReview[index].isHeart = !bestReview[index].isHeart;
    if (bestReview[index].isHeart) {
      bestReview[index].heartCount++;
      // TODO:베스트 리뷰 좋아요 증가
    } else {
      bestReview[index].heartCount--;
      // TODO:베스트 리뷰 좋아요 감소
    }
    _bestReview.refresh();
  }

  reviewsCheck(int index) {
    reviews[index].isHeart = !reviews[index].isHeart;
    if (reviews[index].isHeart) {
      reviews[index].heartCount++;
      // TODO:리뷰 좋아요 증가
    } else {
      reviews[index].heartCount--;
      // TODO:리뷰 좋아요 감소
    }
    _reviews.refresh();
  }

  onHashClick() {
    // TODO:태그 클릭시 검색 페이지로
  }

  static List<ReviewModel> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<ReviewModel>((json) => ReviewModel.fromJson(json))
        .toList();
  }
}
