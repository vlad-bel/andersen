import 'package:andersen_test1/config/colors.dart';
import 'package:andersen_test1/config/resources.dart';
import 'package:andersen_test1/config/styles.dart';
import 'package:andersen_test1/widget/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:routemaster/routemaster.dart';

class TabBarItem extends StatelessWidget {
  const TabBarItem({
    Key? key,
    required this.tabPage,
    required this.tabItem,
    required this.size,
  }) : super(key: key);

  final TabPageState tabPage;
  final TabItem tabItem;
  final Size size;

  @override
  Widget build(BuildContext context) {
    setBottomBarIndex(int index, TabPageState tabPage) {
      tabPage.controller.animateTo(index);
    }

    return Container(
      width: 72,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.only(top: 4, bottom: 8),
      decoration: _decoration,
      child: InkWell(
        onTap: () => setBottomBarIndex(tabItem.index, tabPage),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                tabItem.iconPath,
                color: _color,
              ),
              const SizedBox(height: 4),
              Text(
                tabItem.title,
                textAlign: TextAlign.center,
                style: AppTextStyles.robotoRegular12.copyWith(color: _color),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color get _color {
    if (tabPage.controller.index != tabItem.index) {
      return AppColors.white.withOpacity(0.5);
    }

    return Colors.white;
  }

  BoxDecoration get _decoration {
    return BoxDecoration(
      image: const DecorationImage(
        image: AssetImage(
          Resources.addProjBackground,
        ),
      ),
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 16,
          offset: const Offset(0, 8),
        ),
      ],
    );
  }
}
