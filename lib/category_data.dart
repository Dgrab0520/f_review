import 'model/category_model.dart';

class CategoryData {
  Map<String, Map<String, String>> categories = {
    "하남": {
      "카페": "assets/category_1.png",
      "맛집": "assets/category_2.png",
      "헤어샵": "assets/category_4.png",
      "네일샵": "assets/category_4.png",
      "전자제품": "assets/category_3.png",
      "도서": "assets/category_3.png",
      "공방": "assets/category_3.png",
    },
    "강동": {
      "카페": "assets/category_1.png",
      "맛집": "assets/category_2.png",
      "헤어샵": "assets/category_4.png",
      "네일샵": "assets/category_4.png",
      "전자제품": "assets/category_3.png",
      "도서": "assets/category_3.png",
      "공방": "assets/category_3.png",
    },
    "송파": {
      "카페": "assets/category_1.png",
      "맛집": "assets/category_2.png",
      "헤어샵": "assets/category_4.png",
      "네일샵": "assets/category_4.png",
      "전자제품": "assets/category_3.png",
      "도서": "assets/category_3.png",
      "공방": "assets/category_3.png",
    },
  };

  List<CategoryModel> allCategory() {
    return CategoryData()
        .categories
        .entries
        .map((e) => e.value.entries
            .map((e2) =>
                CategoryModel(area: e.key, service: e2.key, image: e2.value))
            .toList())
        .toList()
        .expand((element) => element)
        .toList();
  }

  List<CategoryModel> selectCategory(
      List<String> areas, List<String> services) {
    List<CategoryModel> result = [];
    for (var area in areas) {
      for (var service in services) {
        result.add(CategoryModel(
            area: area, service: service, image: categories[area]![service]!));
      }
    }
    return result;
  }
}
