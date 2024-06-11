import 'package:flutter/material.dart';

          BoxDecoration boxDecoration(context) { 
         return   BoxDecoration(
   color: Theme.of(context).cardColor,
          border: Border.all(color:Theme.of(context).hintColor, width:2),
          borderRadius: BorderRadius.circular(9),
          shape: BoxShape.rectangle
        );  }