import 'package:blabla/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/theme/theme.dart';

void mainCommon(List<InheritedProvider> providers) {
  runApp(
    MultiProvider(
      providers: providers,
      child: MaterialApp(debugShowCheckedModeBanner: false, home: BlaBlaApp()),
    ),
  );
}

class BlaBlaApp extends StatefulWidget {
  const BlaBlaApp({super.key});

  @override
  State<BlaBlaApp> createState() => _BlaBlaAppState();
}

class _BlaBlaAppState extends State<BlaBlaApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: blaTheme,
      home: Scaffold(body: HomeScreen()),
    );
  }
}
