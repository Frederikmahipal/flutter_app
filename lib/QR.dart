import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'bloc/qr_bloc.dart';
class QRScreen extends StatefulWidget {
  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: BlocBuilder<QrBloc, QrState>(
          builder: (context, state) {
            return MobileScanner(
              allowDuplicates: false,
              controller: MobileScannerController(
                facing: CameraFacing.back,
                torchEnabled: true,
              ),
              onDetect: (barcode, args) {
                if (barcode.rawValue == null) {
                  debugPrint('failed to scan');
                } else {
                  final String code = barcode.rawValue!;
                }
              },
            );
          },
        ),
      ),
    );
  }
}
