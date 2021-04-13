import 'package:flutter/material.dart';

import '../widgets/recorder.dart';

class PracticePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Practice"),
      ),
      body: Container(
        child: Recorder(),
      ),
    );
  }
}
