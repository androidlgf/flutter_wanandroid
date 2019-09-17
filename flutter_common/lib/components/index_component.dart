

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/common/ui/button.dart';
import 'package:flutter_common/common/ui/change_appbar.dart';
import 'package:flutter_common/common/ui/countdown_widget.dart';
import 'package:flutter_common/common/ui/custom_text_field.dart';
import 'package:flutter_common/common/ui/gradual_change_view.dart';
import 'package:flutter_common/common/ui/icon_text.dart';
import 'package:flutter_common/common/ui/image_load_view.dart';
import 'package:flutter_common/common/ui/line.dart';
import 'package:flutter_common/common/ui/line_view_line.dart';
import 'package:flutter_common/common/ui/loader.dart';
import 'package:flutter_common/common/ui/search_bar.dart';
import 'package:flutter_common/common/ui/section_view.dart';
import 'package:flutter_common/common/ui/select_text_item.dart';
import 'package:flutter_common/common/ui/selected_text.dart';
import 'package:flutter_common/common/ui/suspension_tag.dart';
import 'package:flutter_common/common/ui/text_field_item.dart';
import 'package:flutter_common/common/ui/toolbar.dart';

class IndexComponent extends StatefulWidget {
  @override
  _IndexComponentState createState() => _IndexComponentState();
}

class _IndexComponentState extends State<IndexComponent> {
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1111'),
      ),
      body: Container(
        child:Column(
          children: <Widget>[
            TextFieldItem(hintText: '请输入',title: '商品',),
            TextFieldItem(hintText: '请输入',title: '货物',),
            SelectedText('价格',selected: false,unSelectedTextColor: colorPrimary,),
            SelectTextItem(
                title: '我的账户',
                content: '购买、充值记录',
                leading: Icon(Icons.print,
                    size: 20, color: Colors.redAccent)),
            SelectTextItem(
                title: '我的任务',
                content: '绑定手机送买书券',
                trailing: Icons.arrow_forward_ios,
                leading: Icon(Icons.access_alarm,
                    size: 20, color: Colors.yellow),
               ),
            Line(color: colorPrimary,),
            SectionView("电影榜单", hiddenMore: false),
            LineViewLine(),
            CustomTextField(isInputPwd: true,hintText:'123456',controller: _passwordController,),
          ],
        ),
      ),
    );
  }
}
