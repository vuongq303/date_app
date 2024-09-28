import 'package:flutter/material.dart';

class MyStory extends StatelessWidget {
  const MyStory({super.key, required this.colorScheme, required this.image});
  final ColorScheme colorScheme;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(3),
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(32),
                    child: Image.network(image, fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                right: 4,
                bottom: 7,
                child: Container(
                  decoration: BoxDecoration(
                    color: colorScheme.onSecondary,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                      strokeAlign: 0,
                    ),
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'My Story',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
