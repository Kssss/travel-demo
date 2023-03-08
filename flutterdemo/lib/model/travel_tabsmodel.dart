// To parse this JSON data, do
//
//     final travelTabsModel = travelTabsModelFromJson(jsonString);

import 'dart:convert';

TravelTabsModel travelTabsModelFromJson(String str) =>
    TravelTabsModel.fromJson(json.decode(str));

String travelTabsModelToJson(TravelTabsModel data) =>
    json.encode(data.toJson());

class TravelTabsModel {
  String url;
  Params params;
  List<TabItem> tabs;

  TravelTabsModel({
    required this.url,
    required this.params,
    required this.tabs,
  });

  factory TravelTabsModel.fromJson(Map<String, dynamic> json) =>
      TravelTabsModel(
        url: json["url"],
        params: Params.fromJson(json["params"]),
        tabs: List<TabItem>.from(json["tabs"].map((x) => TabItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "params": params.toJson(),
        "tabs": List<TabItem>.from(tabs.map((x) => x.toJson())),
      };
}

class Params {
  Params({
    required this.districtId,
    required this.groupChannelCode,
    required this.type,
    required this.lat,
    required this.lon,
    required this.locatedDistrictId,
    required this.pagePara,
    required this.imageCutType,
    required this.head,
    required this.contentType,
  });

  int districtId;
  String groupChannelCode;
  dynamic type;
  int lat;
  int lon;
  int locatedDistrictId;
  PagePara pagePara;
  int imageCutType;
  Head head;
  String contentType;

  factory Params.fromJson(Map<String, dynamic> json) => Params(
        districtId: json["districtId"],
        groupChannelCode: json["groupChannelCode"],
        type: json["type"],
        lat: json["lat"],
        lon: json["lon"],
        locatedDistrictId: json["locatedDistrictId"],
        pagePara: PagePara.fromJson(json["pagePara"]),
        imageCutType: json["imageCutType"],
        head: Head.fromJson(json["head"]),
        contentType: json["contentType"],
      );

  Map<String, dynamic> toJson() => {
        "districtId": districtId,
        "groupChannelCode": groupChannelCode,
        "type": type,
        "lat": lat,
        "lon": lon,
        "locatedDistrictId": locatedDistrictId,
        "pagePara": pagePara.toJson(),
        "imageCutType": imageCutType,
        "head": head.toJson(),
        "contentType": contentType,
      };
}

class Head {
  Head({
    required this.cid,
    required this.ctok,
    required this.cver,
    required this.lang,
    required this.sid,
    required this.syscode,
    required this.auth,
    required this.extension,
  });

  String cid;
  String ctok;
  String cver;
  String lang;
  String sid;
  String syscode;
  dynamic auth;
  List<Extension> extension;

  factory Head.fromJson(Map<String, dynamic> json) => Head(
        cid: json["cid"],
        ctok: json["ctok"],
        cver: json["cver"],
        lang: json["lang"],
        sid: json["sid"],
        syscode: json["syscode"],
        auth: json["auth"],
        extension: List<Extension>.from(
            json["extension"].map((x) => Extension.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cid": cid,
        "ctok": ctok,
        "cver": cver,
        "lang": lang,
        "sid": sid,
        "syscode": syscode,
        "auth": auth,
        "extension": List<dynamic>.from(extension.map((x) => x.toJson())),
      };
}

class Extension {
  Extension({
    required this.name,
    required this.value,
  });

  String name;
  String value;

  factory Extension.fromJson(Map<String, dynamic> json) => Extension(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class PagePara {
  PagePara({
    required this.pageIndex,
    required this.pageSize,
    required this.sortType,
    required this.sortDirection,
  });

  int pageIndex;
  int pageSize;
  int sortType;
  int sortDirection;

  factory PagePara.fromJson(Map<String, dynamic> json) => PagePara(
        pageIndex: json["pageIndex"],
        pageSize: json["pageSize"],
        sortType: json["sortType"],
        sortDirection: json["sortDirection"],
      );

  Map<String, dynamic> toJson() => {
        "pageIndex": pageIndex,
        "pageSize": pageSize,
        "sortType": sortType,
        "sortDirection": sortDirection,
      };
}

class TabItem {
  String labelName;
  String groupChannelCode;
  TabItem({
    required this.labelName,
    required this.groupChannelCode,
  });
  factory TabItem.fromJson(Map<String, dynamic> json) => TabItem(
        labelName: json["labelName"] ?? "",
        groupChannelCode: json["groupChannelCode"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "labelName": labelName,
        "groupChannelCode": groupChannelCode,
      };
}
