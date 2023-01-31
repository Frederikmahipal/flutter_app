import 'package:equatable/equatable.dart';

abstract class QrEvent extends Equatable {
  const QrEvent();
}

class ScanEvent extends QrEvent {
  final String result;

  const ScanEvent(this.result);

  @override
  List<Object> get props => [result];
}
