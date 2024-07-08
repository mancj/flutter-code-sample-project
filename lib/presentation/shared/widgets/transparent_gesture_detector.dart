import 'dart:ui';

import 'package:flutter/cupertino.dart';

class TransparentGestureDetector extends StatefulWidget {
  final GestureTapCallback? onTap;
  final Widget child;
  final bool animateScale;
  final bool delayForTapAnimation;

  const TransparentGestureDetector({
    Key? key,
    this.onTap,
    required this.child,
    this.animateScale = true,
    this.delayForTapAnimation = true,
  }) : super(key: key);

  @override
  State<TransparentGestureDetector> createState() =>
      _TransparentGestureDetectorState();
}

class _TransparentGestureDetectorState extends State<TransparentGestureDetector>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  AnimationController? _controller;
  Animation<double>? _animation;
  double _animatedScale = 1;
  double _animatedOpacity = 1;
  static const int _animationDuration = 150;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: _animationDuration),
      vsync: this,
    );

    _animation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 1, end: 0), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 1), weight: 1),
      // TweenSequenceItem(tween: Tween<double>(begin: 0.5, end: 1), weight: 1),
    ]).animate(_controller!)
      ..addListener(() {
        setState(() {
          _updateValue();
        });
      });
  }

  void _updateValue() {
    if (widget.animateScale) {
      _animatedScale = lerpDouble(0.98, 1.0, _animation!.value)!;
    }
    _animatedOpacity = lerpDouble(0.8, 1.0, _animation!.value)!;
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Future.delayed(
            Duration(
              milliseconds:
                  widget.delayForTapAnimation ? _animationDuration : 0,
            ), () {
          widget.onTap?.call();
        });
      },
      onTapDown: (d) => _tapDownState(),
      onTapUp: (d) => _tapUpState(),
      onTapCancel: () => _tapUpState(),
      child: Transform.scale(
        scale: 1 * _animatedScale,
        child: Opacity(
          opacity: _animatedOpacity,
          child: widget.child,
        ),
      ),
    );
  }

  void _tapDownState() {
    if (!_isPressed) {
      _controller!.reset();
      _controller!.animateTo(0.5);
    }
  }

  void _tapUpState() {
    // f
    _controller!.animateTo(1);
    _controller!.forward();
  }
}
