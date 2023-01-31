import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';

class CameraBloc extends Bloc<void, List<CameraDescription>> {
  CameraBloc() : super(const []);

  @override
  Stream<List<CameraDescription>> mapEventToState(void _) async* {
    try {
      final cameras = await availableCameras();
      yield cameras;
    } on PlatformException catch (e) {
      print(e);
      yield [];
    }
  }
}

Future<bool> initializeCamera() async {
  late CameraController cameraController;
  final cameras = await availableCameras();
  if (cameras.isNotEmpty) {
    cameraController = CameraController(cameras.first, ResolutionPreset.high);
    await cameraController.initialize();
  }
  return initializeCamera();
}
