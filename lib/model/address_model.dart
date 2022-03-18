class Address {
  Common common;
  List<dynamic> jusoList;

  Address({
    required this.common,
    required this.jusoList,
  });

  factory Address.formJson(Map<String, dynamic> json) {
    final items = json['items'];
    print("items : $items");
    final common = Common.fromJson(json);
    print(common);
    List<dynamic> jusoList = [];
    if (items != null) {
      jusoList = items.map((item) => Juso.fromJson(item)).toList();
    }

    return Address(
      common: common,
      jusoList: jusoList,
    );
  }
}

class Common {
  String lastBuildDate;
  int total;
  int start;
  int display;

  Common({
    required this.lastBuildDate,
    required this.total,
    required this.start,
    required this.display,
  });

  factory Common.fromJson(Map<String, dynamic> json) {
    print("json : $json");
    return Common(
      lastBuildDate: json['lastBuildDate'] ?? "",
      total: json['total'] ?? 0,
      start: json['start'] ?? 0,
      display: json['display'] ?? 0,
    );
  }
}

class Juso {
  String title, link, category;
  String description, telephone, address;
  String roadAddress, mapx, mapy;

  Juso({
    required this.title,
    required this.link,
    required this.category,
    required this.description,
    required this.telephone,
    required this.address,
    required this.roadAddress,
    required this.mapx,
    required this.mapy,
  });

  factory Juso.fromJson(Map<String, dynamic> json) {
    return Juso(
      title: json["title"] ?? "",
      link: json["link"] ?? "",
      category: json["category"] ?? "",
      description: json["description"] ?? "",
      telephone: json["telephone"] ?? "",
      address: json["address"] ?? "",
      roadAddress: json["roadAddress"] ?? "",
      mapx: json["mapx"] ?? "",
      mapy: json["mapy"] ?? "",
    );
  }
}
