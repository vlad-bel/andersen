import 'package:andersen_test1/flows/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class SplashRouteMap extends RouteMap {
  SplashRouteMap() : super(onUnknownRoute: _onUnknownRoute, routes: _routes);

  static RouteSettings _onUnknownRoute(String route) => const Redirect('/');
  static final Map<String, PageBuilder> _routes = {
    '/': (_) => const MaterialPage(
          child: SplashPage(),
        ),
  };
}
