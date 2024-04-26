import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/comments/logic/comment_cubite/comment_cubit.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/Feature/comments/presenataion/widgets/user_comment_card.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/widgets/app_text_formfield.dart';
import 'package:smartsoil/core/widgets/custom_sliver_app_bar.dart';

class CommentsViewBody extends StatefulWidget {
  const CommentsViewBody({Key? key, required this.productModel})
      : super(key: key);
  final StoreProductModel productModel;

  @override
  State<CommentsViewBody> createState() => _CommentsViewBodyState();
}

class _CommentsViewBodyState extends State<CommentsViewBody> {
  @override
  void initState() {
    BlocProvider.of<CommentCubit>(context)
        .getComments(productId: widget.productModel.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentCubit, CommentState>(
      builder: (context, state) {
        if (state is GetCommentsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManger.primaryColor,
            ),
          );
        } else if (state is GetCommentsSuccess) {
          if (state.comments.isNotEmpty) {}
          var cubit = BlocProvider.of<CommentCubit>(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: <Widget>[
                        const CustomSliverAppBar(
                          titleText: 'Reviews & Ratings',
                          centerTitle: false,
                        ),
                        BlocBuilder<CommentCubit, CommentState>(
                          builder: (context, state) {
                            return SliverToBoxAdapter(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 8.h, top: 8.h),
                                          child: UserCommentCard(
                                            commentModel:
                                                BlocProvider.of<CommentCubit>(
                                                        context)
                                                    .commentsList[index],
                                          ),
                                        );
                                      },
                                      itemCount:
                                          BlocProvider.of<CommentCubit>(context)
                                              .commentsList
                                              .length,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  CustomTextFormFiled(
                    onFieldSubmitted: (comment) {
                      if (comment.trim().isNotEmpty) {
                        sendComment(cubit, context);
                      }
                    },
                    obscureText: false,
                    hintText: 'Write a review',
                    controller: cubit.commentsController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter your review';
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        String comment = cubit.commentsController.text;
                        if (comment.trim().isNotEmpty) {
                          sendComment(cubit, context);
                        }
                      },
                      icon: const Icon(
                        Icons.send,
                        color: ColorManger.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is GetCommentsError) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManger.primaryColor,
            ),
          );
        }
      },
    );
  }

  void sendComment(CommentCubit cubit, BuildContext context) {
    cubit.addComment(productId: widget.productModel.id);
    FocusScope.of(context).unfocus();
    cubit.commentsController.clear();
  }
}
