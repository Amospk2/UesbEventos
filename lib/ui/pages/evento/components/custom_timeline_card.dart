import 'package:flutter/material.dart';

class CustomTimelineCard extends StatelessWidget {
  final String title;
  final List<String> atividades;
  final List<Color> status;
  const CustomTimelineCard(
      {Key? key, required this.title, required this.atividades, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 117, 215, 245)),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 25),
          ),
          Card(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 4
                ),

                itemCount: atividades.length,
                itemBuilder: (context, index) => Container(
                  height: 35,
                  color: status[index],
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    atividades[index],
                    style: const TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
