import 'package:app/bloc/qr_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import './bloc/qr_bloc.dart';
import './bloc/qr_state.dart';

class QRScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final qrBloc = Provider.of<QrBloc>(context);
    return Scaffold(
      body: BlocBuilder<QrBloc, QrState>(
        bloc: qrBloc,
        builder: (context, state) {
          return Container(
            child: MobileScanner(
              allowDuplicates: false,
              controller: MobileScannerController(
                facing: CameraFacing.back, 
                torchEnabled: true
              ),
              onDetect: (barcode, args) {
                if (barcode.rawValue == null) {
                  qrBloc.add(QrError("Failed to scan") as QrEvent);
                } else {
                  final String code = barcode.rawValue!;
                  qrBloc.add(QrLoaded(code) as QrEvent);
                }
              },
            ),
          );
        },
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
