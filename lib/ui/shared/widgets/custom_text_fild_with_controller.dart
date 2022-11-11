import 'package:flutter/material.dart';

class CustomTextFildWithController extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool obscure;
  final TextEditingController? controller;
  const CustomTextFildWithController({Key? key, required this.title, required this.icon, this.obscure = false, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      obscureText: obscure,
      controller: controller,
      decoration: InputDecoration(
        focusColor: Colors.white,
        labelStyle: const TextStyle(color: Colors.white),
        label: Text(title),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
