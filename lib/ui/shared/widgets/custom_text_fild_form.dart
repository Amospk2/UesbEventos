import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';  

class CustomTextFildFormBuilder extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool obscure;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? sulffix;
  final bool? readOnly;
  const CustomTextFildFormBuilder({Key? key, required this.title, required this.icon, this.obscure = false, this.controller, this.validator, this.inputFormatters, this.sulffix, this.readOnly = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: title,
      readOnly: readOnly!,
      style: const TextStyle(color: Colors.white),
      obscureText: obscure,
      controller: controller,
      validator: validator,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        suffixIcon: sulffix,
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

