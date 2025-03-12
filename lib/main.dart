import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wass_project1/core/client_status.dart';
import 'package:wass_project1/core/shared_components.dart';
import 'package:wass_project1/features/startup/presentation/onboarding.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x003b0052)),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<SharedPreferences> _prefs;

  @override
  void initState() {
    _prefs = SharedPreferences.getInstance();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _performStartupTasks(context);
    });

    super.initState();
  }

  Future<void> _performStartupTasks(BuildContext context) async {
    SharedPreferences pref = await _prefs;
    String? status = pref.getString("status");

    if (status == null && context.mounted) {
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              SharedComponents.scaffolded(const OnboardingPage()),
        ),
      );

      pref.setString("status", ClientStatus.loggedOut.name);
    }
    
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return SharedComponents.scaffolded(const Center(
      child: Text("Loading ..."),
    ));
  }
}
