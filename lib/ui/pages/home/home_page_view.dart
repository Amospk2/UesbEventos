import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/core/services/firebase/firebase_http_auth_service_imp.dart';
import 'package:uesb_eventos/ui/pages/login/login_page.dart';
import '../../shared/widgets/custom_card.dart';

// ignore: must_be_immutable
class HomePageView extends StatefulWidget {
  HomePageView({super.key});

  List<String> eventNames = [
    "Maratona de Programação",
    "Semana da informatica",
    "Intensivão de Python",
    "Semana Gamer",
    "Tecnologia e Educação Tecnologia e Educação"
  ];

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  // ignore: prefer_typing_uninitialized_variables
  late final authUser;

  @override
  void initState() {
    super.initState();
    if(context.read<RemoteServiceImp>().auth.currentUser != null)  {
      authUser = context.read<RemoteServiceImp>().getUser();
    } else {
      authUser = null;
    }
    
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(children: [
            Container(
              height: size.height * 0.5 - 115,
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(50)),
                  image: DecorationImage(
                      image: AssetImage("assets/images/banner.jpeg"),
                      fit: BoxFit.fitHeight)),
            ),
            Positioned(
                right: 10,
                top: 100,
                child: PopupMenuButton(
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
                              title: const Text('Filtrar Por Tip'),
                              onTap: () {},
                            ),
                          ),
                        ])),
            Positioned(
              top: 75,
              right: 30,
              left: 25,
              child: Column(
                children: [
                  SizedBox(
                    child: TextField(
                        style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(color: Colors.white),
                          label: const Text("Procurar"),
                          border: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15)),
                        )),
                  ),
                  const Text(
                    "Portal De Eventos",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "${" " * 19}UESB",
                    style: const TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            if (authUser == null)
              Positioned(
                  top: 35,
                  left: 0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const LoginPage())),
                  )),
          ]),
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
              itemBuilder: (_, idx) => CustomCardEvent(
                  asset: "assets/images/home_events/${idx + 1}.png",
                  name: widget.eventNames[idx]),
            ),
          ),
        ],
      ),
    );
  }
}
