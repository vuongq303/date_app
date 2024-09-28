import 'package:date_app/data/dummy_data.dart';
import 'package:date_app/models/post_model.dart';
import 'package:flutter/material.dart';

class Interest extends StatelessWidget {
  const Interest({
    super.key,
    required this.colorScheme,
    required this.textTheme,
    required this.toggleFavorite,
  });
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final Map<TypeFavorite, bool> toggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: toggleFavorite.entries.map(
        (entry) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.only(top: 5, bottom: 8, left: 15),
            decoration: BoxDecoration(
              color: entry.value ? colorScheme.onSecondary : Colors.white,
              border: Border.all(
                color: colorScheme.primary.withOpacity(entry.value ? 1 : 0.5),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 40,
            child: InkWell(
              onTap: () {
                
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    getValueForType(entry.key),
                    fit: BoxFit.cover,
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    getCapitalizedValue(
                      entry.key,
                    ),
                    style: textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: entry.value ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
