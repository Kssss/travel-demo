// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutterdemo/model/home_model.dart';
import 'package:flutterdemo/pages/app/webview.dart';

class SubNavView extends StatelessWidget {
  final List<SubNavList> subNavList;

  const SubNavView({required this.subNavList});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    if (subNavList == null) return null;
    List<Widget> items = [];
    subNavList.forEach((element) {
      items.add(_item(context, element));
    });

    ///每行的数量
    var lineItemsNum = 5;

    ///总行数
    var lineNumber = (subNavList.length / lineItemsNum + 0.5).toInt();
    List<Widget> lineWidgets = [];
    for (var i = 1; i < lineNumber; i++) {
      lineWidgets.add(_rowNav(
          context, items.sublist((i - 1) * lineItemsNum, lineItemsNum)));
    }

    ///添加最后一行
    if (lineNumber > 0 && (lineNumber - 1) * lineItemsNum < items.length) {
      lineWidgets.add(_rowNav(context,
          items.sublist((lineNumber - 1) * lineItemsNum, items.length)));
    }

    return Column(
      children: lineWidgets,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }

  _rowNav(BuildContext context, List<Widget> items) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items,
        ),
        const Padding(padding: EdgeInsets.only(top: 10)),
      ],
    );
  }

  Widget _item(BuildContext context, SubNavList model) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          print("cccccccc");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyWebView(
                      url: model.url,
                      title: model.title,
                      hideAppbar: model.hideAppBar)));
        },
        child: Column(
          children: <Widget>[
            Image.network(model.icon, width: 24, height: 24),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(model.title, style: const TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}
