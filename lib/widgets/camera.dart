import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import '../configs/configs.dart';
import '../utils/utils.dart';
import 'face_boxes_overlay.dart';
import 'face_placeholder.dart';
import 'sign_up_form.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late final FaceDetector _faceDetector;
  late final CameraController _cameraController;
  List<Face> _faces = [];
  bool _processing = false;

  void _onCapture() {}

  void _detectFaces(CameraImage image) async {
    _processing = true;

    final InputImage inputImage = convertCameraImageToInputImage(
      camera: sl<CameraDescription>(),
      image: image,
    );
    final List<Face> faces = await _faceDetector.processImage(inputImage);

    setState(() {
      _faces = faces;
      _processing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    if (!_cameraController.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: screenSize.height,
              // width: screenSize.width,
              child: CameraPreview(_cameraController),
            ),
          ),
          Visibility(
            visible: _faces.isEmpty,
            child: const Align(
              alignment: Alignment.center,
              child: FacePlaceholder(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: screenSize.height,
              width: screenSize.width,
              child: FaceBoxesOverlay(
                faces: _faces,
                isCameraInitialized: _cameraController.value.isInitialized,
                height: _cameraController.value.previewSize!.height,
                width: _cameraController.value.previewSize!.width,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SignUpForm(onCapture: _onCapture),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final FaceDetectorOptions options =
        FaceDetectorOptions(performanceMode: FaceDetectorMode.accurate);

    _faceDetector = FaceDetector(options: options);
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

      await _cameraController.startImageStream((CameraImage image) {
        if (_processing) return;

        _detectFaces(image);
      });
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
    _cameraController.stopImageStream();
    _cameraController.dispose();
    super.dispose();
  }
}
