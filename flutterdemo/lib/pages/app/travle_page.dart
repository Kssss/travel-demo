import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/model/travel_tabsmodel.dart';

import 'package:flutterdemo/network/travel_network.dart';
import 'package:flutterdemo/pages/app/travle_item.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TravelPageState();
  }
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin {
  List<TabItem> _tabs = [];
  TabController? _controller;
  @override
  void initState() {
    _controller = TabController(length: 0, vsync: this);

    TravelDao.fetchTabs().then((value) {
      setState(() {
        _tabs = value.tabs;
        if (_tabs.isEmpty) return;
        _controller = TabController(length: _tabs.length, vsync: this);
      });
    }).catchError((e) {
      print(e);
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [_tabTitleView(), contentPage()],
      ),
    );
  }

  _tabTitleView() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 35),
      child: TabBar(
        onTap: (int index) {},
        controller: _controller,
        isScrollable: true,
        labelColor: Colors.black,
        indicatorPadding: EdgeInsets.zero,
        labelPadding: const EdgeInsets.fromLTRB(11, 0, 15, 0),
        indicatorColor: const Color(0xff2fcfbb), //选中下划线的颜色
        indicatorSize: TabBarIndicatorSize
            .label, //选中下划线的长度，label时跟文字内容长度一样，tab时跟一个Tab的长度一样
        indicatorWeight: 4.0, //选中下划线的高度，值越大高度越高，默认为2。0

        // indicator: const UnderlineTabIndicator(
        //   borderSide: BorderSide(color: Color(0xff2fcfbb), width: 3),
        //   insets: EdgeInsets.fromLTRB(0, 0, 0, 10),
        // ),
        tabs: _getListTab(),
      ),
    );
  }

  List<Widget> _getListTab() {
    if (_tabs.isNotEmpty) {
      return _tabs.map((e) {
        // return Text(e.labelName);
        return Tab(
          text: e.labelName,
          iconMargin: EdgeInsets.zero,
          height: 35,
        );
      }).toList();
    }
    return [];
  }

  Flexible contentPage() {
    return Flexible(
      child: TabBarView(
        controller: _controller,
        children: _tabs.map((e) {
          return TravelItemPage(item: e);
        }).toList(),
      ),
    );
  }
}
