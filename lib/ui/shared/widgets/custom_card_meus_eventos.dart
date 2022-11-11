import 'package:flutter/material.dart';
import '../../pages/evento/details_page.dart';
import '../../pages/gerenciar_eventos/gerenciar_page.dart';

class CustomCardMeusEventos extends StatelessWidget {
  final String name;
  final String asset;

  const CustomCardMeusEventos(
      {Key? key, required this.asset, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const DetailsPage())),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 180,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ClipRRect(child: Image.asset(asset, fit: BoxFit.fill)),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: PopupMenuButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Color.fromARGB(255, 255, 0, 0),
                    ),
                    color: Colors.white,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        height: 5,
                        child: ListTile(
                          title: const Text('Gerenciar'),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => const GerenciarPage())),
                        ),
                      ),
                      PopupMenuItem(
                        height: 5,
                        child: ListTile(
                          title: const Text('Editar'),
                          onTap: (){},
                        ),
                      ),
                      PopupMenuItem(
                        height: 5,
                        child: ListTile(
                          title: const Text('Editar'),
                          onTap: (){},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: Text(name,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    overflow: TextOverflow.visible,
                    fontSize: 18,
                    color: Color.fromARGB(255, 255, 253, 253),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
