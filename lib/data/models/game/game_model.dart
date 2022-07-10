class GameModel {
  final int id;
  final String name;
  final String? screenshots;
  final String? summary;
  final List<String?>? genres;
  final List<String?> platforms;

  const GameModel({
    required this.id,
    required this.name,
    required this.summary,
    required this.screenshots,
    required this.genres,
    required this.platforms,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      id: json['id'],
      name: json['name'] ?? '',
      summary: json['summary'] ?? '',
      screenshots: json['screenshots']
          ?.firstWhere((image) => image != null, orElse: () => ['']),
      genres:
          json['genres'].map<String?>((genre) => genre['name']).toList() ?? [],
      platforms: json['platforms']
              .map<String?>((platform) => platform['name'])
              .toList() ??
          [],
    );
  }
}
