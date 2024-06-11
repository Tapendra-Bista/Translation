import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:transition/common/back.dart';


class TopPart extends StatefulWidget {
  const TopPart(
      {super.key,
      required this.mQ,
      required this.countryName1,
      required this.countryName2,
      required this.countryText1,
      required this.countryText2});
//flutter build apk --target-platform android-arm --analyze-size
  final Size mQ;
  final String countryName1;
  final String countryName2;
  final String countryText1;
  final String countryText2;
  @override
  State<TopPart> createState() => _TopPartState();
}

List<String> itemsName = [
  "Reverse translate",
  "Share",
  "Send feedback",
];

enum SampleItem { itemOne, itemTwo, itemThree }


class _TopPartState extends State<TopPart> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        backButton(context),
        SizedBox(
          width: widget.mQ.width * 0.35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.history,
                  color: Theme.of(context).primaryColor,
                  size: 24,
                ),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, "/saved"),
                child: Icon(
                  Icons.star,
                  color: Theme.of(context).primaryColor,
                  size: 24,
                ),
              ),
              PopupMenuButton<SampleItem>(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  iconColor: Theme.of(context).primaryColor,
                  iconSize: 24,
                  tooltip: "More",
                
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SampleItem>>[
                        PopupMenuItem<SampleItem>(
                          value: SampleItem.itemOne,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.swap_horiz,
                                color: Theme.of(context).primaryColor,
                                size: 24,
                              ),
                              Text(
                                itemsName[0],
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 18),
                              )
                            ],
                          ),
                        ),
                        PopupMenuItem<SampleItem>(
                          onTap: () async {
                            await Share.share(
                                "${widget.countryName1}\n\n${widget.countryText1}\n\n${widget.countryName2}\n\n${widget.countryText2}",
                                subject: "Transaltion",
                                sharePositionOrigin: Rect.fromCenter(
                                    center: Offset.zero,
                                    width: widget.mQ.width,
                                    height: widget.mQ.height));
                          },
                          value: SampleItem.itemTwo,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.share,
                                  color: Theme.of(context).primaryColor,
                                  size: 24,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  itemsName[1],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(fontSize: 18),
                                )
                              ],
                            ),
                          ),
                        ),
                        PopupMenuItem<SampleItem>(
                          value: SampleItem.itemThree,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.send,
                                color: Theme.of(context).primaryColor,
                                size: 24,
                              ),
                              Text(
                                itemsName[2],
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 18),
                              )
                            ],
                          ),
                        )
                      ]),
            ],
          ),
        ),
      ],
    );
  }
}
