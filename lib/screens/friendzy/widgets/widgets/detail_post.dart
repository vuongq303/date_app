import 'package:date_app/models/post_model.dart';
import 'package:date_app/screens/friendzy/widgets/item_post.dart';
import 'package:flutter/material.dart';

class DetailPost extends StatelessWidget {
  const DetailPost({super.key, required this.post});
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: ItemPost(
        colorScheme: colorScheme,
        textTheme: textTheme,
        post: post,
      ),
    );
  }
}
