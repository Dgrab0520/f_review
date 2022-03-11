import 'package:f_review/controller/sub_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../profile_page/profile_page.dart';

class SearchSub extends StatefulWidget {
  SearchSub({Key? key, required this.area, required this.service})
      : super(key: key);
  final String area;
  final String service;

  final subPageController = Get.put(SubPageController());

  @override
  _SearchSubState createState() => _SearchSubState();
}

class _SearchSubState extends State<SearchSub> {
  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF362C5E),
                size: 23,
              ),
            )),
        leadingWidth: 35,
        actions: [
          InkWell(
            onTap: () {
              Get.to(ProfilePage());
            },
            child: Container(
                padding: EdgeInsets.only(right: 10),
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
                        Text('#하남카페',
                            style: const TextStyle(
                              fontSize: 23,
                              fontFamily: 'NotoSansKR-Bold',
                            )),
                        const Text(
                          '총 1,234 게시물',
                          style: TextStyle(
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
                      children: [
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 2,
                          child:
                              ImageTile(index: 20, width: 3000, height: 3000),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 1,
                          child: ImageTile(index: 1, width: 3000, height: 3000),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: ImageTile(index: 2, width: 3000, height: 3000),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: ImageTile(index: 3, width: 3000, height: 3000),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 4,
                          mainAxisCellCount: 2,
                          child: ImageTile(index: 4, width: 3000, height: 3000),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 4,
                          mainAxisCellCount: 2,
                          child:
                              ImageTile(index: 22, width: 3000, height: 3000),
                        ),
                      ],
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
  const ImageTile({
    Key? key,
    required this.index,
    required this.width,
    required this.height,
  }) : super(key: key);

  final int index;
  final int width;
  final int height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://picsum.photos/$width/$height?random=$index',
      width: width.toDouble(),
      height: height.toDouble(),
      fit: BoxFit.cover,
    );
  }
}
