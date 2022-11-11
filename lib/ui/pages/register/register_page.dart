import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/ui/pages/login/login_page.dart';
import 'package:uesb_eventos/ui/pages/register/register_controller.dart';
import 'package:uesb_eventos/ui/shared/widgets/custom_text_fild_form.dart';
import '../../../core/providers/home/auth/register_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  DateTime date = DateTime.now();
  late final RegisterController _registerController;
  late final RegisterProvider controller;

  @override
  void initState() {
    super.initState();

    _registerController = RegisterController();
    _registerController.datePickerController.text = "/  /  ";
    controller = context.read<RegisterProvider>();
    controller.addListener(() {
      if (mounted) {
        if (controller.registerstate == RegisterState.error) {
          final snackBarErrorRegister = SnackBar(
            backgroundColor: const Color.fromARGB(255, 22, 22, 22),
            content: Text(controller.responseMSG!),
            duration: const Duration(seconds: 2),
          );
          ScaffoldMessenger.of(
                  context.read<GlobalKey<NavigatorState>>().currentContext!)
              .showSnackBar(snackBarErrorRegister);
        } else if (controller.registerstate == RegisterState.sucess) {
          const snackBarSucessRegister = SnackBar(
            backgroundColor:  Color.fromARGB(255, 22, 22, 22),
            content: Text("Cadastro realizado com sucesso!"),
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(
                  context.read<GlobalKey<NavigatorState>>().currentContext!)
              .showSnackBar(snackBarSucessRegister);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const LoginPage()));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color.fromARGB(255, 183, 75, 75),
      body: FormBuilder(
        key: _registerController.formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(right: 10, left: 15),
          scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Crie seu cadastro",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                SizedBox(
                  child: Image.asset(
                    "assets/images/login_image.png",
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                ),
                CustomTextFildFormBuilder(
                  icon: (Icons.perm_identity),
                  title: "Nome Completo",
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()]),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  readOnly: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    label: Text("Data Nascimento"),
                    icon: Icon(Icons.date_range, color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  controller: _registerController.datePickerController,
                  validator: (value) {
                    if (value != "/  /  ") {
                      return null;
                    } else {
                      return "Este campo não pode ficar vazio.";
                    }
                  },
                  onTap: () async {
                    DateTime? newDate = await showDatePicker(
                        initialDate: date,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                        context: context);
                    if (newDate == null) return;

                    setState(() {
                      date = newDate;
                      _registerController.datePickerController.text =
                          "${date.day}-${date.month}-${date.year}";
                    });
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFildFormBuilder(
                  icon: (Icons.document_scanner_outlined),
                  title: "CPF",
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    (v) => _registerController.validarCPF(v)
                  ]),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFildFormBuilder(
                  icon: (Icons.email),
                  title: "Email",
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email()
                  ]),
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFildFormBuilder(
                  icon: (Icons.house),
                  title: "Endereco",
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()]),
                ),
                const SizedBox(
                  height: 25,
                ),
                FormBuilderRadioGroup(
                  name: 'formacao',
                  decoration: const InputDecoration(
                    focusColor: Colors.white,
                    labelStyle: TextStyle(color: Colors.white),
                    label: Text("Formação"),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    icon: Icon(
                      Icons.school,
                      color: Colors.white,
                    ),
                  ),
                  validator: FormBuilderValidators.required(),
                  options: [
                    'Ensino Médio',
                    'Ensino Médio Técnico',
                    'Ensino Superior (Tecnólogo)',
                    'Ensino Superior (Graduação)',
                    'Pós-graduação',
                    'Mestrado',
                    'Doutorado'
                  ]
                      .map((lang) => FormBuilderFieldOption(
                            value: lang,
                            child: Text(
                              lang,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ))
                      .toList(growable: false),
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFildFormBuilder(
                  icon: (Icons.phone),
                  title: "Telefone",
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()]),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter(),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFildFormBuilder(
                  icon: (Icons.key),
                  title: "Senha",
                  obscure: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                    (v) => _registerController.validatePass()
                  ]),
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFildFormBuilder(
                  icon: (Icons.key),
                  title: "Confirmar Senha",
                  obscure: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    (v) => _registerController.validatePass(),
                    FormBuilderValidators.minLength(6),
                  ]),
                ),
                const SizedBox(
                  height: 25,
                ),
              ]),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.09,
        color: const Color.fromARGB(255, 253, 251, 251),
        child: TextButton(
            onPressed: () {
              if (_registerController.formKey.currentState!.validate()) {
                controller.create(_registerController.toUser());
                
              }
            },
            child: const Text("Criar Cadastro",
                style: TextStyle(color: Color.fromARGB(199, 200, 75, 75)))),
      ),
    );
  }
}
