import 'package:flutter/widgets.dart';
import 'package:flutter_application_t2y3/W6/W6-HW2/data/repositories/settings/app_setting_repository.dart';

import '../../model/settings/app_settings.dart';

class AppSettingsState extends ChangeNotifier {
  AppSettings? _appSettings;
  final AppSettingRepository settingRepo;

  AppSettingsState(this.settingRepo) {
    init();
  }

  Future<void> init() async {
    // Might be used to load data from repository
    _appSettings = await settingRepo.load();
    notifyListeners();
  }

  ThemeColor get theme => _appSettings?.themeColor ?? ThemeColor.blue;

  Future<void> changeTheme(ThemeColor themeColor) async {
    if (_appSettings == null) return;
    _appSettings = _appSettings!.copyWith(themeColor: themeColor);

    notifyListeners();

    await settingRepo.save(_appSettings!);
  }
}
