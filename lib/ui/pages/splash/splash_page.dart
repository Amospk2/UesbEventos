import 'package:flutter/material.dart';
import 'package:uesb_eventos/utils/config/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation = Tween<double>(begin: 1, end: 100).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Center(
          child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: animation.value / 100,
        curve: Curves.easeIn,
        child: Image.asset(
          "assets/images/splash.jpeg",
        ),
      )),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
