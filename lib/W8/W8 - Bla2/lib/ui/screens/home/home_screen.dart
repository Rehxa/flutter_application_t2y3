import 'package:blabla/ui/screens/home/view_model/home_view_model.dart';
import 'package:blabla/ui/screens/home/widgets/home_content.dart';
import 'package:blabla/ui/state/ride_preference_state.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(
        ridePreferenceState: context.read<RidePreferenceState>(),
      ),
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, _) =>
            HomeContent(homeViewModel: viewModel),
      ),
    );
  }
}
