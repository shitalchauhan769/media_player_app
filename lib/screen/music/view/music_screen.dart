import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medio_player_app/provider/music_provider.dart';
import 'package:provider/provider.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  MusicProvider? providerW;
  MusicProvider? providerR;

  @override
  void initState() {
    super.initState();
    context.read<MusicProvider>().changInit();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<MusicProvider>();
    providerW = context.watch<MusicProvider>();
    return Scaffold(

      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  // gradient: const LinearGradient(
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomRight,
                  //   colors: [
                  //     Color(0xff682c73),
                  //     Color(0xffbb406f),
                  //     Color(0xff8d3470),
                  //   ],
                  //   tileMode: TileMode.mirror,
                  // ),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 10,
                      color: Colors.grey.shade100,
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back, color: Colors.white,),
                        color: Colors.grey,

                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage
                      (
                      image: NetworkImage(
                          "${providerR!.MusicList[providerW!.selectedSongIndex].image}"),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 1,
                        color: Colors.grey,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "${providerR!.MusicList[providerR!.selectedSongIndex].name}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                const Spacer(),
                Slider(
                  value: providerW!.carnteData.inSeconds.toDouble(),
                  max: providerW!.songDuration.inSeconds.toDouble(),
                  onChanged: (value) {
                    providerW!.assetsAudioPlayer
                        .seek(Duration(seconds: value.toInt()));
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${providerW!.carnteData}",
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Text(
                      "${providerW!.songDuration}",
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () async {
                         await providerR!.assetsAudioPlayer.previous();
                          providerR!.durationOfSong();
                          providerR!.changePreviousImage(providerW!.selectedSongIndex);
                          providerW!.isPlay = false;
                        },
                        icon: const Icon(
                          Icons.skip_previous_sharp,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            providerW!.changPlay();
                          },
                          icon: providerW!.isPlay
                              ? const Icon(
                                  Icons.play_circle,
                                  color: Colors.white,
                                  size: 40,
                                )
                              : const Icon(
                                  Icons.pause_circle,
                                  color: Colors.white,
                                  size: 40,
                                )),
                      IconButton(
                        onPressed: () async {
                          await providerR!.assetsAudioPlayer.next();
                          providerR!.durationOfSong();
                          providerR!.changeImage(providerW!.selectedSongIndex);
                          providerW!.isPlay = false;
                        },
                        icon: const Icon(
                          Icons.skip_next_sharp,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
