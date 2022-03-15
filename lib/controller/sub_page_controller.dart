import 'dart:convert';

import 'package:f_review/constants.dart';
import 'package:f_review/model/review_model.dart';
import 'package:f_review/model/sponsor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SubPageController extends GetxController {
  final _bestReview = <ReviewModel>[].obs;
  set bestReview(value) => _bestReview.value = value;
  List<ReviewModel> get bestReview => _bestReview;

  final _isBestLoading = false.obs;
  get isBestLoading => _isBestLoading.value;
  set isBestLoading(val) => _isBestLoading.value = val;

  getBestReviews(String area, String type) async {
    isBestLoading = false;
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_BEST";
      map['area'] = area;
      map['type'] = type;
      map['userId'] = "331";
      final response =
          await http.post(Uri.parse("$kBaseUrl/flu_review.php"), body: map);
      print('Best Reviews Response : ${response.body}');
      if (200 == response.statusCode) {
        bestReview = parseResponse(response.body);
        isBestLoading = true;
      } else {}
    } catch (e) {
      print("exception : $e");
      bestReview = <ReviewModel>[];
      isBestLoading = true;
    }
  }
  //베스트 리뷰

  final _reviews = <ReviewModel>[].obs;
  set reviews(value) => _reviews.value = value;
  List<ReviewModel> get reviews => _reviews;

  final _isReviewLoading = false.obs;
  get isReviewLoading => _isReviewLoading.value;
  set isReviewLoading(val) => _isReviewLoading.value = val;

  getReviews(String area, String type) async {
    isReviewLoading = false;
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_REVIEW";
      map['area'] = area;
      map['type'] = type;
      map['userId'] = "331";
      final response =
          await http.post(Uri.parse("$kBaseUrl/flu_review.php"), body: map);
      print('Reviews Response : ${response.body}');
      if (200 == response.statusCode) {
        reviews = parseResponse(response.body);
        isReviewLoading = true;
      }
    } catch (e) {
      print("exception : $e");
      reviews = <ReviewModel>[];
      isReviewLoading = true;
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

  final _sponsorList = <SponsorModel>[].obs;
  set sponsorList(value) => _sponsorList.value = value;
  List<SponsorModel> get sponsorList => _sponsorList;

  final _isSponsorLoading = false.obs;
  get isSponsorLoading => _isSponsorLoading.value;
  set isSponsorLoading(val) => _isSponsorLoading.value = val;

  getSponsors(String area, String serviceType) async {
    isSponsorLoading = false;
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_SPONSOR";
      map['area'] = area;
      map['serviceType'] = serviceType;
      final response = await http
          .post(Uri.parse("$kBaseUrl/flu_review_sponsor.php"), body: map);
      print('Sponsor Response : ${response.body}');
      if (200 == response.statusCode) {
        sponsorList = parseResponseSponsor(response.body);
        isSponsorLoading = true;
      }
    } catch (e) {
      print("exception : $e");
      sponsorList = <SponsorModel>[];
      isSponsorLoading = true;
    }
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

  static List<SponsorModel> parseResponseSponsor(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<SponsorModel>((json) => SponsorModel.fromJson(json))
        .toList();
  }
}
