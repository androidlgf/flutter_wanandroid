import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/common/res/colors.dart';
import 'package:flutter_common/common/ui/gradual_change_view.dart';
import 'package:flutter_common/components/baixing_life/db/life_goods_provider.dart';

class MemberLifeWidget extends StatefulWidget {
  final LifeGoodsProvider provider;

  MemberLifeWidget(this.provider, {Key key}) : super(key: key);

  @override
  _MemberLifeWidgetState createState() => _MemberLifeWidgetState();
}

class _MemberLifeWidgetState extends State<MemberLifeWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: _buildBodyWidget(),
    );
  }

  Widget _buildBodyWidget() {
    return Column(
      children: <Widget>[_buildBodyTopWidget(), _buildBodyOrderWidget()],
    );
  }

  Widget _buildBodyTopWidget() {
    return GradualChangeView(
      colors: [Color(0xFFED4263), Color(0xFFFA8C76)],
      rotation: Rotation.TB,
      height: Screen.hScree232,
      child: Column(
        children: <Widget>[],
      ),
    );
  }

  Widget _buildBodyOrderWidget() {
    return Container(
      color: Colors.white,
      height: Screen.hScree138,
      child: Column(
        children: <Widget>[
          Container(
            height: Screen.hScree52,
            child: ListTile(
              title: Text(
                '全部订单',
                style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: Screen.spScreen16,
                    fontWeight: FontWeight.w900),
              ),
              trailing: Icon(Icons.arrow_forward_ios,
                  size: Screen.hScree13, color: Color(0xFFC7C7CC)),
            ),
          ),
          Container(
            height: Screen.hScree86,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconText(
                  text: Text('待付款',
                      style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: Screen.spScreen12)),
                  icon: Icon(Icons.print,
                      size: Screen.wScreen21, color: Colors.red),
                  iconAlignment: IconAlignment.Top,
                  leading: Screen.hScree5,
                ),
                IconText(
                  text: Text('待发货',
                      style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: Screen.spScreen12)),
                  icon: Icon(Icons.featured_play_list,
                      size: Screen.wScreen21, color: Colors.red),
                  iconAlignment: IconAlignment.Top,
                  leading: Screen.hScree5,
                ),
                IconText(
                  text: Text('待收货',
                      style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: Screen.spScreen12)),
                  icon: Icon(Icons.featured_video,
                      size: Screen.wScreen21, color: Colors.red),
                  iconAlignment: IconAlignment.Top,
                  leading: Screen.hScree5,
                ),
                IconText(
                  text: Text('已完成',
                      style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: Screen.spScreen12)),
                  icon: Icon(Icons.feedback,
                      size: Screen.wScreen21, color: Colors.red),
                  iconAlignment: IconAlignment.Top,
                  leading: Screen.hScree5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
