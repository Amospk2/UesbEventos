import 'package:flutter/material.dart';
import 'package:uesb_eventos/ui/pages/gerenciar_eventos/cadastrar_notificacao.dart';
import '../../shared/widgets/custom_app_bar.dart';

class GerenciarPage extends StatelessWidget {
  const GerenciarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final options = [
      "Visualizar Avaliações",
      "Atualizar a Timeline",
      "Cadastrar Certificados",
      "Gerenciar Frequência",
      "Suporte ao Evento",
      "Cadastrar Notificação",
      "Homologar Inscrição"
    ];
    return Scaffold(
      appBar: buildAppBar("Gerenciar Evento"),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              ListView.separated(
                itemCount: options.length,
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                separatorBuilder: (context, index) =>
                    const Divider(color: Colors.transparent),
                itemBuilder: (context, index) => ListTile(
                  tileColor: Colors.white,
                  textColor: Colors.black,
                  onTap: index == 5
                      ? () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => CadastrarNotificacao()))
                      : () {},
                  title: Text(
                    options[index],
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
