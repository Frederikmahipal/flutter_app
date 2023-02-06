import 'package:equatable/equatable.dart';

abstract class QrState extends Equatable {
}

class QrInitial extends QrState {
  @override
  List<Object> get props => [];
}

class QrLoaded extends QrState {
  final String url;

  QrLoaded(this.url);

  @override
  List<Object> get props => [url];
}

class QrError extends QrState {
  final String errorMessage;

  QrError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}