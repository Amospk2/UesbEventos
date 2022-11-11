import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/core/services/firebase/firebase_http_auth_service_imp.dart';
import 'package:uesb_eventos/ui/pages/login/login_page.dart';
import '../certificados/certificado_page.dart';
import '../evento/meus_eventos.dart';

// ignore: must_be_immutable
class ProfilePageView extends StatelessWidget {
  ProfilePageView({Key? key}) : super(key: key);

  List<String> options = ["Meus Eventos", "Certificados", "Sair"];

  @override
  Widget build(BuildContext context) {
    var email = context.read<RemoteServiceImp>().auth.currentUser != null
        ? context.read<RemoteServiceImp>().auth.currentUser!.email.toString()
        : "User Teste";
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Card(
            margin: const EdgeInsets.only(top: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            color: Colors.white,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 25,
                    child: Text("A"),
                  ),
                  title: Text(email),
                  trailing: const Icon(Icons.arrow_forward),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            color: Colors.white,
            child: ListView.separated(
              itemCount: options.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              separatorBuilder: (context, index) =>
                  const Divider(color: Colors.black),
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  if (options[index] == "Sair") {
                    if (context.read<RemoteServiceImp>().auth.currentUser !=
                        null) {
                      context.read<RemoteServiceImp>().logout();
                    }
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const LoginPage()));
                  } else if (options[index] == "Certificados") {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const CertificadoPage()));
                  } else if (options[index] == "Meus Eventos") {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => MeusEventos()));
                  }
                },
                title: Text(options[index]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
