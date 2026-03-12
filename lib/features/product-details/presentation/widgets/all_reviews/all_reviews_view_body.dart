import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/widgets/custom_failure_message_with_button.dart';
import 'package:nova_store_app/core/widgets/rounded_app_bar.dart';
import 'package:nova_store_app/features/product-details/presentation/manager/manager/all_reviews_cubit/all_reviews_cubit.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/all_reviews/all_reviews_success_body.dart';

class AllReviewsViewBody extends StatelessWidget {
  const AllReviewsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllReviewsCubit, AllReviewsState>(
        builder: (context, state) {
      return switch (state) {
        AllReviewsLoading() => CustomScrollView(
            slivers: [
              const RoundedAppBar(title: 'Reviews'),
              const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        AllReviewsSuccess() => CustomScrollView(
            slivers: [
              const RoundedAppBar(title: 'Reviews'),
              SliverFillRemaining(
                hasScrollBody: true,
                child: AllReviewsSuccessBody(
                  comments: state.comments,
                  onRefresh: context.read<AllReviewsCubit>().getProductComments,
                ),
              ),
            ],
          ),
        AllReviewsFailure() => CustomScrollView(
            slivers: [
              const RoundedAppBar(title: 'Reviews'),
              SliverFillRemaining(
                child: CustomFailureMessageWithButton(
                  message: state.errorMessage,
                  onPressed: () =>
                      context.read<AllReviewsCubit>().getProductComments(),
                ),
              ),
            ],
          ),
      };
    });
  }
}
