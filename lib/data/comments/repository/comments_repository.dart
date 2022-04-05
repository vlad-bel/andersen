import 'package:andersen_test1/data/models/comment.dart';

abstract class CommentsRepository {
  Future<List<Comment>> getComments({
    required int page,
    required int limit,
  });
}
