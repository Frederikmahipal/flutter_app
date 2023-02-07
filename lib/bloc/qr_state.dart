import 'package:equatable/equatable.dart';

abstract class QrState extends Equatable {
}

//initial state of the Qr
class QrInitial extends QrState {
  @override
  List<Object> get props => [];
}

//state for when the Qr is loaded, contains the url of the scanned Qr
class QrLoaded extends QrState {
  final String url;

  QrLoaded(this.url);

  @override
  List<Object> get props => [url];
}

//state for error while scanning
class QrError extends QrState {
  final String errorMessage;

  QrError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}