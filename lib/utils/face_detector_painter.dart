import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class FaceDetectorPainter extends CustomPainter {
  final Size absoluteImageSize;
  final List<Face> faces;
  final CameraLensDirection cameraLensDirection;

  const FaceDetectorPainter({
    required this.absoluteImageSize,
    required this.faces,
    required this.cameraLensDirection,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double scaleX = size.width / absoluteImageSize.width;
    final double scaleY = size.height / absoluteImageSize.height;

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.indigoAccent
      ..strokeWidth = 2.0;

    for (final Face face in faces) {
      final double left = cameraLensDirection == CameraLensDirection.front
          ? (absoluteImageSize.width - face.boundingBox.right) * scaleX
          : face.boundingBox.left * scaleX;
      final double top = face.boundingBox.top * scaleY;
      final double right = cameraLensDirection == CameraLensDirection.front
          ? (absoluteImageSize.width - face.boundingBox.left) * scaleX
          : face.boundingBox.right * scaleX;
      final double bottom = face.boundingBox.bottom * scaleY;

      canvas.drawRect(Rect.fromLTRB(left, top, right, bottom), paint);
    }
  }

  @override
  bool shouldRepaint(FaceDetectorPainter oldDelegate) => true;
}
