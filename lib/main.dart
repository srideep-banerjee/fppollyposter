import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wass_project1/config/colors.dart';
import 'package:wass_project1/core/shared_components.dart';
import 'package:wass_project1/features/auth/data/auth.dart';
import 'package:wass_project1/features/auth/presentation/auth_screen.dart';
import 'package:wass_project1/features/dashboard/presentation/dashboard.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: SharedColors.primary),
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
    
    _prefs.then(
      (_) {
        FlutterNativeSplash.remove();
      }
    );
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SharedComponents.scaffolded(
      FutureBuilder(
        future: _prefs,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Placeholder();
          }
          
          SharedPreferences preferences = snapshot.data!;
          
          String? status = preferences.getString("status");
          
          MultiProvider(
            providers: [
              Provider(create: (context) => Auth(preferences)),
              Provider(create: (context) => preferences),
            ],
            builder:(context, child) {
              if (status == null) {
                return const OnboardingPage();
              }
              
              if (status == AuthState.loggedOut.name) {
                return const AuthScreen();
              }
              
              return const Dashboard();
            },
          );
          
          return Provider<Auth>(
            create: (context) => Auth(preferences),
            child: const AuthScreen(),
          );
        },
      ),
    );
  }
}
