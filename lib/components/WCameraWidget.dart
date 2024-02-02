import 'package:camera/camera.dart';
import 'package:whatsapp/main.dart';
import 'package:whatsapp/utils/WColors.dart';
import 'package:flutter/material.dart';

class CGCameraWidget extends StatefulWidget {
  static String tag = '/CGCameraWidget';

  @override
  CGCameraWidgetState createState() => CGCameraWidgetState();
}

class CGCameraWidgetState extends State<CGCameraWidget> with SingleTickerProviderStateMixin {
  CameraController? controller;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    initializeCamera(getCameDesc());
  }

  void initializeCamera(CameraDescription backCam) async {
    if (controller != null) {
      await controller?.dispose();
    }

    controller = CameraController(backCam, ResolutionPreset.medium);

    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  CameraDescription getCameDesc() {
    if (controller == null) {
      return cameras.firstWhere((element) => element.lensDirection.index == 1);
    }

    if (controller!.description.lensDirection.index == 0) {
      return cameras.firstWhere((element) => element.lensDirection.index == 1);
    } else {
      return cameras.firstWhere((element) => element.lensDirection.index == 0);
    }
  }

  Widget _cameraPreviewWidget() {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;

    if (controller == null || !controller!.value.isInitialized) {
      return Container();
    } else {
      return Transform.scale(
        scale: controller!.value.aspectRatio / deviceRatio,
        child: AspectRatio(aspectRatio: controller!.value.aspectRatio, child: CameraPreview(controller!)),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: _cameraPreviewWidget()),
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          alignment: Alignment.bottomCenter,
          child: const CircleAvatar(backgroundColor: secondaryColor, radius: 35, child: Icon(Icons.camera_alt, color: Colors.white)),
        ),
      ],
    );
  }
}
