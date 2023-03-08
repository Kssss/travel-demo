import 'package:flutter/material.dart';
import 'package:flutterdemo/model/home_model.dart';
import 'package:flutterdemo/pages/app/webview.dart';

class LocalNavView extends StatelessWidget {
  final List<LocalNavListModel> localNavList;

  const LocalNavView(this.localNavList);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    // print("localNavList = ${localNavList.length}");
    if (localNavList.isEmpty) {
      return null;
    } else {
      List<Widget> items = [];
      for (var e in localNavList) {
        // print("url = ${e.url}");
        items.add(_item(context, e));
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items,
      );
    }
  }

  Widget _item(BuildContext context, LocalNavListModel model) {
    return GestureDetector(
      onTap: () {
        // print("aaaaaaaaaaaa");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyWebView(
                    url: model.url,
                    statusBarColor: model.statusBarColor,
                    title: model.title,
                    hideAppbar: model.hideAppBar)));
      },
      child: Column(
        children: <Widget>[
          Image.network(model.icon, width: 32, height: 32),
          Text(model.title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
