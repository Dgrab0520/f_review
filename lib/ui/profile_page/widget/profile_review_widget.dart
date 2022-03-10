import 'package:f_review/controller/profile_page_controller.dart';
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
        //Get.to();
      },
      child: Container(
        padding: const EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 5),
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(profilePageController.reviews[index].image),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(()=>InkWell(
                  onTap: () {
                    profilePageController.reviewsHeartChange(index);
                  },
                  child: profilePageController.reviews[index].isHeart
                      ? Image.asset('assets/heart.png', width: 15)
                      : Image.asset('assets/n_heart.png', width: 15),
                ),)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profilePageController.reviews[index].area,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'NotoSansKR-Regular',
                  ),
                ),
                Text(
                  profilePageController.reviews[index].name,
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
