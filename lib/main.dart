import 'package:flutter/material.dart';
import 'package:meo/meo.dart';

import 'package:meo_state_management/home_screen/home_screen.dart';
import 'package:meo_state_management/sample_controller/count_controller.dart';
import 'package:meo_state_management/sample_controller/sum_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MeoProvider(
      onCreate: () => SumController(),
      child: MeoProvider(
        onCreate: () => CountController(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeScreen(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}
