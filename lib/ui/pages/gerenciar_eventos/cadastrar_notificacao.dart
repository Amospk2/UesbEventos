import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CadastrarNotificacao extends StatelessWidget {
  CadastrarNotificacao({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormBuilderState>();
  final options = [
    ['1', 'teste1@gmail.com'],
    ['2', 'teste2@gmail.com'],
    ['3', 'teste3@gmail.com'],
    ['4', 'teste4@gmail.com'],
    ['5', 'teste5@gmail.com'],
    ['6', 'teste6@gmail.com'],
    ['7', 'teste7@gmail.com'],
    ['8', 'teste8@gmail.com'],
    ['9', 'teste9@gmail.com'],
    ['10', 'teste10@gmail.com'],
    ['11', 'teste11@gmail.com'],
    ['12', 'teste12@gmail.com'],
    ['13', 'teste13@gmail.com'],
    ['14', 'teste14@gmail.com'],
    ['15', 'teste15@gmail.com'],
    ['16', 'teste16@gmail.com'],
    ['17', 'teste17@gmail.com'],
    ['18', 'teste18@gmail.com'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Notificação'),
        centerTitle: true,
      ),
      body: FormBuilder(
        key: formKey,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.only(top: 35, left: 10, right: 10),
          child: Column(
            children: [
              Column(
                children: const [
                  Text(
                    "Informe sua mensagem:",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Text("Para quem enviar:",
                          style: TextStyle(color: Colors.white, fontSize: 24)),
                      const Spacer(),
                      SizedBox(
                        height: 25,
                        width: 150,
                        child: ElevatedButton(
                            onPressed: () {
                              formKey.currentState!.fields['users']!.value !=
                                      null
                                  ? formKey.currentState!.fields['users']!
                                      .didChange(null)
                                  : formKey.currentState!.fields['users']!
                                      .didChange(
                                          options.map((e) => e[0]).toList());
                            },
                            child: const Text("Marcar/Des Todos")),
                      )
                    ],
                  ),
                  FormBuilderCheckboxGroup<String>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    name: 'users',
                    options: options
                        .map((e) => FormBuilderFieldOption(
                              value: e[0],
                              child: Text(
                                e[1],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ))
                        .toList(),
                    separator: const VerticalDivider(
                      width: 10,
                      thickness: 5,
                      color: Colors.red,
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.09,
        color: const Color.fromARGB(255, 253, 251, 251),
        child: TextButton(
            onPressed: () {},
            child: const Text("Enviar Notificação",
                style: TextStyle(color: Color.fromARGB(199, 200, 75, 75)))),
      ),
    );
  }
}
