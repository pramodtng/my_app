import 'package:anony_text/homepage/dashboard.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('images/welcome.gif'),
      logoWidth: 120,
      title: const Text(
        "Explore",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      showLoader: true,
      loadingText: const Text('Loading...'),
      navigator: const Dashboard(),
      durationInSeconds: 5,
    );
  }
}
