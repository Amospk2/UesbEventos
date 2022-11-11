import 'package:flutter/material.dart';
import 'package:uesb_eventos/ui/shared/widgets/custom_card_meus_eventos.dart';
import '../../shared/widgets/custom_app_bar.dart';

// ignore: must_be_immutable
class MeusEventos extends StatefulWidget {
  MeusEventos({super.key});

  List<String> eventNames = [
    "Maratona de Programação",
    "Semana da informatica",
    "Intensivão de Python",
    "Semana Gamer",
    "Tecnologia e Educação Tecnologia e Educação"
  ];

  @override
  State<MeusEventos> createState() => _MeusEventosState();
}

class _MeusEventosState extends State<MeusEventos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Meus Eventos", actions: [
        PopupMenuButton(
            icon: const Icon(
              Icons.filter_list_alt,
              color: Colors.white,
            ),
            color: Colors.white,
            itemBuilder: (context) => [
                  PopupMenuItem(
                    height: 5,
                    child: ListTile(
                      title: const Text('Filtrar Por Nome'),
                      onTap: () {},
                    ),
                  ),
                  PopupMenuItem(
                    height: 5,
                    child: ListTile(
                      title: const Text('Filtrar Por Data'),
                      onTap: () {},
                    ),
                  ),
                  PopupMenuItem(
                    height: 5,
                    child: ListTile(
                      title: const Text('Filtrar Por Tipo'),
                      onTap: () {},
                    ),
                  ),
                ])
      ]),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                color: const Color.fromARGB(255, 207, 107, 107),
                margin: const EdgeInsets.all(10),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 250,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: 5,
                  itemBuilder: (_, idx) => CustomCardMeusEventos(
                      asset: "assets/images/home_events/${idx + 1}.png",
                      name: widget.eventNames[idx]),
                ),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.black,),
      ),
    );
  }
}
