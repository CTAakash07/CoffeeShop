import 'package:coffee_shop/screens/audioScreen/audioScreenController/audio_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AudioScreenView extends GetView<AudioScreenController> {
  AudioScreenView({Key? key}) : super(key: key);

  @override
  var audioController = Get.put(AudioScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int i) {
              return Expanded(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  child: Row(
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        margin: const EdgeInsets.only(
                            right: 15, top: 10, bottom: 10, left: 20),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // transform: Matrix4.diagonal3Values(0.5 ,5 ,0),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Munbae Va",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 21,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Expanded(
                                  child: Row(
                                    children: [
                                      Obx(() => IconButton(
                                          onPressed: () {
                                            audioController.audioPlayPause();
                                          },
                                          icon: audioController.isPlaying.value ? Icon(
                                            Icons.pause,
                                          ) : Icon(
                                            Icons.play_arrow,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 20,),
                                      IconButton(
                                        onPressed: () {
                                          audioController.stopAudio();
                                        },
                                        icon: Icon(
                                          Icons.stop,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
        ),
      ),
    );
  }
}