import 'package:flutter/material.dart';

import 'app_bottom_navigation_bar.dart';

class ServiceMainPage extends StatefulWidget {
  final int initialPage;
  final List<Widget> pages;
  final List<NavigationBarItem> navigationBarItems;

  const ServiceMainPage({
    required this.pages,
    required this.navigationBarItems,
    this.initialPage = 0,
    super.key,
  });

  @override
  State<ServiceMainPage> createState() => _ServiceMainPageState();
}

class _ServiceMainPageState extends State<ServiceMainPage> {
  late PageController pageController;
  int navIndex = 0;

  @override
  void initState() {
    super.initState();
    navIndex = widget.initialPage;
    pageController = PageController(keepPage: true, initialPage: navIndex);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: navIndex == 0,
      onPopInvokedWithResult: (_, result) => gotoPage(0),
      child: Scaffold(
        body: PageView(
          controller: pageController,
          allowImplicitScrolling: true,
          physics: const NeverScrollableScrollPhysics(),
          children: widget.pages,
        ),
        bottomNavigationBar: AppBottomNavigationBar(
          onIndexChanged: (i) => gotoPage(i),
          index: navIndex,
          items: widget.navigationBarItems,
        ),
      ),
    );
  }

  void gotoPage(int index) async {
    if (navIndex != index) {
      pageController.jumpToPage(index);

      setState(() {
        navIndex = index;
      });
    }
  }
}
