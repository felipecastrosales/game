import 'dart:convert';

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

  PlatformModel copyWith({
    int? id,
    String? name,
    String? alternativeName,
    String? abbreviation,
  }) {
    return PlatformModel(
      id: id ?? this.id,
      name: name ?? this.name,
      alternativeName: alternativeName ?? this.alternativeName,
      abbreviation: abbreviation ?? this.abbreviation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'alternative_name': alternativeName,
      'abbreviation': abbreviation,
    };
  }

  factory PlatformModel.fromMap(Map<String, dynamic> map) {
    return PlatformModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      alternativeName: map['alternative_name'] ?? '',
      abbreviation: map['abbreviation'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PlatformModel.fromJson(String source) =>
      PlatformModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PlatformModel(id: $id, name: $name, alternativeName: $alternativeName, abbreviation: $abbreviation)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PlatformModel &&
        other.id == id &&
        other.name == name &&
        other.alternativeName == alternativeName &&
        other.abbreviation == abbreviation;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        alternativeName.hashCode ^
        abbreviation.hashCode;
  }
}
