import 'package:flutter_application_t2y3/W9/model/songs/song.dart';

class SongDetail {
  final Song song;
  final String artistName;
  final String artistGenre;

  const SongDetail({
    required this.artistName,
    required this.artistGenre,
    required this.song,
  });
}
