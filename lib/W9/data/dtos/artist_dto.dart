import 'package:flutter_application_t2y3/W9/model/artists/artist.dart';

import '../../model/artists/artist.dart';

class ArtistDto {
  static const String genreKey = 'genre';
  static const String nameKey = 'name';
  static const String imageUrlKey = "imageUrl";

  static Artist fromJson(String id, Map<String, dynamic> json) {
    assert(json[genreKey] is String);
    assert(json[imageUrlKey] is String);
    assert(json[nameKey] is String);

    return Artist(
      id: id,
      genre: json[genreKey],
      imageUrl: Uri.parse(json[imageUrlKey]),
      name: json[nameKey],
    );
  }

  /// Convert artist to JSON
  Map<String, dynamic> toJson(Artist artist) {
    return {
      genreKey: artist.genre,

      imageUrlKey: artist.imageUrl.toString(),
      nameKey: artist.name,
    };
  }
}
