import 'package:f_review/ui/search_page/widget/searchTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../controller/search_page_controller.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key, required this.keyword, required this.type})
      : super(key: key);
  final String keyword;
  final String type;
  final searchPageController = Get.put(SearchPageController());
  @override
  Widget build(BuildContext context) {
    searchPageController.getSearchResult(keyword, type);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Obx(
          () => searchPageController.isTextField
              ? Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAE5F9),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    controller: searchPageController.searchTextController,
                    focusNode: searchPageController.focusNode,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    onSubmitted: (text) {
                      searchPageController.searchKeyword = text;
                      searchPageController.isTextField = false;
                      searchPageController.getSearchResult(
                          searchPageController.searchKeyword,
                          searchPageController.searchType);
                    },
                  ))
              : InkWell(
                  onTap: () {
                    searchPageController.isTextField = true;
                    searchPageController.searchTextController.text =
                        searchPageController.searchKeyword;
                    searchPageController.focusNode.requestFocus();
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    width: Get.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAE5F9),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      searchPageController.searchKeyword,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'NotoSansKR-Medium',
                      ),
                    ),
                  ),
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
            onTap: () {
              searchPageController.searchKeyword =
                  searchPageController.searchTextController.text;
              searchPageController.isTextField = false;
              searchPageController.getSearchResult(
                  searchPageController.searchKeyword,
                  searchPageController.searchType);
            },
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
                      searchPageController.getSearchResult(
                          searchPageController.searchKeyword, "tag");
                      break;
                    case 1:
                      searchPageController.getSearchResult(
                          searchPageController.searchKeyword, "place");
                      break;
                    case 2:
                      searchPageController.getSearchResult(
                          searchPageController.searchKeyword, "user");
                      break;
                  }
                },
              ),
            ),
          ),
          Obx(
            () => searchPageController.searchResult.isNotEmpty
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: searchPageController.searchResult.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SearchTile(index: index);
                    },
                  )
                : const Text("검색 결과가 없습니다"),
          ),
        ],
      ),
    );
  }
}
