import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullToRefreshListView extends StatefulWidget {
  PullToRefreshListView(
      {@required this.itemCount,
      @required this.itemBuilder,
      this.headerBuilder,
      this.footerBuilder,
      this.loadMoreItemBuilder,
      this.dividerBuilder,
      this.physics,
      this.headerSliverBuilder,
      this.controller,
      this.foregroundWidget,
      this.padding,
      this.onRefresh,
      this.refreshController,
      this.isSliverMode = false,
      this.enablePullDown = false,
      this.enablePullUp = true,
      this.enableOverScroll = false
      // [Not Recommended]
      // Sliver mode will discard a lot of ListView variables (likes physics, controller),
      // and each of items must be sliver.
      // *Sliver mode will build all items when inited. (ListView item is built by lazy)*
      })
      : assert(itemBuilder != null);

  final int itemCount;
  final WidgetBuilder headerBuilder;
  final WidgetBuilder footerBuilder;
  final WidgetBuilder loadMoreItemBuilder;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder dividerBuilder;
  final ScrollPhysics physics;
  final ScrollController controller;
  final NestedScrollViewHeaderSliversBuilder headerSliverBuilder;
  final Widget foregroundWidget;
  final EdgeInsetsGeometry padding;
  final OnRefresh onRefresh;
  final RefreshController refreshController;
  final bool isSliverMode;
  final bool enablePullDown;
  final bool enablePullUp;
  final bool enableOverScroll;

  @override
  State<StatefulWidget> createState() {
    return PullToRefreshListViewState();
  }
}

enum ItemType { header, footer, data, dividerData }

class PullToRefreshListViewState extends State<PullToRefreshListView>
    with TickerProviderStateMixin {
  final GlobalKey<RefreshIndicatorState> _refreshKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () {
      _refreshKey.currentState.show();
      return true;
    });
  }

  @override
  Widget build(BuildContext context) => widget.headerSliverBuilder != null
      ? NestedScrollView(
          headerSliverBuilder: widget.headerSliverBuilder,
          body: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: _buildList(),
          ),
        )
      : _buildList();

  Widget _itemBuilder(context, index) {
    var headerCount = _headerCount();
    var totalItemCount = _dataItemCount() + headerCount + _footerCount();
    switch (_itemType(index, totalItemCount)) {
      case ItemType.header:
        return widget.headerBuilder(context);
      case ItemType.footer:
        return widget.footerBuilder(context);
      case ItemType.dividerData:
        return _buildDividerWithData(index, index - headerCount);
      case ItemType.data:
      default:
        return widget.itemBuilder(context, index - headerCount);
    }
  }

  _buildList() {
    var headerCount = _headerCount();
    var totalItemCount = _dataItemCount() + headerCount + _footerCount();
    var children = <Widget>[
      widget.isSliverMode
          ? RefreshIndicator(
              key: _refreshKey,
              child: SmartRefresher(
                enablePullDown: widget.enablePullDown,
                enablePullUp: widget.enablePullUp,
                enableOverScroll: widget.enableOverScroll,
                controller: widget.refreshController,
                onRefresh: (up) {
                  if (_hasRefresh()) {
                    widget.onRefresh(up);
                  }
                },
                child: CustomScrollView(
                  slivers: List.generate(
                      totalItemCount, (index) => _itemBuilder(context, index)),
                ),
              ),
              onRefresh: () {
                if (_hasRefresh()) {
                  widget.onRefresh(true);
                }
              },
            )
          : RefreshIndicator(
              key: _refreshKey,
              child: SmartRefresher(
                  enablePullDown: widget.enablePullDown,
                  enablePullUp: widget.enablePullUp,
                  enableOverScroll: widget.enableOverScroll,
                  controller: widget.refreshController,
                  onRefresh: (up) {
                    if (_hasRefresh()) {
                      widget.onRefresh(up);
                    }
                  },
                  child: ListView.builder(
                    physics: widget.physics,
                    padding: widget.padding,
                    controller: widget.controller,
                    itemCount: totalItemCount,
                    itemBuilder: _itemBuilder,
                  )),
              onRefresh: () {
                if (_hasRefresh()) {
                  widget.onRefresh(true);
                }
                return Future.delayed(const Duration(milliseconds: 300));
              })
    ];
    if (widget.foregroundWidget != null) children.add(widget.foregroundWidget);
    return Stack(children: children);
  }

  ItemType _itemType(itemIndex, totalItemCount) {
    if (_isHeader(itemIndex)) {
      return ItemType.header;
    } else if (_isFooter(itemIndex, totalItemCount)) {
      return ItemType.footer;
    } else if (_hasDivider()) {
      return ItemType.dividerData;
    } else {
      return ItemType.data;
    }
  }

  Widget _buildDividerWithData(index, dataIndex) => index.isEven
      ? widget.dividerBuilder != null
          ? widget.dividerBuilder(context, dataIndex ~/ 2)
          : widget.isSliverMode
              ? SliverList(delegate: SliverChildListDelegate([_defaultDivider]))
              : _defaultDivider
      : widget.itemBuilder(context, dataIndex ~/ 2);

  bool _isHeader(itemIndex) => _hasHeader() && itemIndex == 0;

  bool _isFooter(itemIndex, total) => _hasFooter() && itemIndex == total - 1;

  int _headerCount() => _hasHeader() ? 1 : 0;

  int _footerCount() => (_hasFooter()) ? 1 : 0;

  int _dataItemCount() =>
      _hasDivider() ? widget.itemCount * 2 - 1 : widget.itemCount;

  bool _hasDivider() => widget.dividerBuilder != null;

  bool _hasHeader() => widget.headerBuilder != null;

  bool _hasFooter() => widget.footerBuilder != null;

  bool _hasRefresh() => widget.onRefresh != null;
  final _defaultDivider = const Divider(color: Colors.grey);
}

typedef void OnRefresh(bool up);
