import 'package:andersen_test1/data/comments/repository/comments_repository.dart';
import 'package:andersen_test1/data/models/app_error.dart';
import 'package:andersen_test1/data/models/comment.dart';
import 'package:andersen_test1/network/api_manager.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: CommentsRepository)
class DefaultCommentsRepository extends CommentsRepository {
  final ApiManager apiManager;

  DefaultCommentsRepository({required this.apiManager});

  @override
  Future<List<Comment>> getComments({
    required int page,
    required int limit,
  }) async {
    late Response response;
    try {
      response = await apiManager.get(
        'comments',
        queryParameters: {
          "_page": page,
          "_limit": limit,
        },
      );

      final commentList = List<Comment>.from(
        response.data.map(
          (x) => Comment.fromJson(x),
        ),
      );

      return commentList;
    } catch (e) {
      throw AppError(error: e.toString());
    }
  }
}
