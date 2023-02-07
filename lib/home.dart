import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'camera.dart';
import 'qr.dart';


/*
Homescreen widget
returns a scaffold containing 2 buttons, used for navigation
*/
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Starter app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton.filled(
              child: Text('Go to Camera'),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => CameraScreen(),
                  ),
                );
              }, 
            ),
            const SizedBox(height: 20),
            CupertinoButton.filled(
              child: Text('Go to QR'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
