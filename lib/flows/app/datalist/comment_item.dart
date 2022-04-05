import 'package:andersen_test1/config/colors.dart';
import 'package:andersen_test1/config/styles.dart';
import 'package:andersen_test1/data/models/comment.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({
    Key? key,
    required this.comment,
  }) : super(key: key);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.conifer,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                comment.name ?? "",
                style: AppTextStyles.bodyBold.copyWith(
                  color: AppColors.darkGrey,
                ),
              ),
              Text(
                comment.email ?? "",
                style: AppTextStyles.bodySBold.copyWith(
                  color: AppColors.darkGrey,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                comment.body ?? "",
                style: AppTextStyles.bodyS.copyWith(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
