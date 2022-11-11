import 'package:flutter/material.dart';
import 'package:uesb_eventos/utils/config/colors.dart';

AppBar buildAppBar(String title, {List<Widget>? actions}) {
  return AppBar(
    actions: actions,
    title: Text(
      title,
      style: const TextStyle(color: Colors.white),
    ),
    centerTitle: true,
    backgroundColor: primaryColor,
    shadowColor: primaryColor,
    foregroundColor: primaryColor,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
