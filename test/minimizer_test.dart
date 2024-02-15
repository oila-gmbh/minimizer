import 'package:flutter_test/flutter_test.dart';
import 'package:minimizer/minimizer.dart';
import 'package:minimizer/minimizer_platform_interface.dart';
import 'package:minimizer/minimizer_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMinimizerPlatform
    with MockPlatformInterfaceMixin
    implements MinimizerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MinimizerPlatform initialPlatform = MinimizerPlatform.instance;

  test('$MethodChannelMinimizer is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMinimizer>());
  });

  test('getPlatformVersion', () async {
    Minimizer minimizerPlugin = Minimizer();
    MockMinimizerPlatform fakePlatform = MockMinimizerPlatform();
    MinimizerPlatform.instance = fakePlatform;

    expect(await minimizerPlugin.getPlatformVersion(), '42');
  });
}
