import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:newsapp/src/pages/tab1_page.dart';
import 'package:newsapp/src/pages/tab2_page.dart';

class TabsPage extends StatelessWidget {
  
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: const NavigationBar(),
      ),
    );
  }
}

class _Pages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);
    return PageView(
      controller: navigationModel._pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const <Widget>[
        Tab1Page(),
        Tab2Page()
      ]
    );
  }
}

class NavigationBar extends StatelessWidget {
  
  const NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.currentPage,
      onTap: (index) => navigationModel.currentPage = index,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon( Icons.person_outline ),
          label: 'Para ti'
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.public ),
          label: 'Encabezados'
        ),
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    _pageController.animateToPage(value, duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}