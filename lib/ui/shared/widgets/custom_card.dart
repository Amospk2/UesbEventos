import 'package:flutter/material.dart';
import '../../pages/evento/details_page.dart';

class CustomCardEvent extends StatelessWidget {
  final String name;
  final String asset;

  const CustomCardEvent({Key? key, required this.asset, required this.name})
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
            SizedBox(
              height: 180,
              width: MediaQuery.of(context).size.width * 0.5,
              child: ClipRRect(child: Image.asset(asset, fit: BoxFit.fill)),
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
