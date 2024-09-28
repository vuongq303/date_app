import 'package:date_app/data/dummy_data.dart';
import 'package:date_app/models/user_model.dart';
import 'package:date_app/screens/detail/detail_screen.dart';
import 'package:flutter/material.dart';

class ItemPersonDiscover extends StatelessWidget {
  const ItemPersonDiscover({
    super.key,
    required this.colorScheme,
    required this.textTheme,
    required this.user,
  });
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => DetailScreen(
              user: user,
            ),
          ),
        );
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: colorScheme.onSecondary,
                width: 5,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.5),
                ],
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Hero(
                tag: user.id + user.image,
                child: Image.network(
                  user.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.white.withOpacity(0.8), width: 1),
                  color: colorScheme.onSecondary.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${user.howFar} km away',
                  style: textTheme.bodySmall!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '${getLastName(user.name)}, ${user.age}',
                style: textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                user.location,
                style: textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
