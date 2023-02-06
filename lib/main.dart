import 'package:flutter/material.dart';
import 'home.dart';
import 'bloc/camera_bloc.dart';
import 'bloc/qr_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<CameraBloc>(create: (context) => CameraBloc()),
        BlocProvider<QrBloc>(create: (context) => QrBloc()),
      ],
      child: MaterialApp(
        title: 'Camera',
        home: HomeScreen(),
      ),
    );
  }
}
