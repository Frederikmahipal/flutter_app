import 'package:flutter/material.dart';
import 'home.dart';
import 'bloc/camera_bloc.dart';
import 'bloc/qr_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

/*
multiprovider used for providing instances of the blocs used. blocs can be
access anywhere
the app is using materialapp
home destination is set to homescreen
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<CameraBloc>(create: (context) => CameraBloc()),
        BlocProvider<QrBloc>(create: (context) => QrBloc()),
      ],
      child: MaterialApp(
        title: 'starter app',
        home: HomeScreen(),
      ),
    );
  }
}
