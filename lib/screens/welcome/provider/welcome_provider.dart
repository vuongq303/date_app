import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomeProvider extends StateNotifier<int> {
  WelcomeProvider() : super(0);
  void increase() {
    state++;
  }
}

final increaseIndexTab =
    StateNotifierProvider<WelcomeProvider, int>((ref) => WelcomeProvider());
