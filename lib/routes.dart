

import 'package:transition/conversion/conversion.dart';
import 'package:transition/home/home.dart';
import 'package:transition/result/result.dart';
import 'package:transition/saved/saved.dart';
import 'package:transition/scanned/identifytext.dart';

var routes = {
  OcsWidget.routeName: (context) => const OcsWidget(),
  Home.routeName: (context) => const Home(),
  SavedText.routeName: (context) => const SavedText(),
  ResultDisplay.routeName: (context) => const ResultDisplay(),
  Conversion.routeName: (context) => const Conversion(),
};
