import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  final String url;
  final String statusBarColor;
  final String title;
  final bool hideAppbar;
  final bool backForbid;

  const MyWebView(
      {Key? key,
      required this.url,
      this.statusBarColor = 'ffffff',
      required this.title,
      this.hideAppbar = false,
      this.backForbid = false})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MyWebViewState();
  }
}

class _MyWebViewState extends State<MyWebView> {
  List<String> Catch_urls = [
    'm.ctrip.com/',
    'm.ctrip.com/html5/',
    'm.ctrip.com/html5'
  ];

  final webviewReference = const WebView();
  // late StreamSubscription<String> _onUrlChanged;
  // late StreamSubscription<WebViewStateChanged> _onStateChanged;
  // late StreamSubscription<WebViewHttpError> _onHttpError;
  bool exiting = false;
  @override
  void initState() {
    super.initState();
    // _onUrlChanged = webviewReference.onUrlChanged.listen((event) {});
    // _onStateChanged =
    //     webviewReference.onStateChanged.listen((WebViewStateChanged event) {
    //   // shouldStart, startLoad, finishLoad, abortLoad
    //   print(event.url);
    //   switch (event.type) {
    //     case WebViewState.shouldStart:
    //       {}
    //       break;
    //     case WebViewState.startLoad:
    //       {
    //         if (_isToMian(event.url) && !exiting) {
    //           if (widget.backForbid) {
    //             webviewReference.launch(widget.url);
    //           } else {
    //             Navigator.pop(context);
    //             exiting = true;
    //           }
    //         }
    //       }
    //       break;
    //     case WebViewState.finishLoad:
    //       {}
    //       break;
    //     case WebViewState.abortLoad:
    //       {}
    //       break;
    //   }

    // };

    // _onHttpError = webviewReference.onHttpError.listen((event) {
    //   print(event);
    // });
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  _isToMain(String? url) {
    bool contain = false;
    for (final value in Catch_urls) {
      if (url?.endsWith(value) ?? false) {
        contain = true;
        break;
      }
    }
    return contain;
  }

  @override
  void dispose() {
    // _onUrlChanged.cancel();
    // _onStateChanged.cancel();
    // _onHttpError.cancel();
    // webviewReference.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String statusBarColorStr = widget.statusBarColor;
    Color backButtonColor;
    if (statusBarColorStr == 'ffffff') {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.black;
    }
    print("-------${widget.url}");
    return Scaffold(
      body: Column(
        children: [
          _appBar(Color(int.parse('0xff$statusBarColorStr')), backButtonColor),
          Expanded(
            child: WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onProgress: (progress) {
                print("进度 $progress");
              },
              onPageStarted: (url) {
                print("onPageStarted $url");
                if (_isToMain(url)) {
                  Navigator.pop(context);
                } else {}
              },
              onPageFinished: (url) {},

              // navigationDelegate:(navigation) {

              // },
            ),
          )
        ],
      ),
    );
  }

  _appBar(Color? backgroudColor, Color? backButtonColor) {
    if (widget.hideAppbar) {
      return Container(
        color: backgroudColor,
        height: 36,
      );
    }
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.close,
                  color: backButtonColor,
                  size: 26,
                ),
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    widget.title,
                    style: TextStyle(color: backButtonColor, fontSize: 20),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
