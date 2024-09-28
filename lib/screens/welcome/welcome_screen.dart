import 'package:date_app/screens/welcome/provider/welcome_provider.dart';
import 'package:date_app/screens/welcome/widgets/button_change_tab_welcome.dart';
import 'package:date_app/screens/welcome/widgets/google_map_welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabController.animateTo(ref.watch(increaseIndexTab));

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children:const [
              Center(
                child:  GoogleMapWelcome(),
              ),
               Center(
                child: Text('App1'),
              ),
               Center(
                child: Text('App12'),
              )
            ],
          ),
          const Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: ButtonChangeTabWelcome(),
          ),
        ],
      ),
    );
  }
}
