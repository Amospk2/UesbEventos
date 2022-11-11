import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomEventsDetailsComponent extends StatelessWidget {
  const CustomEventsDetailsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const AutoSizeText(
          "Data: 17/08/2022",
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 5,
        ),
        const AutoSizeText(
          "Horario: 17H30",
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 5,
        ),
        const AutoSizeText(
          "Local: CPDS",
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 5,
        ),
        const AutoSizeText(
          "Público: Interno",
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 5,
        ),
        const AutoSizeText(
          "Tipo: Publico",
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notification_add,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share, color: Colors.white)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border, color: Colors.white))
          ],
        ),
      ],
    ));
  }
}
