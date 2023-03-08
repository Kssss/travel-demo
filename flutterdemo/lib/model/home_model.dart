class HomeModel {
  final Config config;
  final List<BannerList> bannerList;
  final List<LocalNavListModel> localNavList;
  final GridNavModel gridNav;
  final List<SubNavList> subNavList;
  final SalesBoxModel salesBox;

  HomeModel(
      {required this.config,
      required this.bannerList,
      required this.localNavList,
      required this.gridNav,
      required this.subNavList,
      required this.salesBox});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    List<BannerList> bannerList1;
    List<LocalNavListModel> localNavList1;
    List<SubNavList> subNavList1;

    var bannerListJson = json["bannerList"] as List;
    bannerList1 = bannerListJson.map((e) => BannerList.fromJson(e)).toList();
    

    var localNavList = json["localNavList"] as List;
    localNavList1 =
        localNavList.map((e) => LocalNavListModel.fromJson(e)).toList();

    var subNavList = json["subNavList"] as List;
    subNavList1 = subNavList.map((e) => SubNavList.fromJson(e)).toList();

    return HomeModel(
        config: Config.fromJson(json['config']),
        bannerList: bannerList1,
        localNavList: localNavList1,
        gridNav: GridNavModel.fromJson(json['gridNav']),
        subNavList: subNavList1,
        salesBox: SalesBoxModel.fromJson(json['salesBox']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['config'] = config.toJson();

    data['bannerList'] = bannerList.map((v) => v.toJson()).toList();

    data['localNavList'] = localNavList.map((v) => v.toJson()).toList();

    data['gridNav'] = gridNav.toJson();

    data['subNavList'] = subNavList.map((v) => v.toJson()).toList();

    data['salesBox'] = salesBox.toJson();

    return data;
  }


}

class Config {
  String searchUrl;

  Config({required this.searchUrl});

  factory Config.fromJson(Map<String, dynamic> json) {
    return Config(searchUrl: json["searchUrl"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['searchUrl'] = this.searchUrl;
    return data;
  }
}

class BannerList {
  String icon;
  String url;

  BannerList({required this.icon, required this.url});

  factory BannerList.fromJson(Map<String, dynamic> json) {
    return BannerList(icon: json["icon"], url: json["url"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = icon;
    data['url'] = url;
    return data;
  }
}

class LocalNavListModel {
  String icon;
  String title;
  String url;
  String statusBarColor;
  bool hideAppBar;

  LocalNavListModel(
      {required this.icon,
      required this.title,
      required this.url,
      required this.statusBarColor,
      this.hideAppBar = false});

  factory LocalNavListModel.fromJson(Map<String, dynamic> json) {
    return LocalNavListModel(
        icon: json['icon'],
        title: json['title'],
        url: json['url'],
        statusBarColor: json['statusBarColor'] ??= "ffffff",
        hideAppBar: json['hideAppBar']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['url'] = this.url;
    data['statusBarColor'] = this.statusBarColor;
    data['hideAppBar'] = this.hideAppBar;
    return data;
  }
}

class GridNavModel {
  Hotel hotel;
  Hotel flight;
  Hotel travel;

  GridNavModel(
      {required this.hotel, required this.flight, required this.travel});

  factory GridNavModel.fromJson(Map<String, dynamic> json) {
    var hotel1 = Hotel.fromJson(json['hotel']);
    var flight1 = Hotel.fromJson(json['flight']);
    var travel1 = Hotel.fromJson(json['travel']);
    return GridNavModel(hotel: hotel1, flight: flight1, travel: travel1);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (hotel != null) {
      data['hotel'] = this.hotel.toJson();
    }
    if (flight != null) {
      data['flight'] = this.flight.toJson();
    }
    if (travel != null) {
      data['travel'] = this.travel.toJson();
    }
    return data;
  }
}

class Hotel {
  String startColor;
  String endColor;
  LocalNavListModel mainItem;
  LocalNavListModel item1;
  LocalNavListModel item2;
  LocalNavListModel item3;
  LocalNavListModel item4;

  Hotel(
      {required this.startColor,
      required this.endColor,
      required this.mainItem,
      required this.item1,
      required this.item2,
      required this.item3,
      required this.item4});

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      startColor: json['startColor'],
      endColor: json['endColor'],
      mainItem: LocalNavListModel.fromJson(json['mainItem']),
      item1: LocalNavListModel.fromJson(json['item1']),
      item2: LocalNavListModel.fromJson(json['item2']),
      item3: LocalNavListModel.fromJson(json['item3']),
      item4: LocalNavListModel.fromJson(json['item4']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startColor'] = this.startColor;
    data['endColor'] = this.endColor;
    if (this.mainItem != null) {
      data['mainItem'] = this.mainItem.toJson();
    }
    if (this.item1 != null) {
      data['item1'] = this.item1.toJson();
    }
    if (this.item2 != null) {
      data['item2'] = this.item2.toJson();
    }
    if (this.item3 != null) {
      data['item3'] = this.item3.toJson();
    }
    if (this.item4 != null) {
      data['item4'] = this.item4.toJson();
    }
    return data;
  }
}

class MainItem {
  String title;
  String icon;
  String url;
  String statusBarColor;

  MainItem(
      {required this.title,
      required this.icon,
      required this.url,
      required this.statusBarColor});

  factory MainItem.fromJson(Map<String, dynamic> json) {
    return MainItem(
        icon: json['icon'],
        title: json['title'],
        url: json['url'],
        statusBarColor: json['statusBarColor']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['url'] = this.url;
    data['statusBarColor'] = this.statusBarColor;
    return data;
  }
}

// class Item1 {
//   String title;
//   String url;
//   String statusBarColor;
//   bool hideAppBar;
//   Item1(
//       {required this.title,
//       required this.url,
//       required this.statusBarColor,
//       required this.hideAppBar});

//   factory Item1.fromJson(Map<String, dynamic> json) {
//     return Item1(
//         title: json['title'],
//         url: json['url'],
//         statusBarColor: json['statusBarColor'],
//         hideAppBar: json["hideAppBar"]);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     data['url'] = this.url;
//     data['statusBarColor'] = this.statusBarColor;
//     data["hideAppBar"] = this.hideAppBar;
//     return data;
//   }
// }

class SubNavList {
  String icon;
  String title;
  String url;
  bool hideAppBar;

  SubNavList(
      {required this.icon,
      required this.title,
      required this.url,
      required this.hideAppBar});

  factory SubNavList.fromJson(Map<String, dynamic> json) {
    return SubNavList(
        icon: json["icon"],
        title: json["title"],
        url: json["url"],
        hideAppBar: json["hideAppBar"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = icon;
    data['title'] = title;
    data['url'] = url;
    data['hideAppBar'] = hideAppBar;
    return data;
  }
}

class SalesBoxModel {
  String icon;
  String moreUrl;
  MainItem bigCard1;
  MainItem bigCard2;
  MainItem smallCard1;
  MainItem smallCard2;
  MainItem smallCard3;
  MainItem smallCard4;

  SalesBoxModel(
      {required this.icon,
      required this.moreUrl,
      required this.bigCard1,
      required this.bigCard2,
      required this.smallCard1,
      required this.smallCard2,
      required this.smallCard3,
      required this.smallCard4});

  factory SalesBoxModel.fromJson(Map<String, dynamic> json) {
    return SalesBoxModel(
        icon: json['icon'],
        moreUrl: json['moreUrl'],
        bigCard1: MainItem.fromJson(json['bigCard1']),
        bigCard2: MainItem.fromJson(json['bigCard2']),
        smallCard1: MainItem.fromJson(json['smallCard1']),
        smallCard2: MainItem.fromJson(json['smallCard2']),
        smallCard3: MainItem.fromJson(json['smallCard3']),
        smallCard4: MainItem.fromJson(json['smallCard4']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['moreUrl'] = this.moreUrl;
    if (this.bigCard1 != null) {
      data['bigCard1'] = this.bigCard1.toJson();
    }
    if (this.bigCard2 != null) {
      data['bigCard2'] = this.bigCard2.toJson();
    }
    if (this.smallCard1 != null) {
      data['smallCard1'] = this.smallCard1.toJson();
    }
    if (this.smallCard2 != null) {
      data['smallCard2'] = this.smallCard2.toJson();
    }
    if (this.smallCard3 != null) {
      data['smallCard3'] = this.smallCard3.toJson();
    }
    if (this.smallCard4 != null) {
      data['smallCard4'] = this.smallCard4.toJson();
    }
    return data;
  }
}
