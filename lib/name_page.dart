import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NamePage extends StatefulWidget {
  const NamePage({Key? key}) : super(key: key);

  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
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
          Container(
              padding: EdgeInsets.only(right: 10),
              child: Image.asset(
                'assets/avatar.png',
                width: 30,
              )),
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
                padding: EdgeInsets.only(left: 10, right: 10, top: 40),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '마시랑게',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'NotoSansKR-Bold',
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                  ),
                                ],
                              ),
                              Text(
                                '카페·서울 하남시 검단산로 228-8',
                                style: TextStyle(
                                    color: Color(0xFF2a2a2a),
                                    fontSize: 11,
                                    fontFamily: 'NotoSansKR-Regular'),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Image.asset('assets/bora_heart.png', width: 22),
                            SizedBox(height: 3),
                            Text(
                              '저장',
                              style: TextStyle(
                                color: Color(0xFF2a2a2a),
                                fontFamily: 'NotoSansKR-Regular',
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: Get.width,
                      height: 7,
                      color: Color(0xFFFBF9FF),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/avatar_1.png',
                                width: 40, height: 40),
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
                                    Image.asset('assets/mark.png',
                                        width: 15, height: 15),
                                  ],
                                ),
                                Container(
                                  width: 320,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.all(10),
                          width: Get.width,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/name_img1.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/heart.png',
                                  width: 17,
                                ),
                              ),
                              Container(
                                child: Text(
                                  '1.4K',
                                  style: TextStyle(
                                      color: Color(0xFF362C5E),
                                      fontSize: 10,
                                      fontFamily: 'NotoSansKR-Medium'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Text(
                            '매장도 예쁘고 디저트도 맛있어요 ㅎㅎ 포토존도 따로 있는데 사람이 많아서 줄 서서 기다려야되용.. 그래도 그만큼 사진도 너무 잘나오고 분위기 있어 보여요! 음료도 특색있고, 디저트도 한옥마을이랑 잘 어울려서 하남 오신분들 한번 다녀와보세요 :)',
                            style: TextStyle(
                                color: Color(0xFF2a2a2a), fontSize: 11),
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
                                  '#맛짐도장쾅',
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
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: Get.width,
                height: 7,
                color: Color(0xFFFBF9FF),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '같은 곳 다른 리뷰',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR-Bold',
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '3,000',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR-Bold',
                            fontSize: 16,
                            color: Color(0xFFFFAD00),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('추천 많은 순',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR-Regular',
                            )),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/avatar_2.png',
                            width: 40, height: 40),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '유그린',
                                  style: TextStyle(
                                    color: Color(0xFf2a2a2a),
                                    fontSize: 15,
                                    fontFamily: 'NotoSansKR-Bold',
                                  ),
                                ),
                                SizedBox(width: 5),
                                Image.asset('assets/mark.png',
                                    width: 15, height: 15),
                              ],
                            ),
                            Container(
                              width: 320,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '사진리뷰 15   12.12.토',
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
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: Get.width,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/name_img2.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            child: Image.asset(
                              'assets/n_heart.png',
                              width: 17,
                            ),
                          ),
                          Container(
                            child: Text(
                              '20K',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: 'NotoSansKR-Medium'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text(
                        '분위기가 너무 좋아요. 여러 카페 다녀봤는데 이렇게 깔끔하고 예쁘게 플레이팅 되서 나오는 카페는 처음 봤어요. 사진도 잘 안찍는데 감동 받아서 찍어봅니다.. 다들 마시랑게 하세요 bb',
                        style:
                            TextStyle(color: Color(0xFF2a2a2a), fontSize: 11),
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
                          width: 55,
                          height: 23,
                          decoration: BoxDecoration(
                            color: Color(0xFFEAE5F9),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              '#다들',
                              style: TextStyle(
                                  color: Color(0xFF2a2a2a),
                                  fontSize: 12,
                                  fontFamily: 'NotoSansKR-Regular'),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 80,
                          height: 23,
                          decoration: BoxDecoration(
                            color: Color(0xFFEAE5F9),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              '#마시랑게',
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
                              '#하세요',
                              style: TextStyle(
                                  color: Color(0xFF2a2a2a),
                                  fontSize: 12,
                                  fontFamily: 'NotoSansKR-Regular'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
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