import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../profile_page/profile_page.dart';

class CouponSub extends StatefulWidget {
  const CouponSub({Key? key}) : super(key: key);

  @override
  _CouponSubState createState() => _CouponSubState();
}

class _CouponSubState extends State<CouponSub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF363057),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
            child: Image.asset(
          'assets/logo.png',
          width: 40,
        )),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            padding: const EdgeInsets.only(left: 10),
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
                  color: Colors.white,
                )),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Image.asset('assets/qr.png'),
            Container(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '메가커피',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '크림바바 1종 (커스타드, 초코, 생크림 증 택1) + 퐁크러쉬 + 쿠키프라페',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'NotoSansKR-Medium',
                    ),
                  ),
                  SizedBox(height: 60),
                  Center(
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('알림'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      Text('QR코드를 사용하시겠습니까?'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  FlatButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      '확인',
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      '취소',
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Container(
                        width: 200,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFF363057),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'QR사용하기',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NotoSansKR-Medium',
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '* 누르는 순간 사용되니 직원 외에는 누르지 마세요',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
