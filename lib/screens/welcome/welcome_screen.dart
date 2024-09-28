import 'dart:math';

import 'package:date_app/customs/draw_cycle.dart';
import 'package:date_app/screens/welcome/widgets/google_map_welcome.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  int position = 0;
  final doublePi = 2 * pi;
  late TabController _tabController;
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
        length: 3, vsync: this, animationDuration: setDuration(500));

    _animationController =
        AnimationController(vsync: this, duration: setDuration(1500));

    _animation = Tween(
      begin: 0.0,
      end: doublePi,
    ).animate(_animationController)
      ..addListener(animatedListener);

    _animationController.forward();
  }

  Duration setDuration(int s) => Duration(milliseconds: s);

  void animatedListener() {
    if (_animation.value >= doublePi * (position + 1) / 3) {
      _animationController.stop();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void changeTab() {
    if (position < 2) {
      setState(() {
        position++;
        _tabController.animateTo(position);
        _animationController.forward();
      });
    }
  }

  void skipAction() {}
  void goAction() {}

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              Center(
                child: GoogleMapWelcome(),
              ),
              Center(
                child: Text('App1'),
              ),
              Center(
                child: Text('App1'),
              )
            ],
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: SizedBox(
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
                      child: _IconButton(
                        key: ValueKey(position),
                        icon: position >= 2
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        changeTab,
                        colorScheme: colorScheme,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final Function() onPress;
  final ColorScheme colorScheme;
  final IconData icon;

  const _IconButton(this.onPress,
      {required this.colorScheme, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: colorScheme.onSecondary,
        foregroundColor: colorScheme.surface,
        padding: const EdgeInsets.all(18),
      ),
      onPressed: onPress,
      icon: Icon(icon, size: 30),
    );
  }
}
