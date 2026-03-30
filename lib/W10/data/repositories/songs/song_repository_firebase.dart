import 'dart:convert';

import 'package:flutter_application_t2y3/W10/util/firebase_api.dart';
import 'package:http/http.dart' as http;

import '../../../model/songs/song.dart';
import '../../dtos/song_dto.dart';
import 'song_repository.dart';

class SongRepositoryFirebase extends SongRepository {
  final Uri songsUri = Uri.https(FirebaseApi.firebasedatabase, '/songs.json');

  List<Song>? cachedSongs;
  @override
  bool get hasCache => cachedSongs != null;

  @override
  Future<List<Song>> fetchSongs({bool forceFetch = false}) async {
    if (cachedSongs != null && !forceFetch) {
      return cachedSongs!;
    }
    final http.Response response = await http.get(songsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs
      Map<String, dynamic> songJson = json.decode(response.body);

      List<Song> result = [];
      for (final entry in songJson.entries) {
        result.add(SongDto.fromJson(entry.key, entry.value));
      }
      cachedSongs = result;
      return cachedSongs!;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Song?> fetchSongById(String id) async {}

  @override
  Future<Song?> increaseLikeSong(Song song) async {
    final Uri url = Uri.https(
      FirebaseApi.firebasedatabase,
      '/songs/${song.id}.json',
    );
    final int newLike = song.likeAmount + 1;

    final response = await http.patch(
      url,
      body: json.encode({SongDto.likeAmountKey: newLike}),
    );

    if (response.statusCode == 200) {
      final Song updatedSong = song.copyWith(likeAmount: newLike);
      if (cachedSongs != null) {
        cachedSongs = cachedSongs!.map((old) {
          return old.id == song.id ? updatedSong : old;
        }).toList();
      }
      return updatedSong;
    }
    return null;
  }
}
