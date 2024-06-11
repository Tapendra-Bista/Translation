import 'package:flutter/material.dart';
import 'package:transition/common/dropdownbtn.dart';
import 'package:transition/conversion/conversion.dart';
import 'package:transition/decoration/box.dart';
import 'package:transition/google_ml/translator.dart';
import 'package:transition/home/bttmpart.dart';
import 'package:transition/home/midpart.dart';
import 'package:transition/result/result.dart';
import 'package:transition/saved/saved.dart';
import 'package:translator_plus/translator_plus.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
  static const routeName = "/home";
}

class _HomeState extends State<Home> {
  var myfocusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();
  TranslateLanguage language11 = TranslateLanguage.english;
  TranslateLanguage language22 = TranslateLanguage.nepali;

  // Create a translator instance

  var afterTranslate = '';
  GoogleTranslator translator = GoogleTranslator();


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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: mQ.height * 0.02,
                    ),
                    ListTile(
                      leading: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SavedText.routeName);
                          },
                          icon: Icon(
                            Icons.star,
                            color: Theme.of(context).primaryColor,
                            size: 26,
                          )),
                      title: Center(
                        child: Text(
                          "Translate\t\t\t\t\t\t",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 25),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mQ.height * 0.01,
                    ),
                    Center(
                      child: Container(
                        height: mQ.height * 0.55,
                        width: mQ.width * 0.9,
                        decoration: boxDecoration(context)
                            .copyWith(borderRadius: BorderRadius.circular(40)),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: SizedBox(
                                  height: mQ.height * 0.47,
                                  child: TextField(
                                    focusNode: myfocusNode,
                                    onChanged: (value) async {
                                      try {
                                        translator.baseUrl =
                                            'translate.googleapis.com'; // faster than translate.google.com

                                        var response = await translator
                                            .translate(_textEditingController.text.toString(),
                                                to: language22.bcpCode,
                                                from: language11.bcpCode);
                                        setState(() {
                                          afterTranslate =
                                              response.text.toString();
                                        });
                                      } catch (e) {
                                        debugPrint('Error: $e');
                                        // Handle translation errors gracefully (e.g., display an error message)
                                      }
                                    },
                                    onSubmitted: (value) {
                                     
                                      _textEditingController.clear();

                                      Navigator.pushNamed(
                                          context, ResultDisplay.routeName,
                                          arguments: {
                                            'inputLang': value.toString(),
                                            'focus': myfocusNode,
                                            'l1': language11,
                                            'l2': language22,
                                            'afr': afterTranslate.toString()
                                          });
                                    },
                                    maxLines: null,
                                    expands: true,
                                    scrollPhysics: const ScrollPhysics(),
                                    scrollPadding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(fontSize: 25),
                                    keyboardType: TextInputType.text,
                                    controller: _textEditingController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Enter text",
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(fontSize: 25)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mQ.height * 0.04,
                    ),
                    Midpart(
                        dropdownButton1: myDropdownButton(
                          language11,
                          context,
                          (value) {
                            setState(() {
                              language11 = value!;
                            });
                          },
                        ),
                        dropdownButton2: myDropdownButton(
                          language22,
                          context,
                          (value) {
                            setState(() {
                              language22 = value!;
                            });
                          },
                        ),
                        mQ: mQ),
                    SizedBox(
                      height: mQ.height * 0.04,
                    ),
                    Bottompart(
                        onTapConversion: () {
                          Navigator.pushNamed(context, Conversion.routeName);
                        },
                        localeId: language11.bcpCode.toString(),
                        textEditingController: _textEditingController,
                        mQ: mQ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
