import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'qr_event.dart';
import 'qr_state.dart';

/*
bloc listens to QrEvent for updating the QrState
MobileScanner package is used to scan the QR codes
configurated to default using the backcamera with the torch enabled
onDetect callback when Qr is detected, we receive error if the value of the
code is null else it starts scanning.
QrLoaded event is emmited with the value of the scanned QR.
*/
class QrBloc extends Bloc<QrEvent, QrState> {
  QrBloc() : super(QrInitial()) {
    on<StartScanning>((event, emit) async {
      await _handleStartScanning(event, emit);
    });
  }

  Future<void> _handleStartScanning(
      StartScanning event, Emitter<QrState> emit) async {
    MobileScanner(
      allowDuplicates: false,
      controller: MobileScannerController(
          facing: CameraFacing.back, torchEnabled: true),
      onDetect: (barcode, args) {
        if (barcode.rawValue == null) {
          emit(QrError("Failed to scan"));
        } else {
          StartScanning();
          final String code = barcode.rawValue!;
          emit(QrLoaded(code));
        }
      },
    );
  }
}
