import 'package:expenses_planner/screens/home.dart';
import 'package:flutter/material.dart';

import 'utils/material-theme/color_schemes.g.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      themeMode: ThemeMode.system, // device controls theme
      home: const Home(),
    );
  }
}
