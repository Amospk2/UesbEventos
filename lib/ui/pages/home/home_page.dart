import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/core/providers/home/home_provider.dart';
import 'profile_page_view.dart';
import 'home_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeProvider _controller;

  @override
  void initState() {
    super.initState();
    _controller = context.read<HomeProvider>();
    _controller.indexBottomNavigationBar = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller.pageController,
        onPageChanged: (value) => _controller.changeIndex(value),
        children: [HomePageView(), ProfilePageView()],
      ),
      bottomNavigationBar: Consumer<HomeProvider>(
        builder: (context, value, child) => BottomNavigationBar(
          currentIndex: _controller.indexBottomNavigationBar,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 233, 233, 233),
          selectedItemColor: const Color.fromARGB(255, 5, 5, 5),
          unselectedItemColor:
              const Color.fromARGB(255, 43, 42, 42).withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (page) {
            _controller.changeIndex(page);
            _controller.pageController.animateToPage(
              _controller.indexBottomNavigationBar,
              duration: const Duration(milliseconds: 200),
              curve: Curves.ease,
            );
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Inicio',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Perfil',
              icon: Icon(Icons.perm_identity),
            ),
          ],
        ),
      ),
    );
  }
}
