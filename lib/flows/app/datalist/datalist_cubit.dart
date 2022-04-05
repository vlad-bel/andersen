import 'package:andersen_test1/data/comments/interactor/comments_interactor.dart';
import 'package:andersen_test1/data/models/app_error.dart';
import 'package:andersen_test1/data/models/comment.dart';
import 'package:andersen_test1/service/app_notifier.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

abstract class DataListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DataListLoading extends DataListState {}

class DataListSuccess extends DataListState {
  final bool pagination;
  final List<Comment> commentsList;

  DataListSuccess({
    required this.commentsList,
    this.pagination = false,
  });

  @override
  List<Object?> get props => [
        commentsList,
        pagination,
      ];
}

class DataListError extends DataListState {}

@singleton
class DataListCubit extends Cubit<DataListState> {
  DataListCubit() : super(DataListLoading()) {
    init();
  }

  final commentsInteractor = GetIt.instance.get<CommentsInteractor>();

  var page = 1;
  final limit = 20;

  Future init() async {
    emit(DataListLoading());
    try {
      final commentsList = await commentsInteractor.getComments(
        page: page,
        limit: limit,
      );

      emit(DataListSuccess(commentsList: commentsList));
    } on AppError catch (e) {
      emit(DataListError());
      showMessage(message: e.error, type: NotifyType.error);
    }
  }

  Future<void> paginateComments() async {
    try {
      var currState = state as DataListSuccess;
      final comments = currState.commentsList;

      emit(DataListSuccess(
        pagination: true,
        commentsList: comments,
      ));

      page++;

      final newComments = await commentsInteractor.getComments(
        page: page,
        limit: limit,
      );
      await Future.delayed(const Duration(seconds: 1));

      comments.addAll(newComments);

      emit(DataListSuccess(
        commentsList: comments,
      ));
    } on AppError catch (e) {
      emit(DataListError());
      showMessage(message: e.error, type: NotifyType.error);
    }
  }
}
