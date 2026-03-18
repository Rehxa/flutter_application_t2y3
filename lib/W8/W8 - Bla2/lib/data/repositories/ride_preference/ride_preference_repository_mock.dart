import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RidePreferenceRepositoryMock implements RidePreferenceRepository {
  RidePreference? _selectedPreference;
  final List<RidePreference> _preferenceHistory = [];

  @override
  List<RidePreference> get preferenceHistory => _preferenceHistory;

  @override
  RidePreference? get selectedPreference => _selectedPreference;

  @override
  void selectPreference(RidePreference preference) {
    if (preference != _selectedPreference) {
      _selectedPreference = preference;
      _addPreferenceToHistory(preference);
    }
  }

  void _addPreferenceToHistory(RidePreference preference) {
    _preferenceHistory.add(preference);
  }

  @override
  int get maxAllowedSeats => 8;
}
