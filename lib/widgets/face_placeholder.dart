import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../configs/configs.dart';

class FacePlaceholder extends StatelessWidget {
  const FacePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          child: Lottie.network(
            kFaceScanAnimationUrl,
            width: 300,
            height: 300,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text('Face the camera'),
        ),
      ],
    );
  }
}
