import 'package:date_app/data/dummy_data.dart';
import 'package:date_app/models/user_model.dart';
import 'package:date_app/screens/detail/widget/info_user_detail.dart';
import 'package:flutter/material.dart';

class ActionSheetDetail extends StatefulWidget {
  final double maxHeight;
  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final UserModel user;

  const ActionSheetDetail({
    super.key,
    required this.maxHeight,
    required this.textTheme,
    required this.colorScheme,
    required this.user,
  });

  @override
  State<ActionSheetDetail> createState() => _ActionSheetDetailState();
}

class _ActionSheetDetailState extends State<ActionSheetDetail>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: SlideTransition(
        position: _animation,
        child: Column(
          children: [
            InfoUserDetail(
              user: widget.user,
              textTheme: widget.textTheme,
              colorScheme: widget.colorScheme,
            ),
            const SizedBox(height: 10),
            Container(
              height: widget.maxHeight * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: widget.textTheme.bodyLarge!.copyWith(
                        color: widget.colorScheme.onPrimary.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'A good listener. I love having a good talk to know each other’s side 😍.',
                      style: widget.textTheme.bodyLarge!.copyWith(
                        color: widget.colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Interest',
                      style: widget.textTheme.bodyLarge!.copyWith(
                        color: widget.colorScheme.onPrimary.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Wrap(
                      children: favoriteToValue.entries.map(
                        (entry) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            margin: const EdgeInsets.only(
                              top: 5,
                              bottom: 8,
                              right: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color:
                                    widget.colorScheme.primary.withOpacity(0.5),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 40,
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
                                  style: widget.textTheme.bodyLarge!.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
