import 'package:date_app/models/user_model.dart';
import 'package:date_app/screens/detail/widget/action_bottom_detail.dart';
import 'package:date_app/screens/detail/widget/action_sheet_detail.dart';
import 'package:date_app/screens/detail/widget/action_top_detail.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.user});
  final UserModel user;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SizedBox(
        height: maxHeight,
        child: Stack(
          children: [
            Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    colorScheme.primary,
                    Colors.transparent,
                  ],
                ),
              ),
              child: Hero(
                tag: widget.user.id + widget.user.image,
                child: Image.network(
                  width: maxWidth,
                  height: 2 * maxHeight / 3,
                  widget.user.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ActionSheetDetail(
              maxHeight: maxHeight,
              textTheme: textTheme,
              colorScheme: colorScheme,
              user: widget.user,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionTopDetail(
                  user: widget.user,
                  textTheme: textTheme,
                ),
                const SizedBox(height: 0),
                ActionBottomDetail(
                  colorScheme: colorScheme,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
