import 'dart:convert';

class GenreModel {
  final int id;
  final String name;

  GenreModel({
    required this.id,
    required this.name,
  });

  GenreModel copyWith({
    int? id,
    String? name,
  }) {
    return GenreModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory GenreModel.fromMap(Map<String, dynamic> map) {
    return GenreModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GenreModel.fromJson(String source) =>
      GenreModel.fromMap(json.decode(source));

  @override
  String toString() => 'GenreModel(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GenreModel && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
