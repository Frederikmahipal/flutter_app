part of 'qr_bloc.dart';

abstract class QrState extends Equatable {
  const QrState();
  
  @override
  List<Object> get props => [];
}

class QrInitial extends QrState {}
