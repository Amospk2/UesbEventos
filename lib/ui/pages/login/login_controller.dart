import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginController{
  final formKey = GlobalKey<FormBuilderState>();


  toAuth(){

    var authValues = {
    'email':formKey.currentState!.fields['Email']!.value,
    'senha':formKey.currentState!.fields['Password']!.value
    };
    return authValues;
  
  }


}