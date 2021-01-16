import 'package:TestQuick/utils/colors.dart';
import 'package:TestQuick/utils/dimens.dart';
import 'package:TestQuick/utils/routes.dart';
import 'package:TestQuick/widgets/buttons.dart';
import 'package:TestQuick/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: dimens.height(context) * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _header(context),
                  _Form(),
                  _labels(context),
                  Text(
                    'Términos y condiciones de uso',
                    style: TextStyle(
                      color: colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Container _labels(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('¿No tienes cuenta?',
              style: TextStyle(
                color: colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              )),
          SizedBox(height: 10),
          GestureDetector(
            child: Text('Crea una ahora!',
                style: TextStyle(
                    color: colors.main,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.SIGNUP);
            },
          )
        ],
      ),
    );
  }

  Center _header(BuildContext context) {
    return Center(
      child: Container(
        width: dimens.width(context) * .40,
        margin: dimens.top(context, .1),
        child: Column(
          children: <Widget>[
            Image(image: AssetImage('assets/images/logo.png')),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 30),
                children: [
                  TextSpan(
                    text: 'Test',
                    style: TextStyle(
                      color: colors.white,
                    ),
                  ),
                  TextSpan(
                    text: 'Quick',
                    style: TextStyle(
                      color: colors.main,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textController: passCtrl,
            isPassword: true,
          ),
          buttons.circularButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.USERS, (route) => false);
            },
            text: 'Iniciar sesión',
            color: colors.main,
            textColor: colors.black,
          ),
        ],
      ),
    );
  }
}
