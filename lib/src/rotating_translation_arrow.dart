import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RotatingTranslationArrow extends StatelessWidget {
  const RotatingTranslationArrow(
      {Key? key, required this.controller, this.onTapAdditional})
      : super(key: key);
  final AnimationController controller;
  final void Function()? onTapAdditional;

  @override
  Widget build(BuildContext context) {
    const _iconSize = 32.0;
    final _animation = controller.drive(
      // Offsetの指定が楽になる
      Tween<Offset>(
        begin: const Offset(0.0, 0.0),
        end: const Offset(2.5, 0.0),
      ),
    );
    return InkWell(
      onTap: () {
        if (controller.isDismissed) {
          controller.forward();
        } else if (controller.isCompleted) {
          controller.reverse();
        }
        if (onTapAdditional != null) onTapAdditional!();
      },
      child: Align(
        alignment: Alignment.topLeft,
        child: FractionalTranslation(
          translation: _animation.value,
          child: Transform.rotate(
            angle: controller.value * math.pi,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Icon(
                Icons.arrow_right,
                size: _iconSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
