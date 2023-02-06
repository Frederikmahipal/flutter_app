import 'package:equatable/equatable.dart';

abstract class QrEvent extends Equatable {
}

class StartScanning extends QrEvent {
  @override
  List<Object> get props => [];
}
