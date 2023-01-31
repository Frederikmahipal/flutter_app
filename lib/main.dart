import 'package:flutter/material.dart';
import 'home.dart';
import 'bloc/camera_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => CameraBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera',
      home: HomeScreen(),
    );
  }
}
