import 'package:flutter/material.dart';

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
          child: Container(
            child: Column(
              children: [
                Image.asset('assets/m_poster.jpg'),
                SizedBox(height: 10),
                Text(
                  '[하남 미사점] 아메리카노 무료쿠폰 20명',
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'NotoSansKR-Medium',
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '[하남 미사점] 아메리카노 무료쿠폰 20명',
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'NotoSansKR-Medium',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
