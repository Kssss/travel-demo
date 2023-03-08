import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterdemo/model/travel_item_model.dart';
import 'package:flutterdemo/model/travel_tabsmodel.dart';
import 'package:flutterdemo/network/travel_network.dart';
import 'package:flutterdemo/pages/app/webview.dart';
import 'package:flutterdemo/views/travel_item_cell.dart';

class TravelItemPage extends StatefulWidget {
  final TabItem item;
  const TravelItemPage({required this.item, Key? key}) : super(key: key);

  @override
  _TravelItemPageState createState() => _TravelItemPageState();
}

class _TravelItemPageState extends State<TravelItemPage>
    with AutomaticKeepAliveClientMixin {
  List<TravelItemModel> _item = [];
  bool _loading = false;
  final int _page = 0;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _reloadData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData(loadMore: true);
      }
    });
    super.initState();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _reloadData,
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: _addGridView(context),
        ),
      ),
    );
  }

  Widget _addGridView(BuildContext ctx) {
    return StaggeredGridView.countBuilder(
      controller: _scrollController,
      crossAxisCount: 4,
      itemCount: _item.length,
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: () => _travelCellOntap(index),
        child: TravelItemCell(itemModel: _item[index]),
      ),
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }

  @override
  bool get wantKeepAlive => true;

  void _loadData({loadMore = false}) {
    if (_loading) {
      print("重复刷新了");
    } else {
      int page = _page + 1;
      TravelTabListDat.fetchTravelItemList2(page: page).then((value) {
        setState(() {
          _loading = false;
          if (loadMore) {
            _item.addAll(value);
          } else {
            _item = value;
          }
          print("item.length = " + _item.length.toString());
        });
      });
    }
  }

  Future _reloadData() async {
    _loadData(loadMore: false);
    return null;
  }

  void _travelCellOntap(int index) {
    TravelItemModel model = _item[index];
    if (model.article.urls != null && model.article.urls.length > 0) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyWebView(
                  url: model.article.urls[0].h5Url,
                  title: model.article.articleTitle.length > 12
                      ? model.article.articleTitle.substring(0, 12)
                      : model.article.articleTitle)));
    }
  }
}
