import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterdemo/model/home_model.dart';
import 'package:flutterdemo/network/home_network.dart';
import 'package:flutterdemo/pages/app/search_page.dart';
import 'package:flutterdemo/pages/app/webview.dart';
import 'package:flutterdemo/views/grid_nav.dart';
import 'package:flutterdemo/views/local_nav.dart';
import 'package:flutterdemo/views/sale_box.dart';
import 'package:flutterdemo/views/searchbar_nav.dart';
import 'package:flutterdemo/views/sub_nav.dart';

import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

String keywordDec = "网红打卡地、景点、酒店、美食";

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List<BannerList> bannerList = [];
  List<LocalNavListModel> localNavList = [];
  GridNavModel? gridNavModel;
  List<SubNavList> subNavList = [];
  SalesBoxModel? salesBoxModel;
  double _opacity = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _handleRefresh();

    _scrollController.addListener(() {
      //  if (_scrollController is ScrollUpdateNotification &&
      //         _scrollController.depth == 0) {
      //       _onScroll(scrollNotification.metrics.pixels);
      //     }
    });
  }

  _onScroll(offset) {
    double alpha = offset / 100.0;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    if (alpha == _opacity) return;
    setState(() {
      _opacity = alpha;
    });
  }

  Future<void> _handleRefresh() async {
    HomeModel? model = await HomeDao.fetch();
    setState(() {
      bannerList = model.bannerList;
      localNavList = model.localNavList;
      gridNavModel = model.gridNav;
      subNavList = model.subNavList;
      salesBoxModel = model.salesBox;
    });
    // ignore: avoid_print
    print("下拉刷新");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: Stack(
      children: [
        MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: _notificationView(context)),
        _appBar(context),
      ],
    ));
  }

  Widget _notificationView(BuildContext context) {
    return NotificationListener(
      child: _contentView(context),
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification &&
            scrollNotification.depth == 0) {
          _onScroll(scrollNotification.metrics.pixels);
        }
        return true;
      },
    );
  }

  Widget _contentView(BuildContext context) {
    return RefreshIndicator(
      child: ListView(
        controller: _scrollController,
        children: contentListChildren(context),
      ),
      onRefresh: _handleRefresh,
    );
  }

  List<Widget> contentListChildren(BuildContext context) {
    return [
      _bannerView(context),
      Padding(
        padding: const EdgeInsets.fromLTRB(7, 4, 7, 4),
        child: LocalNavView(localNavList),
      ),
      gridNavModel == null
          ?  Container()
          : Padding(
              padding: const EdgeInsets.fromLTRB(7, 0, 7, 4),
              child: GridNavView(model: gridNavModel),
            ),
      Padding(
        padding: const EdgeInsets.fromLTRB(7, 10, 7, 4),
        child: SubNavView(subNavList: subNavList),
      ),
      Padding(
          padding: const EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: SaleBoxView(model: salesBoxModel))
    ];
  }

  Widget _bannerView(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Swiper(
        itemCount: bannerList.length,
        autoplay: true,
        pagination: const SwiperPagination(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Image.network(
              bannerList[index].icon,
              fit: BoxFit.fill,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyWebView(
                            url: bannerList[index].url,
                            title: "banner",
                          )));
            },
          );
        },
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            height: 80,
            decoration: BoxDecoration(
              color: Color.fromARGB((_opacity * 255).toInt(), 255, 255, 255),
            ),
            child: SearchBar(
              enable: true,
              hideLeft: true,
              searchBarStyle: _opacity > 0.2
                  ? SearchBarStyle.homelight
                  : SearchBarStyle.home,
              hint: keywordDec,
              defaulteText: "",
              leftButtonClick: _leftButtonClick,
              onChanged: _onChanged,
              rightButtonClick: _rightButtonClick,
              speakCLick: _speakCLick,
              inputBoxClick: _inputBoxClick,
            ),
          ),
        ),
        Container(
          height: _opacity > 0.2 ? 0.5 : 0,
          // height: 10,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 137, 128, 128),
            boxShadow: [
              BoxShadow(color: Color.fromARGB(31, 226, 22, 22), blurRadius: 10)
            ],
          ),
        )
      ],
    );
  }

  _leftButtonClick() {
    print("_leftButtonClick");
  }

  _onChanged(String text) {
    print("222" + text);
  }

  _rightButtonClick() {
    print("_rightButtonClick");
  }

  _speakCLick() {
    print("_speakCLick");
  }

  void _inputBoxClick() {
    print("_inputBoxClick");
  
    // Get.isDarkMode ? changeTheme(ThemeData.dark()):;

    SearchPage searchPage1 = Get.put(const SearchPage(hideLeft: false));
    SearchPage searchPage2 = Get.find();

    if (identical(searchPage1, searchPage2)) {
      Get.to(searchPage2);
    }
    ;

    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => const SearchPage(
    //               hideLeft: false,
    //             )));

    // Wrap()

  }



  @override
  bool get wantKeepAlive => true;
}
