import 'dart:math';

import 'package:date_app/screens/welcome/provider/welcome_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:date_app/customs/draw_cycle.dart';

class ButtonChangeTabWelcome extends ConsumerStatefulWidget {
  const ButtonChangeTabWelcome({super.key});

  @override
  ConsumerState<ButtonChangeTabWelcome> createState() =>
      _ButtonChangeTabWelcomeState();
}

class _ButtonChangeTabWelcomeState extends ConsumerState<ButtonChangeTabWelcome>
    with SingleTickerProviderStateMixin {
  final doublePi = 2 * pi;
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: setDuration(1500));

    _animation = Tween(
      begin: 0.0,
      end: doublePi,
    ).animate(_animationController)
      ..addListener(() {
        animatedListener(ref);
      });

    _animationController.forward();
  }

  Duration setDuration(int s) => Duration(milliseconds: s);

  void animatedListener(WidgetRef ref) {
    final position = ref.watch(increaseIndexTab);
    if (_animation.value >= doublePi * (position + 1) / 3) {
      _animationController.stop();
    }
  }

  void changeTab(WidgetRef ref, int position) {
    if (position < 2) {
      ref.read(increaseIndexTab.notifier).increase();
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final position = ref.watch(increaseIndexTab);

    return SizedBox(
      height: 100,
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 80,
              width: 80,
              child: CustomPaint(
                painter: DrawCycle(
                  end: doublePi,
                  strokeWidth: 5,
                  color: colorScheme.secondary.withOpacity(0.3),
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 80,
              width: 80,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (ctx, child) {
                  return CustomPaint(
                    painter: DrawCycle(
                      strokeWidth: 5,
                      end: _animation.value,
                      color: colorScheme.secondary,
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: AnimatedSwitcher(
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              duration: setDuration(300),
              child: IconButton(
                key: ValueKey(position),
                style: IconButton.styleFrom(
                  backgroundColor: colorScheme.onSecondary,
                  foregroundColor: colorScheme.surface,
                  padding: const EdgeInsets.all(18),
                ),
                onPressed: () {
                  changeTab(ref, position);
                },
                icon: Icon(
                  position >= 2
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
