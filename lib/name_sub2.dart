import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'heart_controller.dart';

class NameSub2 extends StatefulWidget {
  const NameSub2({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  _NameSub2State createState() => _NameSub2State();
}

class _NameSub2State extends State<NameSub2> {
  @override
  Widget build(BuildContext context) {
    final heartController = Get.put(HeartController());
    return Container(
      padding: EdgeInsets.only(bottom: 5, top: 10, right: 10),
      margin: EdgeInsets.only(
        bottom: 25,
      ),
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
            child: InkWell(
              onTap: () {
                heartController.heartChange(widget.index);
              },
              child: Obx(
                () => heartController.heart[widget.index]
                    ? Container(
                        child: Image.asset('assets/heart.png', width: 15),
                      )
                    : Container(
                        child: Image.asset('assets/n_heart.png', width: 15),
                      ),
              ),
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
    );
  }
}
