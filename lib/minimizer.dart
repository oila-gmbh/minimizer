
import 'minimizer_platform_interface.dart';

class Minimizer {
  Future<String?> getPlatformVersion() {
    return MinimizerPlatform.instance.getPlatformVersion();
  }
}
