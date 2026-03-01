import 'package:flutter_application_t2y3/W6/W6-HW2/data/repositories/settings/app_setting_mock.dart';
import 'package:flutter_application_t2y3/W6/W6-HW2/data/repositories/settings/app_setting_repository.dart';
import 'package:provider/provider.dart';
import 'package:nested/nested.dart';

import 'main_common.dart';
import 'data/repositories/songs/song_repository.dart';
import 'data/repositories/songs/song_repository_mock.dart';
import 'ui/states/player_state.dart';
import 'ui/states/settings_state.dart';

/// Configure provider dependencies for dev environment
AppSettingRepository settingRepository = AppSettingMock();
AppSettingsState settingsState = AppSettingsState(settingRepository);

List<SingleChildWidget> get devProviders {
  return [
    // 1 - Inject the song repository
    Provider<SongRepository>(create: (_) => SongRepositoryMock()),

    // 2 - Inject the player state
    ChangeNotifierProvider<PlayerState>(create: (_) => PlayerState()),

    // 3 - Inject the  app setting state
    ChangeNotifierProvider<AppSettingsState>(
      create: (_) => AppSettingsState(settingRepository),
    ),
  ];
}

Future<void> main() async {
  mainCommon(devProviders);
}
