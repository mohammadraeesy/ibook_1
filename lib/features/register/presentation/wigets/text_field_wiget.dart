import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget TextFieldWidget(
    {@required String text,
    @required double size,
    @required Icon textFiledIcon,
    @required TextEditingController textController}) {
  return Material(
    elevation: 10,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Container(
      height: size,
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: text,
            suffixIcon: textFiledIcon),
      ),
    ),
  );
}
