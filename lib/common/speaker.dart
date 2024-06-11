 import 'package:flutter_tts/flutter_tts.dart';

FlutterTts tts = FlutterTts();
  Future<void> speaker(String langString,String setLanguage) async {
    await tts.setVolume(1);
    await tts.setPitch(1);
    await tts.setLanguage(setLanguage);
    await tts.speak(langString);
    await tts.clearVoice();
    
    

  }

