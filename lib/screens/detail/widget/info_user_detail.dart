import 'dart:math';

import 'package:date_app/customs/draw_cycle.dart';
import 'package:date_app/models/user_model.dart';
import 'package:flutter/material.dart';

class InfoUserDetail extends StatelessWidget {
  final UserModel user;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const InfoUserDetail({
    super.key,
    required this.user,
    required this.textTheme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${user.name}, ${user.age}',
          style: textTheme.displayLarge!.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          user.location,
          style: textTheme.bodyMedium!.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(
              color: colorScheme.onSecondary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Positioned(
                    top: 13,
                    left: 9,
                    child: Text(
                      '80%',
                      style: textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  CustomPaint(
                    size: const Size(40, 40),
                    painter: DrawCycle(
                      strokeWidth: 4,
                      color: colorScheme.onSecondary.withOpacity(0.5),
                      end: 2 * pi,
                    ),
                  ),
                  CustomPaint(
                    size: const Size(40, 40),
                    painter: DrawCycle(
                      strokeWidth: 4,
                      color: colorScheme.onSecondary,
                      end: 3 * pi / 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Text(
                'Match',
                style: textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ],
    );
  }
}
