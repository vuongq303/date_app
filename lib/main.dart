import 'package:date_app/screens/firebase/firebase_options.dart';
import 'package:date_app/screens/discover/discover_screen.dart';
import 'package:date_app/screens/friendzy/frendzy.dart';
// import 'package:date_app/screens/login/login_screen.dart';
import 'package:date_app/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

TextStyle _textStyle(FontWeight fontWeight, double fontSize) =>
    GoogleFonts.aBeeZee(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: const Color.fromARGB(255, 34, 23, 42),
    );

final theme = ThemeData(
  useMaterial3: true,
  textTheme: TextTheme(
    displayLarge: _textStyle(FontWeight.bold, 32),
    //
    headlineLarge: _textStyle(FontWeight.bold, 28),
    headlineMedium: _textStyle(FontWeight.bold, 24),
    headlineSmall: _textStyle(FontWeight.bold, 20),
    //
    titleLarge: _textStyle(FontWeight.bold, 18),
    titleMedium: _textStyle(FontWeight.bold, 16),
    titleSmall: _textStyle(FontWeight.bold, 14),
    //
    bodyLarge: _textStyle(FontWeight.normal, 16),
    bodyMedium: _textStyle(FontWeight.normal, 14),
    bodySmall: _textStyle(FontWeight.normal, 12),
    //
    labelMedium: _textStyle(FontWeight.normal, 10),
  ),
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromARGB(255, 255, 255, 255),
    primary: const Color.fromARGB(255, 75, 22, 76),
    onPrimary: const Color.fromARGB(255, 34, 23, 42),
    secondary: const Color.fromARGB(255, 180, 62, 160),
    onSecondary: const Color.fromARGB(255, 221, 136, 207),
    secondaryContainer: const Color.fromARGB(255, 248, 231, 246),
  ),
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: theme,
        home: const SplashScreen(),
      ),
    );
  }
}

class BottomNavApp extends StatefulWidget {
  const BottomNavApp({super.key});

  @override
  State<BottomNavApp> createState() => _MyAppState();
}

class _MyAppState extends State<BottomNavApp> {
  int _selectedPage = 0;

  final List<Widget> _allTab = const [
    Frendzy(),
    DiscoverScreen(),
    _Test(),
  ];

  void onPageSelect(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: _allTab.elementAt(_selectedPage),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.access_time_rounded),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
                selectedLabelStyle: const TextStyle(
                  fontSize: 0,
                ),
                currentIndex: _selectedPage,
                selectedItemColor: Colors.blue,
                onTap: onPageSelect,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Test extends StatelessWidget {
  const _Test();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black, width: 2),
      ),
      foregroundDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.red.withOpacity(0.5), Colors.transparent],
        ),
      ),
      child: const Center(
        child: Text(
          'Xin chào',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
