import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/common/res/styles.dart';
import 'package:flutter_common/common/utils/device_util.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

//👈文本标识 👉输入框
class TextFieldIcon extends StatelessWidget {
  final TextEditingController controller;
  final Widget icon;
  final String hintText;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final KeyboardActionsConfig config;
  final FocusNode nextFocusNode;
  final int maxLines;
  final int maxLength;
  final double height;

  const TextFieldIcon(
      {Key key,
      this.controller,
      @required this.icon,
      this.keyboardType: TextInputType.text,
      this.hintText: "",
      this.focusNode,
      this.nextFocusNode,
      this.config,
      this.maxLines: 1,
      this.height,
      this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (config != null && DeviceUtil.isIOS) {
      // 因Android平台输入法兼容问题，所以只配置IOS平台
      FormKeyboardActions.setKeyboardActions(context, config);
    }
    return Container(
        height: height == null ? 55.0 : height,
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: Screen.wScreen10),
        child: Row(
            crossAxisAlignment: maxLines == 1
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: TextField(
                      maxLength: maxLength,
                      style: TextStyle(
                          color: grey900Color, fontSize: Screen.spScreen14),
                      maxLines: maxLines,
                      focusNode: focusNode,
                      keyboardType: keyboardType,
                      inputFormatters: (keyboardType == TextInputType.number ||
                              keyboardType == TextInputType.phone)
                          ? [WhitelistingTextInputFormatter(RegExp("[0-9]"))]
                          : keyboardType ==
                                  TextInputType.numberWithOptions(decimal: true)
                              ? [UsNumberTextInputFormatter()]
                              : [BlacklistingTextInputFormatter(RegExp(""))],
                      controller: controller,
                      onEditingComplete: nextFocusNode == null
                          ? null
                          : () => FocusScope.of(context)
                              .requestFocus(nextFocusNode),
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16.0),
                          hintText: hintText,
                          counterText: "",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: grey500Color,
                              fontSize: Screen.spScreen14)))),
              Container(
                  height: 50, alignment: Alignment.centerLeft, child: icon==null?Container():icon),
            ]));
  }
}

/// 只允许输入小数
class UsNumberTextInputFormatter extends TextInputFormatter {
  static const defaultDouble = 0.001;

  static double strToFloat(String str, [double defaultValue = defaultDouble]) {
    try {
      return double.parse(str);
    } catch (e) {
      return defaultValue;
    }
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String value = newValue.text;
    int selectionIndex = newValue.selection.end;
    if (value == ".") {
      value = "0.";
      selectionIndex++;
    } else if (value != "" &&
        value != defaultDouble.toString() &&
        strToFloat(value, defaultDouble) == defaultDouble) {
      value = oldValue.text;
      selectionIndex = oldValue.selection.end;
    }
    return TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
