import 'package:flutter/material.dart';
import 'package:transition/common/back.dart';



class SavedText extends StatefulWidget {
  const SavedText({super.key});

  @override
  State<SavedText> createState() => _SavedTextState();
  static const routeName = "/saved";
}

class _SavedTextState extends State<SavedText> {
  @override
  Widget build(BuildContext context) {
    var mQ = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (notification) {
              notification.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: mQ.height * 0.03,
                    ),
                   backButton(context),              SizedBox(
                      height: mQ.height * 0.08,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Saved",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: mQ.height * 0.25,
                    ),
                    Center(
                        child: Icon(
                      Icons.star,
                      color: Theme.of(context).primaryColor,
                      size: 26,
                    )),
                    Center(
                      child: RichText(
                          text: TextSpan(
                              text: "Save Key Phrase",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize:40),
                              children: [
                            TextSpan(
                              text:
                                  "\nTap the icon to save translation that\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tyou use most",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize:19),
                            )
                          ])),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
