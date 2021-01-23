import 'package:TestQuick/utils/colors.dart';
import 'package:TestQuick/utils/dimens.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Messagetype {
  message,
  image,
  audio,
}

class ChatMessage extends StatelessWidget {
  final String text;
  final String hour;
  final String uid;
  final Messagetype messagetype;
  final AnimationController animationController;

  const ChatMessage({
    Key key,
    @required this.text,
    @required this.hour,
    @required this.uid,
    @required this.animationController,
    this.messagetype = Messagetype.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor:
            CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        child: Container(
          padding: dimens.bottom(context, .03),
          child: _message(),
        ),
      ),
    );
  }

  Widget _message() {
    return Align(
      alignment:
          this.uid == '123' ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: this.uid == '123'
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12.0),
            margin: this.uid == '123'
                ? EdgeInsets.only(right: 5, bottom: 5, left: 50)
                : EdgeInsets.only(left: 5, bottom: 5, right: 50),
            child: Text(
              this.text,
              style: TextStyle(color: Colors.black),
            ),
            decoration: BoxDecoration(
              color: this.uid == '123' ? colors.main : colors.white,
              borderRadius: this.uid == '123'
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )
                  : BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
            ),
          ),
          Padding(
            padding: this.uid == '123'
                ? const EdgeInsets.only(right: 8)
                : const EdgeInsets.only(left: 8),
            child: Text(
              this.hour,
              style: TextStyle(
                fontSize: 12,
                color: colors.white.withOpacity(.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
