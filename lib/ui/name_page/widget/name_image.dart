import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NameImage extends StatelessWidget {
  const NameImage({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5, top: 10, right: 10),
      margin: const EdgeInsets.only(
        bottom: 25,
      ),
      width: Get.width,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
