import 'package:flutter_application_t2y3/W8/W8-HW1/data/repositories/songs/song_repository.dart';
import 'package:flutter_application_t2y3/W8/W8-HW1/data/repositories/songs/song_repository_mock.dart';
import 'package:flutter_application_t2y3/W8/W8-HW1/model/songs/song.dart';

void main() async {
  //   Instantiate the  song_repository_mock
  SongRepository repo = SongRepositoryMock();
  // Test both the success and the failure of the post request

  // Handle the Future using 2 ways  (2 tests)
  // - Using then() with .catchError().
  await repo
      .fetchSongById("s4")
      .then((s) {
        if (s != null) {
          print("fetch song ${s.id} and ${s.title}");
        }
      })
      .catchError((e) => print(e));
  // - Using async/await with try/catch.
  try {
    Song? song = await repo.fetchSongById("s6");
    if (song != null) {
      print("fetch song ${song.id} and ${song.title}");
    }
  } catch (e) {
    print(e);
  }
}
