import 'package:f_review/ui/main_page/widget/search_sub.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    var mainPageController;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            '하남',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'NotoSansKR-Medium',
            ),
          ),
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
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
                child: SizedBox(
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
              initialIndex: 0,
              child: Material(
                child: TabBar(
                  indicatorColor: Colors.green,
                  tabs: [
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
                ),
              ),
            ),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(SearchSub(
                      area: 'area',
                      service: 'service',
                    ));
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/avatar.png'),
                    ),
                    title: Text('#하남'),
                    subtitle: Text('총 1,234 게시물'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                new Divider(
                  height: 1.0,
                  indent: 1.0,
                ),
                InkWell(
                  onTap: () {
                    Get.to(SearchSub(
                      area: 'area',
                      service: 'service',
                    ));
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/avatar.png'),
                    ),
                    title: Text('#하남'),
                    subtitle: Text('총 1,234 게시물'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                new Divider(
                  height: 1.0,
                  indent: 1.0,
                ),
                InkWell(
                  onTap: () {
                    Get.to(SearchSub(
                      area: 'area',
                      service: 'service',
                    ));
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/avatar.png'),
                    ),
                    title: Text('#하남'),
                    subtitle: Text('총 1,234 게시물'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                new Divider(
                  height: 1.0,
                  indent: 1.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
