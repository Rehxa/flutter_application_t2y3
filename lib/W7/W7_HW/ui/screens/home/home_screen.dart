import 'package:flutter/material.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/data/repositories/songs/song_repository.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/data/repositories/user_history/user_history_repository.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/ui/screens/home/view_model/home_view_model.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/ui/screens/home/widget/home_content.dart';
import 'package:flutter_application_t2y3/W7/W7_HW/ui/states/player_state.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(
        songRepository: context.read<SongRepository>(),
        userHistoryRepository: context.read<UserHistoryRepository>(),
        playerState: context.read<PlayerState>(),
      ),
      child: HomeContent(),
    );
  }
}
