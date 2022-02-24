import 'package:get/get.dart';

class HeartController extends GetxController {
  final _heart = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;

  get heart => _heart;
  set heart(val) => _heart.value = val;

  heartChange(int index) {
    heart[index] = !heart[index];
  }
}
