import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:smartsoil/Feature/comments/data/models/comment_model.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class UserCommentCard extends StatelessWidget {
  const UserCommentCard({super.key, required this.commentModel});
  final CommentModel commentModel;

  @override
  Widget build(BuildContext context) {
    var standerImage = 'https://cdn-icons-png.freepik.com/512/3033/3033143.png';
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 16,
                  backgroundImage:
                      commentModel.commenter.profilePic == standerImage
                          ? CachedNetworkImageProvider(
                              commentModel.commenter.profilePic,
                            )
                          : CachedNetworkImageProvider(
                              '$baseUrl${commentModel.commenter.profilePic}',
                            ),
                ),
                horizontalSpacing(10),
                Text(
                  commentModel.commenter.fullName,
                  style: AppStyle.font14Blacksemibold,
                ),
              ],
            ),
          ],
        ),
        verticalSpacing(10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xffE5E5E5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  Text(
                    '${DateTime.now().day.toString().padLeft(2, '0')} ${_getMonth(DateTime.now().month)} ${DateTime.now().year}',
                    style: AppStyle.font12Blackmedium,
                  ),
                ],
              ),
              verticalSpacing(5),
              ReadMoreText(
                commentModel.comment,
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimExpandedText: 'show less',
                trimCollapsedText: 'show more',
                colorClickableText: ColorManger.primaryColor,
                style: AppStyle.font12Blackmedium,
              ),
            ],
          ),
        )
      ],
    );
  }
}

String _getMonth(int month) {
  switch (month) {
    case 1:
      return 'Jan';
    case 2:
      return 'Feb';
    case 3:
      return 'Mar';
    case 4:
      return 'Apr';
    case 5:
      return 'May';
    case 6:
      return 'Jun';
    case 7:
      return 'Jul';
    case 8:
      return 'Aug';
    case 9:
      return 'Sep';
    case 10:
      return 'Oct';
    case 11:
      return 'Nov';
    case 12:
      return 'Dec';
    default:
      return '';
  }
}
