import 'package:flutter/material.dart';
import 'package:learn_to_sing/utils/musicalnote.dart';
import 'package:pitchdetector/pitchdetector.dart';

class Recorder extends StatefulWidget {
  @override
  _RecorderState createState() => _RecorderState();
}

class _RecorderState extends State<Recorder> {
  Pitchdetector detector;
  bool isRecording = false;
  double pitch;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isRecording ? Text("Listening...") : Container(),
          isRecording
              ? Text("Musical Note : ${musicalnote(pitch)}")
              : Text("Not Listening."),
          Container(
            height: 100,
            alignment: Alignment.center,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(-10)),
                  ),
                  onPressed: isRecording ? stopRecording : startRecording,
                  child: AnimatedContainer(
                    curve: Curves.easeOutCubic,
                    width: isRecording ? 20 : 80,
                    height: isRecording ? 20 : 80,
                    duration: Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          isRecording ? 5 : 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    detector = new Pitchdetector(sampleRate: 44100, sampleSize: 4096);
    isRecording = isRecording;
    detector.onRecorderStateChanged.listen((event) {
      setState(() {
        pitch = event["pitch"];
      });
    });
  }

  void startRecording() async {
    await detector.startRecording();
    if (detector.isRecording && mounted) {
      setState(() {
        isRecording = true;
      });
    }
  }

  void stopRecording() async {
    detector.stopRecording();
    if (mounted)
      setState(() {
        isRecording = false;
        pitch = detector.pitch;
      });
  }
}
