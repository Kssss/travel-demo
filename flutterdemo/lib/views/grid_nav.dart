// ignore_for_file: avoid_web_libraries_in_flutter

// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutterdemo/model/home_model.dart';
import 'package:flutterdemo/pages/app/webview.dart';

//网格卡片
class GridNavView extends StatelessWidget {
  final GridNavModel? model;

  const GridNavView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (model == null) {
      return const SizedBox(
        height: 0,
      );
    }

    return PhysicalModel(
      borderRadius: BorderRadius.circular(6),
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: _gridNavItems(context),
      ),
    );
  }

  List<Widget> _gridNavItems(BuildContext context) {
    List<Widget> items = [];
    if (model != null) {
      // print("1111111" + model!.hotel.toJson().toString());
    }
    if (model == null) return items;
    if (model?.hotel != null) {
      items.add(_gridNavItem(context, model!.hotel, true));
    }
    if (model?.flight != null) {
      items.add(_gridNavItem(context, model!.flight, false));
    }
    if (model?.travel != null) {
      items.add(_gridNavItem(context, model!.travel, false));
    }

    return items;
  }

  Widget _gridNavItem(BuildContext context, Hotel itemmodel, bool first) {
    List<Widget> items = [];
    items.add(_mainItem(context, itemmodel.mainItem));
    items.add(_doubleItem(context, itemmodel.item1, itemmodel.item2, true));
    items.add(_doubleItem(context, itemmodel.item3, itemmodel.item4, false));
    List<Widget> tempItems = [];
    items.forEach((item) {
      tempItems.add(Expanded(child: item));
    });
    Color startC = Color(int.parse("0xff" + itemmodel.startColor));
    Color endC = Color(int.parse("0xff" + itemmodel.endColor));

    return Container(
      height: 88,
      margin: first ? null : EdgeInsets.only(top: 3),
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: [startC, endC])),
      child: Row(
        children: tempItems,
      ),
    );
  }

  Widget _mainItem(BuildContext context, LocalNavListModel localModel) {
    return _warpGesture(
        context: context,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Image.network(localModel.icon,
                fit: BoxFit.contain,
                height: 88,
                width: 121,
                alignment: AlignmentDirectional.bottomEnd),
            Container(
              margin: EdgeInsets.only(top: 11),
              child: Text(
                localModel.title,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            )
          ],
        ),
        localModel: localModel);
  }

  _doubleItem(BuildContext context, LocalNavListModel topItem,
      LocalNavListModel bottomItem, bool centerItem) {
    return Column(
      children: [
        Expanded(
          child: _item(context, topItem, true, centerItem),
        ),
        Expanded(
          child: _item(context, bottomItem, false, centerItem),
        ),
      ],
    );
  }

//每一个小 Item
  Widget _item(
      BuildContext context, LocalNavListModel item, bool isTop, bool isCenter) {
    BorderSide borderSide = BorderSide(width: 0.8, color: Colors.white);
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: borderSide,
              bottom: isTop ? borderSide : BorderSide.none,
            ),
          ),
          child: _warpGesture(
              context: context,
              child: Center(
                child: Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              localModel: item)),
    );
  }

  ///创建一个通用手势组件
  Widget _warpGesture({
    required BuildContext context,
    required Widget child,
    required LocalNavListModel localModel,
  }) {
    if (localModel.hideAppBar == null) {
      localModel.hideAppBar = false;
    }
    // print("${localModel.hideAppBar}----${localModel.url}");
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyWebView(
                      url: localModel.url,
                      // url: "https://www.baidu.com",
                      statusBarColor: localModel.statusBarColor,
                      title: localModel.title,
                      hideAppbar: localModel.hideAppBar)));
        },
        child: child);
  }
}
