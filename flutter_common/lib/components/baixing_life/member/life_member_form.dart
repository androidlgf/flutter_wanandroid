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
      children: <Widget>[_buildBodyTopWidget()],
    );
  }

  Widget _buildBodyTopWidget() {
    return GradualChangeView(
      colors: [red50Color, red200Color, red400Color],
      height: Screen.hScree232,
    );
  }
}
