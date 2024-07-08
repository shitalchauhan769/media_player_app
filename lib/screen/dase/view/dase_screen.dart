import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../provider/music_provider.dart';

class DaseScreen extends StatefulWidget {
  const DaseScreen({super.key});

  @override
  State<DaseScreen> createState() => _DaseScreenState();
}

class _DaseScreenState extends State<DaseScreen> {
  MusicProvider? providerW;
  MusicProvider? providerR;

  @override
  Widget build(BuildContext context) {
    PageController pageController =
        PageController(viewportFraction: 0.8, keepPage: true);
    providerR = context.read<MusicProvider>();
    providerW = context.watch<MusicProvider>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Container(
            //   height: 200,
            //   width: 200,
            //   decoration:  BoxDecoration(
            //  color: Colors.black,
            //     borderRadius: BorderRadius.circular(10),
            //     image: DecorationImage(
            //       image: NetworkImage(
            //           "${providerR!.MusicList[providerW!.selectedSongIndex].image}"),fit: BoxFit.cover
            //     ),
            //
            //   ),
            //
            // ),
            CarouselSlider.builder(
              itemCount: providerW!.MusicList.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  height: 200,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              providerW!.MusicList[index].image as String),
                          fit: BoxFit.cover)),
                );
              },
              options: CarouselOptions(
                initialPage: 2,
                onPageChanged: (index, reason) {
                  providerR!.changeImage(index);
                  pageController = PageController(initialPage: index);
                },
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                enlargeCenterPage: true,
                viewportFraction: 0.8,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  providerW!.MusicList.length,
                  (index) => Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == providerW!.selectedSongIndex
                                ? Colors.blue
                                : Colors.grey),
                        margin: EdgeInsets.all(2),
                      )),
            ),
            // SmoothPageIndicator(
            //   count: providerW!.MusicList.length,
            //   controller: PageController(),
            //
            // ),
            // Text(
            //   "${providerR!.MusicList[providerR!.selectedSongIndex].name}",
            //   style: const TextStyle(color: Colors.white,
            //       fontWeight: FontWeight.bold, fontSize: 25),
            // ),
            Expanded(
              child: ListView.builder(
                itemCount: providerW!.MusicList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      // Container(
                      //   height: 100,
                      //   margin: EdgeInsets.all(5),
                      //   width: 399,
                      //   decoration: BoxDecoration(
                      //     color: Colors.black,
                      //     borderRadius: BorderRadius.circular(10),
                      //     boxShadow: const [
                      //       BoxShadow(
                      //         spreadRadius: 0.5,
                      //         blurRadius: 0.5,
                      //         color: Colors.grey,
                      //       ),
                      //     ],
                      //   ),
                      //
                      // ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: Colors.white,
                                          spreadRadius: 1),
                                    ],
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "${providerW!.MusicList[index].image}"),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "${providerW!.MusicList[index].name}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    context
                                        .read<MusicProvider>()
                                        .changeSongIndex(index);
                                    Navigator.pushNamed(
                                      context,
                                      "music",
                                    );
                                  },
                                  icon: const Icon(Icons.music_note),
                                  color: Colors.white,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
