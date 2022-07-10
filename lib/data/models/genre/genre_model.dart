class GenreModel {
  final int id;
  final String name;

  GenreModel({
    required this.id,
    required this.name,
  });

  GenreModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}
