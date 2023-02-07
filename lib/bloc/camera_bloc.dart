import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'camera_event.dart';
part 'camera_state.dart';

//camereevent can be dispatched to the bloc, the state is managed by the bloc
//calling constructor with the initialstate of camera
//on handles the getcamera event
class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraBloc() : super(CameraInitial()) {
    on<GetCameras>((event, emit) async {
      await _handleGetCameras(event, emit);
  });
}

/*this is for getting a list camera with the async function availableCameras();
then it creates the cameracontroller for managing the cameras and initialize the
first camera in the list
if its success, the state Camerasloaded is emited from the bloc using the
controllerobject
*/

Future<void> _handleGetCameras(GetCameras event, Function emit) async {
    emit(CameraLoading());
    try {
      final cameras = await availableCameras();
      final controller = CameraController(cameras[0], ResolutionPreset.medium);
      await controller.initialize();
      emit(CamerasLoaded(controller));
    } on PlatformException catch (e) {
      emit(CameraError(error: e.toString()));
    }
  }

//error handling, prints out any error
  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
