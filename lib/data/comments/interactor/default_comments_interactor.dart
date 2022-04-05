import 'package:andersen_test1/data/comments/interactor/comments_interactor.dart';
import 'package:andersen_test1/data/comments/repository/comments_repository.dart';
import 'package:andersen_test1/data/models/comment.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: CommentsInteractor)
class DefaultCommentsInteractor extends CommentsInteractor {
  final CommentsRepository repository;

  DefaultCommentsInteractor({
    required this.repository,
  });

  @override
  Future<List<Comment>> getComments({required int page, required int limit}) {
    return repository.getComments(page: page, limit: limit);
  }
}
