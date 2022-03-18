import 'dart:convert';

import 'package:f_review/model/coupon_model.dart';
import 'package:http/http.dart' as http;


class Coupon_Data{
  static const ROOT = "http://flunyt.com/FLUNYT/flu_review_coupon.php";
  static const COUPON_ACTION = "COUPON";
  static const COUPON_SELECT_ACTION = "COUPON_SELECT";
  static const UPDATE_ACTION = "UPDATE_COUPON";

  static Future<List<Coupon>> getCoupon(String user_id) async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = COUPON_ACTION;
      map['user_id'] = user_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Coupon Response : ${response.body}');

      if(response.statusCode == 200){
        List<Coupon> list = parseResponse(response.body);
        return list;
      }else{
        return [];
      }
    }catch(e){
      return[];
    }
  }

  static Future<List<Coupon>> selectCoupon(String coupon_id) async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = COUPON_SELECT_ACTION;
      map['coupon_id'] = coupon_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Coupon Select Response : ${response.body}');

      if(response.statusCode == 200){
        List<Coupon> list = parseResponse(response.body);
        return list;
      }else{
        return [];
      }
    }catch(e){
      return[];
    }
  }

  static Future<String> updateCoupon(String coupon_id, String user_id) async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = UPDATE_ACTION;
      map['coupon_id'] = coupon_id;
      map['user_id'] = user_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Update Coupon Response : ${response.body}');

      if(200 == response.statusCode){
        return response.body;
      }else{
        return "error";
      }
    }catch(e){
      return "error";
    }
  }

  static List<Coupon> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Coupon>((json) => Coupon.fromJson(json)).toList();
  }
}