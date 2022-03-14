import 'package:f_review/constants.dart';
import 'package:f_review/controller/sub_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../date_data.dart';
import '../../name_page/name_page.dart';
import '../../profile_page/profile_page.dart';
import '../../search_page/widget/search_sub.dart';

class ReviewWidget extends StatelessWidget {
  ReviewWidget(
      {Key? key,
      required this.index,
      required this.area,
      required this.service})
      : super(key: key);
  final int index;
  final String area;
  final String service;
  final reviewController = Get.put(SubPageController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.network(
                        "$kBaseUrl/user_profile/${reviewController.reviews[index].profileImage}",
                        width: 40,
                        height: 40),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(ProfilePage(
                              userId: 0,
                            ));
                          },
                          child: Text(
                            reviewController.reviews[index].userName,
                            style: const TextStyle(
                              color: Color(0xFf2a2a2a),
                              fontSize: 15,
                              fontFamily: 'NotoSansKR-Bold',
                            ),
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
                              DateFormat("M.dd").format(
                                      reviewController.reviews[index].date) +
                                  " " +
                                  DateData().getWeekDay(
                                      reviewController.reviews[index].date),
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
                          reviewController.reviewsCheck(index);
                        },
                        child: reviewController.reviews[index].isHeart
                            ? Image.asset('assets/heart.png', width: 17)
                            : Image.asset('assets/bora_heart.png', width: 17),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Obx(
                      () => Text(
                        reviewController.reviews[index].heartCount.toString(),
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
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Get.to(NamePage(
                  reviewModel: reviewController.reviews[index],
                ));
              },
              child: SizedBox(
                width: Get.width,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(
                            "$kBaseUrl/review_img/${reviewController.reviews[index].images[0]}",
                          ),
                          fit: BoxFit.cover,
                        )),
                      )),
                      reviewController.reviews[index].images.length == 1
                          ? Container()
                          : const SizedBox(width: 5),
                      reviewController.reviews[index].images.length == 1
                          ? Container()
                          : Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                      child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: NetworkImage(
                                        "$kBaseUrl/review_img/${reviewController.reviews[index].images[1]}",
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                                  )),
                                  reviewController
                                              .reviews[index].images.length ==
                                          2
                                      ? Container()
                                      : const SizedBox(height: 5),
                                  reviewController
                                              .reviews[index].images.length ==
                                          2
                                      ? Container()
                                      : Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  "$kBaseUrl/review_img/${reviewController.reviews[index].images[2]}",
                                                ),
                                                fit: BoxFit.cover,
                                                colorFilter: ColorFilter.mode(
                                                    Colors.black
                                                        .withOpacity(0.5),
                                                    BlendMode.dstATop),
                                              ),
                                            ),
                                            child: reviewController
                                                        .reviews[index]
                                                        .images
                                                        .length >
                                                    3
                                                ? Center(
                                                    child: Text(
                                                      '+${reviewController.reviews[index].images.length - 3}',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontFamily:
                                                            'NotoSansKR-Medium',
                                                        fontSize: 17,
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  reviewController.reviews[index].placeName,
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
            const SizedBox(height: 2),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                reviewController.reviews[index].review,
                style: const TextStyle(color: Color(0xFF2a2a2a), fontSize: 11),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: 23,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: reviewController.reviews[index].tags.length,
                  itemBuilder: (BuildContext context, int reviewIndex) {
                    return InkWell(
                      onTap: () {
                        Get.to(SearchSub(
                          tag:
                              reviewController.reviews[index].tags[reviewIndex],
                        ));
                      },
                      child: Container(
                        height: 23,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEAE5F9),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Center(
                          child: Text(
                            '#${reviewController.reviews[index].tags[reviewIndex]}',
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
            const Divider(
              height: 60,
            )
          ],
        ));
  }
}
