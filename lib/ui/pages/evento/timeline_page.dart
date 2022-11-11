import 'package:flutter/material.dart';

import '../../shared/widgets/custom_app_bar.dart';
import 'components/custom_timeline_card.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Atividades do evento"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: const [
            CustomTimelineCard(
              title: "Dia 01",
              atividades: [
                "Palestra 9-10hrs",
                "Curso 9-10hrs",
                "Seminario 11-12hrs",
                "seminario 11-13hrs",
                "Palestra 14-16hrs",
              ],
              status: [
                Colors.green,
                Colors.green,
                Colors.yellow,
                Colors.yellow,
                Colors.white,
              ],
            ),

            CustomTimelineCard(
              title: "Dia 02",
              atividades: [
                "Seminario 11-12hrs",
                "seminario 11-13hrs",
                "Palestra 14-16hrs",
                "Palestra 15-16hrs",
                "Curso 16-18hrs",
                "Seminario 18-20hrs",
                "seminario 20-22hrs",
              ],
              status: [
                Colors.green,
                Colors.green,
                Colors.green,
                Colors.green,
                Colors.yellow,
                Colors.white,
                Colors.white,
              ],
            ),

            CustomTimelineCard(
              title: "Dia 03",
              atividades: [
                "Seminario 11-12hrs",
                "seminario 11-13hrs",
                "Palestra 14-16hrs",
                "Curso 16-18hrs",
                "Seminario 18-20hrs",
                "seminario 20-22hrs",
                "Palestra 20-21hrs",
              ],
              status: [
                Colors.green,
                Colors.green,
                Colors.green,
                Colors.yellow,
                Colors.white,
                Colors.white,
                Colors.white,
              ],
            ),
            CustomTimelineCard(
              title: "Dia 04",
              atividades: [
                "Seminario 11-12hrs",
                "seminario 11-13hrs",
                "Palestra 14-16hrs",
                "Palestra 15-16hrs",
                "Curso 16-18hrs",
                "Seminario 18-20hrs",
                "seminario 20-22hrs",
                "Palestra 20-21hrs",
              ],
              status: [
                Colors.green,
                Colors.green,
                Colors.green,
                Colors.green,
                Colors.yellow,
                Colors.white,
                Colors.white,
                Colors.white,
              ],
            ),
            
            
          ],
        ),
      ),
    );
  }
}
