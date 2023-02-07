import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import './bloc/qr_bloc.dart';
import './bloc/qr_state.dart';
import './bloc/qr_event.dart';

/*
UI for QrScreen
Provider is used for accessing the bloc
build function is used for building the UI
builder function checks the state of the Qr to display URL of scanned code
or an error if its unsuccessfull
*/
class QRScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final qrBloc = Provider.of<QrBloc>(context);
    return Scaffold(
      body: BlocBuilder<QrBloc, QrState>(
        bloc: qrBloc,
        builder: (context, state) {
          if (state is QrError) {
            return Container(
              child: Center(
                child: Text(state.errorMessage),
              ),
            );
          }
          if (state is QrLoaded) {
            return Container(
              child: Center(
                child: Text(state.url),
              ),
            );
          } else {
            return Container(
              child: Center(
                child: MobileScanner(
                  onDetect: (barcode, args) {
                    StartScanning();
                  },
                ),
              ),
            );
          }
        },
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
