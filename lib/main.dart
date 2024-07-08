import 'package:flutter/material.dart';
import 'package:medio_player_app/screen/home/provider/home_provider.dart';
import 'package:medio_player_app/provider/music_provider.dart';
import 'package:medio_player_app/screen/video/provider/video_provider.dart';
import 'package:medio_player_app/utils/app_routes.dart';
import 'package:provider/provider.dart';
void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: HomeProvider()),
      ChangeNotifierProvider.value(value: MusicProvider()),
      ChangeNotifierProvider.value(value: VideoProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: app_routes,
    ),
  ));
}