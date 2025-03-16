import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:wass_project1/config/colors.dart';
import 'package:wass_project1/core/shared_components.dart';
import 'package:wass_project1/features/auth/presentation/login.dart';
import 'package:wass_project1/features/startup/presentation/footer.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  int currentPage = 0;

  final List<Widget> pages = const [
    Center(
      child: Text("Screen 1"),
    ),
    Center(
      child: Text("Screen 2"),
    ),
    Center(
      child: Text("Screen 3"),
    ),
    Center(
      child: Text("Screen 4"),
    ),
    Center(
      child: Text("Screen 5"),
    ),
  ];
  
  @override
  void initState() {    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FlutterNativeSplash.remove();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.topRight,
            children: [
              PageView(
                controller: _pageController,
                children: pages,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
              ),
              if (currentPage != pages.length - 1)
                Positioned(
                  top: 20.0,
                  right: 20.0,
                  child: OnboardingButton(
                    "skip",
                    () {
                      currentPage = pages.length - 1;
                      _pageController.jumpToPage(pages.length - 1);
                    },
                  ),
                ),
            ],
          ),
        ),
        Footer(
          pages.length,
          currentPage,
          () {
            if (currentPage == pages.length - 1) {
              Navigator.of(context).pushReplacement(SharedComponents.routeOf(LoginScreen()));
            }
            else {
              currentPage = currentPage + 1;
              _pageController.nextPage(duration: Durations.short4, curve: Curves.easeIn);
            }
          }
        ),
      ],
    );
  }
}

class OnboardingButton extends StatelessWidget {
  final String data;
  final void Function() onClick;
  const OnboardingButton(this.data, this.onClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          backgroundColor: SharedColors.primaryDark,
          foregroundColor: SharedColors.buttonTextColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          side: const BorderSide(color: SharedColors.buttonBorderColor)),
      onPressed: onClick,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(
          data,
          style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
