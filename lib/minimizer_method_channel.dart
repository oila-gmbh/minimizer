import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'minimizer_platform_interface.dart';

/// An implementation of [MinimizerPlatform] that uses method channels.
class MethodChannelMinimizer extends MinimizerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('minimizer');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
