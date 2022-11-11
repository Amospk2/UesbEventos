import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterController {
  final formKey = GlobalKey<FormBuilderState>();
  final datePickerController = TextEditingController();

  Map<String, dynamic> toUser() {
    var registerValues = {
      'nome': formKey.currentState!.fields['Nome Completo']!.value,
      'CPF': CPFValidator.strip(formKey.currentState!.fields['CPF']!.value),
      'email': formKey.currentState!.fields['Email']!.value,
      'endereco': formKey.currentState!.fields['Endereco']!.value,
      'formacao': formKey.currentState!.fields['formacao']!.value,
      'telefone': formKey.currentState!.fields['Telefone']!.value,
      'senha': formKey.currentState!.fields['Senha']!.value,
      'role':'',
      'dataNascimento':
          "${datePickerController.text.split('-').elementAt(2)}-${datePickerController.text.split('-').elementAt(1)}-${datePickerController.text.split('-').elementAt(0)}",
    };

    return registerValues;
  }

  String? validatePass() {
    String? password = formKey.currentState!.fields['Senha']!.value;
    String? passwordToCompare =
        formKey.currentState!.fields['Confirmar Senha']!.value;
    if (password == passwordToCompare) {
      return null;
    } else {
      return "As senhas não correspondem.";
    }
  }

  String? validarCPF(String? value) {
    if (CPFValidator.isValid(value)) {
      return null;
    } else {
      return "CPF Invalido.";
    }
  }
}
