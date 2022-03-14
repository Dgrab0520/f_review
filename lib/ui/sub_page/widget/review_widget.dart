import 'package:f_review/controller/sub_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(reviewController.reviews[index].profileImage,
                    width: 40, height: 40),
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
                          reviewController.reviews[index].date,
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
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Image.asset(
                    reviewController.reviews[index].images[0],
                  )),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  children: [
                    Image.asset(reviewController.reviews[index].images[1]),
                    const SizedBox(height: 5),
                    Container(
                      width: Get.width,
                      height: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              reviewController.reviews[index].images[2]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '+2',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'NotoSansKR-Medium',
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
        Text(
          reviewController.reviews[index].review,
          style: const TextStyle(color: Color(0xFF2a2a2a), fontSize: 11),
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
                      tag: reviewController.reviews[index].tags[reviewIndex],
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
        )
      ],
    );
  }
}
