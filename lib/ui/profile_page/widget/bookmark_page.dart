import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../search_page/widget/search_sub.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
            child: Text(
              '저장',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'NotoSansKR-Medium',
              ),
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
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/bookmark_1.png'),
                    ),
                    title: Text(
                      '마시랑게',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR-Medium',
                      ),
                    ),
                    subtitle: Text(
                      '전라북도 전주시 완산구 전동성당길 100 2층',
                      style: TextStyle(),
                    ),
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
                      tag: '다님길',
                    ));
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/bookmark_2.png'),
                    ),
                    title: Text('다님길'),
                    subtitle: Text('서울 노원구 공릉로41나길 31 1층'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                new Divider(
                  height: 1.0,
                  indent: 1.0,
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/bookmark_3.png'),
                    ),
                    title: Text('리브인오후'),
                    subtitle: Text('서울 노원구 동일로178길 39-30 1층'),
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
