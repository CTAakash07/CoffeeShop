import 'package:coffee_shop/screens/audioScreen/audioScreenController/audio_screen_controller.dart';
import 'package:get/get.dart';

class AudioScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AudioScreenController>(
            () => AudioScreenController()
    );
  }
}