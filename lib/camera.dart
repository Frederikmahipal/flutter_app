import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import './bloc/camera_bloc.dart';

//camerascreen widget, displays the view
class CameraScreen extends StatefulWidget {
  @override
  CameraScreenState createState() => CameraScreenState();
}

/*
extends the state
build method returns Scaffold widget, body contains expanded which is used for
the blocbuilder to display the state of the camera

button is used to trigger event, blocbuilder listens to cameraBloc and renders
UI based on the state
*/
class CameraScreenState extends State<CameraScreen> {
  final _cameraBloc = CameraBloc();

//dispose is used to close the 'connection'
  @override
  void dispose() {
    _cameraBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take a picture'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CameraBloc, CameraState>(
              bloc: _cameraBloc,
              builder: (context, state) {
                if (state is CameraLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is CamerasLoaded) {
                  return CameraPreview(state.controller);
                }
                if (state is CameraError) {
                  return Text('Something went wrong');
                }
                return Container();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: CupertinoButton.filled(
        child: const Icon(Icons.camera_alt),
        onPressed: () {
          _cameraBloc.add(GetCameras());
        },
      ),
    );
  }
}

