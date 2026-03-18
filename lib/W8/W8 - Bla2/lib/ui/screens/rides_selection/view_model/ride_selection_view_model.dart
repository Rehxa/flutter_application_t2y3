import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/state/ride_preference_state.dart';
import 'package:flutter/widgets.dart';

class RideSelectionViewModel extends ChangeNotifier {
  final RideRepository rideRepository;
  final RidePreferenceState ridePreferenceState;

  RideSelectionViewModel({
    required this.rideRepository,
    required this.ridePreferenceState,
  }) {
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

  RidePreference get currentRidePreference =>
      ridePreferenceState.selectedPreference!;

  List<Ride> get matchingRides {
    return rideRepository.getRidesFor(currentRidePreference);
  }
}
