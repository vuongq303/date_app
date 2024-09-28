import 'package:date_app/data/dummy_data.dart';
import 'package:date_app/models/user_model.dart';
import 'package:date_app/screens/friendzy/widgets/item_post.dart';
import 'package:date_app/screens/friendzy/widgets/item_story.dart';
import 'package:date_app/screens/friendzy/widgets/my_story.dart';
import 'package:date_app/widgets/condition_widget.dart';
import 'package:flutter/material.dart';

class Frendzy extends StatefulWidget {
  const Frendzy({super.key});

  @override
  State<Frendzy> createState() => _FrendzyState();
}

class _FrendzyState extends State<Frendzy> {
  late List<UserModel> listUser;

  @override
  void initState() {
    super.initState();
    listUser = [
      UserModel(
        id: '0',
        name: 'Hoang Quan',
        image:
            'https://www.bkns.vn/wp-content/uploads/2022/11/golang-Programing.jpg.webp',
        age: 20,
        location: 'Ha Noi',
        storyStatus: true,
        howFar: 5,
      ),
      ...listUserModel
    ];
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text(
          'Friendzy',
          style: textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none_rounded,
                  size: 24,
                ),
              ),
              Positioned(
                top: 18,
                right: 17,
                child: Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                    color: colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 1, color: Colors.white, strokeAlign: 0),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 120,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 10, top: 5),
                scrollDirection: Axis.horizontal,
                itemCount: listUser.length,
                itemBuilder: (context, index) => ConditionWidget(
                  condition: index == 0,
                  tWidget: MyStory(
                    colorScheme: colorScheme,
                    image: listUser[index].image,
                  ),
                  fWidget: ItemStory(
                    user: listUser[index],
                    colorScheme: colorScheme,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: listPost.length,
                itemBuilder: (context, index) => ItemPost(
                  post: listPost[index],
                  colorScheme: colorScheme,
                  textTheme: textTheme,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
