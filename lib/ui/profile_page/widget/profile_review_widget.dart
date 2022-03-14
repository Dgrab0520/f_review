import 'package:f_review/controller/profile_page_controller.dart';
import 'package:f_review/model/review_model.dart';
import 'package:f_review/ui/name_page/name_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileReviewWidget extends StatelessWidget {
  ProfileReviewWidget({Key? key, required this.index}) : super(key: key);

  final int index;
  final profilePageController = Get.put(ProfilePageController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
            NamePage(
              reviewModel: ReviewModel(
                id: 1,
                profileImage: "profileImage",
                userName: "userName",
                date: "date",
                placeName: "placeName",
                review: "review",
                heartCount: 0,
                tags: [],
                images: [],
                isHeart: false,
              ),
            ),
            arguments: profilePageController.categoryPressed['전체']!
                ? profilePageController.reviews[index]
                : profilePageController.selectedReviews[index]);
      },
      child: Container(
        padding: const EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 5),
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(profilePageController.categoryPressed['전체']!
                ? profilePageController.reviews[index].image
                : profilePageController.selectedReviews[index].image),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(
                  () => InkWell(
                    onTap: () {
                      profilePageController.categoryPressed['전체']!
                          ? profilePageController.reviewsHeartChange(index)
                          : profilePageController
                              .selectedReviewsHeartChange(index);
                    },
                    child: (profilePageController.categoryPressed['전체']!
                            ? profilePageController.reviews[index].isHeart
                            : profilePageController
                                .selectedReviews[index].isHeart)
                        ? Image.asset('assets/heart.png', width: 15)
                        : Image.asset('assets/n_heart.png', width: 15),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profilePageController.categoryPressed['전체']!
                      ? profilePageController.reviews[index].area
                      : profilePageController.selectedReviews[index].area,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'NotoSansKR-Regular',
                  ),
                ),
                Text(
                  profilePageController.categoryPressed['전체']!
                      ? profilePageController.reviews[index].name
                      : profilePageController.selectedReviews[index].name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'NotoSansKR-Regular',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
