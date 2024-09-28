import 'package:date_app/data/dummy_data.dart';
import 'package:date_app/models/user_model.dart';
import 'package:flutter/material.dart';

class ItemStoryDiscover extends StatelessWidget {
  const ItemStoryDiscover({
    super.key,
    required this.user,
    required this.colorScheme,
    required this.textTheme,
  });
  final UserModel user;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10, right: 15),
      width: 100,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: const Alignment(0, 0),
                end: const Alignment(0, 1),
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.4),
                ],
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(user.image, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: 5,
            left: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'NEW',
                style: textTheme.labelMedium!.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withOpacity(0.8),
                    width: 1,
                  ),
                  color: colorScheme.onSecondary.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${user.howFar} km away',
                  style: textTheme.labelMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '${getLastName(user.name)}, ${user.age}',
                style: textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ],
      ),
    );
  }
}
