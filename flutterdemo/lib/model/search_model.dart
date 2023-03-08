class SearchModel {
  final List<SearItem>? data;
  String keyword;
  SearchModel(this.data, {this.keyword = ""});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    var list = json["data"];
    if (list != null) {
      var dataJson = list as List;
      List<SearItem> data = dataJson.map((e) => SearItem.fromJson(e)).toList();
      return SearchModel(data);
    } else {
      return SearchModel(null);
    }
  }
}

class SearItem {
  String word;
  String type;
  String districtname;
  String url;
  String price;
  String star;
  String zonename;

  SearItem(
      {required this.word,
      required this.type,
      required this.districtname,
      required this.url,
      required this.price,
      required this.star,
      required this.zonename});

  factory SearItem.fromJson(Map<String, dynamic> json) {
    SearItem model = SearItem(
        word: json['word'] ?? "",
        type: json['type'] ?? "",
        districtname: json['districtname'] ?? "",
        url: json['url'] ?? "",
        price: json['price'] ?? "",
        star: json['star'] ?? "",
        zonename: json['zonename'] ?? "");
    return model;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['word'] = this.word;
    data['type'] = this.type;
    data['districtname'] = this.districtname;
    data['url'] = this.url;
    data['price'] = this.price;
    data['star'] = this.star;
    data['zonename'] = this.zonename;
    return data;
  }
}
