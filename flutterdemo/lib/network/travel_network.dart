import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutterdemo/model/travel_item_model.dart';
import 'package:flutterdemo/model/travel_tabsmodel.dart';
import 'package:http/http.dart' as http;

const host = "www.devio.org";
const path = "/io/flutter_app/json/travel_page.json";

class TravelDao {
  static Future<TravelTabsModel> fetchTabs() async {
    Uri uri = Uri.https(host, path);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Utf8Decoder utf8 = const Utf8Decoder();
      var retuslt = json.decode(utf8.convert(response.bodyBytes));

      TravelTabsModel searchModel = TravelTabsModel.fromJson(retuslt);

      return searchModel;
    } else {
      throw Exception(" error ");
    }
  }
}

Map paramsDic = {
  "districtId": -1,
  "groupChannelCode": "tourphoto_global1",
  "type": null,
  "lat": -180,
  "lon": -180,
  "locatedDistrictId": 2,
  "pagePara": {
    "pageIndex": 1,
    "pageSize": 10,
    "sortType": 9,
    "sortDirection": 0
  },
  "imageCutType": 1,
  "head": {
    "cid": "09031014111431397988",
    "ctok": "",
    "cver": "1.0",
    "lang": "01",
    "sid": "8888",
    "syscode": "09",
    "auth": null,
    "extension": [
      {"name": "protocal", "value": "https"}
    ]
  },
  "contentType": "json"
};

class TravelTabListDat {
  // static Future<List> fetchTravelItemList(
  //     String url, String groupChannelCode, int pageIndex, int pageSize) async {
  //   Map paramsMap = paramsDic["pagePara"];
  //   paramsMap["pageIndex"] = pageIndex;
  //   paramsMap["pageSize"] = pageSize;
  //   paramsDic["groupChannelCode"] = "tourphoto_global1";
  //   paramsDic["locatedDistrictId"] = 0;
  //   paramsDic["head"] = {};

  //   Uri uri = Uri.https("m.ctrip.com",
  //       "/restapi/soa2/16189/json/searchTripShootListForHomePageV2?_fxpcqlniredt=09031014111431397988&__gw_appid=99999999&__gw_ver=1.0&__gw_from=10650013707&__gw_platform=H5");

  //   final response = await http.post(uri, body: jsonEncode(paramsDic));
  //   if (response.statusCode == 200) {
  //     Utf8Decoder utf8 = const Utf8Decoder();
  //     var retuslt = json.decode(utf8.convert(response.bodyBytes));

  //     if (retuslt["resultList"] == null) return [];

  //     List<TravelItemModel> itemModes =
  //         (retuslt["resultList"] as List).map((e) {
  //       TravelItemModel searchModel =
  //           TravelItemModel.fromJson(retuslt["resultList"]);
  //       return searchModel;
  //     }).toList();

  //     return itemModes;
  //   } else {
  //     throw Exception(" error ");
  //   }
  // }

  static Future<List<TravelItemModel>> fetchTravelItemList2(
      {required int page}) async {
    // sleep(const Duration(milliseconds: 500));
    final value = await rootBundle.loadString("assets/traveljson.json");
    Map json1 = json.decode(value);
    json1["resultList"];

    if (json1["resultList"] == null) return [];

    List<TravelItemModel> itemModes = (json1["resultList"] as List).map((e) {
      TravelItemModel searchModel = TravelItemModel.fromJson(e);
      return searchModel;
    }).toList();

    return shuffle(itemModes);
  }

  static int getRandomInt(int min, int max) {
    final _random = Random();
    return _random.nextInt((max - min).floor()) + min;
  }

//打乱数组
  static List<TravelItemModel> shuffle(List<TravelItemModel> originArray) {
    List<TravelItemModel> newArr = [];
    newArr.addAll(originArray);
    for (var i = 1; i < newArr.length; i++) {
      int j = getRandomInt(0, i);
      TravelItemModel t = newArr[i];
      newArr[i] = newArr[j];
      newArr[j] = t;
    }
    return newArr;
  }
}
