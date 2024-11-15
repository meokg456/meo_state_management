import 'package:flutter/material.dart';
import 'package:meo/meo.dart';

import 'package:meo_state_management/sample_controller/count_controller.dart';

class CountText extends StatelessWidget {
  const CountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MeoListener<CountController, int>(onChanged: (_, state) {
          print('Changed $state');
        }),
        const Text(
          'You have pushed the button this many times:',
        ),
        MeoBuilder<CountController, int>(builder: (context, state) {
          return Text(
            '$state',
            style: Theme.of(context).textTheme.headlineMedium,
          );
        }),
      ],
    );
  }
}
