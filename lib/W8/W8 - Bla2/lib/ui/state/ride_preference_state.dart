import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/widgets.dart';

class RidePreferenceState extends ChangeNotifier {
  final RidePreferenceRepository ridePreferenceRepository;

  RidePreferenceState({required this.ridePreferenceRepository});

  RidePreference? get selectedPreference =>
      ridePreferenceRepository.selectedPreference;

  List<RidePreference> get preferenceHistory =>
      ridePreferenceRepository.preferenceHistory;

  void selectPreference(RidePreference preference) {
    if (preference == ridePreferenceRepository.selectedPreference) return;

    ridePreferenceRepository.selectPreference(preference);
    notifyListeners();
  }
}
