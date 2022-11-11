import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../shared/widgets/custom_app_bar.dart';


class AvaliarPage extends StatelessWidget {
  const AvaliarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Avaliar"),
      body: ListView(padding: const EdgeInsets.all(15), children: [
        const SizedBox(
          height: 50,
        ),
        const Text(
          "O quão satisfeito você está com o evento:",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        const SizedBox(
          height: 15,
        ),
        const TextField(
            maxLines: 5,
            decoration: InputDecoration(
              focusColor: Colors.white,
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            )),
        const SizedBox(
          height: 15,
        ),
        Center(
          child: RatingBar.builder(
            itemSize: 50,
            initialRating: 0,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, indx) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {},
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ]),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.09,
        color: const Color.fromARGB(255, 253, 251, 251),
        child: TextButton(
            onPressed: () {},
            child: const Text("Enviar",
                style: TextStyle(color: Color.fromARGB(199, 200, 75, 75)))),
      ),  
    );
  }
}
