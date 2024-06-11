import 'dart:async';
import 'dart:developer';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import 'package:transition/common/toast.dart';

class OcsWidget extends StatefulWidget {
  const OcsWidget({super.key});

  @override
  State<OcsWidget> createState() => _OcsWidgetState();
  static const routeName = "/ocs";
}

class _OcsWidgetState extends State<OcsWidget> {
  final StreamController<String> _streamController = StreamController<String>();

  void setText(value) {
    _streamController.add(value);
  }

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
                    ListTile(
                      leading: InkWell(
                          onTap: () {
          Navigator.pop(context);
        },
                        child: Icon(
                                    Icons.arrow_back,
                                    color: Theme.of(context).primaryColor,
                                    size: 26,
                                  ),
                      ),
                      title: Center(
                        child: Text(
                          "Scan Text",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 25),
                        ),
                      ),
                    ),
                    Center(
                      child: ScalableOCR(
                          paintboxCustom: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 4.0
                            ..color = const Color.fromARGB(153, 102, 160, 241),
                          boxLeftOff: 77,
                          boxBottomOff: 10,
                          boxRightOff: 14,
                          boxTopOff: 20,
                          boxHeight: MediaQuery.of(context).size.height / 2.2,
                          getRawData: (value) {
                            inspect(value);
                          },
                          getScannedText: (value) {
                            setText(value);
                            debugPrint("scannedText :${value.toString()}");
                          }),
                    ),
                    StreamBuilder<String>(
                      stream: _streamController.stream,
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        return ListTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                                snapshot.data != null
                                    ? snapshot.data!
                                    : "No Data",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 25)),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              toastMessage(context, "Copied");
                              FlutterClipboard.copy(snapshot.data!)
                                  .then((value) => debugPrint("copied"));
                            },
                            icon: Icon(
                              Icons.copy_rounded,
                              color: Theme.of(context).primaryColor,
                              size: 26,
                            ),
                          ),
                        );
                      },
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
