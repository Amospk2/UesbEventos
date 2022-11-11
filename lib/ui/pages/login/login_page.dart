import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/core/providers/home/auth/login_provider.dart';
import 'package:uesb_eventos/ui/pages/login/login_controller.dart';
import 'package:uesb_eventos/ui/pages/suporte/suporte_page.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/custom_text_fild_form.dart';
import '../home/home_page.dart';
import '../redefinir_senha/redefinir_senha.dart';
import '../register/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginProvider controller;
  final loginController = LoginController();

  @override
  void initState() {
    super.initState();

    controller = context.read<LoginProvider>();
    controller.addListener(() {
      if (mounted) {
        if (controller.loginstate == LoginState.error) {
          final snackBarErrorLogin = SnackBar(
            backgroundColor: const Color.fromARGB(255, 22, 22, 22),
            content: Text(controller.responseMSG!),
            duration: const Duration(seconds: 2),
          );
          ScaffoldMessenger.of(
                  context.read<GlobalKey<NavigatorState>>().currentContext!)
              .hideCurrentSnackBar();
          ScaffoldMessenger.of(
                  context.read<GlobalKey<NavigatorState>>().currentContext!)
              .showSnackBar(snackBarErrorLogin);
        } else if (controller.loginstate == LoginState.sucess) {
          loginController.formKey.currentState!.reset();
          FocusScope.of(context).unfocus();
          const snackBarSucesssLogin = SnackBar(
            backgroundColor: Color.fromARGB(255, 22, 22, 22),
            content: Text("Usuário logado com sucesso."),
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(
                  context.read<GlobalKey<NavigatorState>>().currentContext!)
              .hideCurrentSnackBar();
          ScaffoldMessenger.of(
                  context.read<GlobalKey<NavigatorState>>().currentContext!)
              .showSnackBar(snackBarSucesssLogin);

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomePage()));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const HomePage()));
            },
            icon: const Icon(Icons.home)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SuportePage()));
              },
              icon: const Icon(Icons.assistant))
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 183, 75, 75),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            children: [
              Positioned(
                child: Image.asset(
                  "assets/images/login_image.png",
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.38,
                  fit: BoxFit.scaleDown,
                ),
              )
            ],
          ),
          Column(
            children: [
              FormBuilder(
                key: loginController.formKey,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                  child: Column(children: [
                    CustomTextFildFormBuilder(
                      icon: Icons.email,
                      title: "Email",
                      obscure: false,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email()
                      ]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFildFormBuilder(
                      icon: Icons.key,
                      title: "Password",
                      obscure: true,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.45,
                child: CustomButton(
                  title: "ENTRAR",
                  callback: () {
                    if (loginController.formKey.currentState!.validate() &&
                        mounted) {
                      controller.auth(loginController.toAuth());
                    }
                  },
                ),
              ),
            ],
          )
        ],
      )),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: const Color.fromARGB(198, 156, 54, 54),
            width: MediaQuery.of(context).size.width * 0.45,
            height: MediaQuery.of(context).size.height * 0.09,
            child: TextButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const RegisterPage()));
                },
                child: const Text("Cadastre-se")),
          ),
          Container(
            color: const Color.fromARGB(198, 156, 54, 54),
            width: MediaQuery.of(context).size.width * 0.55,
            height: MediaQuery.of(context).size.height * 0.09,
            child: TextButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const RedefinirSenha()));
                },
                child: const Text("Esqueceu sua senha?")),
          ),
        ],
      ),
    );
  }
}
