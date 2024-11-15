import 'package:flutter/material.dart';
import 'package:meo/flutter_meo/meo_provider.dart';
import 'package:meo/meo/sync_meo_controller.dart';

class MeoBuilder<C extends SyncMeoController<S>, S extends Object>
    extends StatefulWidget {
  const MeoBuilder({
    super.key,
    required this.builder,
    this.rebuildWhen,
  });

  final Widget Function(BuildContext context, S state) builder;
  final bool Function(S previous, S state)? rebuildWhen;

  @override
  State<MeoBuilder> createState() => _MeoBuilderState<C, S>();
}

class _MeoBuilderState<C extends SyncMeoController<S>, S extends Object>
    extends State<MeoBuilder<C, S>> {
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
    bool needRebuild = true;
    if (widget.rebuildWhen != null &&
        !widget.rebuildWhen!(state, controller.state)) {
      needRebuild = false;
    }
    if (needRebuild) {
      setState(() {
        state = controller.state;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, state);
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(onStateChange);
  }
}
