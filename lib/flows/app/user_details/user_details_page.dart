import 'package:andersen_test1/config/colors.dart';
import 'package:andersen_test1/config/styles.dart';
import 'package:andersen_test1/flows/app/user_details/user_details_cubit.dart';
import 'package:andersen_test1/navigation/app_state_cubit/app_state_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<UserDetailsCubit, UserDetailsState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<UserDetailsCubit>(context);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            state.user?.email ?? 'no data',
                            style: AppTextStyles.h2.copyWith(
                              color: AppColors.darkGrey,
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: CupertinoButton(
                              child: const Icon(
                                Icons.logout,
                                color: AppColors.red,
                              ),
                              onPressed: () {
                                cubit.logout(logout: () {
                                  final appCubit =
                                      BlocProvider.of<AppStateCubit>(context);
                                  appCubit.logout();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "id: ${state.user?.id ?? 'no data'}",
                    style: AppTextStyles.bodyBold.copyWith(
                      color: AppColors.darkGreen,
                    ),
                  ),
                  Text(
                    "register time: ${state.user?.registerTime ?? 'no data'}",
                    style: AppTextStyles.bodyBold.copyWith(
                      color: AppColors.darkGreen,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
