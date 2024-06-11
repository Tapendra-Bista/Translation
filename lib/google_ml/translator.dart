enum TranslateLanguage {
  /// Afrikaans
  afrikaans,

  /// Albanian
  albanian,

  /// Arabic
  arabic,

  /// Belarusian
  belarusian,

  /// Bengali
  bengali,

  /// Bulgarian
  bulgarian,

  /// Catalan
  catalan,

  /// Chinese
  chinese,

  /// Croatian
  croatian,

  /// Czech
  czech,

  /// Danish
  danish,

  /// Dutch
  dutch,

  /// English
  english,

  /// Esperanto
  esperanto,

  /// Estonian
  estonian,

  /// Finnish
  finnish,

  /// French
  french,

  /// Galician
  galician,

  /// Georgian
  georgian,

  /// German
  german,

  /// Greek
  greek,

  /// Gujarati
  gujarati,

  /// Haitian
  haitian,

  /// Hebrew
  hebrew,

  /// Hindi
  hindi,

  /// Hungarian
  hungarian,

  /// Icelandic
  icelandic,

  /// Indonesian
  indonesian,

  /// Irish
  irish,

  /// Italian
  italian,

  /// Japanese
  japanese,

  /// Kannada
  kannada,

  /// Korean
  korean,

  /// Latvian
  latvian,

  /// Lithuanian
  lithuanian,

  /// Macedonian
  macedonian,

  /// Malay
  malay,

  /// Maltese
  maltese,

  /// Marathi
  marathi,

  /// Nepali
  nepali,

  /// Norwegian
  norwegian,

  /// Persian
  persian,

  /// Polish
  polish,

  /// Portuguese
  portuguese,

  /// Romanian
  romanian,

  /// Russian
  russian,

  /// Slovak
  slovak,

  /// Slovenian
  slovenian,

  /// Spanish
  spanish,

  /// Swahili
  swahili,

  /// Swedish
  swedish,

  /// Tagalog
  tagalog,

  /// Tamil
  tamil,

  /// Telugu
  telugu,

  /// Thai
  thai,

  /// Turkish
  turkish,

  /// Ukrainian
  ukrainian,

  /// Urdu
  urdu,

  /// Vietnamese
  vietnamese,

  /// Welsh
  welsh,
}

extension LanguageCode on TranslateLanguage {
  /// Returns BCP-47 tag of the language.
  String get lCode {
    switch (this) {
      case TranslateLanguage.afrikaans:
        return 'af-ZA';
      case TranslateLanguage.albanian:
        return 'sq-AL';
      case TranslateLanguage.arabic:
        return 'ar-XA';
      case TranslateLanguage.belarusian:
        return 'be-BY';
      case TranslateLanguage.bengali:
        return 'bn-IN';
      case TranslateLanguage.bulgarian:
        return 'bg-BG';
      case TranslateLanguage.catalan:
        return 'ca-ES';
      case TranslateLanguage.chinese:
        return 'zh-CN';
      case TranslateLanguage.croatian:
        return 'hr-HR';
      case TranslateLanguage.czech:
        return 'cs-CZ';
      case TranslateLanguage.danish:
        return 'da-DK';
      case TranslateLanguage.dutch:
        return 'nl-NL';
      case TranslateLanguage.english:
        return 'en-US';
      case TranslateLanguage.esperanto:
        return 'en-US';
      case TranslateLanguage.estonian:
        return 'et-EE';
      case TranslateLanguage.finnish:
        return 'fi-FI';
      case TranslateLanguage.french:
        return 'fr-FR';
      case TranslateLanguage.galician:
        return 'gl-ES';
      case TranslateLanguage.georgian:
        return 'ka-GE';
      case TranslateLanguage.german:
        return 'de-DE';
      case TranslateLanguage.greek:
        return 'el-GR';
      case TranslateLanguage.gujarati:
        return 'gu-IN';
      case TranslateLanguage.haitian:
        return 'ht';
      case TranslateLanguage.hebrew:
        return 'he-IL';
      case TranslateLanguage.hindi:
        return 'hi-IN';
      case TranslateLanguage.hungarian:
        return 'hu-HU';
      case TranslateLanguage.icelandic:
        return 'is-IS';
      case TranslateLanguage.indonesian:
        return 'id-ID';
      case TranslateLanguage.irish:
        return 'ga-IE';
      case TranslateLanguage.italian:
        return 'it-IT';
      case TranslateLanguage.japanese:
        return 'ja-JP';
      case TranslateLanguage.kannada:
        return 'kn-IN';
      case TranslateLanguage.korean:
        return 'ko-KR';
      case TranslateLanguage.latvian:
        return 'lv-LV';
      case TranslateLanguage.lithuanian:
        return 'lt-LT';
      case TranslateLanguage.macedonian:
        return 'mk-MK';
      case TranslateLanguage.malay:
        return 'ms-MY';
      case TranslateLanguage.maltese:
        return 'mt-MT';
      case TranslateLanguage.marathi:
        return 'mr-IN';
      case TranslateLanguage.nepali:
        return 'ne-NP';
      case TranslateLanguage.norwegian:
        return 'no-NO';
      case TranslateLanguage.persian:
        return 'fa-IR';
      case TranslateLanguage.polish:
        return 'pl-PL';
      case TranslateLanguage.portuguese:
        return 'pt-PT';
      case TranslateLanguage.romanian:
        return 'ro-RO';
      case TranslateLanguage.russian:
        return 'ru-RU';
      case TranslateLanguage.slovak:
        return 'sk-SK';
      case TranslateLanguage.slovenian:
        return 'sl-SL';
      case TranslateLanguage.spanish:
        return 'es-US';
      case TranslateLanguage.swahili:
        return 'sw-TZ';
      case TranslateLanguage.swedish:
        return 'sv-SE';
      case TranslateLanguage.tagalog:
        return 'fil-PH';
      case TranslateLanguage.tamil:
        return 'ta-IN';
      case TranslateLanguage.telugu:
        return 'te-IN';
      case TranslateLanguage.thai:
        return 'th-TH';
      case TranslateLanguage.turkish:
        return 'tr-TR';
      case TranslateLanguage.ukrainian:
        return 'uk-UA';
      case TranslateLanguage.urdu:
        return 'ur-PK';
      case TranslateLanguage.vietnamese:
        return 'vi-VN';
      case TranslateLanguage.welsh:
        return 'en-GB-WLS';
    }
  }

  static TranslateLanguage? fromRawValue(String lCode) {
    try {
      return TranslateLanguage.values
          .firstWhere((element) => element.lCode == lCode);
    } catch (_) {
      return null;
    }
  }
}

extension BCP47Code on TranslateLanguage {
  /// Returns BCP-47 tag of the language.
  String get bcpCode {
    switch (this) {
      case TranslateLanguage.afrikaans:
        return 'af';
      case TranslateLanguage.albanian:
        return 'sq';
      case TranslateLanguage.arabic:
        return 'ar';
      case TranslateLanguage.belarusian:
        return 'be';
      case TranslateLanguage.bengali:
        return 'bn';
      case TranslateLanguage.bulgarian:
        return 'bg';
      case TranslateLanguage.catalan:
        return 'ca';
      case TranslateLanguage.chinese:
        return 'zh';
      case TranslateLanguage.croatian:
        return 'hr';
      case TranslateLanguage.czech:
        return 'cs';
      case TranslateLanguage.danish:
        return 'da';
      case TranslateLanguage.dutch:
        return 'nl';
      case TranslateLanguage.english:
        return 'en';
      case TranslateLanguage.esperanto:
        return 'eo';
      case TranslateLanguage.estonian:
        return 'et';
      case TranslateLanguage.finnish:
        return 'fi';
      case TranslateLanguage.french:
        return 'fr';
      case TranslateLanguage.galician:
        return 'gl';
      case TranslateLanguage.georgian:
        return 'ka';
      case TranslateLanguage.german:
        return 'de';
      case TranslateLanguage.greek:
        return 'el';
      case TranslateLanguage.gujarati:
        return 'gu';
      case TranslateLanguage.haitian:
        return 'ht';
      case TranslateLanguage.hebrew:
        return 'he';
      case TranslateLanguage.hindi:
        return 'hi';
      case TranslateLanguage.hungarian:
        return 'hu';
      case TranslateLanguage.icelandic:
        return 'is';
      case TranslateLanguage.indonesian:
        return 'id';
      case TranslateLanguage.irish:
        return 'ga';
      case TranslateLanguage.italian:
        return 'it';
      case TranslateLanguage.japanese:
        return 'ja';
      case TranslateLanguage.kannada:
        return 'kn';
      case TranslateLanguage.korean:
        return 'ko';
      case TranslateLanguage.latvian:
        return 'lv';
      case TranslateLanguage.lithuanian:
        return 'lt';
      case TranslateLanguage.macedonian:
        return 'mk';
      case TranslateLanguage.malay:
        return 'ms';
      case TranslateLanguage.maltese:
        return 'mt';
      case TranslateLanguage.marathi:
        return 'mr';
      case TranslateLanguage.nepali:
        return 'ne';
      case TranslateLanguage.norwegian:
        return 'no';
      case TranslateLanguage.persian:
        return 'fa';
      case TranslateLanguage.polish:
        return 'pl';
      case TranslateLanguage.portuguese:
        return 'pt';
      case TranslateLanguage.romanian:
        return 'ro';
      case TranslateLanguage.russian:
        return 'ru';
      case TranslateLanguage.slovak:
        return 'sk';
      case TranslateLanguage.slovenian:
        return 'sl';
      case TranslateLanguage.spanish:
        return 'es';
      case TranslateLanguage.swahili:
        return 'sw';
      case TranslateLanguage.swedish:
        return 'sv';
      case TranslateLanguage.tagalog:
        return 'tl';
      case TranslateLanguage.tamil:
        return 'ta';
      case TranslateLanguage.telugu:
        return 'te';
      case TranslateLanguage.thai:
        return 'th';
      case TranslateLanguage.turkish:
        return 'tr';
      case TranslateLanguage.ukrainian:
        return 'uk';
      case TranslateLanguage.urdu:
        return 'ur';
      case TranslateLanguage.vietnamese:
        return 'vi';
      case TranslateLanguage.welsh:
        return 'cy';
    }
  }

  static TranslateLanguage? fromRawValue(String bcpCode) {
    try {
      return TranslateLanguage.values
          .firstWhere((element) => element.bcpCode == bcpCode);
    } catch (_) {
      return null;
    }
  }
}
