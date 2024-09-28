import 'package:flutter/material.dart';

class TitleAppBarDisCorver extends StatelessWidget {
  final TextTheme textTheme;
  const TitleAppBarDisCorver(this.textTheme, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: const Icon(
                Icons.location_pin,
                size: 12,
              ),
            ),
            const SizedBox(width: 4),
            Text('HaNoi', style: textTheme.bodySmall),
          ],
        ),
        Positioned(
          bottom: 0,
          child: Text('Discover', style: textTheme.headlineMedium),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
