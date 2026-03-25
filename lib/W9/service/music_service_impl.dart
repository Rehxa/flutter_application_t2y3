import 'package:flutter_application_t2y3/W9/data/repositories/artists/artist_repository.dart';
import 'package:flutter_application_t2y3/W9/data/repositories/songs/song_repository.dart';
import 'package:flutter_application_t2y3/W9/model/artists/artist.dart';
import 'package:flutter_application_t2y3/W9/model/song_detail/song_detail.dart';
import 'package:flutter_application_t2y3/W9/model/songs/song.dart';
import 'package:flutter_application_t2y3/W9/service/music_service.dart';

class MusicServiceImpl implements MusicService {
  final SongRepository songRepository;
  final ArtistRepository artistRepository;

  MusicServiceImpl({
    required this.songRepository,
    required this.artistRepository,
  });

  @override
  Future<List<SongDetail>> fetchSongDetails() async {
    final List<Song> songs = await songRepository.fetchSongs();
    final List<Artist> artists = await artistRepository.fetchArtists();

    Map<String, Artist> artistMap = {};
    for (var artist in artists) {
      artistMap[artist.id] = artist;
    }

    return songs.map((song) {
      final Artist? artist = artistMap[song.artistId];
      return SongDetail(
        song: song,
        artistName: artist!.name,
        artistGenre: artist.genre,
      );
    }).toList();
  }
}
