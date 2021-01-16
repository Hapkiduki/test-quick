import 'package:TestQuick/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:TestQuick/utils/dimens.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  //List<Usuario> usuarios = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text(
                'Chats',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => _userChat(),
                  itemCount: 10,
                  //shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userChat() {
    return Padding(
      padding: dimens.symetric(context, .05, .02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _photo(),
          Container(
            width: dimens.width(context) * .7,
            padding: dimens.left(context, .05),
            child: Column(
              children: [
                _bodyUser(),
                _detailMessage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _bodyUser() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            'Ester Esposito',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          '12:18 a.m.',
          style: TextStyle(
            color: Colors.black38,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  _detailMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            'Hola hijueputa bobo, venga le cuento un cuento! 😋😋',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        SizedBox(
          width: dimens.width(context) * .03,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: colors.main,
            child: Padding(
              padding: dimens.symetric(context, .03, .02),
              child: Text(
                '1',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _photo() => Stack(
        children: [
          ClipOval(
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              height: dimens.width(context) * .2,
              width: dimens.width(context) * .2,
              imageUrl:
                  'https://cdn2.actitudfem.com/media/files/images/2019/09/la-marquesita-elite.jpg',
              placeholder: (context, url) => SvgPicture.asset(
                'assets/icons/user.svg',
                fit: BoxFit.cover,
                height: dimens.height(context) * .24,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 4,
            child: Container(
              width: dimens.width(context) * .03,
              height: dimens.width(context) * .03,
              decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: BorderRadius.circular(100)),
            ),
          ),
        ],
      );
}
