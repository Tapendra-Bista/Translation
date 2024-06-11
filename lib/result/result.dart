import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:transition/common/speaker.dart';
import 'package:transition/common/toast.dart';
import 'package:transition/result/language.dart';
import 'package:transition/result/toppart.dart';


import '../google_ml/translator.dart';

class ResultDisplay extends StatefulWidget {
  const ResultDisplay({
    super.key,
  });

  @override
  State<ResultDisplay> createState() => _ResultDisplayState();
  static const routeName = "/result";
}

class _ResultDisplayState extends State<ResultDisplay> {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as Map;
    var mQ = MediaQuery.of(context).size;
    var myfocus = arg['focus'] as FocusNode;
    var l1 = arg['l1'] as TranslateLanguage;
    var l2 = arg['l2'] as TranslateLanguage;

    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 55, bottom: 50, right: 80),
        child: FloatingActionButton.extended(
            backgroundColor: Theme.of(context).primaryColor,
            tooltip: "New translation",
            label: Text(
              "New translation",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 19),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            icon: Icon(
              Icons.add,
              color: Theme.of(context).cardColor.withOpacity(1),
              size: 26,
            ),
            onPressed: () {
              Navigator.pop(context);
              myfocus.requestFocus();
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
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
                    TopPart(mQ: mQ,countryName1: l1.name,countryName2: l2.name,countryText1: arg['inputLang'],countryText2: arg['afr'],),
                    SizedBox(
                      height: mQ.height * 0.08,
                    ),
                    Lang(
                      onPressed1: () {
                        toastMessage(context, "Copied");
                        FlutterClipboard.copy(arg['inputLang'] == null
                                ? "Empty"
                                : arg['inputLang']!)
                            .then((value) => debugPrint("copied"));
                      },
                      onPressed: () {
                        toastMessage(context, "Speaking");
                        speaker(arg['inputLang']!,l1.lCode);
                      },
                      mQ: mQ,
                      mainString: arg['inputLang']!,
                      langauage: l1.name,
                    ),
                    Center(
                      child: SizedBox(
                        width: mQ.width * 0.7,
                        child: Divider(
                          thickness: 2,
                          height: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mQ.height * 0.05,
                    ),
                    Lang(
                      onPressed1: () {
                        toastMessage(context, "Copied");
                        FlutterClipboard.copy(arg['afr']!)
                            .then((value) => debugPrint("copied"));
                      },
                      onPressed: () {
                        toastMessage(context, "Speaking");
                        speaker(arg['afr']!,l2.lCode);
                      },
                      mQ: mQ,
                      mainString: arg['afr']!,
                      langauage: l2.name,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
