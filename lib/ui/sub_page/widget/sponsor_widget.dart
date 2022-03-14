import 'package:f_review/model/sponsor_model.dart';
import 'package:f_review/ui/sub_page/widget/sposor_sub.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SponsorWidget extends StatelessWidget {
  const SponsorWidget({Key? key, required this.sponsorModel}) : super(key: key);
  final SponsorModel sponsorModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: InkWell(
        onTap: () {
          Get.to(SponsorSub());
        },
        child: SizedBox(
          width: 200,
          height: 100,
          child: Column(
            children: [
              Expanded(
                  child: Image.asset(
                sponsorModel.thumbnail,
                fit: BoxFit.cover,
              )),
              Text(
                sponsorModel.title,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
