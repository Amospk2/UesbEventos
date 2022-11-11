import 'package:flutter/material.dart';
import 'package:uesb_eventos/ui/shared/widgets/custom_app_bar.dart';
import 'package:uesb_eventos/ui/shared/widgets/custom_text_title_widget.dart';
import '../login/login_page.dart';

class RedefinirSenhaNovaSenha extends StatelessWidget {
  const RedefinirSenhaNovaSenha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  buildAppBar("Redefinir Senha"),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          SizedBox(
            height: 65,
          ),
          CustomTextTitleWidget(
            maxLines: 1,
            isPassword: true,
            title:
                "Nova Senha:",
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextTitleWidget(
            maxLines: 1,
            isPassword: true,
            title:
                "Confirmar Nova Senha:",
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.09,
        color: const Color.fromARGB(255, 253, 251, 251),
        child:
            TextButton(onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>const LoginPage()), (route) => route is LoginPage,);
            }, child: const Text("Redefinir", style: TextStyle(color: Color.fromARGB(199, 200, 75, 75)))),
      ),
    );
  }
}