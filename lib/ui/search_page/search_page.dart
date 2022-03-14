import 'package:f_review/ui/search_page/widget/searchTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../controller/search_page_controller.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key, required this.keyword, required this.type})
      : super(key: key);
  bool isTextField = false;

  final String keyword;
  final String type;
  final searchPageController = Get.put(SearchPageController());
  @override
  Widget build(BuildContext context) {
    searchPageController.getSearchResult(keyword, type);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: FlatButton(
            onPressed: () {
              isTextField = true;
            },
            child: Column(
              children: <Widget>[
                isTextField
                    ? TextField()
                    : Text(
                        keyword,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'NotoSansKR-Medium',
                        ),
                      ),
              ],
            ),
          ),
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
                    color: Color(0xFF362C5E),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            DefaultTabController(
              length: 3,
              initialIndex: type == "tag"
                  ? 0
                  : type == "place"
                      ? 1
                      : 2,
              child: Material(
                child: TabBar(
                  indicatorColor: Colors.green,
                  tabs: const [
                    Tab(
                      text: "태그",
                    ),
                    Tab(
                      text: "장소",
                    ),
                    Tab(
                      text: "계정",
                    ),
                  ],
                  labelColor: Colors.black,
                  indicator: DotIndicator(
                    color: Colors.black,
                    distanceFromCenter: 16,
                    radius: 3,
                    paintingStyle: PaintingStyle.fill,
                  ),
                  onTap: (index) {
                    switch (index) {
                      case 0:
                        searchPageController.getSearchResult(keyword, "tag");
                        break;
                      case 1:
                        searchPageController.getSearchResult(keyword, "place");
                        break;
                      case 2:
                        searchPageController.getSearchResult(keyword, "user");
                        break;
                    }
                  },
                ),
              ),
            ),
            Obx(
              () => ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: searchPageController.searchResult.length,
                itemBuilder: (BuildContext context, int index) {
                  return SearchTile(index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
