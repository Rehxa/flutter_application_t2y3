import 'package:flutter_application_t2y3/W6/W6-HW2/data/repositories/settings/app_setting_repository.dart';
import 'package:flutter_application_t2y3/W6/W6-HW2/model/settings/app_settings.dart';

class AppSettingMock implements AppSettingRepository {
  AppSettings theme = AppSettings(themeColor: ThemeColor.blue);
  @override
  Future<AppSettings> load() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return theme;
  }

  @override
  Future<void> save(AppSettings settings) async {
    theme = settings;
  }
}
