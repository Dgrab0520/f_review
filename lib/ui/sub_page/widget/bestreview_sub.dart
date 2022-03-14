import 'package:f_review/constants.dart';
import 'package:f_review/controller/sub_page_controller.dart';
import 'package:f_review/date_data.dart';
import 'package:f_review/ui/search_page/widget/search_sub.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../name_page/name_page.dart';
import '../../profile_page/profile_page.dart';

class BestReviewSub extends StatelessWidget {
  BestReviewSub(
      {Key? key,
      required this.index,
      required this.service,
      required this.area})
      : super(key: key);
  final int index;
  final String service;
  final String area;
  final reviewController = Get.put(SubPageController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding:
              const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10),
          margin: const EdgeInsets.only(
            bottom: 25,
          ),
          width: Get.width,
          decoration: BoxDecoration(
            color: const Color(0xFFFBF9FF),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFdbdbdb).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(2, 4), // changes position of shadow
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(ProfilePage(
                      userId: 0,
                    ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.network(
                              "$kBaseUrl/user_profile/${reviewController.bestReview[index].profileImage}",
                              fit: BoxFit.cover,
                              width: 40,
                              height: 40),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                reviewController.bestReview[index].userName,
                                style: const TextStyle(
                                  color: Color(0xFf2a2a2a),
                                  fontSize: 15,
                                  fontFamily: 'NotoSansKR-Bold',
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '$service·$area',
                                    style: const TextStyle(
                                      color: Color(0xFF2a2a2a),
                                      fontSize: 11,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    DateFormat("M.dd").format(reviewController
                                            .bestReview[index].date) +
                                        " " +
                                        DateData().getWeekDay(reviewController
                                            .bestReview[index].date),
                                    style: const TextStyle(
                                      color: Color(0xFF8D8D8D),
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Obx(
                            () => InkWell(
                              onTap: () {
                                reviewController.bestReviewCheck(index);
                              },
                              child: reviewController.bestReview[index].isHeart
                                  ? Image.asset('assets/heart.png', width: 17)
                                  : Image.asset('assets/bora_heart.png',
                                      width: 17),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Obx(
                            () => Text(
                              reviewController.bestReview[index].heartCount
                                  .toString(),
                              style: const TextStyle(
                                color: Color(0xFF362C5E),
                                fontSize: 10,
                                fontFamily: 'NotoSansKR-Medium',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(NamePage(
                      reviewModel: reviewController.bestReview[index],
                    ));
                  },
                  child: Container(
                    width: Get.width,
                    height: 130,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(
                            "$kBaseUrl/review_img/${reviewController.bestReview[index].images[0]}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Get.to(NamePage(
                      reviewModel: reviewController.bestReview[index],
                    ));
                  },
                  child: Row(
                    children: [
                      Text(
                        reviewController.bestReview[index].placeName,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'NotoSansKR-Bold',
                          color: Color(0xFF2a2a2a),
                        ),
                      ),
                      const SizedBox(width: 2),
                      const Icon(Icons.arrow_forward_ios,
                          size: 15, color: Color(0xFF2a2a2a)),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    reviewController.bestReview[index].review,
                    style:
                        const TextStyle(color: Color(0xFF2a2a2a), fontSize: 11),
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 23,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: reviewController.bestReview[index].tags.length,
                      itemBuilder: (BuildContext context, int tagIndex) {
                        return InkWell(
                          onTap: () {
                            Get.to(SearchSub(
                              tag: reviewController
                                  .bestReview[index].tags[tagIndex],
                            ));
                          },
                          child: Container(
                            height: 23,
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEAE5F9),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                '#${reviewController.bestReview[index].tags[tagIndex]}',
                                style: const TextStyle(
                                    color: Color(0xFF2a2a2a),
                                    fontSize: 12,
                                    fontFamily: 'NotoSansKR-Regular'),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
