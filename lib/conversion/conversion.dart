import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:transition/common/back.dart';
import 'package:transition/common/dropdownbtn.dart';
import 'package:transition/common/glow.dart';
import 'package:transition/common/speaker.dart';
import 'package:transition/common/toast.dart';
import 'package:transition/decoration/box.dart';
import 'package:transition/google_ml/translator.dart';
import 'package:transition/home/midpart.dart';
import 'package:translator_plus/translator_plus.dart';


   class Conversion extends StatefulWidget {
  const Conversion({super.key});

  @override
  State<Conversion> createState() => _ConversionState();
  static const routeName = "/con";
}

class _ConversionState extends State<Conversion> {
  TranslateLanguage newlanguage11 = TranslateLanguage.english;
  TranslateLanguage newlanguage22 = TranslateLanguage.nepali;
  bool animate1 = false;
  bool animate2 = false;
  bool animate3 = false;
  bool animate4 = false;
  String? person1 ;
  String? person2 ;
  GoogleTranslator translator = GoogleTranslator();
  final SpeechToText speechToText = SpeechToText();
  final SpeechToText speechToText22 = SpeechToText();
  bool speechEnabled = false;
  bool speechEnabled22 = false;

  @override
  void initState() {
    super.initState();

    _initSpeech();

    _initSpeech22();
  }

  void _initSpeech() async {
    speechEnabled = await speechToText.initialize();
    setState(() {});
  }

  void _initSpeech22() async {
    speechEnabled22 = await speechToText22.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void startListening(String languages) async {
    await speechToText.listen(
        localeId: languages,
        onResult: (SpeechRecognitionResult result) {
          setState(() async {
            textFromMic = result.recognizedWords;
            {
              try {
                translator.baseUrl =
                    'translate.googleapis.com'; // faster than translate.google.com

                var response = await translator.translate(
                    result.recognizedWords.toString(),
                    to: newlanguage22.bcpCode,
                    from: newlanguage11.bcpCode);
                setState(() {
                  person1 = response.text.toString();
                });
              } catch (e) {
                debugPrint('Error: $e');
                // Handle translation errors gracefully (e.g., display an error message)
              }
            }
          });
        });

    setState(() {});
  }

  void startListening22(String languages) async {
    await speechToText.listen(
        localeId: languages,
        onResult: (SpeechRecognitionResult result) {
          setState(() async {
            textFromMic = result.recognizedWords;
            {
              try {
                translator.baseUrl =
                    'translate.googleapis.com'; // faster than translate.google.com

                var response = await translator.translate(
                    result.recognizedWords.toString(),
                    to: newlanguage11.bcpCode,
                    from: newlanguage22.bcpCode);
                setState(() {
                  person2 = response.text.toString();
                });
              } catch (e) {
                debugPrint('Error: $e');
                // Handle translation errors gracefully (e.g., display an error message)
              }
            }
          });
        });

    setState(() {});
  }

  void stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void stopListening22() async {
    await speechToText22.stop();
    setState(() {});
  }

  String textFromMic="" ;

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
                 backButton(context),            SizedBox(
                    height: mQ.height * 0.04,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Conversion",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: mQ.height * 0.04,
                  ),
                  Text(
                    textFromMic,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 25),
                  ),
                  SizedBox(
                    height: mQ.height * 0.04,
                  ),
                  firstPerson(mQ, context),
                  SizedBox(
                    height: mQ.height * 0.039,
                  ),
                  Center(
                    child: Midpart(
                        dropdownButton1: myDropdownButton(
                          newlanguage11,
                          context,
                          (value) {
                            setState(() {
                              newlanguage11 = value!;
                            });
                          },
                        ),
                        dropdownButton2: myDropdownButton(
                          newlanguage22,
                          context,
                          (value) {
                            setState(() {
                              newlanguage22 = value!;
                            });
                          },
                        ),
                        mQ: mQ),
                  ),
                  SizedBox(
                    height: mQ.height * 0.045,
                  ),
                  secondPerson(mQ, context),
                ]),
          ),
        ),
      ),
    ));
  }

  Container firstPerson(Size mQ, BuildContext context) {
    return Container(
      height: mQ.height * 0.19,
      width: mQ.width,
      decoration: boxDecoration(context)
          .copyWith(borderRadius: BorderRadius.circular(40)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "\t${newlanguage11.name} person ",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 25),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    speechToText.isNotListening
                        ? startListening(
                            newlanguage11.bcpCode,
                          )
                        : stopListening();
                   
                    if (animate1 == false) {
                      setState(() {
                        animate1 = true;
                      });

                      toastMessage(context, "Listening");
                    } else {
                      setState(() {
                        animate1 = false;
                      });
                    }
                  },
                  child: glowMaker(animate1, context, mQ, Icons.mic)),
              GestureDetector(
                  onTap: () {
                    speaker(person2!, newlanguage11.lCode);
                    toastMessage(
                        context,
                        person2!.isEmpty
                            ? "Please used microphone before it !"
                            : "Speaking");
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Icon(
                      color: Theme.of(context).primaryColor,
                      size: 60,
                      Icons.volume_up_rounded,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Container secondPerson(Size mQ, BuildContext context) {
    return Container(
      height: mQ.height * 0.19,
      width: mQ.width,
      decoration: boxDecoration(context)
          .copyWith(borderRadius: BorderRadius.circular(40)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "\t${newlanguage22.name} person",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 25),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    speechToText22.isNotListening
                        ? startListening22(
                            newlanguage22.bcpCode,
                          )
                        : stopListening22();

                    if (animate3 == false) {
                      setState(() {
                        animate3 = true;
                      });

                      toastMessage(context, "Listening");
                    } else {
                      setState(() {
                        animate3 = false;
                      });
                    }
                  },
                  child: glowMaker(
                    animate3,
                    context,
                    mQ,
                    Icons.mic,
                  )),
              GestureDetector(
                  onTap: () {
                    toastMessage(
                        context,
                        person1!.isEmpty
                            ? "Please used microphone before it !"
                            : "Speaking");
                    speaker(person1!, newlanguage22.lCode);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Icon(
                      color: Theme.of(context).primaryColor,
                      size: 60,
                      Icons.volume_up_rounded,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
