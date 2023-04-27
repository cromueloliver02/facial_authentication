import 'package:camera/camera.dart';
import 'package:get_it/get_it.dart';

// service locator
final GetIt sl = GetIt.instance;

void setup() {
  sl.registerSingletonAsync<CameraDescription>(() async {
    final List<CameraDescription> cameras = await availableCameras();

    return cameras.first;
  });
}
