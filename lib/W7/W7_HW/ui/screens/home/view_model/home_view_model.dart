import 'package:flutter/material.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/data/repositories/songs/song_repository.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/data/repositories/user_history/user_history_repository.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/model/songs/song.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/ui/states/player_state.dart';

class HomeViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final UserHistoryRepository userHistoryRepository;
  final PlayerState playerState;

  HomeViewModel({
    required this.songRepository,
    required this.userHistoryRepository,
    required this.playerState,
  }) {
    playerState.addListener(handleChanges);
    init();
  }

  List<Song> recentSongs = [];
  List<Song> suggestedSongs = [];

  void init() {
    List<Song> allSongs = songRepository.fetchSongs();
    List<String> recentIds = userHistoryRepository.fetchRecentSongIds();

    recentSongs = recentIds
        .map((id) => allSongs.firstWhere((s) => s.id == id))
        .toList();

    suggestedSongs = allSongs.where((s) => !recentIds.contains(s.id)).toList();

    notifyListeners();
  }

  void handleChanges() {
    notifyListeners();
  }

  bool isPlaying(Song song) => playerState.currentSong == song;

  void play(Song song) {
    userHistoryRepository.addSongToHistory(song.id);
    playerState.start(song);
    init();
  }

  void stop() => playerState.stop();

  @override
  void dispose() {
    playerState.removeListener(handleChanges);
    super.dispose();
  }
}
