import 'package:flutter/material.dart';

mySnackBar(context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    shape:const RoundedRectangleBorder(),
    duration: const Duration(seconds:3),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    content: Text(
      text,
      style: Theme.of(context).textTheme.headlineSmall,
    ),
  ));
}
