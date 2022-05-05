class Language{
  final int id;
  final String name;
  final String flag;
  final String Languagecode;

  Language(this.id, this.name, this.flag, this.Languagecode);
  static List<Language> languageList(){
    return<Language>[
      Language(1, '🏴󠁧󠁢󠁥󠁮󠁧󠁿 ', 'English', 'en'),
      Language(1, '🇪🇹 ', 'አማርኛ', 'am'),
    ];
  }

}