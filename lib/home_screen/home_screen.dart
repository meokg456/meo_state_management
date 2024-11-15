import 'package:flutter/material.dart';
import 'package:meo/meo.dart';
import 'package:meo_state_management/home_screen/widgets/count_text.dart';
import 'package:meo_state_management/home_screen/widgets/selected_sum_text.dart';
import 'package:meo_state_management/home_screen/widgets/sum_text.dart';
import 'package:meo_state_management/sample_controller/count_controller.dart';
import 'package:meo_state_management/sample_controller/sum_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final countController = MeoProvider.of<CountController>(context);
    final sumController = MeoProvider.of<SumController>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CountText(),
            IconButton(
                onPressed: () {
                  countController.increase();
                },
                icon: const Icon(Icons.add)),
            FilledButton(
                onPressed: () {
                  countController.reset();
                  sumController.reset();
                },
                child: const Text('Reset')),
            const SumText(),
            FilledButton(
                onPressed: () {
                  sumController.call(sumController.calculateSum(2, 3));
                },
                child: const Text('Sum')),
            const SelectedSumText(),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
