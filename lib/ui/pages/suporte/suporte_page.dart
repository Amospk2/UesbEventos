import 'package:flutter/material.dart';
import 'package:uesb_eventos/ui/shared/widgets/custom_app_bar.dart';
import 'package:uesb_eventos/ui/shared/widgets/custom_text_title_widget.dart';


class SuportePage extends StatelessWidget {
  const SuportePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Fale Conosco"),
      body: ListView(padding: const EdgeInsets.all(15), children: const [
         SizedBox(
          height: 50,
        ),
        CustomTextTitleWidget(
          maxLines: 1,
          title: "Informe o seu Email:",
        ),
        SizedBox(height: 15,),
        CustomTextTitleWidget(
          maxLines: 5,
          title: "Descreva o seu problema:",
        ),
        SizedBox(
          height: 15,
        ),
      
      ]),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.09,
        color: const Color.fromARGB(255, 253, 251, 251),
        child:
            TextButton(onPressed: () {
            }, child: const Text("Enviar", style: TextStyle(color: Color.fromARGB(199, 200, 75, 75)))),
      ),
    );
  }
}
