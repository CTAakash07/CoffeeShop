import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioScreenController extends GetxController {

  RxList audioList = [
    {'name' : 'Annul Mellae', 'Audio' : 'https://wynk.in/u/U0KsjbGBK'},
    {'name' : 'Ava Yenna', 'Audio' : 'https://wynk.in/u/w4Wng8uT8'},
    {'name' : 'Yethi Yethi', 'Audio' : 'https://wynk.in/u/lMrgy1JFr'},
    {'name' : 'Munbae Va', 'Audio' : ''}
  ].obs;
  
  AudioPlayer audioPlayer = new AudioPlayer();
  RxBool isPlaying = false.obs;
  RxString imageUrl = 'https://wynk.in/assets/images/playlist_icons/U0KsjbGBK/Wynk_Love_8th%20July%202022.jpg'.obs;

  @override
  void onInit(){

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    stopAudio();
  }

  audioPlayPause() {
    isPlaying.toggle();
    if (isPlaying.value != true) {
      pauseLocalAudio();
    } else {
      playLocalAudio();
    }
  }

  playLocalAudio() {
    audioPlayer.play(UrlSource("https://www.friendstamilmp3.in/songs2/A-Z%20Movie%20Songs/Aadhavan/Dammaku%20Dammaku%20.mp3"));
  }

  pauseLocalAudio() {
    audioPlayer.pause();
  }
  
  stopAudio() {
    audioPlayer.stop();
    isPlaying = false.obs;
  }

}