import 'package:flutter/material.dart';
import 'package:medio_player_app/screen/home/view/home_screen.dart';
import 'package:medio_player_app/screen/music/view/music_screen.dart';
import 'package:medio_player_app/screen/splash/view/Splash_screen.dart';
import 'package:medio_player_app/screen/video/view/video_player.dart';
import 'package:medio_player_app/screen/video/view/video_screen.dart';


import '../screen/dase/view/dase_screen.dart';
Map<String,WidgetBuilder> app_routes={
  '/':(contaxt)=> const SplashScreen(),
  'home':(contaxt)=> const HomeScreen(),
  'dase':(contaxt)=> const DaseScreen(),
  'music':(contaxt)=> const MusicScreen(),
  'video':(contaxt)=> const VideoScreen(),
  'video player':(contaxt)=> const VideoPlayerScreen()
};