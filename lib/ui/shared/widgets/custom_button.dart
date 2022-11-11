import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function()? callback;
  const CustomButton({Key? key, required this.title, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          onPressed: callback,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(title,
              style: const TextStyle(color: Color.fromARGB(199, 200, 75, 75)))
    );
  }
}
