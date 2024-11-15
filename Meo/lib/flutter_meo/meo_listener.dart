import 'package:flutter/material.dart';
import 'package:meo/flutter_meo/meo_provider.dart';
import 'package:meo/meo/sync_meo_controller.dart';

class MeoListener<C extends SyncMeoController<S>, S extends Object>
    extends StatefulWidget {
  const MeoListener({
    super.key,
    required this.onChanged,
  });

  final void Function(S previousState, S state) onChanged;

  @override
  State<MeoListener> createState() => _MeoListenerState<C, S>();
}

class _MeoListenerState<C extends SyncMeoController<S>, S extends Object>
    extends State<MeoListener<C, S>> {
  late C controller;
  late S state;
  bool loaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!loaded) {
      controller = MeoProvider.of<C>(context);
      state = controller.state;
      controller.addListener(onStateChange);
      loaded = true;
    }
  }

  void onStateChange() {
    widget.onChanged(state, controller.state);
    state = controller.state;
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(onStateChange);
  }
}
