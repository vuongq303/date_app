import 'package:flutter/material.dart';

class ConditionWidget extends StatelessWidget {
  final Widget tWidget;
  final Widget fWidget;
  final bool condition;

  const ConditionWidget({
    super.key,
    required this.condition,
    required this.tWidget,
    required this.fWidget,
  });

  @override
  Widget build(BuildContext context) {
    return condition ? tWidget : fWidget;
  }
}
