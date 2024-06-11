import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:transition/common/glow.dart';
import 'package:transition/common/toast.dart';
import 'package:transition/scanned/identifytext.dart';


class Bottompart extends StatefulWidget {
  const Bottompart({
    super.key,
    required this.mQ,
    required this.textEditingController,
    required this.localeId,
    required this.onTapConversion,
  });
  final Function() onTapConversion;
  final Size mQ;
  final TextEditingController textEditingController;
  final String localeId;
  @override
  State<Bottompart> createState() => _BottompartState();
}

class _BottompartState extends State<Bottompart> {
  bool animate = false;
  final SpeechToText _speechToText = SpeechToText();
  bool speechEnabled = false;
  String lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void startListening() async {
    await _speechToText.listen(
        localeId: widget.localeId, onResult: _onSpeechResult);

    setState(() {});
  }

  void stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: widget.onTapConversion,
          child: SizedBox(
            height: widget.mQ.height * 0.08,
            width: widget.mQ.width * 0.3,
            child: ListTile(
              title: Icon(
                Icons.people_alt_outlined,
                color: Theme.of(context).primaryColor,
                size: 40,
              ),
              subtitle: Center(
                child: Text(
                  "Conversion",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 15),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            _speechToText.isNotListening ? startListening() : stopListening();
            widget.textEditingController.text = lastWords;
            if (animate == false) {
              setState(() {
                animate = true;
              });
              toastMessage(context, "Listening");
            } else {
              setState(() {
                animate = false;
              });
            }
          },
          child:glowMaker(animate, context, widget.mQ, Icons.mic)
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, OcsWidget.routeName);
          },
          child: SizedBox(
            height: widget.mQ.height * 0.08,
            width: widget.mQ.width * 0.24,
            child: ListTile(
              title: Icon(
                Icons.camera_alt_outlined,
                color: Theme.of(context).primaryColor,
                size: 40,
              ),
              subtitle: Center(
                child: Text("Camera",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 15)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
