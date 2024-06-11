import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

AvatarGlow glowMaker(bool myBool, context, mQ, IconData iconData) {
  return AvatarGlow(
    startDelay: const Duration(milliseconds: 1000),
    glowColor: myBool == true
        ? Theme.of(context).primaryColor.withOpacity(0.01)
        : Theme.of(context).scaffoldBackgroundColor,
    glowShape: BoxShape.circle,
    animate: myBool,
    curve: Curves.fastOutSlowIn,
    child: Material(
      elevation: 100,
      shape: const CircleBorder(),
      color: Colors.transparent,
      child: SizedBox(
          height: mQ.height * 0.08,
          width: mQ.width * 0.32,
          child: Icon(
            iconData,
            color: Theme.of(context).primaryColor,
            size: 60,
          )),
    ),
  );
}
