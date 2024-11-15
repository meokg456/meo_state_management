import 'package:flutter/cupertino.dart';
import 'package:meo/meo/sync_meo_controller.dart';

class MeoProvider<T extends SyncMeoController> extends StatefulWidget {
  const MeoProvider({super.key, required this.onCreate, required this.child});

  final T Function() onCreate;
  final Widget child;

  static T? maybeOf<T extends SyncMeoController>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
        ?.controller;
  }

  static T of<T extends SyncMeoController>(BuildContext context) {
    final T? result = maybeOf<T>(context);
    assert(result != null, 'No Provider found in context');
    return result!;
  }

  @override
  State<MeoProvider> createState() => _MeoProviderState<T>();
}

class _MeoProviderState<T extends SyncMeoController>
    extends State<MeoProvider<T>> {
  late T controller;
  @override
  void initState() {
    super.initState();
    controller = widget.onCreate();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider(controller, child: widget.child);
  }
}

class InheritedProvider<T extends SyncMeoController> extends InheritedWidget {
  final T controller;

  const InheritedProvider(this.controller, {super.key, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedProvider<T> oldWidget) {
    return controller != oldWidget.controller;
  }
}
