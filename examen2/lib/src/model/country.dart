class Countrybycode {
  final Name name;
  final List<String> tld;
  final String cca2;
  final String cca3;
  final Map<String, Translation> translations;

  Countrybycode({
    required this.name,
    required this.tld,
    required this.cca2,
    required this.cca3,
    required this.translations,
  });

  factory Countrybycode.fromJson(Map<String, dynamic> json) => Countrybycode(
        name: Name.fromJson(json['name']),
        tld: List<String>.from(json['tld']),
        cca2: json['cca2'],
        cca3: json['cca3'],
        translations: (json['translations'] as Map<String, dynamic>).map(
          (key, value) => MapEntry(key, Translation.fromJson(value)),
        ),
      );

  Map<String, dynamic> toJson() => {
        'name': name.toJson(),
        'tld': tld,
        'cca2': cca2,
        'cca3': cca3,
        'translations': translations.map((key, value) => MapEntry(key, value.toJson())),
      };
}

class Name {
  final String common;
  final String official;

  Name({
    required this.common,
    required this.official,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json['common'],
        official: json['official'],
      );

  Map<String, dynamic> toJson() => {
        'common': common,
        'official': official,
      };
}

class Translation {
  final String common;
  final String official;

  Translation({
    required this.common,
    required this.official,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        common: json['common'],
        official: json['official'],
      );

  Map<String, dynamic> toJson() => {
        'common': common,
        'official': official,
      };
}
