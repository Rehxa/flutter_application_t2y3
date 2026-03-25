// import 'package:flutter_application_t2y3/W9/data/repositories/artists/artist_repository.dart';
// import 'package:flutter_application_t2y3/W9/data/repositories/library/library_repository.dart';
// import 'package:flutter_application_t2y3/W9/data/repositories/songs/song_repository.dart';
// import 'package:flutter_application_t2y3/W9/model/song_detail/song_detail.dart';

// class LibraryRepositoryFirebase implements LibraryRepository {
//   final SongRepository songRepository;
//   final ArtistRepository artistRepository;

//   LibraryRepositoryFirebase({
//     required this.songRepository,
//     required this.artistRepository,
//   });
//   @override
//   Future<List<SongAndArtist>> fetchSongAndArtist() async {
//     final songs = await songRepository.fetchSongs();
//     final artists = await artistRepository.fetchArtists();
//   }
// }
