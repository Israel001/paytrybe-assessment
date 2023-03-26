import 'package:flutter/material.dart';

class Countdown extends AnimatedWidget {
  const Countdown({
    required Key key,
    required this.animation,
  }) : super(key: key, listenable: animation);

  final Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Expires in $timerText"),
      ],
    );
  }
}
