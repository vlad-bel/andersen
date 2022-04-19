import 'package:andersen_test1/widget/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({
    Key? key,
    required this.initialTabPage,
  }) : super(key: key);

  final int initialTabPage;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final tabPage = TabPage.of(context);

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      bottomNavigationBar: CustomBottomNavBar(
        size: size,
        tabPage: tabPage,
      ),
      body: IndexedStack(
        index: tabPage.index,
        children: tabPage.stacks
            .map(
              (e) => PageStackNavigator(stack: e),
            )
            .toList(),
      ),
    );
  }
}
