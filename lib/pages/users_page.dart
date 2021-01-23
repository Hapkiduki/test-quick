import 'package:flutter/material.dart';

import 'package:TestQuick/utils/colors.dart';
import 'package:TestQuick/utils/dimens.dart';

import 'package:TestQuick/pages/profile_page.dart';
import 'package:TestQuick/pages/chat_users_page.dart';

enum DragState {
  profile,
  users,
}

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  //List<Usuario> usuarios = [];

  double maxHeight;
  double minHeight;

  DragState _dragState = DragState.users;

  _onVerticalDrag(DragUpdateDetails details) {
    if (details.primaryDelta > 7) {
      setState(() {
        _dragState = DragState.profile;
      });
    } else if (details.primaryDelta < -4) {
      setState(() {
        _dragState = DragState.users;
      });
    }
  }

  double _getTopProfile() {
    if (_dragState == DragState.users) {
      return -maxHeight;
    } else {
      return -minHeight;
    }
  }

  double _getTopUsers() {
    if (_dragState == DragState.users) {
      return minHeight;
    } else {
      return maxHeight;
    }
  }

  @override
  Widget build(BuildContext context) {
    maxHeight = dimens.height(context) * .85;
    minHeight = dimens.height(context) * .15;

    return Scaffold(
      backgroundColor: colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOutBack,
                    top: _getTopProfile(),
                    left: 0,
                    right: 0,
                    height: dimens.height(context),
                    child: GestureDetector(
                      onVerticalDragUpdate: _onVerticalDrag,
                      child: ProfilePage(
                        dragState: _dragState,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOutBack,
                    top: _getTopUsers(),
                    left: 0,
                    right: 0,
                    height: dimens.height(context),
                    child: ChatUsersPage(
                      dragState: _dragState,
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
