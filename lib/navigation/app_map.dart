import 'package:andersen_test1/flows/app/datalist/datalist_page.dart';
import 'package:andersen_test1/flows/app/user_details/user_details_page.dart';
import 'package:andersen_test1/widget/tab_page.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final tabBarPageKey = GlobalKey();

class AppRouteMap extends RouteMap {
  AppRouteMap({
    int initialTabPage = 0,
  }) : super(
            onUnknownRoute: _onUnknownRoute,
            routes: _routes(
              initialTabPage: initialTabPage,
            ));

  static RouteSettings _onUnknownRoute(String route) => const Redirect('/');

  static Map<String, PageBuilder> _routes({
    required int initialTabPage,
  }) {
    return {
      '/': (_) => TabPage(
            pageBuilder: (child) => MaterialPage(child: child),
            child: TabBarPage(
              initialTabPage: initialTabPage,
              key: tabBarPageKey,
            ),
            paths: const [
              "/data_list",
              "/user_details",
            ],
          ),
      "/data_list": (_) => const MaterialPage(child: const DataList()),
      "/user_details": (_) => const MaterialPage(child: const UserDetails()),
    };
  }
}
