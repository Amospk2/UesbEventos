import 'package:flutter/material.dart';
import 'package:uesb_eventos/ui/shared/widgets/custom_app_bar.dart';
import 'package:uesb_eventos/ui/shared/widgets/custom_text_title_widget.dart';
import 'redefinir_senha_confirmar_codigo.dart';

class RedefinirSenha extends StatelessWidget {
  const RedefinirSenha({super.key});

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
                "Para redefinir sua senha é necessario  informar \no email cadastrado para que o codigo de \n confirmação seja enviado.",
            label: "Email",
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
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const RedefinirSenhaConfirmarCodigo()));

            }, child: const Text("Enviar", style: TextStyle(color: Color.fromARGB(199, 200, 75, 75)))),
      ),
    );
  }
}
