import 'package:flutter/material.dart';

class Lang extends StatefulWidget {
  const Lang({
    super.key,
    required this.onPressed,
    required this.onPressed1,
    required this.mQ,
    required this.mainString,
    required this.langauage,
  });
  final String langauage;
  final String mainString;
  final Function() onPressed;
  final Function() onPressed1;
  final Size mQ;

  @override
  State<Lang> createState() => _LangState();
  // instance of class
}

class _LangState extends State<Lang> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            widget.langauage,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 19),
          ),
        ),
        SizedBox(
          height: widget.mQ.height * 0.01,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.mainString,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 26),
          ),
        ),
        SizedBox(
          height: widget.mQ.height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: widget.onPressed,
              icon: Icon(
                Icons.volume_up_rounded,
                color: Theme.of(context).primaryColor,
                size: 26,
              ),
            ),
            IconButton(
              onPressed: widget.onPressed1,
              icon: Icon(
                Icons.copy_rounded,
                color: Theme.of(context).primaryColor,
                size: 26,
              ),
            ),
          ],
        ),
        SizedBox(
          height: widget.mQ.height * 0.01,
        ),
      ],
    );
  }
}
