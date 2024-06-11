import 'package:flutter/material.dart';
import 'package:transition/decoration/box.dart';


class Midpart extends StatefulWidget {
  const Midpart({
    super.key,
    required this.mQ,
    required this.dropdownButton1,
    required this.dropdownButton2,
  });

  final Size mQ;
  final Widget dropdownButton1;
  final Widget dropdownButton2;
  @override
  State<Midpart> createState() => _MidpartState();
}

class _MidpartState extends State<Midpart> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: widget.mQ.height * 0.08,
          width: widget.mQ.width * 0.35,
          decoration: boxDecoration(context)
              .copyWith(borderRadius: BorderRadiusDirectional.circular(20)),
          child: widget.dropdownButton1,
        ),
        Icon(
          Icons.swap_horiz,
          size: 26,
          color: Theme.of(context).primaryColor,
        ),
        Container(
            height: widget.mQ.height * 0.08,
            width: widget.mQ.width * 0.35,
            decoration: boxDecoration(context)
                .copyWith(borderRadius: BorderRadiusDirectional.circular(20)),
            child: widget.dropdownButton2),
      ],
    );
  }
}
