import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja/asymmetric/rsa/rsa.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../profile_page/profile_page.dart';

class CouponSub extends StatefulWidget {
  const CouponSub({Key? key}) : super(key: key);

  @override
  _CouponSubState createState() => _CouponSubState();
}

class _CouponSubState extends State<CouponSub> {
  //coupon_id 암호화 키
  final privateKeyPem = '''
-----BEGIN RSA PRIVATE KEY-----
MIIBOwIBAAJBAMv7Reawnxr0DfYN3IZbb5ih/XJGeLWDv7WuhTlie//c2TDXw/mW
914VFyoBfxQxAezSj8YpuADiTwqDZl13wKMCAwEAAQJAYaTrFT8/KpvhgwOnqPlk
NmB0/psVdW6X+tSMGag3S4cFid3nLkN384N6tZ+na1VWNkLy32Ndpxo6pQq4NSAb
YQIhAPNlJsV+Snpg+JftgviV5+jOKY03bx29GsZF+umN6hD/AiEA1ouXAO2mVGRk
BuoGXe3o/d5AOXj41vTB8D6IUGu8bF0CIQC6zah7LRmGYYSKPk0l8w+hmxFDBAex
IGE7SZxwwm2iCwIhAInnDbe2CbyjDrx2/oKvopxTmDqY7HHWvzX6K8pthZ6tAiAw
w+DJoSx81QQpD8gY/BXjovadVtVROALaFFvdmN64sw==
-----END RSA PRIVATE KEY-----''';

  String coupon_qr = '';
  String coupon = Get.arguments;

  @override
  void initState() {
    super.initState();
    coupon = Get.arguments;
    print(coupon);
    final privateKey = RSAPrivateKey.fromPEM(privateKeyPem);
    final publicKey = privateKey.toPublicKey;
    coupon_qr = publicKey.encryptOaepToBase64(coupon); //couopon_id 암호
    print(coupon_qr);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.3,
        title: Center(
            child: Image.asset(
          'assets/logo.png',
          width: 40,
        )),
        centerTitle: true,
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
        margin:
            EdgeInsets.only(bottom: 60.0, top: 40.0, left: 35.0, right: 35.0),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.0,
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.7, color: Color(0xffc6c6c6))),
              child: QrImage(
                data: coupon_qr,
                backgroundColor: Colors.white,
                size: 200,
                version: 10,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '스타벅스',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSansKR-Regular',
                    ),
                  ),
                  Text(
                    coupon,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'NotoSansKR-Medium',
                    ),
                  ),
                  Text(
                    '사용가능  |  22.03.31 - 22.05.31',
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 50),
                  // Center(
                  //   child: InkWell(
                  //     onTap: () {
                  //       showDialog(
                  //           context: context,
                  //           builder: (BuildContext context) {
                  //             return AlertDialog(
                  //               title: Text('알림'),
                  //               content: SingleChildScrollView(
                  //                 child: ListBody(
                  //                   children: [
                  //                     Text('QR코드를 사용하시겠습니까?'),
                  //                   ],
                  //                 ),
                  //               ),
                  //               actions: [
                  //                 FlatButton(
                  //                   onPressed: () {
                  //                     Get.back();
                  //                   },
                  //                   child: Text(
                  //                     '확인',
                  //                   ),
                  //                 ),
                  //                 FlatButton(
                  //                   onPressed: () {
                  //                     Get.back();
                  //                   },
                  //                   child: Text(
                  //                     '취소',
                  //                   ),
                  //                 ),
                  //               ],
                  //             );
                  //           });
                  //     },
                  //     child: Container(
                  //       width: 200,
                  //       height: 40,
                  //       decoration: BoxDecoration(
                  //         color: Color(0xFF363057),
                  //         borderRadius: BorderRadius.circular(5),
                  //       ),
                  //       child: Center(
                  //         child: Text(
                  //           'QR사용하기',
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontFamily: 'NotoSansKR-Medium',
                  //             fontSize: 15,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 20),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 7, vertical: 10.0),
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        color: Color(0xFFf1f1f1)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '주의사항',
                          style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '- 사용 가능 지점 : 스타벅스 하남 미사점',
                          style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '- 유효기일간 : 2022년 3월 31일 ~ 2022년 5월 31일',
                          style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '본 상품은 일회성 상품으로 반복 사용이 불가하며, 이벤트 참여 보상 상품으로 교환 및 환불이 불가합니다. 또한 업체의 사정에 따라 사전 고지 없이 변경 또는 취소될 수 있습니다.',
                          style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '기타 문의사항은 플루닛 고객센터를 통해 문의해주세요.',
                          style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '해당 매장에서 직원에게 QR코드를 제시해주세요',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
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
