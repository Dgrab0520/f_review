import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/profile_page_controller.dart';
import 'bookmark_widget.dart';

class BookmarkPage extends StatelessWidget {
  BookmarkPage({Key? key}) : super(key: key);

  final ProfilePageController profilePageController =
      Get.put(ProfilePageController());
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      profilePageController.getSaved(331);
    });
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            '저장',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'NotoSansKR-Medium',
            ),
          ),
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF362C5E),
                size: 23,
              ),
            ),
          ),
          leadingWidth: 35,
          actions: [
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.only(right: 10),
                child: const SizedBox(
                  height: 25,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Obx(
          () => profilePageController.isBookmarkLoading
              ? profilePageController.savedPlace.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: profilePageController.savedPlace.length,
                      itemBuilder: (BuildContext context, int index) {
                        return BookmarkWidget(
                            bookmarkModel:
                                profilePageController.savedPlace[index]);
                      },
                    )
                  : const Text("저장된 장소가 없습니다")
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
