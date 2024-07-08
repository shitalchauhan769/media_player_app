import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:medio_player_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';
import '../../../provider/music_provider.dart';
import '../../dase/view/dase_screen.dart';
import '../../video/view/video_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
  PageController pageController =
      PageController(viewportFraction: 0.8, keepPage: true);
  HomeProvider? providerW;
  HomeProvider? providerR;

  @override
  void initState() {
    super.initState();
    assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    context.read<MusicProvider>().changInit();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text(
              "Media Booster App",
              style: TextStyle(color: Colors.white),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: "Music",),
                Tab(text: "Video",)
              ],
            ),
            // actions: [
            //   TextButton(
            //       onPressed: () {
            //         Navigator.pushNamed(context, "dase");
            //       },
            //       child: const Text(
            //         "Music",
            //       )),
            //   TextButton(
            //       onPressed: () {
            //         Navigator.pushNamed(context, "video");
            //       },
            //       child: const Text(
            //         "video",
            //       )),
            // ],
            backgroundColor: Colors.black,
          ),
          body:const TabBarView(
            children: [
              DaseScreen(),
              VideoScreen(),
            ],
          ) ),
    );
  }
}



//
//Column(
        //   children: [
        //     // CarouselSlider.builder(
        //     //   itemCount: ImageList.length,
        //     //   itemBuilder: (context, index, realIndex) {
        //     //     return Container(
        //     //       height: 200,
        //     //       width: MediaQuery.sizeOf(context).width,
        //     //       decoration: BoxDecoration(
        //     //           image: DecorationImage(
        //     //               image: NetworkImage(ImageList[index]),
        //     //               fit: BoxFit.cover)),
        //     //     );
        //     //   },
        //     //   options: CarouselOptions(
        //     //     initialPage: 2,
        //     //     onPageChanged: (index, reason) {
        //     //       providerR!.chageImage(index);
        //     //       pageController = PageController(initialPage: index);
        //     //     },
        //     //     autoPlay: true,
        //     //     autoPlayInterval: const Duration(seconds: 3),
        //     //     enlargeCenterPage: true,
        //     //     viewportFraction: 0.8,
        //     //   ),
        //     // ),
        //     // const SizedBox(
        //     //   height: 10,
        //     // ),
        //     // SmoothPageIndicator(
        //     //   count: ImageList.length,
        //     //   controller: pageController,
        //     // ),
        //     // // const SizedBox(
        //     // //   height: 10,
        //     // // ),
        //     // // ElevatedButton(
        //     // //   onPressed: () {
        //     // //     Navigator.pushNamed(context, "dase");
        //     // //   },
        //     // //   child: const Text("music"),
        //     // // ),
        //     // Expanded(
        //     //   child: GridView.builder(
        //     //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     //         crossAxisCount: 2),
        //     //     itemCount: providerW!.MusicList.length,
        //     //     itemBuilder: (context, index) {
        //     //      return InkWell(
        //     //        onTap: () {
        //     //          Navigator.pushNamed(context, "dase");
        //     //        },
        //     //        child: Padding(
        //     //          padding: const EdgeInsets.all(8.0),
        //     //          child: Container(
        //     //             height: 100,
        //     //             margin: const EdgeInsets.all(5),
        //     //             width: 100,
        //     //             decoration:BoxDecoration(
        //     //               borderRadius: BorderRadius.circular(10),
        //     //               color: Colors.white,
        //     //                 image: DecorationImage(
        //     //                   image: NetworkImage(
        //     //                       "${providerR!.MusicList[index].image}"),
        //     //                 )
        //     //             ),
        //     //           ),
        //     //        ),
        //     //      );
        //     //
        //     //
        //     //
        //     //
        //     //
        //     //     },
        //     //
        //     //
        //     //   ),
        //     // ),
        //   ],
        // ),
