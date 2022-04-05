import 'package:andersen_test1/config/colors.dart';
import 'package:andersen_test1/config/styles.dart';
import 'package:andersen_test1/flows/app/datalist/comment_item.dart';
import 'package:andersen_test1/flows/app/datalist/datalist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataList extends StatefulWidget {
  const DataList({Key? key}) : super(key: key);

  @override
  State<DataList> createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  final scrollController = ScrollController();

  void _initProjectListController() {
    final cubit = BlocProvider.of<DataListCubit>(context);
    scrollController.addListener(
      () async {
        if (_isBottom) {
          await cubit.paginateComments();
        }
      },
    );
  }

  bool get _isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;

    return currentScroll == maxScroll;
  }

  @override
  void initState() {
    super.initState();
    _initProjectListController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<DataListCubit, DataListState>(builder: (
          context,
          state,
        ) {
          final cubit = BlocProvider.of<DataListCubit>(context);

          if (state is DataListError) {
            return Text(
              "Data error",
              style: AppTextStyles.bodyBold.copyWith(
                color: AppColors.red,
              ),
            );
          }
          if (state is DataListLoading) {
            return const CircularProgressIndicator();
          }

          final currState = state as DataListSuccess;
          final itemCount = currState.commentsList.length;

          return RefreshIndicator(
            onRefresh: () async {
              await cubit.init();
              return Future.value();
            },
            color: AppColors.green,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              controller: scrollController,
              itemCount: currState.pagination ? itemCount + 1 : itemCount,
              itemBuilder: (ctx, index) {
                if (index == itemCount) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: 16.0,
                        top: 16,
                      ),
                      child: CircularProgressIndicator(
                        color: AppColors.green,
                      ),
                    ),
                  );
                }

                final comment = currState.commentsList[index];

                return Padding(
                  padding: index == 0
                      ? const EdgeInsets.only(top: 12.0)
                      : EdgeInsets.zero,
                  child: CommentItem(
                    comment: comment,
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
