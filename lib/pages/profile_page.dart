import 'dart:math';

import 'package:TestQuick/pages/users_page.dart';
import 'package:TestQuick/utils/colors.dart';
import 'package:TestQuick/utils/dimens.dart';
import 'package:TestQuick/widgets/buttons.dart';
import 'package:TestQuick/widgets/custom_input.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  final DragState dragState;

  ProfilePage({Key key, this.dragState}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  final Duration _animDuration = Duration(milliseconds: 500);

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: _animDuration,
    );

    animation = Tween<double>(begin: .2, end: .4).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOutBack,
    ));

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nameCtrl = TextEditingController();

    return Container(
      padding: dimens.top(context, .4),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            left: 0,
            right: 0,
            top: widget.dragState == DragState.users
                ? dimens.height(context) * .68
                : 10,
            duration: _animDuration,
            child: _header(context),
          ),
          AnimatedPositioned(
            left: 0,
            right: 0,
            top: widget.dragState == DragState.profile
                ? dimens.height(context) * .25
                : 0,
            duration: _animDuration,
            child: AnimatedSwitcher(
              duration: _animDuration,
              child: widget.dragState == DragState.users
                  ? SizedBox.shrink()
                  : Column(
                      children: [
                        Padding(
                          padding: dimens.all(context, .05),
                          child: Text(
                            'Andrés Felipe Corrales Ortiz',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: dimens.all(context, .02),
                          child: Text(
                            'tenkan.af@gmail.com',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                CustomInput(
                                  icon: Icons.perm_identity,
                                  placeholder: 'Nombre',
                                  keyboardType: TextInputType.text,
                                  textController: nameCtrl,
                                  color: colors.main,
                                ),
                                CustomInput(
                                  icon: Icons.people_alt_outlined,
                                  placeholder: 'Apellido',
                                  keyboardType: TextInputType.text,
                                  textController: nameCtrl,
                                  color: colors.main,
                                ),
                                buttons.circularButton(
                                  onPressed: () {},
                                  text: 'Actualizar datos',
                                  color: colors.black,
                                  textColor: colors.main,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Padding(
      padding: dimens.horizontal(context, .05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: widget.dragState == DragState.users
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () {},
            backgroundColor: colors.black,
            child: AnimatedCrossFade(
              crossFadeState: widget.dragState == DragState.users
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: Duration(seconds: 1),
              firstChild: Icon(
                Icons.border_color,
                color: colors.main,
              ),
              secondChild: Icon(
                Icons.close,
                color: colors.main,
              ),
            ),
          ),
          _photo(context),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {},
            backgroundColor: colors.black,
            child: Icon(
              Icons.logout,
              color: colors.main,
            ),
          ),
        ],
      ),
    );
  }

  Widget _photo(BuildContext context) {
    if (widget.dragState == DragState.users) {
      animationController.reverse();
    } else {
      animationController.forward();
    }

    return AnimatedBuilder(
      builder: (context, snapshot) {
        return InkWell(
          onTap: () {
            print('change Photo');
          },
          child: ClipOval(
            child: CachedNetworkImage(
              height: dimens.width(context) * animation.value,
              fit: BoxFit.cover,
              imageUrl:
                  'https://media-exp1.licdn.com/dms/image/C5603AQEYLYZnLxalqw/profile-displayphoto-shrink_100_100/0/1608647963887?e=1616630400&v=beta&t=zlvcMC-9ZMLLWVGlM8lFwYgQ-EGUIq2nqtQhe5kUxXI',
              placeholder: (context, url) => ClipOval(
                child: SvgPicture.asset(
                  'assets/icons/user.svg',
                  fit: BoxFit.cover,
                  height: dimens.height(context) * .24,
                ),
              ),
            ),
          ),
        );
      },
      animation: animationController,
    );
  }
}
