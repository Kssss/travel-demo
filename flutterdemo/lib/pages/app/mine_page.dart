import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/pages/app/webview.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

MyWebView getWebView() {
  return MyWebView(
    url: "https://m.ctrip.com/webapp/myctrip/",
    title: " ",
    hideAppbar: true,
    backForbid: true,
    statusBarColor: "4c5bca",
  );
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return getWebView();
  }

  @override
  bool get wantKeepAlive => false;
}
