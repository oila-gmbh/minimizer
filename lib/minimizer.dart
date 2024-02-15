import 'minimizer_platform_interface.dart';

class Minimizer {
  // Future<void> toPreviousApp() async {
  //   await MinimizerPlatform.instance.toPreviousApp();
  // }

  static toPreviousApp() async {
    try {
      await MinimizerPlatform.instance.toPreviousApp();
    } catch (_) {}
  }
}
