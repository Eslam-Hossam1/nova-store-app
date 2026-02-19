import 'package:flutter/material.dart';
import 'package:nova_store_app/core/widgets/custom_circular_progress_indecator.dart';

class SliverScrollingLoadingIndIcator extends StatelessWidget {
  const SliverScrollingLoadingIndIcator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: CustomCircularProgressIndicator(),
        ),
      ),
    );
  }
}
