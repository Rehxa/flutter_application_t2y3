import 'package:flutter_application_t2y3/W6/W6-HW2/model/settings/app_settings.dart';

abstract class AppSettingRepository {
  Future<AppSettings> load();
  Future<void> save(AppSettings settings);
}
