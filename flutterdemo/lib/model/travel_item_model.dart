// To parse this JSON data, do
//
//     final travelItemModel = travelItemModelFromJson(jsonString);

import 'dart:convert';

TravelItemModel travelItemModelFromJson(String str) =>
    TravelItemModel.fromJson(json.decode(str));

String travelItemModelToJson(TravelItemModel data) =>
    json.encode(data.toJson());

class TravelItemModel {
  TravelItemModel({
    required this.type,
    required this.article,
  });

  int type;
  Article article;

  factory TravelItemModel.fromJson(Map<String, dynamic> json) =>
      TravelItemModel(
        type: json["type"],
        article: Article.fromJson(json["article"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "article": article.toJson(),
      };
}

class Article {
  Article({
    required this.articleId,
    required this.productType,
    required this.sourceType,
    required this.articleTitle,
    required this.content,
    required this.author,
    required this.images,
    required this.hasVideo,
    required this.readCount,
    required this.likeCount,
    required this.commentCount,
    required this.shareCount,
    required this.urls,
    required this.tags,
    required this.topics,
    required this.relatedTopics,
    required this.pois,
    required this.publishTime,
    required this.publishTimeDisplay,
    required this.shootTime,
    required this.shootTimeDisplay,
    required this.level,
    required this.distanceText,
    required this.isLike,
    required this.imageCounts,
    required this.isCollected,
    required this.collectCount,
    required this.articleStatus,
    required this.poiName,
    required this.shareInfo,
    required this.currentDate,
    required this.sourceId,
    required this.videoAutoplayNet,
    required this.combinateContent,
  });

  int articleId;
  int productType;
  int sourceType;
  String articleTitle;
  String content;
  Author author;
  List<Images> images;
  bool hasVideo;
  int readCount;
  int likeCount;
  int commentCount;
  int shareCount;
  List<Url> urls;
  List<Tag> tags;
  List<Topic> topics;
  List<RelatedTopic> relatedTopics;
  List<Pois> pois;
  DateTime publishTime;
  DateTime publishTimeDisplay;
  DateTime shootTime;
  DateTime shootTimeDisplay;
  int level;
  String distanceText;
  bool isLike;
  int imageCounts;
  bool isCollected;
  int collectCount;
  int articleStatus;
  String poiName;
  ShareInfo shareInfo;
  String currentDate;
  int sourceId;
  String videoAutoplayNet;
  String combinateContent;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        articleId: json["articleId"],
        productType: json["productType"],
        sourceType: json["sourceType"],
        articleTitle: json["articleTitle"],
        content: json["content"],
        author: Author.fromJson(json["author"]),
        images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
        hasVideo: json["hasVideo"],
        readCount: json["readCount"],
        likeCount: json["likeCount"],
        commentCount: json["commentCount"],
        shareCount: json["shareCount"],
        urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        topics: List<Topic>.from(json["topics"].map((x) => Topic.fromJson(x))),
        relatedTopics: List<RelatedTopic>.from(
            json["relatedTopics"].map((x) => RelatedTopic.fromJson(x))),
        pois: List<Pois>.from(json["pois"].map((x) => Pois.fromJson(x))),
        publishTime: DateTime.parse(json["publishTime"]),
        publishTimeDisplay: DateTime.parse(json["publishTimeDisplay"]),
        shootTime: DateTime.parse(json["shootTime"]),
        shootTimeDisplay: DateTime.parse(json["shootTimeDisplay"]),
        level: json["level"],
        distanceText: json["distanceText"],
        isLike: json["isLike"],
        imageCounts: json["imageCounts"],
        isCollected: json["isCollected"],
        collectCount: json["collectCount"],
        articleStatus: json["articleStatus"],
        poiName: json["poiName"],
        shareInfo: ShareInfo.fromJson(json["shareInfo"]),
        currentDate: json["currentDate"],
        sourceId: json["sourceId"],
        videoAutoplayNet: json["videoAutoplayNet"],
        combinateContent: json["combinateContent"],
      );

  Map<String, dynamic> toJson() => {
        "articleId": articleId,
        "productType": productType,
        "sourceType": sourceType,
        "articleTitle": articleTitle,
        "content": content,
        "author": author.toJson(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "hasVideo": hasVideo,
        "readCount": readCount,
        "likeCount": likeCount,
        "commentCount": commentCount,
        "shareCount": shareCount,
        "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "topics": List<dynamic>.from(topics.map((x) => x.toJson())),
        "relatedTopics":
            List<dynamic>.from(relatedTopics.map((x) => x.toJson())),
        "pois": List<dynamic>.from(pois.map((x) => x.toJson())),
        "publishTime": publishTime.toIso8601String(),
        "publishTimeDisplay":
            "${publishTimeDisplay.year.toString().padLeft(4, '0')}-${publishTimeDisplay.month.toString().padLeft(2, '0')}-${publishTimeDisplay.day.toString().padLeft(2, '0')}",
        "shootTime": shootTime.toIso8601String(),
        "shootTimeDisplay":
            "${shootTimeDisplay.year.toString().padLeft(4, '0')}-${shootTimeDisplay.month.toString().padLeft(2, '0')}-${shootTimeDisplay.day.toString().padLeft(2, '0')}",
        "level": level,
        "distanceText": distanceText,
        "isLike": isLike,
        "imageCounts": imageCounts,
        "isCollected": isCollected,
        "collectCount": collectCount,
        "articleStatus": articleStatus,
        "poiName": poiName,
        "shareInfo": shareInfo.toJson(),
        "currentDate": currentDate,
        "sourceId": sourceId,
        "videoAutoplayNet": videoAutoplayNet,
        "combinateContent": combinateContent,
      };
}

class Author {
  Author({
    required this.authorId,
    required this.nickName,
    required this.clientAuth,
    required this.userUrl,
    required this.jumpUrl,
    required this.coverImage,
    required this.qualification,
    required this.identityType,
    required this.identityTypeName,
    required this.tag,
    required this.followCount,
    required this.vIcon,
    required this.levelValue,
    required this.levelValueText,
    required this.identityDesc,
    required this.isStarAccount,
    required this.showTagList,
  });

  int authorId;
  String nickName;
  String clientAuth;
  String userUrl;
  String jumpUrl;
  CoverImage coverImage;
  String qualification;
  int identityType;
  String identityTypeName;
  String tag;
  int followCount;
  String vIcon;
  int levelValue;
  String levelValueText;
  String identityDesc;
  bool isStarAccount;
  List<ShowTagList> showTagList;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        authorId: json["authorId"],
        nickName: json["nickName"],
        clientAuth: json["clientAuth"],
        userUrl: json["userUrl"],
        jumpUrl: json["jumpUrl"],
        coverImage: CoverImage.fromJson(json["coverImage"]),
        qualification: json["qualification"],
        identityType: json["identityType"],
        identityTypeName: json["identityTypeName"],
        tag: json["tag"],
        followCount: json["followCount"],
        vIcon: json["vIcon"],
        levelValue: json["levelValue"],
        levelValueText: json["levelValueText"],
        identityDesc: json["identityDesc"],
        isStarAccount: json["isStarAccount"],
        showTagList: List<ShowTagList>.from(
            json["showTagList"].map((x) => ShowTagList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "authorId": authorId,
        "nickName": nickName,
        "clientAuth": clientAuth,
        "userUrl": userUrl,
        "jumpUrl": jumpUrl,
        "coverImage": coverImage.toJson(),
        "qualification": qualification,
        "identityType": identityType,
        "identityTypeName": identityTypeName,
        "tag": tag,
        "followCount": followCount,
        "vIcon": vIcon,
        "levelValue": levelValue,
        "levelValueText": levelValueText,
        "identityDesc": identityDesc,
        "isStarAccount": isStarAccount,
        "showTagList": List<dynamic>.from(showTagList.map((x) => x.toJson())),
      };
}

class CoverImage {
  CoverImage({
    required this.dynamicUrl,
    required this.originalUrl,
  });

  String dynamicUrl;
  String originalUrl;

  factory CoverImage.fromJson(Map<String, dynamic> json) => CoverImage(
        dynamicUrl: json["dynamicUrl"],
        originalUrl: json["originalUrl"],
      );

  Map<String, dynamic> toJson() => {
        "dynamicUrl": dynamicUrl,
        "originalUrl": originalUrl,
      };
}

class ShowTagList {
  ShowTagList({
    required this.tagStyle,
    required this.tagType,
    required this.tagName,
    required this.tagShortName,
    required this.tagStyleMap,
  });

  int tagStyle;
  int tagType;
  String tagName;
  String tagShortName;
  TagStyleMap tagStyleMap;

  factory ShowTagList.fromJson(Map<String, dynamic> json) => ShowTagList(
        tagStyle: json["tagStyle"],
        tagType: json["tagType"],
        tagName: json["tagName"],
        tagShortName: json["tagShortName"],
        tagStyleMap: TagStyleMap.fromJson(json["tagStyleMap"]),
      );

  Map<String, dynamic> toJson() => {
        "tagStyle": tagStyle,
        "tagType": tagType,
        "tagName": tagName,
        "tagShortName": tagShortName,
        "tagStyleMap": tagStyleMap.toJson(),
      };
}

class TagStyleMap {
  TagStyleMap({
    required this.white,
    required this.black,
  });

  Black white;
  Black black;

  factory TagStyleMap.fromJson(Map<String, dynamic> json) => TagStyleMap(
        white: Black.fromJson(json["white"]),
        black: Black.fromJson(json["black"]),
      );

  Map<String, dynamic> toJson() => {
        "white": white.toJson(),
        "black": black.toJson(),
      };
}

class Black {
  Black({
    required this.tagStyleId,
    required this.tagStyleFont,
    required this.tagStyleBack,
    required this.tagStyleBackArgb,
  });

  int tagStyleId;
  String tagStyleFont;
  String tagStyleBack;
  String tagStyleBackArgb;

  factory Black.fromJson(Map<String, dynamic> json) => Black(
        tagStyleId: json["tagStyleId"],
        tagStyleFont: json["tagStyleFont"],
        tagStyleBack: json["tagStyleBack"],
        tagStyleBackArgb: json["tagStyleBackARGB"],
      );

  Map<String, dynamic> toJson() => {
        "tagStyleId": tagStyleId,
        "tagStyleFont": tagStyleFont,
        "tagStyleBack": tagStyleBack,
        "tagStyleBackARGB": tagStyleBackArgb,
      };
}

class Images {
  Images({
    required this.imageId,
    required this.dynamicUrl,
    required this.originalUrl,
    required this.width,
    required this.height,
    required this.mediaType,
    // required this.lat,
    // required this.lon,
  });

  int imageId;
  String dynamicUrl;
  String originalUrl;
  int width;
  int height;
  int mediaType;
  // int lat;
  // int lon;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        imageId: json["imageId"],
        dynamicUrl: json["dynamicUrl"],
        originalUrl: json["originalUrl"],
        width: json["width"],
        height: json["height"],
        mediaType: json["mediaType"],
        // lat: json["lat"],
        // lon: json["lon"],
      );

  Map<String, dynamic> toJson() => {
        "imageId": imageId,
        "dynamicUrl": dynamicUrl,
        "originalUrl": originalUrl,
        "width": width,
        "height": height,
        "mediaType": mediaType,
        // "lat": lat,
        // "lon": lon,
      };
}

class Pois {
  Pois({
    required this.poiType,
    required this.poiId,
    required this.poiName,
    required this.businessId,
    required this.districtId,
    required this.districtName,
    required this.poiExt,
    required this.source,
    required this.isMain,
    required this.isInChina,
    required this.countryName,
    required this.districtEnName,
  });

  int poiType;
  int poiId;
  String poiName;
  int businessId;
  int districtId;
  String districtName;
  PoiExt poiExt;
  int source;
  int isMain;
  bool isInChina;
  String countryName;
  String districtEnName;

  factory Pois.fromJson(Map<String, dynamic> json) => Pois(
        poiType: json["poiType"],
        poiId: json["poiId"],
        poiName: json["poiName"],
        businessId: json["businessId"] == null ? null : json["businessId"],
        districtId: json["districtId"],
        districtName: json["districtName"],
        poiExt: PoiExt.fromJson(json["poiExt"]),
        source: json["source"],
        isMain: json["isMain"],
        isInChina: json["isInChina"],
        countryName: json["countryName"] == null ? null : json["countryName"],
        districtEnName:
            json["districtENName"] == null ? null : json["districtENName"],
      );

  Map<String, dynamic> toJson() => {
        "poiType": poiType,
        "poiId": poiId,
        "poiName": poiName,
        "businessId": businessId == null ? null : businessId,
        "districtId": districtId,
        "districtName": districtName,
        "poiExt": poiExt.toJson(),
        "source": source,
        "isMain": isMain,
        "isInChina": isInChina,
        "countryName": countryName == null ? null : countryName,
        "districtENName": districtEnName == null ? null : districtEnName,
      };
}

class PoiExt {
  PoiExt({
    required this.h5Url,
    required this.appUrl,
  });

  String h5Url;
  String appUrl;

  factory PoiExt.fromJson(Map<String, dynamic> json) => PoiExt(
        h5Url: json["h5Url"],
        appUrl: json["appUrl"],
      );

  Map<String, dynamic> toJson() => {
        "h5Url": h5Url,
        "appUrl": appUrl,
      };
}

class RelatedTopic {
  RelatedTopic({
    required this.topicId,
    required this.topicName,
    required this.type,
  });

  int topicId;
  String topicName;
  int type;

  factory RelatedTopic.fromJson(Map<String, dynamic> json) => RelatedTopic(
        topicId: json["topicId"],
        topicName: json["topicName"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "topicId": topicId,
        "topicName": topicName,
        "type": type,
      };
}

class ShareInfo {
  ShareInfo({
    required this.imageUrl,
    required this.shareTitle,
    required this.shareContent,
    required this.platForm,
    required this.token,
  });

  String imageUrl;
  String shareTitle;
  String shareContent;
  String platForm;
  String token;

  factory ShareInfo.fromJson(Map<String, dynamic> json) => ShareInfo(
        imageUrl: json["imageUrl"],
        shareTitle: json["shareTitle"],
        shareContent: json["shareContent"],
        platForm: json["platForm"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "shareTitle": shareTitle,
        "shareContent": shareContent,
        "platForm": platForm,
        "token": token,
      };
}

class Tag {
  Tag({
    required this.tagId,
    required this.tagName,
    required this.tagLevel,
    required this.parentTagId,
    required this.source,
    required this.sortIndex,
  });

  int tagId;
  String tagName;
  int tagLevel;
  int parentTagId;
  int source;
  int sortIndex;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        tagId: json["tagId"],
        tagName: json["tagName"],
        tagLevel: json["tagLevel"],
        parentTagId: json["parentTagId"],
        source: json["source"],
        sortIndex: json["sortIndex"],
      );

  Map<String, dynamic> toJson() => {
        "tagId": tagId,
        "tagName": tagName,
        "tagLevel": tagLevel,
        "parentTagId": parentTagId,
        "source": source,
        "sortIndex": sortIndex,
      };
}

class Topic {
  Topic({
    required this.topicId,
    required this.topicName,
    required this.level,
    required this.image,
  });

  int topicId;
  String topicName;
  int level;
  Images? image;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        topicId: json["topicId"],
        topicName: json["topicName"],
        level: json["level"],
        image: json["image"] == null ? null : Images.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "topicId": topicId,
        "topicName": topicName,
        "level": level,
        "image": image == null ? null : image!.toJson(),
      };
}

class Url {


  String version;
  String appUrl;
  String h5Url;
  String wxUrl;

    Url({
    required this.version,
    required this.appUrl,
    required this.h5Url,
    required this.wxUrl,
  });

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        version: json["version"],
        appUrl: json["appUrl"],
        h5Url: json["h5Url"],
        wxUrl: json["wxUrl"],
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "appUrl": appUrl,
        "h5Url": h5Url,
        "wxUrl": wxUrl,
      };
}
