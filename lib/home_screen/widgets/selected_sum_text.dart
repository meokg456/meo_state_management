import 'package:flutter/material.dart';
import 'package:meo/meo.dart';
import 'package:meo_state_management/sample_controller/sum_controller.dart';

class SelectedSumText extends StatelessWidget {
  const SelectedSumText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MeoBuilder<SumController, AsyncState<int>>(
            rebuildWhen: (previous, state) =>
                state.status == Status.success || state.status == Status.idle,
            builder: (context, state) {
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
