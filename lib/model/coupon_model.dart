class Coupon{
  int id;
  String coupon_id;
  String user_id;
  String coupon_status;
  String use_date;
  String index;
  String coupon_brand;
  String brand_image;
  String coupon_image;
  String coupon_title;
  String coupon_detail;
  String coupon_date;
  String coupon_notice;
  String coupon_index;
  String register_date;

  Coupon({
    required this.id,
    required this.coupon_id,
    required this.user_id,
    required this.coupon_status,
    required this.use_date,
    required this.index,
    required this.coupon_brand,
    required this.brand_image,
    required this.coupon_image,
    required this.coupon_title,
    required this.coupon_detail,
    required this.coupon_date,
    required this.coupon_notice,
    required this.coupon_index,
    required this.register_date,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) {
    return Coupon(
      id: int.parse(json['id']),
      coupon_id: json['coupon_id'] == null ? '' : json['coupon_id'] as String,
      user_id: json['user_id'] == null ? '' : json['user_id'] as String,
      coupon_status: json['coupon_status'] == null ? '' : json['coupon_status'] as String,
      use_date: json['use_date'] == null ? '' : json['use_date'] as String,
      index: json['index'] == null ? '' : json['index'] as String,
      coupon_brand: json['coupon_brand'] == null ? '' : json['coupon_brand'] as String,
      brand_image: json['brand_image'] == null ? '' : json['brand_image'] as String,
      coupon_image: json['coupon_image'] == null ? '' : json['coupon_image'] as String,
      coupon_title: json['coupon_title'] == null ? '' : json['coupon_title'] as String,
      coupon_detail: json['coupon_detail'] == null ? '' : json['coupon_detail'] as String,
      coupon_date: json['coupon_date'] == null ? '' : json['coupon_date'] as String,
      coupon_notice: json['coupon_notice'] == null ? '' : json['coupon_notice'] as String,
      coupon_index: json['coupon_index'] == null ? '' : json['coupon_index'] as String,
      register_date: json['register_date'] == null ? '' : json['register_date'] as String,
    );
  }
}
