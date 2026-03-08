import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/core/widgets/spacing/height_space.dart';
import 'package:nova_store_app/features/product-details/domain/params/add_comment_param.dart';
import 'package:nova_store_app/features/product-details/presentation/manager/manager/add_comment_cubit/add_comment_cubit.dart';
import 'package:nova_store_app/features/product-details/presentation/manager/manager/product_details_cubit/product_details_cubit.dart';

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
  final _commentController = TextEditingController();
  int _selectedRate = 5;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final productId =
        context.read<ProductDetailsCubit>().productDetailsEntity.id;

    context.read<AddCommentCubit>().addComment(
          AddCommentParam(
            productId: productId,
            comment: _commentController.text.trim(),
            rate: _selectedRate,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddCommentCubit, AddCommentState>(
      listener: (context, state) {
        if (state is AddCommentSuccess) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Comment added successfully!')),
          );
        } else if (state is AddCommentFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      child: Padding(
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
                // drag handle
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
                _StarRatingPicker(
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
                TextFormField(
                  controller: _commentController,
                  minLines: 3,
                  maxLines: 5,
                  inputFormatters: [LengthLimitingTextInputFormatter(300)],
                  style: AppTextStyles.regular14(context)
                      .copyWith(color: context.mainTextColor),
                  decoration: InputDecoration(
                    hintText: 'Write your comment here...',
                    hintStyle: AppTextStyles.regular14(context)
                        .copyWith(color: const Color(0xff605A65)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: context.primaryColor),
                    ),
                    contentPadding: const EdgeInsets.all(14),
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return 'Comment cannot be empty';
                    }
                    return null;
                  },
                ),
                const HeightSpace(height: 24),

                // Submit button
                BlocBuilder<AddCommentCubit, AddCommentState>(
                  builder: (context, state) {
                    final isLoading = state is AddCommentLoading;
                    return SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: FilledButton(
                        onPressed: isLoading ? null : _submit,
                        style: FilledButton.styleFrom(
                          backgroundColor: context.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: isLoading
                            ? const SizedBox(
                                height: 22,
                                width: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                'Submit',
                                style: AppTextStyles.bold15(context)
                                    .copyWith(color: Colors.white),
                              ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Star rating picker ────────────────────────────────────────────

class _StarRatingPicker extends StatelessWidget {
  const _StarRatingPicker({
    required this.selected,
    required this.onChanged,
  });

  final int selected;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (i) {
        final star = i + 1;
        return GestureDetector(
          onTap: () => onChanged(star),
          child: Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Icon(
              star <= selected ? Icons.star_rounded : Icons.star_outline_rounded,
              color: star <= selected
                  ? const Color(0xffFFC107)
                  : Colors.grey.shade400,
              size: 32,
            ),
          ),
        );
      }),
    );
  }
}
