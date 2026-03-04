import 'package:flutter_application_t2y3/W7/W7_HW/data/repositories/user_history/user_history_repository.dart';

class UserHistoryMock implements UserHistoryRepository {
  final List<String> recentSongIds = [];

  @override
  void addSongToHistory(String songId) {
    recentSongIds.remove(songId);
    recentSongIds.insert(0, songId);
  }

  @override
  List<String> fetchRecentSongIds() {
    return recentSongIds;
  }
}
