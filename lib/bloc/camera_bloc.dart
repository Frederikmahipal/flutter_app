import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraBloc() : super(CameraInitial()) {
    on<GetCameras>((event, emit) async {
      await _handleGetCameras(event, emit);
    });
  }

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

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
