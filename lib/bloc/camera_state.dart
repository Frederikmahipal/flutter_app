part of 'camera_bloc.dart';

class CameraState extends Equatable {
const CameraState();

@override
List<Object> get props => [];
}

class CameraInitial extends CameraState {}

class CameraLoading extends CameraState {}

class CamerasLoaded extends CameraState {
final CameraController controller;

CamerasLoaded(this.controller);

@override
List<Object> get props => [controller];
}

class CameraError extends CameraState {
final String error;

CameraError({required this.error});

@override
List<Object> get props => [error];
}