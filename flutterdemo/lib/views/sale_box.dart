import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterdemo/model/home_model.dart';
import 'package:flutterdemo/pages/app/webview.dart';

class SaleBoxView extends StatelessWidget {
  final SalesBoxModel? model;
  const SaleBoxView({Key? key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (model == null) {
      return const SizedBox(height: 0.0);
    }
    List<Widget> views = [];

    //头部
    if (model!.icon.isNotEmpty) {
      views.add(_topView(context, model!.icon, model!.moreUrl));
    }
    //大图
    views.add(
        _doubleItems(context, model!.bigCard1, model!.bigCard2, true, false));
    views.add(_doubleItems(
        context, model!.smallCard1, model!.smallCard2, false, false));
    views.add(_doubleItems(
        context, model!.smallCard3, model!.smallCard4, false, true));

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: views);
  }

  Widget _doubleItems(BuildContext context, leftItem, MainItem rightItem,
      bool isBig, bool islast) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _item(context, leftItem, true, isBig, islast),
        _item(context, rightItem, true, isBig, islast),
      ],
    );
  }

  Widget _item(BuildContext context, MainItem item, bool isleft, bool isbig,
      bool isLast) {
    BorderSide borderSide =
        const BorderSide(width: 1, color: Color(0xfff2f2f2));
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyWebView(
                      url: item.url,
                      statusBarColor: item.statusBarColor,
                      title: item.title,
                      hideAppbar: false)));
        },
        child: Container(
          child: Image.network(
            item.icon,
            width: (MediaQuery.of(context).size.width / 2) - 10,
            height: isbig ? 129 : 80,
          ),
          decoration: BoxDecoration(
              border: Border(
            right: isleft ? borderSide : BorderSide.none,
            bottom: isLast ? BorderSide.none : borderSide,
          )),
        ));
  }

  Widget _topView(BuildContext context, String icon, String moreUrl) {
    return ClipRRect(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Image.network(
                icon,
                height: 15,
                fit: BoxFit.fill,
              ),
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
                margin: const EdgeInsets.only(right: 4),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    gradient: LinearGradient(
                      colors: [Color(0xffff4e63), Color(0xffff6cc9)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyWebView(
                                url: moreUrl,
                                statusBarColor: "ffffff",
                                title: "",
                                hideAppbar: false)));
                  },
                  child: const Text(
                    "获取更多福利 >",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ))
          ],
        ),
        height: 44,
        margin: const EdgeInsets.only(left: 0, right: 0),
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Color(0xfff2f2f2))),
            color: Colors.white),
      ),
      borderRadius: BorderRadius.circular(6),
    );
  }
}
