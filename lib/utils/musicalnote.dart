import 'dart:math';

dynamic musicalnote(f) {
  var a4 = 440;
  var c0 = a4 * pow(2, -4.75);
  var name = [
    "C",
    "C#",
    "D",
    "D#",
    "E",
    "F",
    "F#",
    "G",
    "G#",
    "A",
    "A#",
    "B",
  ];
  dynamic pitch(freq) {
    try {
      if (freq == -1.0) return;
      var h = ((log(freq / c0) / log(2)) * 12).round();
      var octave = (h / 12).floor();
      var n = h % 12;
      return name[n] + octave.toString();
    } catch (e) {
      print(e);
    }
  }

  return pitch(f);
}
