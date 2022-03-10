import 'package:f_review/controller/sub_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/review_model.dart';
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
    ReviewModel reviewModel = reviewController.bestReview[index];
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10),
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
                Get.to(ProfilePage());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(reviewModel.profileImage,
                          width: 40, height: 40),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            reviewModel.userName,
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
                              SizedBox(width: 5),
                              Text(
                                reviewModel.date,
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
                              : Image.asset('assets/bora_heart.png', width: 17),
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
                  reviewModel: reviewModel,
                  index: index,
                  service: service,
                  area: area,
                ));
              },
              child: Container(
                width: Get.width,
                height: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(reviewModel.images[0]),
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
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                Get.to(NamePage(
                  reviewModel: reviewModel,
                  index: index,
                  service: service,
                  area: area,
                ));
              },
              child: Row(
                children: [
                  Text(
                    reviewModel.placeName,
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
            Text(
              reviewModel.review,
              style: const TextStyle(color: Color(0xFF2a2a2a), fontSize: 11),
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: 23,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: reviewModel.tags.length,
                  itemBuilder: (BuildContext context, int tagIndex) {
                    return Container(
                      height: 23,
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAE5F9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          '#${reviewModel.tags[tagIndex]}',
                          style: const TextStyle(
                              color: Color(0xFF2a2a2a),
                              fontSize: 12,
                              fontFamily: 'NotoSansKR-Regular'),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
