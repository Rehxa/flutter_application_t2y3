import 'package:flutter/material.dart';

import 'package:flutter_application_t2y3/W7/W7_HW/data/repositories/songs/song_repository.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/model/songs/song.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/ui/states/player_state.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository repository;
  final PlayerState playerState;

  LibraryViewModel({required this.repository, required this.playerState}) {
    playerState.addListener(handleListener);
    init();
  }

  List<Song> songs = [];

  void init() {
    songs = repository.fetchSongs();
    notifyListeners();
  }

  void handleListener() {
    notifyListeners();
  }

  List<Song> get allSongs => songs;

  bool isPlaying(Song song) => playerState.currentSong == song;

  void play(Song song) => playerState.start(song);
  void stop() => playerState.stop();

  @override
  void dispose() {
    playerState.removeListener(handleListener);
    super.dispose();
  }
}
