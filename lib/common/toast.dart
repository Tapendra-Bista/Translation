
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?>  toastMessage(context,String name) { 
  
  return Fluttertoast.showToast(
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Theme.of(context).primaryColor,
                            textColor: Theme.of(context).secondaryHeaderColor,
                            msg:name);}