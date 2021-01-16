import 'package:flutter/material.dart';

import 'package:TestQuick/utils/colors.dart';
import 'package:TestQuick/utils/routes.dart';
import 'package:TestQuick/utils/dimens.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));

    controller.addListener(() async {
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
      }

      if (controller.status == AnimationStatus.dismissed) {
        Navigator.pushReplacementNamed(context, Routes.LOGIN);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    //_appState = context.watch<LoginProvider>().appState;

    return Scaffold(
      backgroundColor: colors.black,
      extendBodyBehindAppBar: true,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: quoteAnimation(),
      ),
    );
  }

  Widget quoteAnimation() {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) => Opacity(
        opacity: animation.value,
        child: Container(
          height: dimens.height(context),
          color: colors.main,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 0),
                Padding(
                  padding: dimens.vertical(context, .025),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: dimens.width(context) * 0.7,
                  ),
                ),
                SizedBox(height: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
