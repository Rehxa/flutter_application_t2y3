import 'package:flutter/material.dart';
import 'package:flutter_application_t2y3/W9/data/repositories/artists/artist_repository.dart';
import 'package:flutter_application_t2y3/W9/model/artists/artist.dart';
import '../../../utils/async_value.dart';

class ArtistViewModel extends ChangeNotifier {
  final ArtistRepository artistRepository;

  AsyncValue<List<Artist>> artistValue = AsyncValue.loading();

  ArtistViewModel({required this.artistRepository}) {
    // init
    _init();
  }

  void _init() async {
    fetchArtist();
  }

  void fetchArtist() async {
    artistValue = AsyncValue.loading();
    notifyListeners();

    try {
      List<Artist> artists = await artistRepository.fetchArtists();
      artistValue = AsyncValue.success(artists);
    } catch (e) {
      artistValue = AsyncValue.error(e);
    }
    notifyListeners();
  }
}
