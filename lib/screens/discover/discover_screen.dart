import 'package:date_app/data/dummy_data.dart';
import 'package:date_app/models/post_model.dart';
import 'package:date_app/screens/discover/widgets/item_person_discover.dart';
import 'package:date_app/screens/discover/widgets/item_story_discover.dart';
import 'package:date_app/screens/discover/widgets/title_appbar_discover.dart';
import 'package:flutter/material.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final Map<TypeFavorite, bool> _toggleFavorite = {
    TypeFavorite.football: false,
    TypeFavorite.nature: false,
    TypeFavorite.language: false,
    TypeFavorite.photography: false,
    TypeFavorite.music: false,
    TypeFavorite.writing: false,
  };

  String get _getFavoriteSelected {
    final val = _toggleFavorite.entries
        .where((entry) => entry.value)
        .map((entry) => getCapitalizedValue(entry.key));
    return val.isEmpty
        ? ""
        : '"${val.toString().substring(1, val.toString().length - 1)}" ';
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: TitleAppBarDisCorver(textTheme),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 24),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort, size: 24),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 180,
              child: ListView.builder(
                itemCount: listUserModel.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 15),
                itemBuilder: (context, index) {
                  return ItemStoryDiscover(
                    user: listUserModel[index],
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Interest', style: textTheme.headlineSmall),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View all',
                      style: textTheme.bodyLarge!.copyWith(
                        color: colorScheme.onSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Wrap(
              children: _toggleFavorite.entries.map(
                (entry) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    margin: const EdgeInsets.only(top: 5, bottom: 8, left: 15),
                    decoration: BoxDecoration(
                      color:
                          entry.value ? colorScheme.onSecondary : Colors.white,
                      border: Border.all(
                        color: colorScheme.primary
                            .withOpacity(entry.value ? 1 : 0.5),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 40,
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            _toggleFavorite[entry.key] =
                                !_toggleFavorite[entry.key]!;
                          },
                        );
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
                            style: textTheme.bodyLarge!.copyWith(
                              color: entry.value
                                  ? Colors.white
                                  : colorScheme.onPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                'Around me',
                style: textTheme.headlineSmall,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Wrap(
                children: [
                  Text(
                    'People with ',
                    style: textTheme.bodyMedium!.copyWith(
                      color: const Color.fromARGB(255, 158, 158, 158),
                    ),
                  ),
                  Text(
                    _getFavoriteSelected,
                    style: textTheme.titleSmall!.copyWith(
                      color: colorScheme.secondary,
                    ),
                  ),
                  Text(
                    'interest around me',
                    style: textTheme.bodyMedium!.copyWith(
                      color: const Color.fromARGB(255, 158, 158, 158),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: GridView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 7 / 10,
                ),
                itemBuilder: (context, index) {
                  return ItemPersonDiscover(
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                    user: listUserModel[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
