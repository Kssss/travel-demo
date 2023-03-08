import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/model/travel_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class TravelItemCell extends StatelessWidget {
  final TravelItemModel itemModel;

  const TravelItemCell({
    required this.itemModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: PhysicalModel(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(5),
        child: Column(
          children: [
            _itemImage(),
            _middleView(),
            _bottomView(),
          ],
        ),
      ),
    );
  }

  _itemImage() {
    // ;
    String url = itemModel.article.images[0].dynamicUrl;
    // url = "";
    return Stack(
      children: [
        // const Icon(Icons.flutter_dash),
        //  CachedNetworkImage(
        //         progressIndicatorBuilder: (context, url, progress) => Center(
        //           child: Image.asset("assets/placholdImage.jpg"),
        //         ),
        //         imageUrl:
        //             url,
        //       ),
        // Image.network(
        //   url,
        //   errorBuilder: (_, __, ___) => Image.asset(
        //     'assets/placholdImage.png',
        //     fit: BoxFit.fill,
        //   ),
        // ),
        FadeInImage.assetNetwork(
          placeholder: "assets/placholdImage.jpg",
          image: url,
        ),
        Positioned(
            bottom: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 3),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                  LimitedBox(
                      maxWidth: 130,
                      child: Text(_poiName(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white, fontSize: 12))),
                ],
              ),
            ))
      ],
    );
  }

  _middleView() {
    return Container(
      padding:const EdgeInsets.all(4),
      child: Text(
        itemModel.article.articleTitle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 14, color: Colors.black87),
      ),
    );
  }

  _bottomView() {
    return Container(
        padding: const EdgeInsets.fromLTRB(6, 0, 6, 10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PhysicalModel(
                color: Colors.transparent,
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  itemModel.article.author.coverImage.dynamicUrl,
                  height: 24,
                )),
            Container(
                // color: Colors.red,
                padding: const EdgeInsets.all(5),
                width: 90,
                child: Text(
                  itemModel.article.author.nickName,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                )),
            Row(
              children: [
                const Icon(
                  Icons.thumb_up,
                  size: 14,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Text(
                    itemModel.article.likeCount.toString(),
                    style: const TextStyle(fontSize: 10),
                  ),
                )
              ],
            )
          ],
        ));
  }

  String _poiName() {
    return itemModel.article.pois.isEmpty
        ? "未知"
        : itemModel.article.pois[0].poiName;
  }
}
