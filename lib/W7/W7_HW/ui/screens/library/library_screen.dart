import 'package:flutter/material.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/data/repositories/songs/song_repository.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/ui/screens/library/view_model/library_view_model.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/ui/screens/library/widget/library_content.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/ui/states/player_state.dart';
import 'package:provider/provider.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LibraryViewModel(
        repository: context.read<SongRepository>(),
        playerState: context.read<PlayerState>(),
      ),
      child: LibraryContent(),
    );
  }
}
