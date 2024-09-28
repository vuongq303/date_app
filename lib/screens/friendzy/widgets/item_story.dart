import 'dart:math';

import 'package:date_app/customs/draw_cycle.dart';
import 'package:date_app/models/user_model.dart';
import 'package:flutter/material.dart';

class ItemStory extends StatelessWidget {
  const ItemStory({super.key, required this.user, required this.colorScheme});
  final UserModel user;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(4),
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(30),
                    child: Image.network(user.image, fit: BoxFit.cover),
                  ),
                ),
              ),
              CustomPaint(
                size: const Size(68, 68),
                painter: DrawCycle(
                  strokeWidth: 2,
                  end: 2 * pi,
                  color: colorScheme.onSecondary,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            user.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
