import 'dart:async';
import 'package:circle_wave_progress/circle_wave_progress.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:styled_widget/styled_widget.dart';

class WaterWavePage extends StatefulWidget {
  static const routeName = '/water-wave';

  @override
  _WaterWavePageState createState() => _WaterWavePageState();
}

class _WaterWavePageState extends State<WaterWavePage> {
  double _progress = 20;
  Timer _progressTimer;

  @override
  void initState() {
    _progressTimer = Timer.periodic(1.seconds, _increasesProgress);
    super.initState();
  }

  @override
  void dispose() {
    _progressTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('WaterWave'),
        ),
        body: [
          CircleWaveProgress(
            size: 200,
            progress: _progress,
            waveColor: Colors.teal[100],
            borderColor: Colors.white,
            backgroundColor: Colors.teal,
          ),
          Text('$_progress%').textColor(Colors.white).fontWeight(FontWeight.bold).fontSize(24)
        ].toStack(alignment: Alignment.center).center());
  }

  void _increasesProgress(Timer timer) {
    final double newProgress = _progress + 1;
    print(newProgress);

    if (newProgress > 100) {
      timer.cancel();
    } else {
      setState(() {
        _progress = newProgress;
      });
    }
  }
}
