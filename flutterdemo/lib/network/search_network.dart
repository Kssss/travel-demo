import 'dart:convert';

import 'package:flutterdemo/model/search_model.dart';
import 'package:http/http.dart' as http;

const host = "m.ctrip.com";
const path =
    "/restapi/h5api/searchapp/search?source=mobileweb&action=autocomplete&contentType=json&keyword=";

class SearchDao {
  static Future<SearchModel> fetch(String keyword) async {
    Uri uri = Uri.http(host, path + keyword);
     

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Utf8Decoder utf8 = const Utf8Decoder();
      var retuslt = json.decode(utf8.convert(response.bodyBytes));
      SearchModel searchModel = SearchModel.fromJson(retuslt);
      searchModel.keyword = keyword;
      return searchModel;
    } else {
      throw Exception(" error ");
    }
  }
}
