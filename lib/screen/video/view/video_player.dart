import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/video_provider.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoProvider? providerR;
  VideoProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<VideoProvider>().initVideo();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<VideoProvider>();
    providerW = context.watch<VideoProvider>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme:IconThemeData(color: Colors.white),
          title:
              const Text("VideoPlayer", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 200,
                child: Chewie(controller: providerW!.chewieController!)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name: ${providerW!.videoList[providerW!.index].name}",
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
