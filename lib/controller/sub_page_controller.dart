import 'dart:convert';

import 'package:f_review/constants.dart';
import 'package:f_review/model/review_model.dart';
import 'package:f_review/model/sponsor_model.dart';
import 'package:f_review/review_heart_count.dart';
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

  getReviews(String area, String type, String orderBy) async {
    isReviewLoading = false;
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_REVIEW";
      map['area'] = area;
      map['type'] = type;
      map['userId'] = "331";
      map['orderBy'] = orderBy;
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

  setItem(String value, String area, String type) {
    selectedValue = value;
    switch (value) {
      case "최신순":
        getReviews(area, type, "ORDER BY id DESC");
        break;
      case "추천순":
        getReviews(area, type, "ORDER BY heartCount DESC");
        break;
    }
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
    print("best");
    bestReview[index].isHeart = !bestReview[index].isHeart;
    if (bestReview[index].isHeart) {
      bestReview[index].heartCount++;
      ReviewHeartCount().reviewHeartCount(bestReview[index].id, 331, true);
      for (int i = 0; i < reviews.length; i++) {
        if (reviews[i].id == bestReview[index].id) {
          reviews[i].heartCount++;
          reviews[i].isHeart = true;
        }
      }
    } else {
      bestReview[index].heartCount--;
      ReviewHeartCount().reviewHeartCount(bestReview[index].id, 331, false);
      for (int i = 0; i < reviews.length; i++) {
        if (reviews[i].id == bestReview[index].id) {
          reviews[i].heartCount--;
          reviews[i].isHeart = false;
        }
      }
    }
    _bestReview.refresh();
    _reviews.refresh();
  }

  reviewsCheck(int index) {
    reviews[index].isHeart = !reviews[index].isHeart;
    if (reviews[index].isHeart) {
      reviews[index].heartCount++;
      ReviewHeartCount().reviewHeartCount(reviews[index].id, 331, true);
      for (int i = 0; i < bestReview.length; i++) {
        if (bestReview[i].id == reviews[index].id) {
          bestReview[i].heartCount++;
          bestReview[i].isHeart = true;
        }
      }
    } else {
      reviews[index].heartCount--;
      ReviewHeartCount().reviewHeartCount(reviews[index].id, 331, false);
      for (int i = 0; i < bestReview.length; i++) {
        if (bestReview[i].id == reviews[index].id) {
          bestReview[i].heartCount--;
          bestReview[i].isHeart = false;
        }
      }
    }
    _bestReview.refresh();
    _reviews.refresh();
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

  final ScrollController scrollController = ScrollController();
}
