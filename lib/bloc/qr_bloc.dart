import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'qr_event.dart';
import 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  QrBloc() : super(QrInitial()) {
    MobileScanner(
      allowDuplicates: false,
      controller: MobileScannerController(
          facing: CameraFacing.back, torchEnabled: true),
      onDetect: (barcode, args) {
        if (barcode.rawValue == null) {
          emit(QrError("Failed to scan"));
        } else {
          final String code = barcode.rawValue!;
          emit(QrLoaded(code));
        }
      },
    );
  }
}
