import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'minimizer_method_channel.dart';

abstract class MinimizerPlatform extends PlatformInterface {
  /// Constructs a MinimizerPlatform.
  MinimizerPlatform() : super(token: _token);

  static final Object _token = Object();

  static MinimizerPlatform _instance = MethodChannelMinimizer();

  /// The default instance of [MinimizerPlatform] to use.
  ///
  /// Defaults to [MethodChannelMinimizer].
  static MinimizerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MinimizerPlatform] when
  /// they register themselves.
  static set instance(MinimizerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  toPreviousApp() {
    throw UnimplementedError('toPreviousApp() has not been implemented.');
  }
}
