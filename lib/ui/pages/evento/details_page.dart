import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:uesb_eventos/ui/pages/evento/timeline_page.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/custom_button.dart';
import 'avaliar_page.dart';
import 'components/custom_card_details.dart';
import 'components/events_details.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Descrição do evento"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.vertical,
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          Row(
            children: const [
              CustomCardDetailsPage(),
              CustomEventsDetailsComponent()
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 15,
              ),
              CustomButton(
                  title: "TimeLine",
                  callback: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const TimelinePage())));
                  }),
              const SizedBox(
                width: 15,
              ),
              CustomButton(
                  title: "Avaliar",
                  callback: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const AvaliarPage())));
                  })
            ],
          ),
          const Card(
            color: Colors.white,
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: AutoSizeText(
                '''A Maratona SBC de Programação é um evento da Sociedade Brasileira de Computação que existe desde o ano de 1996. Desde o ano de 2006 o evento vem sendo realizado em parceria com a Fundação Carlos Chagas. A Maratona nasceu das competições regionais classificatórias para as finais mundiais do concurso de programação da ACM, o ACM International Collegiate Programming Contest, e é parte da regional sulamericana do concurso.
          Ela se destina a alunos de cursos de graduação e início de pós-graduação na área de Computação e afins (Ciência da Computação, Engenharia de Computação, Sistemas de Informação, Matemática, etc). A competição promove nos alunos a criatividade, a capacidade de trabalho em equipe, a busca de novas soluções de software e a habilidade de resolver problemas sob pressão. De ano para ano temos observado que as instituições e principalmente as grandes empresas da área têm valorizado os alunos que participam da Maratona.
          Várias universidades do Brasil desenvolvem concursos locais para escolher os melhores times para participar da Maratona de Programação. Estes times competem na Maratona (e portanto na regional sul americana) de onde os melhores serão selecionados para participar das Finais Mundiais do evento e a UESB realiza neste final de semana maratona para selecionar os seus representantes. 
          ''',
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.09,
        color: const Color.fromARGB(255, 253, 251, 251),
        child: TextButton(
            onPressed: () {},
            child: const Text("Realizar Inscrição",
                style: TextStyle(color: Color.fromARGB(199, 200, 75, 75)))),
      ),
    );
  }
}
