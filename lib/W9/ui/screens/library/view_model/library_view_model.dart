import 'package:flutter/material.dart';
import 'package:flutter_application_t2y3/W9/model/song_detail/song_detail.dart';
import 'package:flutter_application_t2y3/W9/service/music_service.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../states/player_state.dart';
import '../../../../model/songs/song.dart';
import '../../../utils/async_value.dart';

class LibraryViewModel extends ChangeNotifier {
  // final SongRepository songRepository;
  final MusicService musicService;
  final PlayerState playerState;

  AsyncValue<List<SongDetail>> songsValue = AsyncValue.loading();

  LibraryViewModel({required this.musicService, required this.playerState}) {
    playerState.addListener(notifyListeners);

    // init
    _init();
  }

  @override
  void dispose() {
    playerState.removeListener(notifyListeners);
    super.dispose();
  }

  void _init() async {
    fetchSong();
  }

  void fetchSong() async {
    // 1- Loading state
    songsValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2- Fetch is successfull
      List<SongDetail> songs = await musicService.fetchSongDetails();
      songsValue = AsyncValue.success(songs);
    } catch (e) {
      // 3- Fetch is unsucessfull
      songsValue = AsyncValue.error(e);
    }
    notifyListeners();
  }

  bool isSongPlaying(Song song) => playerState.currentSong == song;

  void start(Song song) => playerState.start(song);
  void stop(Song song) => playerState.stop();
}
