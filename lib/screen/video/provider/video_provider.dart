import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../model/video_model.dart';

class VideoProvider with ChangeNotifier {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  int index=0;

  void initVideo() {

          videoPlayerController=VideoPlayerController.networkUrl(Uri.parse("https://rr1---sn-bu2a-nu8s.googlevideo.com/videoplayback?expire=1720437856&ei=AHiLZuD0BvLU6dsPx_ShkA0&ip=142.132.205.100&id=o-AN18iP8fXKSQV4upTl0Xgqs_PbWJjUjdmvnb2s08hEN_&itag=134&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&vprv=1&svpuc=1&mime=video%2Fmp4&rqh=1&gir=yes&clen=4509991&dur=226.699&lmt=1710937859384224&keepalive=yes&c=ANDROID_TESTSUITE&txp=4535434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cvprv%2Csvpuc%2Cmime%2Crqh%2Cgir%2Cclen%2Cdur%2Clmt&sig=AJfQdSswRQIhAJ3PagGzGoJxrLTapLkDAQpDu-LOGWVIHL987cpoa5qUAiAhnOGO_wUm5e8SP35OuT2sU5EcuoKv6z9-iRwg3ysTYw%3D%3D&redirect_counter=1&rm=sn-4g5e6z7z&fexp=24350518&req_id=e3a1f8dae8a3a3ee&cms_redirect=yes&cmsv=e&ipbypass=yes&mh=Yu&mip=163.53.179.141&mm=31&mn=sn-bu2a-nu8s&ms=au&mt=1720415456&mv=u&mvi=1&pcm2cms=yes&pl=24&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pcm2cms,pl&lsig=AHlkHjAwRQIhALAc3gNGxTen-lkbhdRtfbq-d19ONIvG4XJU5-Yn29I4AiBYu55Quo_GU8odXFYl5mz7o4RHPINJ_RLYjF9iHSbB9g%3D%3D"));
          videoPlayerController?.initialize();
          chewieController = ChewieController(videoPlayerController: videoPlayerController!);
          notifyListeners();

  }
  List<VideoModel> videoList = [
    VideoModel(
        image: "https://pagalfree.com/images/128Abrars%20Entry%20Jamal%20Kudu%20-%20Animal%20128%20Kbps.jpg",
        name: "jamal kudu",
        link: "https://rr2---sn-bu2a-nu8s.googlevideo.com/videoplayback?expire=1720430096&ei=sFmLZt-nA6LB6dsPlpqauA0&ip=148.251.87.183&id=o-ABZVoEV9wa4hrhR987BubmLcbVUWCUJkjA8Y5yV_MIiI&itag=18&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&vprv=1&svpuc=1&mime=video%2Fmp4&rqh=1&gir=yes&clen=21819275&ratebypass=yes&dur=345.350&lmt=1715745659690222&c=ANDROID_TESTSUITE&txp=4538434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cvprv%2Csvpuc%2Cmime%2Crqh%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AJfQdSswRQIhAPWPCUWsvXge3tDJ2EqYJPg7rzzjfSM2UpvEJ3kr2HDeAiAB6ZhYtHgNduT4uSRZQbv1pbOYqZDucj92mzhZPy0RvQ%3D%3D&title=Saari%20Duniya%20Jalaa%20Denge(Extended%20Full%20Song)%20Ranbir%20K%2CAnil%20K%2CBobby%20D%7CSandeep%7CB%20Praak%2CJaani%7CBhushan%20K&redirect_counter=1&rm=sn-4g5err7e&fexp=24350518&req_id=fcfbf75efb36a3ee&cms_redirect=yes&cmsv=e&ipbypass=yes&mh=CY&mip=163.53.179.141&mm=31&mn=sn-bu2a-nu8s&ms=au&mt=1720415456&mv=u&mvi=2&pcm2cms=yes&pl=24&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pcm2cms,pl&lsig=AHlkHjAwRQIgHt1tp4CMIMyI_5Edp2CuWnT7jBX59WGveH7T6svuvjkCIQCn5TkwbCHd7hNvxgn-RjshIufkn6quu1YpI64g4VcWCw%3D%3D",),
    VideoModel(
        image: "https://pagalfree.com/images/128Apna%20Bana%20Le%20-%20Bhediya%20128%20Kbps.jpg",
        name: "Apna Bana Le",
        link: "https://rr1---sn-bu2a-nu8s.googlevideo.com/videoplayback?expire=1720437856&ei=AHiLZuD0BvLU6dsPx_ShkA0&ip=142.132.205.100&id=o-AN18iP8fXKSQV4upTl0Xgqs_PbWJjUjdmvnb2s08hEN_&itag=134&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&vprv=1&svpuc=1&mime=video%2Fmp4&rqh=1&gir=yes&clen=4509991&dur=226.699&lmt=1710937859384224&keepalive=yes&c=ANDROID_TESTSUITE&txp=4535434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cvprv%2Csvpuc%2Cmime%2Crqh%2Cgir%2Cclen%2Cdur%2Clmt&sig=AJfQdSswRQIhAJ3PagGzGoJxrLTapLkDAQpDu-LOGWVIHL987cpoa5qUAiAhnOGO_wUm5e8SP35OuT2sU5EcuoKv6z9-iRwg3ysTYw%3D%3D&redirect_counter=1&rm=sn-4g5e6z7z&fexp=24350518&req_id=e3a1f8dae8a3a3ee&cms_redirect=yes&cmsv=e&ipbypass=yes&mh=Yu&mip=163.53.179.141&mm=31&mn=sn-bu2a-nu8s&ms=au&mt=1720415456&mv=u&mvi=1&pcm2cms=yes&pl=24&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pcm2cms,pl&lsig=AHlkHjAwRQIhALAc3gNGxTen-lkbhdRtfbq-d19ONIvG4XJU5-Yn29I4AiBYu55Quo_GU8odXFYl5mz7o4RHPINJ_RLYjF9iHSbB9g%3D%3D",),
    VideoModel(
        image: "https://pagalfree.com/images/128Kala%20Chashma%20-%20Baar%20Baar%20Dekho%20128%20Kbps.jpg",
        name: "Kala Chashma",
        link: "https://rr2---sn-bu2a-nu86.googlevideo.com/videoplayback?expire=1720437591&ei=93aLZq3pNffQi9oPjuSxyAk&ip=148.251.87.183&id=o-AGDzOrzQv25JMD35PhcabARwLuLTmky9WRUMql9f3T7m&itag=243&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&vprv=1&svpuc=1&mime=video%2Fwebm&rqh=1&gir=yes&clen=9953050&dur=191.920&lmt=1705978081193404&keepalive=yes&c=ANDROID_TESTSUITE&txp=4437434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cvprv%2Csvpuc%2Cmime%2Crqh%2Cgir%2Cclen%2Cdur%2Clmt&sig=AJfQdSswRQIgVbua5VLJU573KOs8GY7A8OfAibNcaSfGU6BESgTRZGwCIQCobZW0VnQmjvIu1ZC2kDG_j60ZEO88bsCjBk-cVsAL5w%3D%3D&redirect_counter=1&rm=sn-4g5er77s&rrc=104&fexp=24350518&req_id=9527c3782bb3a3ee&cms_redirect=yes&cmsv=e&ipbypass=yes&mh=gS&mip=163.53.179.141&mm=31&mn=sn-bu2a-nu86&ms=au&mt=1720415456&mv=u&mvi=2&pl=24&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AHlkHjAwRgIhAJ12uzE--ga8Zp2oJDsUCnl0BGqYtiP5sPQeZcFKo6fbAiEA9iN2P2pAqdVEl63ynmgdw91QtoykZA57WLbl6qyjX7U%3D",),
    VideoModel(
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoU_XYUuq4PqCHbEMN9S0E1voam4QuMV5V6Q&s",
        name: "Kesariya",
        link: "https://rr2---sn-cvh7kn66.googlevideo.com/videoplayback?expire=1720432136&ei=qGGLZoTSDtaV9fwP0eeNqA4&ip=103.115.207.65&id=o-AD1F0yYUmLZc7Oc5-K78k2y_-MufOlkiRulJpBYyRT9a&itag=18&sourc",),
    VideoModel(
        image: "https://pagalfree.com/images/128Meri%20Aashiqui%20-%20Jubin%20Nautiyal%20128%20Kbps.jpg",
        name: "Meri aashiqui",
        link: "https://rr3---sn-bu2a-nu86.googlevideo.com/videoplayback?expire=1720437985&ei=gXiLZoSoMN2Ji9oPmLm7oAc&ip=148.251.137.140&id=o-AAQitU33crxQyY96lx_nj1tkwakClhqQFUy6LMq3iPyI&itag=134&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&vprv=1&svpuc=1&mime=video%2Fmp4&rqh=1&gir=yes&clen=6227816&dur=307.208&lmt=1706310550387857&keepalive=yes&c=ANDROID_TESTSUITE&txp=4535434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cvprv%2Csvpuc%2Cmime%2Crqh%2Cgir%2Cclen%2Cdur%2Clmt&sig=AJfQdSswRQIgJ_qm0uAXE9hvP27edqSJYev81PnxVLETkglz4TAGmcECIQDmZkcCvKOl5sH53YsVmPdDG3lCIg8gUPtofVTZk-HP3w%3D%3D&redirect_counter=1&rm=sn-4g5err7e&fexp=24350518&req_id=c6813da99760a3ee&cms_redirect=yes&cmsv=e&ipbypass=yes&mh=aH&mip=163.53.179.141&mm=31&mn=sn-bu2a-nu86&ms=au&mt=1720415456&mv=u&mvi=3&pl=24&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AHlkHjAwRAIgb9OoMGaQljaoS6-qh_99TWzXai3NILFkPS1P_v5rIJ4CIFvSOt8RK8bYnCk8DiGpMYH3_vLc3-XtccJEtOYNYZmy",),
    VideoModel(
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQyB0isbBYuLR_agR8hCSe9prcOrZN575W6Q&s",
      name: "Paon Ki Jutti",
      link: "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",),
    VideoModel(
        image: "https://c.saavncdn.com/023/Jhamkudi-From-Jhamkudi-Gujarati-2024-20240515213217-500x500.jpg",
        name: "Jhamkudi",
        link: "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
    VideoModel(
        image: "https://c.saavncdn.com/643/Khokhe-Punjabi-2024-20240520151515-500x500.jpg",
        name: "Khokhe",
        link: "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4"),
    VideoModel(
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlmKymYo0LyilAN6VyXVQtnfCC1BT9CNPrcg&s",
        name: "Kassam",
        link: "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"),
  ];
  void changeIndex(int i) {
    index = i;
    initVideo();
    notifyListeners();
  }
}
