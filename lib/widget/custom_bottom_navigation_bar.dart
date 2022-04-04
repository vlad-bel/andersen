import 'package:andersen_test1/widget/tab_bar_item.dart';
import 'package:andersen_test1/widget/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.size,
    required this.tabPage,
  }) : super(key: key);

  final Size size;
  final TabPageState tabPage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(26)),
        ),
        width: size.width,
        height: 76,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: TabItem.values
              .map((e) => TabBarItem(
                    tabPage: tabPage,
                    tabItem: e,
                    size: size,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
