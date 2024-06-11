import 'package:flutter/material.dart';

Align backButton(context) {
  return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: FittedBox(
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
            size: 26,
          ),
        ),
      ));
}
