import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

InputImage convertCameraImageToInputImage({
  required CameraDescription camera,
  required CameraImage image,
}) {
  final WriteBuffer allBytes = WriteBuffer();

  for (final Plane plane in image.planes) {
    allBytes.putUint8List(plane.bytes);
  }

  final Uint8List bytes = allBytes.done().buffer.asUint8List();
  final Size imageSize = Size(image.width.toDouble(), image.height.toDouble());
  final InputImageRotation? imageRotation =
      InputImageRotationValue.fromRawValue(camera.sensorOrientation);
  final InputImageFormat? inputImageFormat =
      InputImageFormatValue.fromRawValue(image.format.raw);

  final List<InputImagePlaneMetadata> planeData = image.planes.map(
    (Plane plane) {
      return InputImagePlaneMetadata(
        bytesPerRow: plane.bytesPerRow,
        height: plane.height,
        width: plane.width,
      );
    },
  ).toList();

  final InputImageData inputImageData = InputImageData(
    size: imageSize,
    imageRotation: imageRotation!,
    inputImageFormat: inputImageFormat!,
    planeData: planeData,
  );

  final InputImage inputImage =
      InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);

  return inputImage;
}
