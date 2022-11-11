import 'package:flutter/material.dart';
import '../../shared/widgets/custom_app_bar.dart';

class CertificadoPage extends StatelessWidget {
  const CertificadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Certificado"),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  labelStyle: TextStyle(color: Colors.white),
                  label: Text("Buscar Certificado"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  suffixIcon: Icon(
                    (Icons.search),
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: Card(
                  color: Colors.white,
                  child: ListView.separated(
                    itemCount: 8,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    separatorBuilder: (context, index) =>
                        const Divider(color: Color.fromARGB(255, 80, 80, 80)),
                    itemBuilder: (context, index) => ListTile(
                      textColor: Colors.black,
                      onTap: () {},
                      title: Text("Certificado $index"),
                      trailing: const Icon(
                        Icons.download,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
            ],
          )),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.09,
        color: const Color.fromARGB(255, 253, 251, 251),
        child: ElevatedButton(
            onPressed: () {},
            child: Row(
              children: const [
                Spacer(),
                Text("Compartilhar",
                    style: TextStyle(color: Color.fromARGB(199, 200, 75, 75))),
                Spacer(),
                Icon(Icons.share)
              ],
            )),
      ),
    );
  }
}
