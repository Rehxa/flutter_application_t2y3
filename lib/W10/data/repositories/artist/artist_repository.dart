import '../../../model/artist/artist.dart';

abstract class ArtistRepository {
  bool get hasCache;

  Future<List<Artist>> fetchArtists({bool forceFetch = false});

  Future<Artist?> fetchArtistById(String id);
}
