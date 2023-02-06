part of 'camera_bloc.dart';

abstract class CameraEvent extends Equatable {
  const CameraEvent();
}

class GetCameras extends CameraEvent {
  @override
  List<Object> get props => [];
}

class CameraLoadingEvent extends CameraEvent {
  @override
  List<Object> get props => [];
}

class CamerasLoadedEvent extends CameraEvent {
  final List<CameraController> cameras;

  CamerasLoadedEvent(this.cameras);

  @override
  List<Object> get props => [cameras];
}

class CameraErrorEvent extends CameraEvent {
  final String error;

  CameraErrorEvent({required this.error});

  @override
  List<Object> get props => [error];
}
