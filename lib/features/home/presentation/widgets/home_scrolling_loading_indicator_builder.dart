import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/widgets/sliver_scrolling_loading_indicator.dart';
import 'package:nova_store_app/features/home/presentation/manager/home_products_cubit/home_products_cubit.dart';
import 'package:nova_store_app/features/home/presentation/manager/home_products_cubit/home_products_state.dart';

class HomeScrollingLoadingIndicatorbuilder extends StatelessWidget {
  const HomeScrollingLoadingIndicatorbuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeProductsCubit, HomeProductsState>(
      builder: (context, state) {
        return state is HomeProductsLoadingMore
            ? SliverScrollingLoadingIndIcator()
            : SliverToBoxAdapter(
                child: SizedBox(),
              );
      },
    );
  }
}
