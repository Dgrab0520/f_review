import 'package:f_review/controller/search_page_controller.dart';
import 'package:f_review/ui/name_page/name_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:numeral/fun.dart';

import '../../profile_page/profile_page.dart';

class SearchSub extends StatelessWidget {
  SearchSub({Key? key, required this.tag}) : super(key: key);
  final String tag;

  final searchPageController = Get.put(SearchPageController());
  @override
  Widget build(BuildContext context) {
    searchPageController.getTagPost(tag);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
            child: Image.asset(
          'assets/logo.png',
          width: 40,
        )),
        leading: Container(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF362C5E),
                size: 23,
              ),
            )),
        leadingWidth: 35,
        actions: [
          InkWell(
            onTap: () {
              Get.to(ProfilePage(
                userId: 0,
              ));
            },
            child: Container(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  'assets/avatar.png',
                  width: 30,
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('#$tag',
                            style: const TextStyle(
                              fontSize: 23,
                              fontFamily: 'NotoSansKR-Bold',
                            )),
                        Text(
                          "총" + numeral(searchPageController.tagCount) + "게시물",
                          style: const TextStyle(
                            color: Color(0xFF8D8D8D),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: Get.width,
                height: 7,
                color: const Color(0xFFFBF9FF),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    StaggeredGrid.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      children: searchPageController.tagPost
                          .asMap()
                          .map((index, value) => MapEntry(
                              index,
                              StaggeredGridTile.count(
                                crossAxisCellCount:
                                    searchPageController.crossCount[index % 5],
                                mainAxisCellCount:
                                    searchPageController.mainCount[index % 5],
                                child: InkWell(
                                  onTap: () {
                                    Get.to(NamePage(
                                        reviewModel: searchPageController
                                            .tagPost[index]));
                                  },
                                  child: ImageTile(
                                    image: searchPageController
                                        .tagPost[index].images.first,
                                  ),
                                ),
                              )))
                          .values
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageTile extends StatelessWidget {
  const ImageTile({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    // return Image.network(
    //   'https://picsum.photos/$width/$height?random=$index',
    //   width: 300,
    //   height: 300,
    //   fit: BoxFit.cover,
    // );
    return Image.asset(
      image,
      width: 300,
      height: 300,
      fit: BoxFit.cover,
    );
  }
}
