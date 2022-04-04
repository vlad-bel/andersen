import 'package:andersen_test1/config/colors.dart';
import 'package:andersen_test1/config/styles.dart';
import 'package:andersen_test1/flows/auth/signin/bloc/signin_cubit.dart';
import 'package:andersen_test1/flows/auth/signup/bloc/signup_cubit.dart';
import 'package:andersen_test1/service/app_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sizer/sizer.dart';
import 'package:get_it/get_it.dart';

import 'navigation/app_state_cubit/app_state_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Routemaster.setPathUrlStrategy();

  // await TokenManager.removeTokenData();

  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final appStateCubit = AppStateCubit();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // value: appStateCubit,
      providers: [
        BlocProvider<AppStateCubit>(
          create: (context) => appStateCubit,
        ),
        BlocProvider<SignupCubit>(
          create: (_) => GetIt.instance.get<SignupCubit>(),
        ),
        BlocProvider<SigninCubit>(
          create: (_) => GetIt.instance.get<SigninCubit>(),
        ),
        // BlocProvider<SigninCubit>(
        //   create: (_) => GetIt.instance.get<SigninCubit>(),
        // ),
      ],
      child: BlocBuilder<AppStateCubit, AppState>(
        bloc: appStateCubit,
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              hideKeyboard(context);
            },
            child: Sizer(
              builder: (
                BuildContext context,
                Orientation orientation,
                DeviceType deviceType,
              ) {
                return MaterialApp.router(
                  scaffoldMessengerKey: snackbarKey,
                  title: 'Andersen Test',
                  debugShowCheckedModeBanner: false,
                  routeInformationParser: const RoutemasterParser(),
                  routerDelegate: RoutemasterDelegate(
                    routesBuilder: (context) => state.routeMap,
                  ),
                  theme: ThemeData(
                    appBarTheme: AppBarTheme(
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.almostBlack,
                      titleTextStyle: AppTextStyles.sfProDisplaySemiBold17,
                    ),
                    tabBarTheme: TabBarTheme(
                      indicator: const UnderlineTabIndicator(
                        borderSide:
                            BorderSide(width: 2, color: AppColors.green),
                      ),
                      labelStyle: AppTextStyles.bodyS,
                      labelColor: AppColors.almostBlack,
                      unselectedLabelStyle: AppTextStyles.bodyS,
                      unselectedLabelColor: AppColors.darkGrey,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void hideKeyboard(BuildContext context) {
    FocusScopeNode curFocus = FocusScope.of(context);
    if (!curFocus.hasPrimaryFocus && curFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }
}
