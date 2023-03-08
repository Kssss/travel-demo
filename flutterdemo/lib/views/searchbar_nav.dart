import 'package:flutter/material.dart';

enum SearchBarStyle {
  home,
  homelight,
  normal,
}

class  SearchBar extends StatefulWidget {
  final bool enable;
  final bool hideLeft;
  final SearchBarStyle searchBarStyle;
  final String hint; // placholdText
  final String defaulteText;
  final void Function()? leftButtonClick;
  final void Function()? rightButtonClick;
  final void Function()? speakCLick;
  final void Function()? inputBoxClick;
  final void Function(String text)? onChanged;

  SearchBar(
      {this.enable = false,
      this.hideLeft = false,
      this.searchBarStyle = SearchBarStyle.home,
      this.hint = "11",
      this.defaulteText = "",
      this.leftButtonClick,
      this.rightButtonClick,
      this.speakCLick,
      this.inputBoxClick,
      this.onChanged});

  @override
  State<StatefulWidget> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool showClearBtn = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if (widget.defaulteText.isNotEmpty) {
      setState(() {
        _controller.text = widget.defaulteText;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.searchBarStyle == SearchBarStyle.normal
        ? _genNormalSearchBar()
        : _genHomeSearchBar();
  }

  _genNormalSearchBar() {
    return Container(
      // height: 50,
      decoration: const BoxDecoration(
          // color: Colors.yellowAccent,
          ),
      child: Row(
        children: [
          _warpTap(
              Container(
                padding: const EdgeInsets.fromLTRB(6, 5, 10, 5),
                child: widget.hideLeft
                    ? null
                    : const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.grey,
                        size: 26,
                      ),
              ),
              widget.leftButtonClick),
          Expanded(
            flex: 1,
            child: _inputBar(),
          ),
          _warpTap(
              Container(
                child: const Text(
                  "搜索",
                  style: TextStyle(color: Colors.blue, fontSize: 17),
                ),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              ),
              widget.rightButtonClick),
        ],
      ),
    );
  }

  _inputBar() {
    Color inputBoxColor;
    if (widget.searchBarStyle == SearchBarStyle.home) {
      inputBoxColor = Colors.white;
    } else {
      inputBoxColor = Color(int.parse("0xffededed"));
    }

    return Container(
        height: 30,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            color: inputBoxColor,
            borderRadius: BorderRadius.circular(
                widget.searchBarStyle == SearchBarStyle.normal ? 5 : 15)),
        child: Row(
          children: [
            Icon(
              Icons.search,
              size: 20,
              color: widget.searchBarStyle == SearchBarStyle.normal
                  ? const Color(0xffa9a9a9)
                  : Colors.blue,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: widget.searchBarStyle == SearchBarStyle.normal
                  ? TextField(
                      maxLines: 1,
                      controller: _controller,
                      onChanged: _onChanged,
                      autofocus: true,
                      style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.hint,
                        hintStyle: TextStyle(fontSize: 15),
                      ),
                    )
                  : _warpTap(
                      Container(
                        child: Text(
                          widget.hint,
                          style:
                              const TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ),
                      widget.inputBoxClick),
            ),
            !showClearBtn ? _warpTap(
                    Icon(Icons.mic,
                        size: 22,
                        color: widget.searchBarStyle == SearchBarStyle.normal
                            ? Colors.blue
                            : Colors.grey),
                    widget.speakCLick)
                : _warpTap(
                    const Icon(
                      Icons.clear,
                      size: 22,
                      color: Colors.grey,
                    ), () {
                    setState(() {
                      _controller.clear();
                    });
                    _onChanged("");
                  })
          ],
        ));
  }

  _genHomeSearchBar() {
    return Container(
      // height: 50,
      decoration: const BoxDecoration(
          // color: Colors.yellowAccent,
          ),
      child: Row(
        children: [
          _warpTap(
              Container(
                  padding: const EdgeInsets.fromLTRB(6, 5, 10, 5),
                  child: Row(
                    children: [
                      Text(
                        "上海",
                        style: TextStyle(color: _homeFontColor(), fontSize: 14),
                      ),
                      Icon(
                        Icons.expand_more,
                        color: _homeFontColor(),
                        size: 22,
                      ),
                    ],
                  )),
              widget.leftButtonClick),
          Expanded(
            flex: 1,
            child: _inputBar(),
          ),
          _warpTap(
              Container(
                child: Icon(
                  Icons.comment,
                  color: _homeFontColor(),
                  size: 26,
                ),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              ),
              widget.rightButtonClick),
        ],
      ),
    );
  }

  _warpTap(Widget? child, void Function()? callback) {
    return GestureDetector(
      onTap: () {
        if (callback != null) callback();
      },
      child: child,
    );
  }

  _onChanged(String text) {
    setState(() {
      showClearBtn = text.isNotEmpty;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(text);
    }
  }

  _homeFontColor() {
    return widget.searchBarStyle == SearchBarStyle.homelight
        ? Colors.black54
        : Colors.white;
  }
}
