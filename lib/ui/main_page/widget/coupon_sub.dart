import 'package:f_review/data/coupon_data.dart';
import 'package:f_review/model/coupon_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja/asymmetric/rsa/rsa.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flip_card/flip_card.dart';
import '../../profile_page/profile_page.dart';
import 'package:f_review/constants.dart';

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
  List<Coupon> _coupon = [];
  bool _isLoading = false;

  @override
  void initState(){
    super.initState();
    coupon = Get.arguments;
    print(coupon);
    final privateKey = RSAPrivateKey.fromPEM(privateKeyPem);
    final publicKey = privateKey.toPublicKey;
    coupon_qr = publicKey.encryptOaepToBase64(coupon);  //couopon_id 암호
    print(coupon_qr);
    selectCoupon();
  }

  selectCoupon(){
    Coupon_Data.selectCoupon(coupon).then((value){
      setState(() {
        _coupon = value;
      });
      if(value.length == 0){
        setState(() {
          _isLoading = false;
        });
      }else{
        setState(() {
          _isLoading = true;
          print(_coupon.length);
        });
      }
    });
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
      body: SingleChildScrollView(
        child: _isLoading ? Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 40.0, left: 35.0, right: 35.0),
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
              SizedBox(height: 40.0,),
              FlipCard(
                fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
                direction: FlipDirection.HORIZONTAL, // default
                front: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.7, color: Color(0xffc6c6c6))
                  ),
                  child: QrImage(
                    data: coupon_qr,
                    backgroundColor: Colors.white,
                    size: 200,
                    version: 10,
                  ),
                ),
                back: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.7, color: Color(0xffc6c6c6))
                  ),
                  child: Image.network('${kBaseUrl}/coupon/${_coupon[0].coupon_image}', width: 200, fit: BoxFit.cover,)
                ),
              ),


              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _coupon[0].coupon_brand,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NotoSansKR-Regular',
                      ),
                    ),
                    Text(
                      _coupon[0].coupon_title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'NotoSansKR-Medium',
                      ),
                    ),
                    Text(
                      '사용가능  |  ${_coupon[0].coupon_date.substring(0,11)}까지',
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10.0),
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          color: Color(0xFFf1f1f1)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('이용 방법', style: TextStyle(fontSize: 11.0, color: Colors.black87, fontWeight: FontWeight.w600),),
                          SizedBox(height: 10,),
                          Text(_coupon[0].coupon_detail, style: TextStyle(fontSize: 11.0, color: Colors.black54, fontWeight: FontWeight.w600),),
                          SizedBox(height: 20,),
                          Text('주의사항', style: TextStyle(fontSize: 11.0, color: Colors.black87, fontWeight: FontWeight.w600),),
                          SizedBox(height: 10,),
                          Text(_coupon[0].coupon_notice, style: TextStyle(fontSize: 11.0, color: Colors.black54, fontWeight: FontWeight.w600),),

                        ],
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text('해당 매장에서 직원에게 QR코드를 제시해주세요',
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
        ) : Center(child: CircularProgressIndicator(),)
      )
    );
  }
}
