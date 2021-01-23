import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji_keyboard/flutter_emoji_keyboard.dart';

import 'package:TestQuick/utils/colors.dart';
import 'package:TestQuick/utils/dimens.dart';

import 'package:TestQuick/widgets/chat_message.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatPage extends StatefulWidget {
  ChatPage(this.arguments);

  final dynamic arguments;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();

  List<ChatMessage> _messages = [];

  bool showEmoji = false;

  @override
  void initState() {
    _messages.addAll([
      ChatMessage(
        text: 'Hola Perras! 😋😋',
        hour: '04:21 p.m',
        uid: '1234',
        animationController: new AnimationController(
            vsync: this, duration: Duration(milliseconds: 0))
          ..forward(),
      ),
      ChatMessage(
        text:
            'Hola que mas!, como va todo, cara la yuca no? eso es mero complique debewmos testear bien la aplicación',
        hour: '04:21 p.m',
        uid: '1234',
        animationController: new AnimationController(
            vsync: this, duration: Duration(milliseconds: 0))
          ..forward(),
      ),
      ChatMessage(
        text:
            'Hola que mas!, como va todo, cara la yuca no? eso es mero complique debewmos testear bien la aplicación',
        hour: '04:21 p.m',
        uid: '123',
        animationController: new AnimationController(
            vsync: this, duration: Duration(milliseconds: 0))
          ..forward(),
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            _header(),
            Flexible(
                child: ListView.builder(
              padding: dimens.horizontal(context, .03),
              physics: BouncingScrollPhysics(),
              itemCount: _messages.length,
              itemBuilder: (_, i) => _messages[i],
              reverse: true,
            )),
            Divider(height: 1),
            _inputChat(),
            if (showEmoji)
              EmojiKeyboard(
                onEmojiSelected: (Emoji emoji) {
                  print(emoji.category);
                  print(emoji.name);
                  print(emoji.text);
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _header() => SafeArea(
        child: Container(
          padding: dimens.vertical(context, .01),
          decoration: BoxDecoration(
            color: colors.main,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              BackButton(),
              SizedBox(
                width: dimens.width(context) * .02,
              ),
              _photo(),
              SizedBox(
                width: dimens.width(context) * .02,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ester Esposito',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'últ. vez hoy a las 12:47 a.m',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget _photo() {
    int index = widget.arguments['index'];
    return Hero(
      tag: 'user_123-$index',
      child: Stack(
        children: [
          ClipOval(
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              height: dimens.width(context) * .13,
              width: dimens.width(context) * .13,
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
            bottom: 6,
            right: 0,
            child: Container(
              width: dimens.width(context) * .03,
              height: dimens.width(context) * .03,
              decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              margin: dimens.fromLTRB(context, .02, 0, .02, .02),
              decoration: BoxDecoration(
                color: colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: AnimatedSwitcher(
                      duration: Duration(milliseconds: 1000),
                      child: !showEmoji
                          ? Icon(Icons.sentiment_satisfied_alt)
                          : Icon(Icons.keyboard),
                    ),
                    onPressed: () {
                      showEmoji = !showEmoji;
                      setState(() {});
                    },
                  ),
                  Flexible(
                    child: TextField(
                      minLines: 1,
                      maxLines: 2,
                      cursorColor: colors.black,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: 'Escribe un mensaje',
                      ),
                      controller: _textController,
                      onTap: () {
                        if (showEmoji) {
                          setState(() {
                            showEmoji = false;
                          });
                        }
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: () {
                      print('send a photo');
                    },
                  ),
                ],
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: AnimatedCrossFade(
              firstChild: Icon(
                Icons.mic_none,
                size: 28,
                color: colors.black,
              ),
              secondChild: Icon(
                Icons.send,
                size: 28,
                color: colors.black,
              ),
              crossFadeState: CrossFadeState.showFirst,
              duration: Duration(milliseconds: 250),
            ),
            heroTag: null,
            backgroundColor: colors.main,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            mini: true,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }

    super.dispose();
  }
}
