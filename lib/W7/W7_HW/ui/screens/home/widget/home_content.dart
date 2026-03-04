import 'package:flutter/material.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/model/songs/song.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/ui/screens/home/view_model/home_view_model.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/ui/screens/library/view_model/library_view_model.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/ui/states/settings_state.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/ui/theme/theme.dart';
import 'package:provider/provider.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();
    List<Song> recentSongs = homeViewModel.recentSongs;
    List<Song> suggestedSongs = homeViewModel.suggestedSongs;

    AppSettingsState settingsState = context.read<AppSettingsState>();

    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Home", style: AppTextStyles.heading),

          SizedBox(height: 50),

          Text("Your recent songs", style: AppTextStyles.label),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: recentSongs.length,
              itemBuilder: (context, index) => SongTile(
                song: recentSongs[index],
                isPlaying: homeViewModel.isPlaying(recentSongs[index]),
                onTap: () {
                  homeViewModel.play(recentSongs[index]);
                },
              ),
            ),
          ),

          Text("You might also like", style: AppTextStyles.label),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: suggestedSongs.length,
              itemBuilder: (context, index) => SongTile(
                song: suggestedSongs[index],
                isPlaying: homeViewModel.isPlaying(suggestedSongs[index]),
                onTap: () {
                  homeViewModel.play(suggestedSongs[index]);
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
