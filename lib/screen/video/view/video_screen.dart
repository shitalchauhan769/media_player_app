import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:medio_player_app/screen/video/provider/video_provider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../home/provider/home_provider.dart';


class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  PageController pageController =
      PageController(viewportFraction: 0.8, keepPage: true);

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
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: providerW!.videoList.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  height: 200,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              providerW!.videoList[index].image as String),
                          fit: BoxFit.cover)),
                );
              },
              options: CarouselOptions(
                initialPage: 2,
                onPageChanged: (index, reason) {
                  providerR!.changeIndex(index);
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
                providerW!.videoList.length,
                (index) => Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == providerW!.index
                          ? Colors.blue
                          : Colors.grey),
                  margin: EdgeInsets.all(2),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: providerW!.videoList.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     InkWell(onTap: () {
                       Navigator.pushNamed(
                         context,
                         "video player",
                       );
                     },
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Container(
                               height: 70,
                               width: 70,
                               margin: const EdgeInsets.all(15),
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(10),
                                 image: DecorationImage(
                                     image: NetworkImage(
                                         "${providerW!.videoList[index].image}"),
                                     fit: BoxFit.cover),
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.all(12.0),
                               child: Align(alignment: Alignment.center,
                                 child: Text(
                                   "${providerW!.videoList[index].name}",
                                   style: const TextStyle(
                                       fontSize: 20, color: Colors.white),
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),
                     )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//*CarouselSlider.builder(
//               itemCount: 1,
//               itemBuilder: (context, index, realIndex) {
//                 return ;
//               },
//               options: CarouselOptions(
//                 initialPage: 2,
//                 onPageChanged: (index, reason) {
//                   providerR!.chageImage(index);
//                   pageController = PageController(initialPage: index);
//                 },
//                 autoPlay: true,
//                 autoPlayInterval: const Duration(seconds: 3),
//                 enlargeCenterPage: true,
//                 viewportFraction: 0.8,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             SmoothPageIndicator(
//               count: ImageList.length,
//               controller: pageController,
//             ),
