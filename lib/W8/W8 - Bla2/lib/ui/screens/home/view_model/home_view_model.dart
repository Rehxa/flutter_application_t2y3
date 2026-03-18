import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/state/ride_preference_state.dart';
import 'package:flutter/widgets.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferenceState ridePreferenceState;

  HomeViewModel({required this.ridePreferenceState}) {
    ridePreferenceState.addListener(handleRidePrefChanges);
  }

  void handleRidePrefChanges() {
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    ridePreferenceState.removeListener(handleRidePrefChanges);
  }

  void selectPreference(RidePreference preference) {
    ridePreferenceState.selectPreference(preference);
  }

  RidePreference? get selectedPreference =>
      ridePreferenceState.selectedPreference;

  List<RidePreference> get history =>
      ridePreferenceState.preferenceHistory.reversed.toList();
}
