
import 'package:flutter/widgets.dart';
import 'package:visibility_detector/visibility_detector.dart';

typedef PageLifecycleStateChangedCallback = void Function(bool appeared);

enum PageLifecycleDisappearCondition {
  appInactive,
  appPaused,
}

class PageLifecycleConfig {
  /// The detection interval.
  /// Smaller detectionInterval means more accuracy and higher CPU consumption.
  static Duration get detectionInterval =>
      Duration.zero;
  static set detectionInterval(Duration value) =>
      Duration.zero;

  /// The default additional condition which will mark the page disappear.
  static final Set<PageLifecycleDisappearCondition> disappearWhen = {
    PageLifecycleDisappearCondition.appInactive,
    PageLifecycleDisappearCondition.appPaused,
  };
}

class PageLifecycle extends StatefulWidget {
  // page lifecycle call back
  final PageLifecycleStateChangedCallback stateChanged;

  /// Child widget.
  final Widget? child;

  /// The additional condition which will mark the page disappear for current widget.
  /// If it's null, will use [PageLifecycleConfig.disappearWhen]
  final Set<PageLifecycleDisappearCondition>? disappearWhen;

  const PageLifecycle(
      {super.key, required this.stateChanged, this.disappearWhen, this.child});

  @override
  State<PageLifecycle> createState() => _PageLifecycleState();
}

class _PageLifecycleState extends State<PageLifecycle>
    with WidgetsBindingObserver {
  final _key = UniqueKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.inactive:
        if (_markDisappearWhen(PageLifecycleDisappearCondition.appInactive)) {
          _updateAppearanceStateIfNeeded(false);
        }
        break;
      case AppLifecycleState.paused:
        if (_markDisappearWhen(PageLifecycleDisappearCondition.appPaused)) {
          _updateAppearanceStateIfNeeded(false);
        }
        break;
      case AppLifecycleState.resumed:
        final newValue = _visibleFraction != 0;
        _updateAppearanceStateIfNeeded(newValue);
        break;
    }
  }

  bool _appeared = false;
  double _visibleFraction = 0;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(

      key: _key,
      onVisibilityChanged: (visibilityInfo) {
        _visibleFraction = visibilityInfo.visibleFraction;
        final newValue = _visibleFraction != 0;
        _updateAppearanceStateIfNeeded(newValue);
      },
      child: widget.child ?? Container(),
    );
  }

  void _updateAppearanceStateIfNeeded(bool newValue) {
    if (_appeared == newValue) {
      return;
    }
    _appeared = newValue;
    widget.stateChanged(_appeared);
  }

  bool _markDisappearWhen(PageLifecycleDisappearCondition condition) {
    final situations =
        widget.disappearWhen ?? PageLifecycleConfig.disappearWhen;
    return situations.contains(condition);
  }
}
