part of 'camera_bloc.dart';

abstract class CameraState {
  const CameraState();
  
  @override
  List<Object> get props => [];
}

class CameraInitial extends CameraState {}
