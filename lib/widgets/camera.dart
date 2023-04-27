import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../configs/app_dependencies.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late final CameraController _cameraController;
  late final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    if (!_cameraController.value.isInitialized) return const SizedBox.shrink();

    return SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: screenSize.height,
              child: CameraPreview(_cameraController),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _nameController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      hintText: 'Enter name',
                      filled: true,
                      fillColor: Colors.white54,
                      hintStyle: TextStyle(color: Colors.black45),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.camera),
                      label: const Text('Capture'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _cameraController = CameraController(
      sl<CameraDescription>(),
      ResolutionPreset.max,
      enableAudio: false,
    );
    _initializeCamera();
  }

  void _initializeCamera() async {
    try {
      await _cameraController.initialize();

      if (!mounted) return;

      setState(() {});
    } catch (err) {
      if (err is CameraException) {
        switch (err.code) {
          case 'CameraAccessDenied':
            debugPrint('Camera permission is denied');
            break;
          default:
            debugPrint('Error: $err');
            break;
        }
      }
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}
