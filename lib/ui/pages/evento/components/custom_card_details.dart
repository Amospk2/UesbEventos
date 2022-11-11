import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomCardDetailsPage extends StatelessWidget {
  const CustomCardDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 200,
      child: Card(
        color: Colors.grey[500],
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(8),
        child: InkWell(
          onTap: () {
          },
          child: Column(
            children: [
              SizedBox(
                child: ClipRRect(
                    child: Image.asset("assets/images/home_events/1.png",
                        fit: BoxFit.fill)),
              ),
              const SizedBox(
                height: 5,
              ),
              const AutoSizeText("Maratona de Programação",
              textAlign: TextAlign.center,
              softWrap: true  ,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 255, 253, 253),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
