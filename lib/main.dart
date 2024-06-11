import 'package:flutter/material.dart';

import 'BlocForHome/Screen/choiceChips.dart';
import 'BlocForHome/Screen/current_location.dart';
import 'BlocForHome/Screen/home_screen.dart';
import 'BlocForHome/Screen/quick_picks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: QuickPicksScreen(),
     // home: QuickPicksScreen(),
    );
  }
}
