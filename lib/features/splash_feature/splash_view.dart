import 'package:duka/core/utilities/color_asset.dart';
import 'package:duka/features/widgets/expanding_circle.dart';
import 'package:flutter/material.dart';
import 'package:duka/features/splash_feature/opening_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Route _createRoute() {
    return PageRouteBuilder(
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(
        milliseconds: 400,
      ),
      pageBuilder: (context, animation, secondaryAnimation) =>
          const OpeningView(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    pageChange();
  }

  void pageChange() {
    Future.delayed(
      const Duration(milliseconds: 2515),
    ).then((value) {
      return Navigator.pushReplacement(context, _createRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ExpandingCircle(
          circleColor: Palette.primaryColor,
        ),
      ),
    );
  }
}
