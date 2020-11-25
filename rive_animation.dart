import 'package:customer_app/appData/appdata.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

initRive() {
  print('init rive');
  // setting things up
  rootBundle.load('images/4bubbles-anim.riv').then(
    (data) async {
      final file = RiveFile();
      if (file.import(data)) {
        final artboard = file.mainArtboard;
        artboard.addController(SimpleAnimation('dence'));
        AppData.riveBoard = artboard;
        print('board ready');
      }
    },
  );
}

/*

1. on the first screen call the above initRive()

2. then on the pages that you want to use the animation use

  Artboard _riveArtboard;
  RiveAnimationController _riveController;

  @override
  void initState() {
    _riveArtboard = AppData.riveBoard;
    _riveArtboard.addController(SimpleAnimation('dence'));
    setState(() => _riveController?.isActive = true);
    super.initState();
  }

  Rive(artboard: _riveArtboard),





*/
