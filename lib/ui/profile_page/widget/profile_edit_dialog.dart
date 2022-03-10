import 'package:f_review/controller/profile_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEditDialog extends StatelessWidget {
  ProfileEditDialog({Key? key}) : super(key: key);

  final profilePageController = Get.put(ProfilePageController());
  @override
  Widget build(BuildContext context) {
    profilePageController.profileContentController.text =
        profilePageController.profileContent;
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '프로필 편집',
            style: TextStyle(
              fontFamily: 'NotoSansKR-Bold',
              fontSize: 15,
            ),
          ),
          SizedBox(height: 7),
          Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
                controller: profilePageController.profileContentController,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 2,
                maxLength: 50,
                decoration: const InputDecoration(
                  hintText: '프로필로 본인을 소개해보세요',
                  hintStyle: TextStyle(
                    color: Color(0xFFBFBFBF),
                    fontSize: 13,
                  ),
                  counterText: '',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                )),
          ),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
            child: const Text(
              '수정하기',
              style: TextStyle(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: const Color(0xFF362C5E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: const BorderSide(color: Color(0xFF362C5E)),
              ),
              // 3
            ),
            onPressed: () {
              profilePageController.profileContent =
                  profilePageController.profileContentController.text;
              Get.back();
            },
          )
        ],
      ),
    );
  }
}
