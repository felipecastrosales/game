class PlatformModel {
  final int id;
  final String name;
  final String alternativeName;
  final String abbreviation;

  PlatformModel({
    required this.id,
    required this.name,
    required this.alternativeName,
    required this.abbreviation,
  });

  PlatformModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        alternativeName = json['alternative_name'],
        abbreviation = json['abbreviation'];
}
