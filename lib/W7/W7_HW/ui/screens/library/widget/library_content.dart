import 'package:flutter/material.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/model/songs/song.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/ui/screens/library/view_model/library_view_model.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/ui/states/settings_state.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/ui/theme/theme.dart';
import 'package:provider/provider.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    // 1- Read the  song repository
    LibraryViewModel libraryViewModel = context.watch<LibraryViewModel>();
    List<Song> songs = libraryViewModel.allSongs;

    // 2- Read the settings state
    AppSettingsState settingsState = context.read<AppSettingsState>();

    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),

          SizedBox(height: 50),

          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) => SongTile(
                song: songs[index],
                isPlaying: libraryViewModel.isPlaying(songs[index]),
                onTap: () {
                  libraryViewModel.play(songs[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(song.title),
      trailing: Text(
        isPlaying ? "Playing" : "",
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}
