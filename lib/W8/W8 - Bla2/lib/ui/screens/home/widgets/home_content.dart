import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/screens/home/view_model/home_view_model.dart';
import 'package:blabla/ui/screens/home/widgets/home_history_tile.dart';
import 'package:blabla/ui/screens/rides_selection/rides_selection_screen.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/ui/widgets/pickers/bla_ride_preference_picker.dart';
import 'package:blabla/utils/animations_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const String blablaHomeImagePath = 'assets/images/blabla_home.png';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  void onRidePrefSelected(
    BuildContext context,
    RidePreference selectedPreference,
    HomeViewModel homeViewModel,
  ) async {
    // 1- Ask the service to update the current preference
    homeViewModel.selectPreference(selectedPreference);

    // 2 - Navigate to the rides screen
    await Navigator.of(
      context,
    ).push(AnimationUtils.createBottomToTopRoute(RidesSelectionScreen()));
  }

  @override
  Widget build(context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();

    return Stack(
      children: [_buildBackground(), _buildForeground(context, homeViewModel)],
    );
  }

  Widget _buildForeground(BuildContext context, HomeViewModel homeViewModel) {
    return Column(
      children: [
        // 1 - THE HEADER
        SizedBox(height: 16),
        Align(
          alignment: AlignmentGeometry.center,
          child: Text(
            "Your pick of rides at low price",
            style: BlaTextStyles.heading.copyWith(color: Colors.white),
          ),
        ),
        SizedBox(height: 100),

        Container(
          margin: EdgeInsets.symmetric(horizontal: BlaSpacings.xxl),
          decoration: BoxDecoration(
            color: Colors.white, // White background
            borderRadius: BorderRadius.circular(16), // Rounded corners
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 2 - THE FORM
              BlaRidePreferencePicker(
                initRidePreference: homeViewModel.selectedPreference,
                onRidePreferenceSelected: (preference) =>
                    onRidePrefSelected(context, preference, homeViewModel),
              ),
              SizedBox(height: BlaSpacings.m),

              // 3 - THE HISTORY
              _buildHistory(context, homeViewModel),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHistory(BuildContext context, HomeViewModel homeViewModel) {
    // Reverse the history of preferences
    List<RidePreference> history = homeViewModel.history;
    return SizedBox(
      height: 200, // Set a fixed height
      child: ListView.builder(
        shrinkWrap: true, // Fix ListView height issue
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: history.length,
        itemBuilder: (ctx, index) => HomeHistoryTile(
          ridePref: history[index],
          onPressed: () =>
              onRidePrefSelected(context, history[index], homeViewModel),
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return SizedBox(
      width: double.infinity,
      height: 340,
      child: Image.asset(
        blablaHomeImagePath,
        fit: BoxFit.cover, // Adjust image fit to cover the container
      ),
    );
  }
}
