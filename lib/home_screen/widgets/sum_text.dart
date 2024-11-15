import 'package:flutter/material.dart';
import 'package:meo/meo.dart';
import 'package:meo_state_management/sample_controller/sum_controller.dart';

class SumText extends StatelessWidget {
  const SumText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MeoListener<SumController, AsyncState<int>>(onChanged: (_, state) {
          print(state);
        }),
        MeoBuilder<SumController, AsyncState<int>>(builder: (context, state) {
          if (state.status == Status.loading) {
            return const CircularProgressIndicator();
          }
          if (state.status == Status.success) {
            return Text('${state.data}');
          }
          return const SizedBox();
        }),
      ],
    );
  }
}
