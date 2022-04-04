import 'package:andersen_test1/flows/auth/signin/signin_page.dart';
import 'package:andersen_test1/flows/auth/signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class AuthRouteMap extends RouteMap {
  AuthRouteMap()
      : super(
          onUnknownRoute: _onUnknownRoute,
          routes: _routes,
        );

  static RouteSettings _onUnknownRoute(String route) => const Redirect('/');

  static final Map<String, PageBuilder> _routes = {
    SigninPage.path: (_) => const MaterialPage(child: SigninPage()),
    SignupPage.path: (_) => const MaterialPage(child: SignupPage()),
  };
}

