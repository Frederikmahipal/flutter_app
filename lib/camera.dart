import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './bloc/camera_bloc.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool _isReady = false;
  
  get cameraController => null;

  @override
  void initState() {
    super.initState();
    initializeCamera();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (() {
            Navigator.pop(context);
          }),
        ),
      ),
      body: Center(
        child: !_isReady
            ? const Text("No cameras available")
            : CupertinoButton.filled(
                child: const Text('Take a photo'),
                onPressed: () async {
                  final path = join(
                    (await getTemporaryDirectory()).path,
                    '${DateTime.now()}.jpg',
                  );
                  await cameraController.takePicture();
                  Navigator.pop(context, path);
                },
              ),
      ),
    );
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }
}
