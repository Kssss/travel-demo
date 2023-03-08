import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/model/common_model.dart';
import 'package:flutterdemo/model/search_model.dart';
import 'package:flutterdemo/network/search_network.dart';
import 'package:flutterdemo/pages/app/webview.dart';
import 'package:flutterdemo/views/searchbar_nav.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  final bool hideLeft;

  final String hint; // placholdText
  final String keyword;

  const SearchPage(
      {Key? key, this.hideLeft = true, this.hint = "", this.keyword = ""})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage>
    with AutomaticKeepAliveClientMixin {
  String keyword = "";
  SearchModel? searchModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _appBar(),
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: Expanded(
                flex: 1,
                child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      if (searchModel != null) {
                        List<SearItem>? list = searchModel!.data;

                        if (list != null && list.isNotEmpty) {
                          SearItem item = list[index];
                          return _cellWithItem(item);
                        } else {
                          SizedBox();
                        }
                      }
                      return SizedBox();
                    },
                    itemCount: searchModel?.data?.length ?? 0),
              )),
        ],
      ),
    );
  }

  _cellWithItem(SearItem item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyWebView(title: "详情", url: item.url),
            ));
      },
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.3, color: Colors.grey)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                child: const Icon(Icons.phone, size: 26, color: Colors.blue),
              ),
              Column(
                children: [
                  SizedBox(
                      width: 300,
                      child: Text(
                          "${item.word} ${item.districtname} ${item.zonename}")),
                  SizedBox(
                      width: 300,
                      child: Text(
                          "${item.price} ${item.districtname} ${item.type}")),
                ],
              )
            ],
          )),
    );
  }

  // _pushToWeb(BuildContext context, String url, String title1) {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => WebView(title: title1, url: url),
  //       ));
  // }

  void _leftButtonClick() {
    Navigator.pop(context);
  }

  void _onChanged(String text) {
    print(text);
    keyword = text;
    if (text.isNotEmpty) {
      _getSearchModel(text);
    } else {
      setState(() {
        searchModel = null;
      });
    }
  }

  _getSearchModel(String keyword) async {
    SearchModel model = await SearchDao.fetch(keyword);
    print(model);
    if (keyword == model.keyword) {
      setState(() {
        searchModel = model;
      });
    }
  }

  _rightButtonClick() {}
  _speakCLick() {}

  _appBar() {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x66000000), Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Container(
            padding: const EdgeInsets.only(top: 34),
            height: 88,
            decoration: const BoxDecoration(color: Colors.white),
            child: SearchBar(
              enable: true,
              hideLeft: widget.hideLeft,
              searchBarStyle: SearchBarStyle.normal,
              hint: widget.hint,
              defaulteText: widget.keyword,
              leftButtonClick: _leftButtonClick,
              onChanged: _onChanged,
              rightButtonClick: _rightButtonClick,
              speakCLick: _speakCLick,
            ),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
