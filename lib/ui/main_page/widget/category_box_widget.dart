import 'package:f_review/controller/main_page_controller.dart';
import 'package:f_review/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../sub_page/widget/sposor_sub.dart';

class CategoryBoxWidget extends StatelessWidget {
  CategoryBoxWidget({
    Key? key,
    required this.category,
  }) : super(key: key);
  final CategoryModel category;
  final mainPageController = Get.put(MainPageController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        onTap: () {
          mainPageController
              .getSponsorOnce(category.area, category.service)
              .then((value) {
            if (value != null) {
              Get.to(SponsorSub(
                sponsorModel: value,
                area: category.area,
                service: category.service,
              ));
            }
          });
        },
        child: Container(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          width: Get.width,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage(category.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '${category.area} ${category.service} 리뷰',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'NotoSansKR-Medium',
                ),
              ),
              Text(
                '${category.area} ${category.service} 리뷰를 참고해보세요!',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontFamily: 'NotoSansKR-Regular',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
