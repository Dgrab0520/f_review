import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SponsorSub extends StatefulWidget {
  const SponsorSub({Key? key}) : super(key: key);

  @override
  _SponsorSubState createState() => _SponsorSubState();
}

class _SponsorSubState extends State<SponsorSub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/m_poster.jpg'),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(color: Color(0xFfEAE5F9)),
                        child: Text(
                          '메가커피 [하남 미사점] 아메리카노 무료쿠폰 20잔',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'NotoSansKR-Bold',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: Text(
                        '안녕하세요 플루닛입니다',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'NotoSansKR-Medium',
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Center(
                      child: Text(
                        '하남 지역 베스트 리뷰에 선정되신 분들 중에',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'NotoSansKR-Medium',
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Center(
                      child: Text(
                        '메가커피 [하남 미사점] 아메리카노 무료 쿠폰 20잔을',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'NotoSansKR-Medium',
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Center(
                      child: Text(
                        '추첨을 통해 드립니다.',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'NotoSansKR-Medium',
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '* 유의사항',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'NotoSansKR-Bold',
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '- 본 쿠폰의 유효기간은 발급일로부터 2주 입니다.',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'NotoSansKR-Regular',
                            ),
                          ),
                          Text(
                            '- 본 쿠폰의 유효기간은 발급일로부터 2주 입니다.',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'NotoSansKR-Regular',
                            ),
                          ),
                          Text(
                            '- 본 쿠폰의 유효기간은 발급일로부터 2주 입니다.',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'NotoSansKR-Regular',
                            ),
                          ),
                          Text(
                            '- 본 쿠폰의 유효기간은 발급일로부터 2주 입니다.',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'NotoSansKR-Regular',
                            ),
                          ),
                          Text(
                            '- 본 쿠폰의 유효기간은 발급일로부터 2주 입니다.',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'NotoSansKR-Regular',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                right: 7,
                child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      'assets/cross.png',
                      color: Colors.white,
                      width: 22,
                    )),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
