import 'package:flutter/material.dart';
import 'package:transition/google_ml/translator.dart';


DropdownButtonHideUnderline myDropdownButton(TranslateLanguage language,
    context, void Function(TranslateLanguage?) onChanged) {
  return DropdownButtonHideUnderline(
    child: DropdownButton<TranslateLanguage>(
        value: language,
        isExpanded: true,
        iconSize: 0.0,
        borderRadius: BorderRadius.circular(8),
        dropdownColor: Theme.of(context).scaffoldBackgroundColor,
        items: TranslateLanguage.values
            .map((TranslateLanguage languages) => DropdownMenuItem(
                value: languages,
                child: Center(
                    child: Text(
                  languages.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ))))
            .toList(),
        onChanged: onChanged),
  );
}
