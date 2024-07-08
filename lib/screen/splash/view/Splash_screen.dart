import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () =>
        Navigator.pushReplacementNamed(context, "home"));}

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: NetworkImage("https://static.vecteezy.com/system/resources/thumbnails/007/655/372/small/animation-earphones-neon-light-isolate-on-green-background-video.jpg")),
            SizedBox(height: 10,),
            Text("Media Booster App",
                style: TextStyle(fontSize: 30, color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
