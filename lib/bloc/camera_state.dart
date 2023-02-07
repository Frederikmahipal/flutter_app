part of 'camera_bloc.dart';


class CameraState extends Equatable {
const CameraState();

@override
List<Object> get props => [];
}

//initial state of the camera
class CameraInitial extends CameraState {
}

//state used to show to the user the camera is being loaded
class CameraLoading extends CameraState {
}

//state when the camera is initialized and has a cameracontroller instance
class CamerasLoaded extends CameraState {
final CameraController controller;

CamerasLoaded(this.controller);

@override
List<Object> get props => [controller];
}

//state when there is any issue with camerahandling
class CameraError extends CameraState {
final String error;

CameraError({required this.error});

@override
List<Object> get props => [error];
}