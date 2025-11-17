import 'package:flutter/material.dart';
import 'package:nova_store_app/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF4F3F4),
        body: SafeArea(child: const HomeViewBody()));
  }
}
