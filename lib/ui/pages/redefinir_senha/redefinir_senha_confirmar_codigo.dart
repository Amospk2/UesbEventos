import 'package:flutter/material.dart';
import 'package:uesb_eventos/ui/shared/widgets/custom_app_bar.dart';
import 'package:uesb_eventos/ui/shared/widgets/custom_text_title_widget.dart';
import 'redefinir_senha_nova_senha.dart';

class RedefinirSenhaConfirmarCodigo extends StatelessWidget {
  const RedefinirSenhaConfirmarCodigo({super.key});

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
            title:
                "Informe o codigo enviado para o seu email:",
            label: "Codigo",
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
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const RedefinirSenhaNovaSenha()));
            }, child: const Text("Confirmar", style: TextStyle(color: Color.fromARGB(199, 200, 75, 75)))),
      ),
    );
  }
}