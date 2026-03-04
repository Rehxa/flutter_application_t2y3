abstract class UserHistoryRepository {
  List<String> fetchRecentSongIds();
  void addSongToHistory(String songId);
}
