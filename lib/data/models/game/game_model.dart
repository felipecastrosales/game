import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

import 'package:game/data/models/genre/genre_model.dart';
import 'package:game/data/models/platform/platform_model.dart';

class GameModel {
  final int id;
  final String name;
  final String? screenshots;
  final String? summary;
  final List<GenreModel>? genres;
  final List<PlatformModel>? platforms;

  GameModel({
    required this.id,
    required this.name,
    this.screenshots,
    this.summary,
    this.genres,
    this.platforms,
  });

  GameModel copyWith({
    int? id,
    String? name,
    String? screenshots,
    String? summary,
    List<GenreModel>? genres,
    List<PlatformModel>? platforms,
  }) {
    return GameModel(
      id: id ?? this.id,
      name: name ?? this.name,
      screenshots: screenshots ?? this.screenshots,
      summary: summary ?? this.summary,
      genres: genres ?? this.genres,
      platforms: platforms ?? this.platforms,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'screenshots': screenshots,
      'summary': summary,
      'genres': genres?.map((genre) => genre.toMap()).toList(),
      'platforms': platforms?.map((platform) => platform.toMap()).toList(),
    };
  }

  factory GameModel.fromMap(Map<String, dynamic> map) {
    String getScreenshots(List<dynamic> images) => images.first['url'];

    return GameModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      screenshots:
          map['screenshots'] != null ? getScreenshots(map['screenshots']) : '',
      summary: map['summary'],
      genres: map['genres'] != null
          ? List<GenreModel>.from(
              map['genres']?.map((genre) => GenreModel.fromMap(genre)))
          : null,
      platforms: map['platforms'] != null
          ? List<PlatformModel>.from(map['platforms']
              ?.map((platform) => PlatformModel.fromMap(platform)))
          : null,
    );
  }

  factory GameModel.fromDatabase(Map<String, dynamic> map) {
    String getScreenshots(List<dynamic>? images) => images!.first['url'] ?? '';
  
    List<GenreModel> genresLocale = json
        .decode(map['genres'])
        .map<GenreModel>((genre) => GenreModel.fromJson(genre))
        .toList();
    List<PlatformModel> platformsLocale = json
        .decode(map['platforms'])
        .map<PlatformModel>((plaftform) => PlatformModel.fromJson(plaftform))
        .toList();

    developer.log('${genresLocale is String}');
    developer.log('${platformsLocale is String}');
    developer.log('${map['genres']}', name: 'genre');
    developer.log('$genresLocale', name: 'genre');

    return GameModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      screenshots: getScreenshots(map['screenshots']),
      summary: map['summary'],
      genres: genresLocale,
      platforms: platformsLocale,
    );
  }

  String toJson() => json.encode(toMap());

  factory GameModel.fromJson(String source) =>
      GameModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GameModel(id: $id, name: $name, screenshots: $screenshots, summary: $summary, genres: $genres, platforms: $platforms)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameModel &&
        other.id == id &&
        other.name == name &&
        other.screenshots == screenshots &&
        other.summary == summary &&
        listEquals(other.genres, genres) &&
        listEquals(other.platforms, platforms);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        screenshots.hashCode ^
        summary.hashCode ^
        genres.hashCode ^
        platforms.hashCode;
  }
}
