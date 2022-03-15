import 'package:f_review/constants.dart';
import 'package:f_review/controller/name_page_controller.dart';
import 'package:f_review/model/bookmark_model.dart';
import 'package:f_review/ui/name_page/name_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarkWidget extends StatelessWidget {
  BookmarkWidget({Key? key, required this.bookmarkModel}) : super(key: key);

  final BookmarkModel bookmarkModel;
  final namePageController = Get.put(NamePageController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            namePageController
                .getMainReview(bookmarkModel.reviewId)
                .then((value) {
              if (value != null) {
                Get.to(NamePage(reviewModel: value));
              }
            });
          },
          child: ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundImage:
                  NetworkImage('$kBaseUrl/review_img/${bookmarkModel.image}'),
            ),
            title: Text(
              bookmarkModel.name,
              style: const TextStyle(
                fontFamily: 'NotoSansKR-Medium',
              ),
            ),
            subtitle: Text(
              bookmarkModel.address,
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
        ),
        const Divider(
          height: 1.0,
          indent: 1.0,
        ),
      ],
    );
  }
}
