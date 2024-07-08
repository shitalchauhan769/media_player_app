import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import '../screen/home/model/model_data.dart';

class MusicProvider with ChangeNotifier {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  bool isPlay = true;
  Duration songDuration = const Duration(seconds: 0);
  Duration carnteData = const Duration(seconds: 0);
  List<DaseCategoryModel> MusicList = [
    DaseCategoryModel(
        image: "https://pagalfree.com/images/128Angaaron%20-%20Pushpa%202%20The%20Rule%20128%20Kbps.jpg",
        name: "Angaaron ",
        song: "https://pagalfree.com/musics/128-Angaaron%20-%20Pushpa%202%20The%20Rule%20128%20Kbps.mp3"),
    DaseCategoryModel(
        image: "https://pagalfree.com/images/128Pushpa%20Pushpa%20-%20Pushpa%202%20The%20Rule%20128%20Kbps.jpg",
        name: "Pushpa Pushpa ",
        song: "https://pagalfree.com/musics/128-Pushpa%20Pushpa%20-%20Pushpa%202%20The%20Rule%20128%20Kbps.mp3"),
    DaseCategoryModel(
        image: "https://pagalfree.com/images/128Team%20India%20Hain%20Hum%20-%20Maidaan%20128%20Kbps.jpg",
        name: "Team India Hain Hum",
        song: "https://pagalfree.com/musics/128-Team%20India%20Hain%20Hum%20-%20Maidaan%20128%20Kbps.mp3"),
    DaseCategoryModel(
        image: "https://pagalfree.com/images/128Halki%20Halki%20Si%20-%20Asees%20Kaur%20128%20Kbps.jpg",
        name: "Halki Halki Si ",
        song: "https://pagalfree.com/musics/128-Halki%20Halki%20Si%20-%20Asees%20Kaur%20128%20Kbps.mp3"),
    DaseCategoryModel(
        image: "https://pagalfree.com/images/128Agar%20Ho%20Tum%20-%20Mr.%20And%20Mrs.%20Mahi%20128%20Kbps.jpg",
        name: "Agar Ho Tum  ",
        song: "https://pagalfree.com/musics/128-Agar Ho Tum - Mr. And Mrs. Mahi 128 Kbps.mp3"),
    DaseCategoryModel(
        image: "https://pagalfree.com/images/128Galti%20-%20Vishal%20Mishra%20128%20Kbps.jpg",
        name: "Galti ",
        song: "https://pagalfree.com/musics/128-Galti - Vishal Mishra 128 Kbps.mp3"),
    DaseCategoryModel(
        image: "https://pagalfree.com/images/128Rabba%20Mereya%20-%20B%20Praak%20128%20Kbps.jpg",
        name: " Rabba Mereya",
        song: "https://pagalfree.com/musics/128-Rabba Mereya - B Praak 128 Kbps.mp3"),
    DaseCategoryModel(
        image: "https://pagalfree.com/images/128Yaara%20-%20Sumit%20Goswami%20128%20Kbps.jpg",
        name: "Yaara",
        song: "https://pagalfree.com/musics/128-Yaara - Sumit Goswami 128 Kbps.mp3"),
    DaseCategoryModel(
        image: "https://pagalfree.com/images/128Sukriya%20-%20Saaj%20Bhatt%20128%20Kbps.jpg",
        name: "Sukriya ",
        song: "https://pagalfree.com/musics/128-Sukriya - Saaj Bhatt 128 Kbps.mp3"),
    DaseCategoryModel(
        image: "https://pagalfree.com/images/128Soni%20Soni%20-%20Ishq%20Vishk%20Rebound%20128%20Kbps.jpg",
        name: "Soni Soni ",
        song: "https://pagalfree.com/musics/128-Soni Soni - Ishq Vishk Rebound 128 Kbps.mp3"),
  ];
  int selectedSongIndex = 0;

  void changeSongIndex(int index) {
    selectedSongIndex = index;
    notifyListeners();
  }

  void changeImage(int index) {
    if (selectedSongIndex < MusicList.length - 1) {
      selectedSongIndex++;
    } else {
      selectedSongIndex = 0;
    }

    notifyListeners();
  }

  void changePreviousImage(int index) {
    if (selectedSongIndex > MusicList.length + 1) {
      selectedSongIndex--;
    } else {
      selectedSongIndex = 0;
    }

    notifyListeners();
  }

  void changInit() async {
    await assetsAudioPlayer.open(
        Playlist(
          startIndex: selectedSongIndex,
          audios: MusicList.map(
            (e) => Audio.network(e.song!),
          ).toList(),
        ),
        autoStart: false);

    durationOfSong();
    live();
  }

  void changPlay() {
    isPlay = !isPlay;
    if (isPlay) {
      assetsAudioPlayer.pause();
    } else {
      assetsAudioPlayer.play();
    }
    notifyListeners();
  }

  void durationOfSong() {
    songDuration = assetsAudioPlayer.current.value!.audio.duration;
    notifyListeners();
  }

  void live() {
    assetsAudioPlayer.currentPosition.listen(
      (event) {
        carnteData = event;
        notifyListeners();
      },
    );
  }
}
//https://pagalfree.com/musics/128-Angaaron%20-%20Pushpa%202%20The%20Rule%20128%20Kbps.mp3
//https://pagalfree.com/musics/128-Ghagra%20-%20Crew%20128%20Kbps.mp3
//https://pagalfree.com/musics/128-Zindagi%20Tere%20Naam%20-%20Yodha%20128%20Kbps.mp3
//https://pagalfree.com/musics/128-Galti%20-%20Vishal%20Mishra%20128%20Kbps.mp3
//https://pagalfree.com/musics/128-Aisa%20Main%20Shaitaan%20-%20Shaitaan%20128%20Kbps.mp3
//https://pagalfree.com/musics/128-Galti%20-%20Vishal%20Mishra%20128%20Kbps.mp3
