import 'package:TestQuick/utils/routes.dart';
import 'package:flutter/material.dart';

import 'package:TestQuick/utils/colors.dart';
import 'package:TestQuick/utils/dimens.dart';

import 'package:TestQuick/widgets/buttons.dart';
import 'package:TestQuick/widgets/custom_input.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
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
      padding: dimens.vertical(context, .05),
      child: Column(
        children: <Widget>[
          Text('¿Ya tienes una cuenta?',
              style: TextStyle(
                color: colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              )),
          SizedBox(height: 10),
          GestureDetector(
            child: Text('Ingresa ahora!',
                style: TextStyle(
                    color: colors.main,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.LOGIN);
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
  final nameCtrl = TextEditingController();
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
            icon: Icons.perm_identity,
            placeholder: 'Nombre',
            keyboardType: TextInputType.text,
            textController: nameCtrl,
          ),
          CustomInput(
            icon: Icons.people_alt_outlined,
            placeholder: 'Apellido',
            keyboardType: TextInputType.text,
            textController: nameCtrl,
          ),
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
            text: 'Crear cuenta',
            color: colors.main,
            textColor: colors.black,
          ),
        ],
      ),
    );
  }
}
