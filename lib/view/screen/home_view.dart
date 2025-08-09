import 'package:flutter/material.dart';
import '../widget/home/app_primary_header_container.dart';
import '../widget/home/appbar_home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppPrimaryHeaderContainer(
        child: Column(
          children: [
            AppbarHome(),   
          ],
        ),
      ),
    );
  }
}
