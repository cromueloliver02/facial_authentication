import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import '../utils/utils.dart';

class FaceBoxesOverlay extends StatelessWidget {
  final List<Face> faces;
  final bool isCameraInitialized;
  final double width;
  final double height;

  const FaceBoxesOverlay({
    super.key,
    required this.faces,
    required this.isCameraInitialized,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    if (faces.isEmpty || !isCameraInitialized) {
      return const SizedBox.shrink();
    }

    final Size imageSize = Size(height, width);
    final CustomPainter painter = FaceDetectorPainter(
      absoluteImageSize: imageSize,
      faces: faces,
      cameraLensDirection: CameraLensDirection.front,
    );

    return CustomPaint(painter: painter);
  }
}
