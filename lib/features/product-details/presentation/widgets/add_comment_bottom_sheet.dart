import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/helpers/dialog_helper.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/core/widgets/custom_button.dart';
import 'package:nova_store_app/core/widgets/spacing/height_space.dart';
import 'package:nova_store_app/features/product-details/domain/params/add_comment_param.dart';
import 'package:nova_store_app/features/product-details/presentation/manager/manager/add_comment_cubit/add_comment_cubit.dart';
import 'package:nova_store_app/features/product-details/presentation/manager/manager/product_details_cubit/product_details_cubit.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/comment_text_form_field.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/star_rating_picker.dart';

class AddCommentBottomSheet extends StatefulWidget {
  const AddCommentBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: context.read<ProductDetailsCubit>()),
          BlocProvider.value(value: context.read<AddCommentCubit>()),
        ],
        child: const AddCommentBottomSheet(),
      ),
    );
  }

  @override
  State<AddCommentBottomSheet> createState() => _AddCommentBottomSheetState();
}

class _AddCommentBottomSheetState extends State<AddCommentBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  String comment = '';
  int _selectedRate = 5;

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    final productId =
        context.read<ProductDetailsCubit>().productDetailsEntity.id;

    context.read<AddCommentCubit>().addComment(
          AddCommentParam(
            productId: productId,
            comment: comment.trim(),
            rate: _selectedRate,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: context.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 28),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const HeightSpace(height: 20),
              Text(
                'Leave a Comment',
                style: AppTextStyles.bold17(context)
                    .copyWith(color: context.mainTextColor),
              ),
              const HeightSpace(height: 6),
              Text(
                'Share your experience with this product.',
                style: AppTextStyles.regular14(context)
                    .copyWith(color: const Color(0xff605A65)),
              ),
              const HeightSpace(height: 20),

              // Star rating row
              Text(
                'Rating',
                style: AppTextStyles.semiBold14(context)
                    .copyWith(color: context.mainTextColor),
              ),
              const HeightSpace(height: 8),
              StarRatingPicker(
                selected: _selectedRate,
                onChanged: (v) => setState(() => _selectedRate = v),
              ),
              const HeightSpace(height: 20),

              // Comment text field
              Text(
                'Comment',
                style: AppTextStyles.semiBold14(context)
                    .copyWith(color: context.mainTextColor),
              ),
              const HeightSpace(height: 8),
              CommentTextFormField(
                onSaved: (value) => comment = value!,
              ),

              const HeightSpace(height: 24),

              // Submit button
              BlocConsumer<AddCommentCubit, AddCommentState>(
                listener: (context, state) {
                  if (state is AddCommentSuccess) {
                    DialogHelper.showSuccessDialog(
                      context,
                      successMessage: 'Comment added successfully!',
                      btnOkOnPress: () => Navigator.of(context).pop(),
                    );
                  } else if (state is AddCommentFailure) {
                    DialogHelper.showErrorDialog(
                      context,
                      errorMessage: state.errorMessage,
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    isLoading: state is AddCommentLoading,
                    width: double.infinity,
                    height: 50.h,
                    borderRadius: 12.r,
                    backgroundColor: context.primaryColor,
                    onPressed: _submit,
                    child: Text(
                      'Submit',
                      style: AppTextStyles.semiBold14(context)
                          .copyWith(color: Colors.white),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
