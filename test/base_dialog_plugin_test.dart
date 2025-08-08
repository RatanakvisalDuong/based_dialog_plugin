import 'package:flutter_test/flutter_test.dart';
import 'package:base_dialog_plugin/base_dialog_plugin.dart';
import 'package:base_dialog_plugin/base_dialog_plugin_platform_interface.dart';
import 'package:base_dialog_plugin/base_dialog_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBaseDialogPluginPlatform
    with MockPlatformInterfaceMixin
    implements BaseDialogPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BaseDialogPluginPlatform initialPlatform = BaseDialogPluginPlatform.instance;

  test('$MethodChannelBaseDialogPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBaseDialogPlugin>());
  });

  // test('getPlatformVersion', () async {
  //   BaseDialogPlugin baseDialogPlugin = BaseDialogPlugin();
  //   MockBaseDialogPluginPlatform fakePlatform = MockBaseDialogPluginPlatform();
  //   BaseDialogPluginPlatform.instance = fakePlatform;

  //   expect(await baseDialogPlugin.getPlatformVersion(), '42');
  // });
}
