import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/components/baixing_life/db/life_goods_provider.dart';
import 'package:flutter_common/res/json_strings.dart';

import 'data/member_life_data.dart';

class MemberLifeWidget extends StatefulWidget {
  final LifeGoodsProvider provider;

  MemberLifeWidget(this.provider, {Key key}) : super(key: key);

  @override
  _MemberLifeWidgetState createState() => _MemberLifeWidgetState();
}

class _MemberLifeWidgetState extends State<MemberLifeWidget> {
  bool _isShowFloatingTopBar = false;
  double _topBarOpacity = 1;
  double _lastScrollPixels = 0;

  @override
  Widget build(BuildContext context) {
    final localMemberObject =
        MemberLifeData.fromJson(json.decode(JsonStrings.lifeMemberJson));
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: NotificationListener(
          onNotification: _onScroll,
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  _buildBodyTopWidget(localMemberObject),
                  SizedBox(height: Screen.hScree10),
                  _buildBodyOrderWidget(localMemberObject),
                  SizedBox(height: Screen.hScree10),
                  _buildEssentialToolWidget(localMemberObject),
                  SizedBox(height: Screen.hScree10),
                  _buildToolWidget(localMemberObject),
                  SizedBox(height: Screen.hScree20),
                  _buildFocusWidget(localMemberObject)
                ],
              )),
              Offstage(
                offstage: !_isShowFloatingTopBar,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.orange, Colors.deepOrange])),
                  width: DeviceUtil.width,
                  height: DeviceUtil.topSafeHeight + Screen.hScree40,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: DeviceUtil.topSafeHeight,
                      ),
                      Container(
                        height: Screen.hScree40,
                        child: _buildFloatingTopBar(localMemberObject?.user),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget _buildFloatingTopBar(User obj) {
    return Stack(
      children: <Widget>[
        Container(
//          color: Colors.blue,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              GestureDetector(
                  child: Text(
                '设置',
                style:
                    TextStyle(color: Colors.white, fontSize: Screen.spScreen16),
              )),
              SizedBox(
                width: 8,
              ),
            ],
          ),
        ),
        Center(
          child: Text('${obj.name}',
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontSize: Screen.spScreen16)),
        ),
      ],
    );
  }

  Widget _buildBodyTopWidget(MemberLifeData obj) {
    return Stack(
      children: <Widget>[
        Container(
          width: DeviceUtil.width,
          height: DeviceUtil.height / 4,
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.orange, Colors.deepOrange])),
          child: Column(
            children: <Widget>[
              Opacity(
                opacity: _topBarOpacity,
                child: _buildTopBar(obj),
              ),
              Container(
                width: DeviceUtil.width,
                height: DeviceUtil.height / 4 -
                    Screen.hScree75 -
                    DeviceUtil.topSafeHeight,
                margin: EdgeInsets.only(top: Screen.hScree10),
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: obj?.user?.userTab?.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //纵轴间距
                        mainAxisSpacing: 0.0,
                        //横轴间距
                        crossAxisSpacing: 0.0,
                        //横轴元素个数
                        crossAxisCount: 4,
                        //子组件宽高长度比例
                        childAspectRatio: 1.0),
                    itemBuilder: (BuildContext context, int index) {
                      return _buildUserTabItemWidget(
                          obj?.user?.userTab[index], index);
                    }),
              )
            ],
          ),
        ),
        Container(
          width: DeviceUtil.width,
          height: Screen.hScree50,
          margin: EdgeInsets.only(
              top: DeviceUtil.height / 4 - Screen.hScree20,
              left: Screen.wScreen10,
              right: Screen.wScreen10),
          padding: EdgeInsets.symmetric(
              horizontal: Screen.wScreen10, vertical: Screen.hScree5),
          //边框设置
          decoration: new BoxDecoration(
            //背景
            color: Colors.white,
            //设置四周圆角 角度
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            //设置四周边框
            border: new Border.all(width: 0, color: Colors.white),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(
                '${obj?.vip?.vipIcon}',
                height: Screen.hScree40,
              ),
              Container(
                width: 1,
                height: Screen.hScree30,
                color: Color(0xFFedeeed),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${obj?.vip?.voucher}',
                    style: TextStyle(color: Color(0xFF666666)),
                  ),
                  Text(
                    '${obj?.vip?.voucherDeclare}',
                    style: TextStyle(
                        color: Color(0xFF666666), fontSize: Screen.spScreen12),
                  )
                ],
              ),
              Image.asset(
                '${obj?.vip?.vipUrl}',
                height: 44,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildTopBar(MemberLifeData obj) {
    return Container(
      margin: EdgeInsets.only(top: DeviceUtil.topSafeHeight + Screen.hScree10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: Screen.wScreen10,
          ),
          ClipOval(
            child: ImageLoadView('${obj?.user?.advert}',
                fit: BoxFit.fill,
                width: Screen.hScree55,
                height: Screen.hScree55),
          ),
          SizedBox(
            width: Screen.wScreen10,
          ),
          Container(
            height: Screen.hScree55,
            alignment: Alignment.centerLeft,
            child: Text(
              '${obj.user.name}',
              style: TextStyle(
                  fontSize: Screen.spScreen19,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(
                  Icons.child_care,
                  color: Colors.white,
                ),
                SizedBox(
                  width: Screen.wScreen5,
                ),
                Text(
                  '亲情账号',
                  style: TextStyle(
                      fontSize: Screen.spScreen15, color: Colors.white),
                ),
                SizedBox(
                  width: Screen.wScreen20,
                ),
                Icon(
                  Icons.date_range,
                  color: Colors.white,
                ),
                SizedBox(
                  width: Screen.wScreen10,
                ),
                GestureDetector(
                  onTap: () async {},
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: Screen.wScreen10,
          ),
        ],
      ),
    );
  }

  Widget _buildBodyOrderWidget(MemberLifeData obj) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Screen.wScreen10),
      //边框设置
      decoration: new BoxDecoration(
        //背景
        color: Colors.white,
        //设置四周圆角 角度
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //设置四周边框
        border: new Border.all(width: 0, color: Colors.white),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: Screen.hScree40,
            padding: EdgeInsets.symmetric(horizontal: Screen.wScreen10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '我的订单',
                  style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: Screen.spScreen14,
                      fontWeight: FontWeight.w900),
                ),
                Icon(Icons.arrow_forward_ios,
                    size: Screen.hScree10, color: Color(0xFFC7C7CC)),
              ],
            ),
          ),
          Container(
            height: 0.5,
            color: Color(0xFFedeeed),
          ),
          Container(
            height: Screen.hScree80,
            padding: EdgeInsets.only(bottom: Screen.hScree10),
            child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: obj?.order?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //纵轴间距
                    mainAxisSpacing: 0.0,
                    //横轴间距
                    crossAxisSpacing: 0.0,
                    //横轴元素个数
                    crossAxisCount: 5,
                    //子组件宽高长度比例
                    childAspectRatio: 1.0),
                itemBuilder: (BuildContext context, int index) {
                  //Widget Function(BuildContext context, int index)
                  return _buildOrderItemWidget(obj?.order[index], index);
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildEssentialToolWidget(MemberLifeData obj) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Screen.wScreen10),
      //边框设置
      decoration: new BoxDecoration(
        //背景
        color: Colors.white,
        //设置四周圆角 角度
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //设置四周边框
        border: new Border.all(width: 0, color: Colors.white),
      ),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: obj?.equity?.length,
          //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //纵轴间距
              mainAxisSpacing: 0.0,
              //横轴间距
              crossAxisSpacing: 0.0,
              //横轴元素个数
              crossAxisCount: 4,
              //子组件宽高长度比例
              childAspectRatio: 1.3),
          itemBuilder: (BuildContext context, int index) {
            //Widget Function(BuildContext context, int index)
            return _buildEquityItemWidget(obj?.equity[index], index);
          }),
    );
  }

  ///必备工具 /
  Widget _buildToolWidget(MemberLifeData obj) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Screen.wScreen10),
      //边框设置
      decoration: new BoxDecoration(
        //背景
        color: Colors.white,
        //设置四周圆角 角度
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //设置四周边框
        border: new Border.all(width: 0, color: Colors.white),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: Screen.hScree40,
            padding: EdgeInsets.symmetric(horizontal: Screen.wScreen10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '必备工具',
                  style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: Screen.spScreen14,
                      fontWeight: FontWeight.w900),
                ),
                Icon(Icons.arrow_forward_ios,
                    size: Screen.hScree10, color: Color(0xFFC7C7CC)),
              ],
            ),
          ),
          Container(
            height: 0.5,
            color: Color(0xFFedeeed),
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: obj?.tool?.length,
              //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //纵轴间距
                  mainAxisSpacing: 0.0,
                  //横轴间距
                  crossAxisSpacing: 0.0,
                  //横轴元素个数
                  crossAxisCount: 4,
                  //子组件宽高长度比例
                  childAspectRatio: 1.3),
              itemBuilder: (BuildContext context, int index) {
                //Widget Function(BuildContext context, int index)
                return _buildToolItemWidget(obj?.tool[index], index);
              })
        ],
      ),
    );
  }

  /// 我关注的频道/
  Widget _buildFocusWidget(MemberLifeData obj) {
    return Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(horizontal: Screen.wScreen10),
            alignment: Alignment.topLeft,
            child: Text(
              '我关注的频道',
              style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: Screen.spScreen14,
                  fontWeight: FontWeight.w900),
            )),
        Container(
            margin: EdgeInsets.symmetric(
                horizontal: Screen.wScreen10, vertical: Screen.hScree10),
            child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: obj?.focus?.length,
                //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //纵轴间距
                    mainAxisSpacing: Screen.wScreen10,
                    //横轴间距
                    crossAxisSpacing: Screen.wScreen10,
                    //横轴元素个数
                    crossAxisCount: 2,
                    //子组件宽高长度比例
                    childAspectRatio: 0.6),
                itemBuilder: (BuildContext context, int index) {
                  //Widget Function(BuildContext context, int index)
                  return _buildFocusItemWidget(obj?.focus[index], index);
                }))
      ],
    );
  }

  Widget _buildFocusItemWidget(obj, index) {
    Color color;
    if (index == 0) {
      color = blue600Color;
    } else if (index == 1) {
      color = teal600Color;
    } else if (index == 2) {
      color = deepOrange600Color;
    } else {
      color = purple600Color;
    }
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Screen.wScreen10, vertical: Screen.hScree10),
      //边框设置
      decoration: new BoxDecoration(
        //背景
        color: Colors.white,
        //设置四周圆角 角度
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //设置四周边框
        border: new Border.all(width: 0, color: Colors.white),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset(
                '${obj.focusPayIcon}',
                fit: BoxFit.fill,
                width: Screen.hScree15,
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: Screen.wScreen5, right: Screen.wScreen5),
                  child: Text(
                    '${obj.focusPayTitle}',
                    style: TextStyle(
                        color: Color(0xFF333333), fontSize: Screen.spScreen14),
                  )),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: Screen.wScreen3),
                  //边框设置
                  decoration: new BoxDecoration(
                    //背景
                    color: Colors.orange,
                    //设置四周圆角 角度
                    borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    //设置四周边框
                    border: new Border.all(width: 0, color: Colors.orange),
                  ),
                  child: Text(
                    '${obj.focusButtonTitle}',
                    style: TextStyle(
                        color: Colors.white, fontSize: Screen.spScreen10),
                  ))
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: Screen.hScree5),
              child: Text('${obj.focusPayDescribe}',
                  style: TextStyle(
                      color: Color(0xFF666666), fontSize: Screen.spScreen12))),
          Container(
            width: (DeviceUtil.width - Screen.wScreen60) / 2,
            height: (DeviceUtil.width - Screen.wScreen60) / 2,
            //边框设置
            decoration: new BoxDecoration(
              //背景
              color: grey100Color,
              //设置四周圆角 角度
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              //设置四周边框
              border: new Border.all(width: 0, color: grey100Color),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('${obj.focusContentTitle}',
                    style:
                        TextStyle(fontSize: Screen.spScreen21, color: color)),
                Text('${obj.focusDescribeTitle}',
                    style: TextStyle(fontSize: Screen.spScreen14)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: Screen.wScreen10),
                  //边框设置
                  decoration: new BoxDecoration(
                    //设置四周圆角 角度
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    //设置四周边框
                    border: new Border.all(width: 1, color: color),
                  ),
                  child: Text('${obj.focusMoreTitle}',
                      style:
                          TextStyle(fontSize: Screen.spScreen12, color: color)),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Image.asset(
                        '${obj.content[0].icon}',
                        width: Screen.hScree20,
                      ),
                      SizedBox(
                        height: Screen.hScree3,
                      ),
                      Text('${obj.content[0].title}',
                          style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: Screen.spScreen12))
                    ],
                  ),
                  Container(
                    height: Screen.hScree40,
                    width: 1,
                    color: Color(0xFFedeeed),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Image.asset('${obj.content[1].icon}',
                          width: Screen.hScree20),
                      SizedBox(
                        height: Screen.hScree3,
                      ),
                      Text('${obj.content[1].title}',
                          style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: Screen.spScreen12))
                    ],
                  ),
                ],
              ),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }

  Widget _buildOrderItemWidget(obj, index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(
          '${obj.orderIcon}',
          height: Screen.hScree20,
        ),
        SizedBox(height: Screen.hScree5),
        Text('${obj.orderTitle}',
            style: TextStyle(
                color: Color(0xFF333333), fontSize: Screen.spScreen14))
      ],
    );
  }

  Widget _buildEquityItemWidget(obj, index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(
          '${obj.equityIcon}',
          height: Screen.hScree20,
        ),
        SizedBox(height: Screen.hScree5),
        Text('${obj.equityTitle}',
            style: TextStyle(
                color: Colors.deepOrange, fontSize: Screen.spScreen14))
      ],
    );
  }

  Widget _buildToolItemWidget(obj, index) {
    return InkWell(
      onTap: () => null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            '${obj.toolIcon}',
            height: Screen.hScree20,
          ),
          SizedBox(height: Screen.hScree5),
          Text('${obj.toolTitle}',
              style: TextStyle(
                  color: Colors.deepOrange, fontSize: Screen.spScreen14))
        ],
      ),
    );
  }

  Widget _buildUserTabItemWidget(obj, index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          '${obj.userTabNum}',
          style: TextStyle(color: Colors.white, fontSize: Screen.spScreen14),
        ),
        Text(
          '${obj.userTabTitle}',
          style: TextStyle(color: Colors.white, fontSize: Screen.spScreen14),
        )
      ],
    );
  }

  bool _onScroll(ScrollNotification scroll) {
    double limitExtent = Screen.hScree40;
    // 当前滑动距离
    double currentExtent = scroll.metrics.pixels;
    //向下滚动
    if (currentExtent - _lastScrollPixels > 0) {
      if (currentExtent <= limitExtent) {
        setState(() {
          double opacity = 1 - currentExtent / limitExtent;
          _topBarOpacity = opacity > 1 ? 1 : opacity;
        });
      } else {
        if (!_isShowFloatingTopBar) {
          setState(() {
            _isShowFloatingTopBar = true;
          });
        }
      }
    }
    //往上滚动
    if (currentExtent - _lastScrollPixels < 0) {
      if (currentExtent <= limitExtent) {
        setState(() {
          double opacity = 1 - currentExtent / limitExtent;
          _topBarOpacity = opacity > 1 ? 1 : opacity;
          _isShowFloatingTopBar = false;
        });
      }
    }
    _lastScrollPixels = currentExtent;
    // 返回false，继续向上传递,返回true则不再向上传递
    return false;
  }
}
