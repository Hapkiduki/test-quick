import 'package:TestQuick/utils/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:TestQuick/utils/colors.dart';
import 'package:TestQuick/utils/dimens.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'users_page.dart';

class ChatUsersPage extends StatelessWidget {
  final DragState dragState;

  const ChatUsersPage({Key key, this.dragState: DragState.users})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors.black,
      padding: dimens.vertical(context, .05),
      child: Column(
        children: [
          Text(
            'Chats',
            style: TextStyle(
              color: colors.main,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: dragState == DragState.users
                  ? ListView.builder(
                      itemBuilder: (context, index) => Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: colors.main,
                          onTap: () {
                            Navigator.pushNamed(context, Routes.CHAT,
                                arguments: {'index': index});
                          },
                          child: _userChat(index, context),
                        ),
                      ),
                      itemCount: 10,
                      //shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                    )
                  : SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _userChat(int index, BuildContext context) {
    return Padding(
      padding: dimens.symetric(context, .05, .02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _photo(index, context),
          Container(
            width: dimens.width(context) * .7,
            padding: dimens.left(context, .05),
            child: Column(
              children: [
                _bodyUser(),
                _detailMessage(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _photo(int index, BuildContext context) => Hero(
        tag: 'user_123-$index',
        child: Stack(
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
        ),
      );

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
              color: colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          '12:18 a.m.',
          style: TextStyle(
            color: Colors.white38,
            //Colors.black38,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  _detailMessage(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            'Hola hijueputa bobo, venga le cuento un cuento! 😋😋',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: colors.white,
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
}
