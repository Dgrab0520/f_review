import 'package:f_review/heart_controller.dart';
import 'package:f_review/name_page.dart';
import 'package:f_review/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BestreviewSub extends StatefulWidget {
  const BestreviewSub({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  _BestreviewSubState createState() => _BestreviewSubState();
}

class _BestreviewSubState extends State<BestreviewSub> {
  final heartController = Get.put(HeartController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10),
      margin: EdgeInsets.only(
        bottom: 25,
      ),
      width: Get.width,
      decoration: BoxDecoration(
        color: Color(0xFFFBF9FF),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFdbdbdb).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(2, 4), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Get.to(ProfilePage());
              },
              child: Row(
                children: [
                  Image.asset('assets/avatar_1.png', width: 40, height: 40),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '유라희',
                            style: TextStyle(
                              color: Color(0xFf2a2a2a),
                              fontSize: 15,
                              fontFamily: 'NotoSansKR-Bold',
                            ),
                          ),
                          SizedBox(width: 5),
                          Image.asset('assets/mark.png', width: 15, height: 15),
                        ],
                      ),
                      Container(
                        width: 260,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '사진리뷰 5   6.12.일',
                              style: TextStyle(
                                color: Color(0xFF8D8D8D),
                                fontSize: 11,
                              ),
                            ),
                            Text(
                              '카페·서울 하남',
                              style: TextStyle(
                                color: Color(0xFF2a2a2a),
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(NamePage());
              },
              child: Container(
                width: Get.width,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/sub_img.png'),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 30, right: 5),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              heartController.heartChange(widget.index);
                            },
                            child: Obx(
                              () => heartController.heart[widget.index]
                                  ? Container(
                                      child: Image.asset('assets/heart.png',
                                          width: 15),
                                    )
                                  : Container(
                                      child: Image.asset('assets/n_heart.png',
                                          width: 15),
                                    ),
                            ),
                          ),
                          SizedBox(height: 1),
                          Text(
                            '1.4K',
                            style: TextStyle(
                              color: Color(0xFF362C5E),
                              fontSize: 10,
                              fontFamily: 'NotoSansKR-Medium',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.to(NamePage());
              },
              child: Container(
                child: Row(
                  children: [
                    Text(
                      '마시랑게',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'NotoSansKR-Bold',
                        color: Color(0xFF2a2a2a),
                      ),
                    ),
                    SizedBox(width: 2),
                    Icon(Icons.arrow_forward_ios,
                        size: 15, color: Color(0xFF2a2a2a)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2),
            Container(
              child: Text(
                '매장도 예쁘고 디저트도 맛있어요 ㅎㅎ 포토존도 따로 있는데 사람이 많아서 줄 서서 기다려야되용.. 그래도 그만큼 사진도 너무 잘나오고 ...',
                style: TextStyle(color: Color(0xFF2a2a2a), fontSize: 11),
              ),
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Container(
                  width: 80,
                  height: 23,
                  decoration: BoxDecoration(
                    color: Color(0xFFEAE5F9),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      '#하남카페',
                      style: TextStyle(
                          color: Color(0xFF2a2a2a),
                          fontSize: 12,
                          fontFamily: 'NotoSansKR-Regular'),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 70,
                  height: 23,
                  decoration: BoxDecoration(
                    color: Color(0xFFEAE5F9),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      '#포토존',
                      style: TextStyle(
                          color: Color(0xFF2a2a2a),
                          fontSize: 12,
                          fontFamily: 'NotoSansKR-Regular'),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 90,
                  height: 23,
                  decoration: BoxDecoration(
                    color: Color(0xFFEAE5F9),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      '#비쥬얼맛집',
                      style: TextStyle(
                          color: Color(0xFF2a2a2a),
                          fontSize: 12,
                          fontFamily: 'NotoSansKR-Regular'),
                    ),
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
