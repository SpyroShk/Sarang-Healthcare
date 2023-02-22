import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../theme/app_color.dart';
import '../theme/sizes.dart';

typedef RetryCallBack = void Function();

class ConnectionLost extends StatefulWidget {
  const ConnectionLost({super.key, required this.onRetry});

  final RetryCallBack? onRetry;

  @override
  State<ConnectionLost> createState() => _ConnectionLostState();
}

class _ConnectionLostState extends State<ConnectionLost>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      //  if the full duration of the animation is 8 secs then 0.5 is 4 secs
      if (_controller.value > 0.8) {
// When it gets there hold it there.
        _controller.value = 0.8;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/connectionlost.json',
              height: 250,
              controller: _controller,
              onLoaded: (comp) {
                _controller
                  ..duration = comp.duration
                  ..forward();
              },
            ),
            const Text(
              'Connection Lost!',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: Sizes.s32,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Internet down? \nWe will wait for you!',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: Sizes.s14,
                color: AppColor.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            MaterialButton(
              onPressed: widget.onRetry,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: AppColor.primary,
              height: 40,
              minWidth: 107,
              child: const Text(
                'Try again',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
