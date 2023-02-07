import 'package:equatable/equatable.dart';

abstract class QrEvent extends Equatable {
}

//event to start scanning
class StartScanning extends QrEvent {
  @override
  List<Object> get props => [];
}
