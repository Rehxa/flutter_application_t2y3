import 'dart:convert';

import 'package:flutter_application_t2y3/W9/data/dtos/artist_dto.dart';
import 'package:flutter_application_t2y3/W9/data/repositories/artists/artist_repository.dart';
import 'package:flutter_application_t2y3/W9/model/artists/artist.dart';
import 'package:http/http.dart' as http;

class ArtistRepositoryFirebase implements ArtistRepository {
  final Uri artistUrl = Uri.https(
    'w9-database-b4d16-default-rtdb.asia-southeast1.firebasedatabase.app',
    '/artists.json',
  );
  @override
  Future<List<Artist>> fetchArtists() async {
    final http.Response response = await http.get(artistUrl);

    if (response.statusCode == 200) {
      final List<Artist> artists = [];
      Map<String, dynamic> artistJson = json.decode(response.body);
      for (var entry in artistJson.entries) {
        final String id = entry.key;
        final Map<String, dynamic> jsonMap = Map<String, dynamic>.from(
          entry.value,
        );
        final Artist artist = ArtistDto.fromJson(id, jsonMap);
        artists.add(artist);
      }
      return artists;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
