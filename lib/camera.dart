import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc/camera_bloc.dart';

class CameraScreen extends StatefulWidget {
  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  final _cameraBloc = CameraBloc();

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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.camera_alt),
        onPressed: () {
          _cameraBloc.add(GetCameras());
        },
      ),
    );
  }
}

