import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomTextTitleWidget extends StatelessWidget {
  final String title;
  final int maxLines;
  final String label;
  final bool isPassword;
  const CustomTextTitleWidget({Key? key, required this.title, required this.maxLines, this.label = "", this.isPassword = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AutoSizeText(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ),
        const SizedBox(height: 10,),
         TextField(
            maxLines: maxLines,
            obscureText: isPassword,
            style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
            decoration: InputDecoration(
              focusColor: Colors.white,
              labelStyle: const TextStyle(color: Colors.white),
              label: Text(label),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            )),
      ],
    );
  }
}
