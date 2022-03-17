import 'package:http/http.dart' as http;

import 'constants.dart';

class ReviewHeartCount {
  reviewHeartCount(int reviewId, int userId, bool isIncrease) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "HEART_COUNT";
      map['reviewId'] = reviewId.toString();
      map['userId'] = userId.toString();
      map['isIncrease'] = isIncrease ? "1" : "0";
      final response =
          await http.post(Uri.parse("$kBaseUrl/flu_review.php"), body: map);
      print('Heart Counting Response : ${response.body}');
      if (200 == response.statusCode) {}
    } catch (e) {
      print("exception : $e");
    }
  }
}
