part of 'app_state_cubit.dart';

@immutable
abstract class AppState extends Equatable {
  final RouteMap routeMap;

  const AppState({required this.routeMap});

  @override
  List<Object?> get props => [routeMap];
}

class SplashState extends AppState {
  SplashState()
      : super(
          routeMap: SplashRouteMap(),
        );
}

class UnauthorizedState extends AppState {
  UnauthorizedState()
      : super(
          routeMap: AuthRouteMap(),
        );
}

class AuthorizedState extends AppState {
  AuthorizedState() : super(routeMap: AppRouteMap());
}
