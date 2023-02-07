part of 'camera_bloc.dart';

/*abstract class extending equatable class. Allowing comparing of instances
of events. The props is a list of properties that is used when comparing events
*/
abstract class CameraEvent extends Equatable {
  const CameraEvent();
}

//used to get available cameras in the device
class GetCameras extends CameraEvent {
  @override
  List<Object> get props => [];
}




