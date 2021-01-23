import 'package:TestQuick/pages/users_page.dart';
import 'package:TestQuick/utils/colors.dart';
import 'package:flutter/material.dart';

import 'pages/chat_page.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';
import 'pages/splash_page.dart';

import 'utils/fade_route.dart';
import 'utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TestQuick',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: colors.black,
        ),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                builder: (_) => SplashPage(),
              );
              break;

            case Routes.LOGIN:
              return FadeRoute(widget: LoginPage());
              break;

            case Routes.SIGNUP:
              return FadeRoute(widget: SignupPage());
              break;

            case Routes.USERS:
              return FadeRoute(widget: UsersPage());
              break;

            case Routes.CHAT:
              return FadeRoute(widget: ChatPage(settings.arguments));
              break;

            default:
              return MaterialPageRoute(
                builder: (_) => SplashPage(),
              );
          }
        });
  }
}
